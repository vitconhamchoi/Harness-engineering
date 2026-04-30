# Cách dùng

## 1. Nếu muốn thêm harness vào một project có sẵn
Cần làm đủ bốn việc:

1. thêm phần hướng dẫn riêng của dự án
2. thêm phần đặc tả thay đổi
3. thêm phần quy trình làm việc của agent
4. thêm phần kiểm chứng

## 2. Thêm phần hướng dẫn riêng của dự án
Copy các file sau vào project thật.

### File hướng dẫn agent
Nguồn:
- `project-kit/templates/AGENTS.md`

Đích:
- `/path/to/my-project/AGENTS.md`

### File ví dụ prompt
Nguồn:
- `project-kit/templates/prompt-examples.md`

Đích:
- `/path/to/my-project/docs/prompt-examples.md`

### File mẫu quy trình
Nguồn:
- `project-kit/templates/workflow-templates.md`

Đích:
- `/path/to/my-project/docs/workflow-templates.md`

### File mẫu rà soát bảo mật
Nguồn:
- `project-kit/templates/security-review-template.md`

Đích:
- `/path/to/my-project/docs/security-review-template.md`

### File mẫu nghiên cứu
Nguồn:
- `project-kit/templates/research-template.md`

Đích:
- `/path/to/my-project/docs/research-template.md`

## 3. Thêm phần đặc tả thay đổi
Trong repo project của mày, chạy:

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

Sau đó dùng OpenSpec để quản lý:
- đề xuất thay đổi
- thiết kế
- đầu việc

## 4. Thêm phần quy trình làm việc của agent
Nếu nền tảng mày dùng có hỗ trợ plugin, cài Superpowers theo `02-INSTALLATION.md`.

Sau khi cài xong, agent sẽ có thêm quy trình làm việc tốt hơn cho:
- phân tích yêu cầu
- lập kế hoạch
- kiểm thử
- gỡ lỗi
- rà soát mã nguồn

## 5. Thêm phần kiểm chứng
Trong chính project của mày, phải xác định rõ ít nhất các lệnh sau:
- lệnh test
- lệnh build
- lệnh lint
- điều kiện được coi là hoàn thành

Nếu không có phần này thì harness chưa hoàn chỉnh.

