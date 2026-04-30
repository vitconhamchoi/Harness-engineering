# Harness Engineering

Repository này giải thích cách bổ sung lớp điều phối xung quanh AI agent để agent làm việc đúng quy trình hơn trong một dự án phần mềm.

## Định nghĩa ngắn

- **Model**: mô hình ngôn ngữ.
- **Agent**: model có thể đọc file, gọi công cụ, sửa mã, chạy lệnh.
- **Harness**: phần bao quanh agent để nạp ngữ cảnh, áp quy tắc, gắn quy trình và buộc kiểm chứng.

**Harness không phải agent.**
Harness là phần cấu hình và điều phối cách agent làm việc.

## Mô hình tổng quát

```text
Người dùng
   │
   ▼
Harness
   ├─ nạp hướng dẫn dự án
   ├─ nạp đặc tả thay đổi
   ├─ gắn quy trình làm việc
   └─ áp bước kiểm chứng
   │
   ▼
Agent
   │
   ├─ đọc file
   ├─ sửa mã
   ├─ chạy công cụ
   └─ tạo thay đổi trong project
   │
   ▼
Mã nguồn và công cụ
```

## Các thành phần chính của harness

### 1. Hướng dẫn riêng của dự án
Mục đích: cho agent biết repo này phải được xử lý theo cách nào.

Trong repo này:
- `project-kit/templates/AGENTS.md`
- `project-kit/templates/prompt-examples.md`
- `project-kit/templates/workflow-templates.md`
- `project-kit/templates/security-review-template.md`
- `project-kit/templates/research-template.md`

### 2. Đặc tả thay đổi
Mục đích: lưu yêu cầu, thiết kế và đầu việc ra ngoài phần chat.

Trong repo này:
- `project-kit/openspec/`
- `02-INSTALLATION.md` phần cài OpenSpec

Công cụ tiêu biểu:
- OpenSpec

### 3. Quy trình làm việc của agent
Mục đích: cải thiện cách agent phân tích, lập kế hoạch, kiểm thử, gỡ lỗi và rà soát.

Trong repo này:
- `02-INSTALLATION.md` phần cài Superpowers

Công cụ tiêu biểu:
- Superpowers

### 4. Kiểm chứng
Mục đích: buộc agent chứng minh là thay đổi đã đúng trước khi kết thúc.

Ví dụ:
- test
- build
- lint
- review

## OpenSpec và Superpowers nằm ở đâu?

- **OpenSpec** thuộc phần **đặc tả thay đổi**.
- **Superpowers** thuộc phần **quy trình làm việc của agent**.

Chúng không phải toàn bộ harness.
Chúng chỉ là hai thành phần bên trong harness.

## Tài liệu chính
1. `01-FOUNDATIONS.md`
2. `02-INSTALLATION.md`
3. `03-HOW-TO-USE.md`

## Phần có thể dùng lại trong project
- `project-kit/openspec/`
- `project-kit/templates/`
