# Data Governance (riêng cho dữ liệu)

Tài liệu này mô tả **data governance** theo hướng “giống README”: có biểu đồ, có luồng thiết kế cụ thể, nhưng tập trung *chỉ* vào data.

Mục tiêu:
- Thống nhất cách định nghĩa, sở hữu, truy vết và bảo vệ dữ liệu.
- Đảm bảo dữ liệu đi từ **nguồn → xử lý → tiêu thụ** có kiểm soát và có bằng chứng.
- Làm nền cho audit/tuân thủ (compliance) và giảm rủi ro rò rỉ dữ liệu.

Không nằm trong phạm vi:
- Quy trình phát triển phần mềm nói chung (cái đó đã có trong `README.md`).
- Thiết kế chi tiết hạ tầng cụ thể (Kafka/Snowflake/BigQuery…) — tài liệu này giữ ở mức “pattern”, có thể map sang bất kỳ stack nào.

---

## Diagram

```text
Producers (nguồn)
  - App services
  - 3rd-party systems
  - Manual import
      │
      ▼
Ingestion
  - Validate schema
  - PII classification
  - Quarantine (nếu lỗi)
      │
      ▼
Storage Zones
  - Raw (immutable)
  - Curated (cleaned)
  - Serving (optimized)
      │
      ├──────────────┐
      ▼              ▼
Processing        Governance Control Plane
  - Batch/stream     - Data catalog
  - Quality checks   - Policy (RBAC/ABAC)
  - Transform        - Lineage
  - Backfill         - Retention & deletion
      │              - Audit logs
      ▼
Consumers
  - BI/Analytics
  - ML features
  - Product APIs
```

---

## Khái niệm & nguyên tắc

### 1) Data Product
Mỗi tập dữ liệu quan trọng được quản lý như một **data product**:
- Có *owner* rõ ràng (Data Owner) và người vận hành (Data Steward).
- Có contract: schema, semantics, SLA, mức nhạy cảm.

### 2) Single Source of Truth (SSOT) cho metadata
Metadata (schema, owner, classification, retention…) phải có 1 nơi chuẩn để:
- tra cứu nhanh
- tự động kiểm tra (policy-as-code)
- audit

### 3) “Trust but verify”
Không tin vào dữ liệu chỉ vì “đã chạy được”. Dữ liệu phải có:
- kiểm tra chất lượng (data quality)
- lineage (nguồn gốc)
- log/audit

---

## Vai trò (Roles)

- **Data Owner**: chịu trách nhiệm business meaning, ai được dùng, mục đích nào được dùng.
- **Data Steward**: chuẩn hóa định nghĩa, quản lý catalog, xử lý yêu cầu truy cập.
- **Platform/Engineering**: cung cấp pipeline, bảo mật, logging, tooling.
- **Consumers**: dùng dữ liệu theo policy, không “copy ra ngoài” hoặc bypass zone.

---

## Thiết kế luồng dữ liệu (Design Flow)

### Flow 0 — Onboard một dataset mới
1. **Đăng ký dataset** trong catalog
   - tên chuẩn
   - owner/steward
   - classification (Public/Internal/Confidential/Restricted)
   - retention policy (vd: 30/90/365 ngày)
2. **Khai báo schema contract**
   - versioned schema (v1, v2…)
   - backward/forward compatibility rule
3. **Tạo ingestion pipeline**
   - validate schema
   - quarantine record lỗi
4. **Bật data quality checks**
   - completeness, uniqueness, freshness…
5. **Expose dataset** qua curated/serving zone
   - có SLA
   - có access policy

Kết quả: dataset có “identity” rõ ràng và có thể audit.

---

### Flow 1 — Ingestion → Raw zone
**Mục tiêu:** lưu dữ liệu nguồn *bất biến* để truy vết và backfill.

Quy tắc:
- Raw zone **immutable** (append-only), không update in-place.
- Mọi record phải có:
  - `ingested_at`
  - `source_system`
  - `schema_version`
- Record không đạt chuẩn → **quarantine** (tách riêng) + alert.

---

### Flow 2 — Raw → Curated (chuẩn hóa)
**Mục tiêu:** tạo dataset tin cậy để dùng cho BI/ML.

Quy tắc:
- Transform có version (vd: `model_version`).
- Không “ẩn lỗi”: nếu drop record phải log count + lý do.
- DQ gate:
  - nếu fail ngưỡng → không publish curated mới.

---

### Flow 3 — Curated → Serving (tối ưu tiêu thụ)
**Mục tiêu:** tối ưu theo use-case (API, dashboard, feature store).

Quy tắc:
- Serving có thể denormalize/aggregate nhưng phải giữ lineage link về curated.
- PII trong serving phải theo masking/tokenization policy.

---

## Data Quality (DQ)

Checklist tiêu chuẩn (tùy dataset chọn subset phù hợp):
- **Freshness**: dữ liệu có cập nhật đúng SLA không?
- **Completeness**: tỷ lệ null/missing có vượt ngưỡng?
- **Uniqueness**: khóa chính có bị trùng?
- **Validity**: giá trị có nằm trong domain?
- **Consistency**: quan hệ giữa các field/table có hợp lý?

Gợi ý triển khai:
- DQ check là “gates” cho curated/serving.
- Mỗi DQ check phải có: owner, severity, threshold, action khi fail.

---

## Bảo mật & quyền truy cập

### Phân loại dữ liệu (Classification)
Đề xuất 4 mức (có thể map sang internal policy):
- **Public**: công khai.
- **Internal**: nội bộ, không nhạy cảm.
- **Confidential**: có thể gây rủi ro nếu lộ.
- **Restricted**: PII/Secrets/Financial, cần kiểm soát chặt.

### Quyền truy cập (Access)
- Mặc định **deny-by-default**.
- Access được cấp dựa trên:
  - role (RBAC)
  - mục đích sử dụng (purpose)
  - classification

### Audit
- Log mọi hành vi:
  - ai truy cập
  - dataset nào
  - lúc nào
  - mục đích

---

## Lineage (truy vết nguồn gốc)

Yêu cầu tối thiểu:
- biết dataset serving/curated được tạo từ raw nào
- biết version transform
- biết run nào tạo ra snapshot hiện tại

Lineage là bắt buộc để:
- điều tra incident
- backfill
- chứng minh tuân thủ

---

## Retention & Deletion

Nguyên tắc:
- Dataset nào cũng phải khai báo retention.
- Xóa dữ liệu phải có khả năng *propagate* qua curated/serving.

Hai loại xóa:
- **Time-based retention**: tự dọn theo thời gian.
- **Subject request**: xóa theo chủ thể (vd: GDPR delete request), cần trace id.

---

## Tích hợp với workflow của repo này

Repo này tập trung vào “harness” cho agent. Khi mở rộng sang data governance, có thể dùng cùng tinh thần:
- Viết policy/contract rõ ràng như “instructions”.
- Có verify: DQ checks, access audit, retention jobs.
- Không kết luận “data OK” nếu không có bằng chứng (DQ + audit).

---

## Câu hỏi để chốt phạm vi (để refine tài liệu)

Nếu bạn muốn mình tinh chỉnh tài liệu theo bối cảnh thực tế, cần 5 thông tin:
1. Data stack hiện tại (warehouse/lake + orchestrator)
2. Có data catalog/tooling chưa (vd: DataHub/Amundsen/Glue…)
3. Dataset nào quan trọng nhất (top 3)
4. Có yêu cầu compliance nào không (GDPR/PCI/SOC2…)
5. Consumers chính: BI hay product APIs hay ML?
