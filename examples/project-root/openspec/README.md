# OpenSpec example

Đây là **ví dụ cấu trúc thư mục `openspec/`** trong một project dùng OpenSpec.

**Không phải tự tạo tay các file này.**
Cách đúng là cài OpenSpec, chạy `openspec init`, rồi dùng lệnh / workflow của OpenSpec để nó sinh và cập nhật các file.

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

Các lệnh / workflow quan trọng:
- `/opsx:propose <ten-thay-doi>`: tạo proposal, design, tasks, specs cho một thay đổi mới
- `/opsx:apply`: triển khai các tasks đang có
- `/opsx:archive`: lưu thay đổi đã hoàn tất vào archive
- `openspec update`: cập nhật lại agent instructions / workflow trong project

Ý nghĩa nhanh:
- `changes/<feature>/proposal.md`: mô tả thay đổi
- `changes/<feature>/design.md`: thiết kế kỹ thuật
- `changes/<feature>/tasks.md`: danh sách đầu việc
- `changes/<feature>/specs/requirements.md`: yêu cầu chi tiết
- `changes/archive/`: thay đổi đã hoàn tất
