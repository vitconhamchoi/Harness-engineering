# Harness Engineering

Repository này giải thích cách tổ chức AI coding agent làm việc bài bản trong một dự án phần mềm.

## Mô hình thành phần

```text
                 Người dùng
                     │
                     │ giao mục tiêu / yêu cầu
                     ▼
              ┌───────────────┐
              │     Agent     │
              │    (Model)    │
              └───────┬───────┘
                      │
                      │ được điều khiển bởi harness
                      ▼
    ┌───────────────────────────────────────────────┐
    │                 HARNESS                       │
    │                                               │
    │  ┌─────────────────────────────────────────┐  │
    │  │ 1. Lớp hướng dẫn riêng của dự án       │  │
    │  │ - AGENTS.md                            │  │
    │  │ - prompt examples                      │  │
    │  │ - workflow docs                        │  │
    │  │ - review docs                          │  │
    │  └───────────────────┬────────────────────┘  │
    │                      │ tác động cách agent   │
    │                      │ hiểu repo và làm việc │
    │                      ▼                       │
    │  ┌─────────────────────────────────────────┐  │
    │  │ 2. Lớp quy trình làm việc của agent    │  │
    │  │ - Superpowers                          │  │
    │  │ - planning / debugging / review / TDD  │  │
    │  └───────────────────┬────────────────────┘  │
    │                      │ điều khiển cách       │
    │                      │ agent thực hiện việc  │
    │                      ▼                       │
    │  ┌─────────────────────────────────────────┐  │
    │  │ 3. Lớp đặc tả                           │  │
    │  │ - OpenSpec                              │  │
    │  │ - proposal / design / tasks            │  │
    │  └───────────────────┬────────────────────┘  │
    │                      │ cung cấp nguồn sự thật│
    │                      │ cho thay đổi          │
    │                      ▼                       │
    │  ┌─────────────────────────────────────────┐  │
    │  │ 4. Lớp kiểm chứng                       │  │
    │  │ - test                                  │  │
    │  │ - build                                 │  │
    │  │ - lint                                  │  │
    │  │ - review gate                           │  │
    │  └─────────────────────────────────────────┘  │
    │                                               │
    └───────────────────────────────────────────────┘
                      │
                      │ tạo thay đổi trong codebase
                      ▼
                 Mã nguồn dự án
```

## Hiểu ngắn gọn

- **Agent** là model trực tiếp làm việc.
- **Harness** là phần bao quanh agent để ép nó làm việc có tổ chức hơn.
- **Lớp hướng dẫn riêng của dự án** nói cho agent biết repo này phải làm thế nào.
- **Lớp quy trình làm việc của agent** quyết định cách agent suy nghĩ, lập kế hoạch, debug, test và review.
- **Lớp đặc tả** giữ yêu cầu, thiết kế và đầu việc ra ngoài phần chat.
- **Lớp kiểm chứng** buộc agent chứng minh là nó đã làm đúng.

## Quan hệ giữa OpenSpec và Superpowers

```text
Harness Engineering
│
├─ OpenSpec
│  └─ thuộc lớp đặc tả
│
└─ Superpowers
   └─ thuộc lớp quy trình làm việc của agent
```

Nói ngắn gọn:
- **OpenSpec** giữ nội dung cần làm.
- **Superpowers** cải thiện cách agent làm.

## Nên đọc theo thứ tự
1. `README.md`
2. `01-FOUNDATIONS.md`
3. `02-INSTALLATION.md`
4. `03-HOW-TO-USE.md`

## Phần nào có thể lấy sang project thật
Chỉ dùng các file trong:
- `project-kit/openspec/`
- `project-kit/local-superpower-patterns/`
- `project-kit/templates/`

## Lưu ý quan trọng
- OpenSpec là công cụ có thật dùng cho lớp đặc tả.
- Superpowers là plugin / framework có thật dùng cho lớp quy trình làm việc của agent.
- `project-kit/local-superpower-patterns/` không phải plugin Superpowers chính thức.
- Không nên copy cả repo này vào dự án. Chỉ lấy đúng phần cần dùng trong `project-kit/`.
