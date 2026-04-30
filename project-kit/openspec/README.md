# OpenSpec (real external tool)

OpenSpec ở đây được hiểu là **tool thật từ bên ngoài**, không phải mấy file markdown trong repo này.

## Cài đặt

```bash
npm install -g @fission-ai/openspec@latest
```

## Khởi tạo trong project

```bash
cd my-project
openspec init
```

## Sau khi init thường sẽ có cấu trúc kiểu

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

## Vai trò
- lưu spec cho từng thay đổi
- giữ context ngoài chat history
- làm source-of-truth cho requirement, design, tasks
- archive thay đổi đã hoàn tất

## Workflow thực tế
1. tạo proposal cho thay đổi mới
2. review proposal
3. refine design và tasks
4. dùng spec làm context cho execution
5. archive sau khi xong

## Ghi chú
Các file template trong thư mục này chỉ là ví dụ cấu trúc và nội dung. Chúng **không thay thế việc cài OpenSpec thật**.
