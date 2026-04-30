# Harness Engineering

Repository này giải thích cách tổ chức AI coding agent làm việc bài bản trong một dự án phần mềm.

## Sơ đồ khái niệm

```text
Harness Engineering
│
├─ 1. Lớp đặc tả
│  ├─ Mục đích: lưu yêu cầu, thiết kế, đầu việc và lịch sử thay đổi ra ngoài phần chat
│  └─ Ví dụ công cụ: OpenSpec
│
├─ 2. Lớp quy trình làm việc của agent
│  ├─ Mục đích: giúp agent suy nghĩ, lập kế hoạch, kiểm thử, gỡ lỗi và rà soát tốt hơn
│  └─ Ví dụ công cụ / framework: Superpowers
│
├─ 3. Lớp hướng dẫn riêng của dự án
│  ├─ Mục đích: dạy agent cách làm việc đúng với repo cụ thể này
│  └─ Ví dụ: AGENTS.md, tài liệu prompt, tài liệu workflow, checklist review
│
└─ 4. Lớp kiểm chứng
   ├─ Mục đích: không cho agent tự nhận là xong khi chưa có bằng chứng
   └─ Ví dụ: test, build, lint, review gate
```

## Giải thích ngắn

- **Harness Engineering** là khung tổ chức tổng thể để AI làm việc có bài bản hơn.
- **OpenSpec** nằm ở **lớp đặc tả**.
- **Superpowers** nằm ở **lớp quy trình làm việc của agent**.
- `AGENTS.md` và các file mẫu nằm ở **lớp hướng dẫn riêng của dự án**.
- test, build, lint và review nằm ở **lớp kiểm chứng**.

Nói ngắn gọn:

```text
Agent = Model + Harness
```

Muốn có harness tốt thì thường phải có đủ:
- lớp đặc tả
- lớp quy trình làm việc
- hướng dẫn riêng của dự án
- kiểm chứng

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
