# OpenSpec

Phần này đại diện cho lớp **spec + memory** trong một harness.

## Vai trò
- lưu spec cho từng thay đổi
- giữ context ngoài chat history
- làm source-of-truth cho requirement, design, và tasks
- archive thay đổi đã hoàn tất

## Cấu trúc điển hình trong project thật

```text
openspec/
  changes/
    <feature-name>/
      proposal.md
      design.md
      tasks.md
      specs/
        requirements.md
  archive/
```

## Dùng thế nào
Trong dự án thật:
1. khởi tạo OpenSpec
2. tạo change proposal
3. review proposal
4. dùng spec làm context cho execution
5. archive sau khi xong

## Ghi chú
Đây là lớp quản lý tri thức và boundary của thay đổi, không phải phần execution skill.
