# Harness Engineering

Harness Engineering là cách tổ chức thêm các lớp hỗ trợ xung quanh AI agent để việc phân tích, lập kế hoạch, triển khai và kiểm tra trong dự án phần mềm diễn ra ổn định hơn.

Mục tiêu của nó là giảm việc agent làm theo cảm tính của từng phiên chat, đồng thời giữ yêu cầu, quy trình và tiêu chí kiểm chứng ở trạng thái rõ ràng hơn.

## Diagram

```text
Người dùng
   │
   ▼
Harness
   ├─ Hướng dẫn riêng của dự án
   │  └─ ví dụ: AGENTS.md, docs/
   │
   ├─ Đặc tả thay đổi
   │  └─ ví dụ công cụ: OpenSpec
   │
   ├─ Quy trình làm việc của agent
   │  └─ ví dụ công cụ / framework: Superpowers
   │
   └─ Kiểm chứng
   │  └─ ví dụ: test, build, lint, review
   │
   ▼
Agent
   │
   ▼
Mã nguồn và công cụ
```

## Khái niệm chính

- **Model**: mô hình ngôn ngữ, tức lõi sinh câu trả lời và suy luận.
- **Agent**: hệ thống dùng model làm bộ não, đồng thời có thêm khả năng đọc file, gọi công cụ, sửa mã, chạy lệnh và làm việc nhiều bước.
- **Harness**: lớp bao quanh agent để nạp ngữ cảnh, áp quy tắc, gắn quy trình và buộc kiểm chứng.

**Harness không phải agent. Agent cũng không phải model.**

## Bốn phần của harness

### 1. Hướng dẫn riêng của dự án
Cho agent biết repo cụ thể này phải được xử lý như thế nào.

Ví dụ:
- `AGENTS.md`
- tài liệu prompt
- tài liệu workflow
- tài liệu review

Trong repo này:
- `examples/project-root/AGENTS.md`
- `examples/project-root/docs/`

### 2. Đặc tả thay đổi
Giữ yêu cầu, thiết kế, đầu việc và lịch sử thay đổi ra ngoài phần chat.

Đây là nơi trả lời các câu hỏi như:
- thay đổi này nhằm giải quyết vấn đề gì?
- phạm vi thay đổi là gì?
- hướng thiết kế kỹ thuật là gì?
- cần làm những đầu việc nào?
- yêu cầu chi tiết và tình huống cần đáp ứng là gì?

Ví dụ cấu trúc thường gặp:
- `openspec/changes/<ten-thay-doi>/proposal.md`: mô tả mục tiêu và phạm vi thay đổi
- `openspec/changes/<ten-thay-doi>/design.md`: hướng thiết kế kỹ thuật
- `openspec/changes/<ten-thay-doi>/tasks.md`: danh sách đầu việc cần thực hiện
- `openspec/changes/<ten-thay-doi>/specs/requirements.md`: yêu cầu chi tiết
- `openspec/changes/archive/`: nơi lưu các thay đổi đã hoàn tất

Trong tầng này:
- **OpenSpec** là một công cụ cụ thể để quản lý đặc tả

Trong repo này:
- `examples/project-root/openspec/`

### 3. Quy trình làm việc của agent
Cải thiện cách agent phân tích, lập kế hoạch, kiểm thử, gỡ lỗi và rà soát.

Trong tầng này:
- **Superpowers** là plugin / framework giúp agent làm việc theo workflow mạnh hơn

### 4. Kiểm chứng
Buộc agent chứng minh là thay đổi đã đúng trước khi kết thúc.

Ví dụ:
- test
- build
- lint
- review

