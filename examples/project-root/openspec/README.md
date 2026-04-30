# OpenSpec example

Đây là **ví dụ cấu trúc thư mục `openspec/`** trong một project dùng OpenSpec.

**Không phải tự tạo tay các file này.**
Cách đúng là cài OpenSpec, chạy `openspec init`, rồi dùng workflow của OpenSpec để nó sinh và cập nhật các file.

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

Ý nghĩa nhanh:
- `changes/<feature>/proposal.md`: mô tả thay đổi
- `changes/<feature>/design.md`: thiết kế kỹ thuật
- `changes/<feature>/tasks.md`: danh sách đầu việc
- `changes/<feature>/specs/requirements.md`: yêu cầu chi tiết
- `changes/archive/`: thay đổi đã hoàn tất
