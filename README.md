# Harness Engineering

Repository này mô tả cách tổ chức AI coding agent làm việc có kiểm soát trong một dự án phần mềm.

## Mô hình tổng quát

```text
Người dùng
   │
   ▼
Harness
   ├─ Lớp hướng dẫn dự án
   │  └─ AGENTS.md, prompt examples, workflow docs
   │
   ├─ Lớp đặc tả
   │  └─ OpenSpec
   │
   ├─ Lớp quy trình làm việc của agent
   │  └─ Superpowers
   │
   └─ Lớp kiểm chứng
      └─ test, build, lint, review
   │
   ▼
Agent / Model
   │
   ▼
Mã nguồn và công cụ
```

## Vai trò của từng thành phần

- **Harness Engineering**: khung tổ chức tổng thể.
- **OpenSpec**: công cụ cho lớp đặc tả.
- **Superpowers**: plugin / framework cho lớp quy trình làm việc của agent.
- **AGENTS.md** và tài liệu mẫu: hướng dẫn riêng của từng dự án.
- **Test / build / lint / review**: lớp kiểm chứng.

## Tài liệu chính
1. `01-FOUNDATIONS.md`
2. `02-INSTALLATION.md`
3. `03-HOW-TO-USE.md`

## Phần có thể dùng lại trong project
- `project-kit/openspec/`
- `project-kit/local-superpower-patterns/`
- `project-kit/templates/`
