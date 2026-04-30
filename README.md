# Harness Engineering

Repository này giải thích cách bổ sung lớp điều phối xung quanh AI agent để agent làm việc đúng quy trình hơn trong một dự án phần mềm.

## 1. Ba khái niệm phải tách rõ

- **Model**: mô hình ngôn ngữ, tức lõi sinh câu trả lời và suy luận.
- **Agent**: hệ thống dùng model làm bộ não, đồng thời có thêm khả năng đọc file, gọi công cụ, sửa mã, chạy lệnh và làm việc nhiều bước.
- **Harness**: lớp bao quanh agent để nạp ngữ cảnh, áp quy tắc, gắn quy trình và buộc kiểm chứng.

Nói ngắn gọn:
- model là lõi suy luận
- agent là hệ thống làm việc dùng model
- harness là lớp điều phối cách agent vận hành

**Harness không phải agent. Agent cũng không phải model.**

## 2. Diagram

```text
Người dùng
   │
   ▼
Harness
   ├─ Hướng dẫn riêng của dự án
   ├─ Đặc tả thay đổi
   ├─ Quy trình làm việc của agent
   └─ Kiểm chứng
   │
   ▼
Agent
   │
   ▼
Mã nguồn và công cụ
```

## 3. Bốn phần của harness

### 3.1. Hướng dẫn riêng của dự án
Cho agent biết repo cụ thể này phải được xử lý như thế nào.

Ví dụ:
- `AGENTS.md`
- tài liệu prompt
- tài liệu workflow
- tài liệu review

Trong repo này:
- `examples/project-docs/`

### 3.2. Đặc tả thay đổi
Giữ yêu cầu, thiết kế và đầu việc ra ngoài phần chat.

Công cụ tiêu biểu:
- OpenSpec

Trong repo này:
- `examples/openspec/`

### 3.3. Quy trình làm việc của agent
Cải thiện cách agent phân tích, lập kế hoạch, kiểm thử, gỡ lỗi và rà soát.

Công cụ tiêu biểu:
- Superpowers

### 3.4. Kiểm chứng
Buộc agent chứng minh là thay đổi đã đúng trước khi kết thúc.

Ví dụ:
- test
- build
- lint
- review

## 4. OpenSpec, Superpowers, Spec-Kit nằm ở đâu?

- **OpenSpec**: công cụ cho phần **đặc tả thay đổi**.
- **Superpowers**: plugin / framework cho phần **quy trình làm việc của agent**.
- **Spec-Kit**: cách tổ chức quy trình theo hướng đặc tả trước.

Nói ngắn:
- cần công cụ quản lý spec -> OpenSpec
- cần workflow cho agent -> Superpowers
- cần cách tổ chức theo spec-first -> Spec-Kit

## 5. Ví dụ dùng lại trong repo này

- `examples/openspec/`
- `examples/project-docs/`
