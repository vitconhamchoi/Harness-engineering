# Cách dùng

## Trường hợp 1: Muốn thêm lớp đặc tả vào project đang có sẵn

Trong repo project của mày, chạy:

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

Sau đó dùng OpenSpec để quản lý:
- đề xuất thay đổi
- thiết kế
- danh sách đầu việc

## Trường hợp 2: Muốn thêm Superpowers vào agent

Nếu nền tảng mày dùng có hỗ trợ plugin, cài Superpowers theo `02-INSTALLATION.md`.

Sau khi cài xong, Superpowers sẽ giúp agent làm việc tốt hơn ở các bước như:
- phân tích yêu cầu trước khi code
- lập kế hoạch
- thực hiện từng bước có kiểm soát
- kiểm thử
- gỡ lỗi
- rà soát mã nguồn

Tùy nền tảng, agent có thể:
- tự kích hoạt kỹ năng phù hợp theo ngữ cảnh
- hoặc cho phép người dùng gọi lệnh trực tiếp

## Trường hợp 3: Muốn bổ sung tài liệu hướng dẫn cho project thật

### Copy từ đâu sang đâu

#### File hướng dẫn agent
Nguồn:
- `project-kit/templates/AGENTS.md`

Đích:
- `/path/to/my-project/AGENTS.md`

#### File ví dụ prompt
Nguồn:
- `project-kit/templates/prompt-examples.md`

Đích:
- `/path/to/my-project/docs/prompt-examples.md`

#### File mẫu quy trình
Nguồn:
- `project-kit/templates/workflow-templates.md`

Đích:
- `/path/to/my-project/docs/workflow-templates.md`

#### File mẫu rà soát bảo mật
Nguồn:
- `project-kit/templates/security-review-template.md`

Đích:
- `/path/to/my-project/docs/security-review-template.md`

#### File mẫu nghiên cứu
Nguồn:
- `project-kit/templates/research-template.md`

Đích:
- `/path/to/my-project/docs/research-template.md`

## `project-kit/local-superpower-patterns/` dùng để làm gì?
Thư mục này chỉ để tham khảo thêm ý tưởng tổ chức quy trình làm việc.

Nó chỉ hữu ích khi:
- mày chưa cài được Superpowers chính thức
- hoặc mày muốn tham khảo cách tổ chức workflow để tự điều chỉnh cho project riêng

Nó không phải bản thay thế đầy đủ cho Superpowers chính thức.
