# OpenSpec example

Thư mục này là **ví dụ cấu trúc** của phần `openspec/` trong một project sau khi dùng OpenSpec.

Nó không có ý nói rằng người dùng phải tự ngồi tạo tay toàn bộ các file này.

## Cách đúng để có cấu trúc này

Trong project thật:

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

Sau đó, khi dùng workflow của OpenSpec như propose/apply/archive, OpenSpec sẽ tạo và cập nhật các file liên quan.

## Ý nghĩa các thư mục và file trong ví dụ này

### `openspec/changes/`
Chứa các thay đổi đang được đề xuất hoặc đang triển khai.

### `openspec/changes/example-feature/proposal.md`
Giải thích vì sao cần thay đổi này và thay đổi những gì.

### `openspec/changes/example-feature/design.md`
Mô tả hướng thiết kế kỹ thuật cho thay đổi đó.

### `openspec/changes/example-feature/tasks.md`
Danh sách đầu việc cần làm để hoàn thành thay đổi.

### `openspec/changes/example-feature/specs/requirements.md`
Yêu cầu chi tiết và các tình huống cần đáp ứng.

### `openspec/changes/archive/`
Nơi chứa các thay đổi đã hoàn tất và được lưu lại.
