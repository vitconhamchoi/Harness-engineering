# Harness Engineering

Repository này giải thích **Harness Engineering** là gì và nó được ghép từ những phần nào trong một dự án dùng AI coding agent.

Hiểu ngắn gọn, Harness Engineering là cách bổ sung lớp điều phối xung quanh agent để agent làm việc đúng quy trình hơn, nhớ đúng ngữ cảnh hơn và tự kiểm tra kỹ hơn trước khi kết thúc.

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

Nói ngắn gọn:
- model là lõi suy luận
- agent là hệ thống làm việc dùng model
- harness là lớp điều phối cách agent vận hành

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
Giữ yêu cầu, thiết kế và đầu việc ra ngoài phần chat.

Ví dụ:
- openspec/changes/<ten-thay-doi>/proposal.md
- openspec/changes/<ten-thay-doi>/design.md
- openspec/changes/<ten-thay-doi>/tasks.md
- openspec/changes/<ten-thay-doi>/specs/requirements.md
- openspec/changes/archive/

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

## Cấu trúc repo hiện tại

- `README.md`: giải thích khái niệm chính
- `examples/project-root/`: ví dụ cấu trúc harness trong một project thật
