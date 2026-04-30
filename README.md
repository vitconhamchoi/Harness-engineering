# Harness Engineering

Repository này mô tả cách tổ chức AI coding agent làm việc có kiểm soát trong một dự án phần mềm.

## Cần hiểu ngay từ đầu

Hình dưới đây mô tả **4 lớp khái niệm** của một harness.

Nó **không có nghĩa** là trong repo hoặc trong project thật sẽ luôn tồn tại đúng 4 thư mục tương ứng.

Trong thực tế:
- một lớp có thể được hiện thực bằng **tool**
- hoặc bằng **file cấu hình**
- hoặc bằng **tài liệu hướng dẫn**
- hoặc bằng **quy trình làm việc**

## Mô hình tổng quát

```text
Người dùng
   │
   ▼
Harness
   ├─ Lớp hướng dẫn dự án
   ├─ Lớp đặc tả
   ├─ Lớp quy trình làm việc của agent
   └─ Lớp kiểm chứng
   │
   ▼
Agent / Model
   │
   ▼
Mã nguồn và công cụ
```

## Trong repo này, mỗi lớp được hiện thực bằng gì?

### 1. Lớp hướng dẫn dự án
Mục đích: nói cho agent biết cách làm việc đúng với một repo cụ thể.

Trong repo này, lớp đó được thể hiện bằng:
- `project-kit/templates/AGENTS.md`
- `project-kit/templates/prompt-examples.md`
- `project-kit/templates/workflow-templates.md`
- `project-kit/templates/security-review-template.md`
- `project-kit/templates/research-template.md`

### 2. Lớp đặc tả
Mục đích: lưu yêu cầu, thiết kế, đầu việc và thay đổi ra ngoài phần chat.

Trong repo này, lớp đó được thể hiện bằng:
- `02-INSTALLATION.md` phần cài OpenSpec
- `project-kit/openspec/`

Công cụ tiêu biểu:
- OpenSpec

### 3. Lớp quy trình làm việc của agent
Mục đích: cải thiện cách agent phân tích, lập kế hoạch, kiểm thử, gỡ lỗi và rà soát.

Trong repo này, lớp đó được thể hiện bằng:
- `02-INSTALLATION.md` phần cài Superpowers
- `project-kit/local-superpower-patterns/` (chỉ là tài liệu tham khảo, không phải plugin chính thức)

Công cụ tiêu biểu:
- Superpowers

### 4. Lớp kiểm chứng
Mục đích: buộc agent chứng minh là kết quả đúng trước khi kết thúc.

Trong repo này, lớp đó chủ yếu được mô tả ở mức nguyên tắc trong:
- `01-FOUNDATIONS.md`
- `03-HOW-TO-USE.md`

Ví dụ thực tế:
- test
- build
- lint
- review

## Vai trò của từng thành phần

- **Harness Engineering**: khung tổ chức tổng thể.
- **OpenSpec**: công cụ cho lớp đặc tả.
- **Superpowers**: plugin / framework cho lớp quy trình làm việc của agent.
- **AGENTS.md** và tài liệu mẫu: phần hướng dẫn riêng của từng dự án.
- **Test / build / lint / review**: phần kiểm chứng.

## Tài liệu chính
1. `01-FOUNDATIONS.md`
2. `02-INSTALLATION.md`
3. `03-HOW-TO-USE.md`

## Phần có thể dùng lại trong project
- `project-kit/openspec/`
- `project-kit/local-superpower-patterns/`
- `project-kit/templates/`
