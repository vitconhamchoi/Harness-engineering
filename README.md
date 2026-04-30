# Harness Engineering

Repository này giải thích cách bổ sung lớp điều phối xung quanh AI agent để agent làm việc đúng quy trình hơn trong một dự án phần mềm.

## 1. Ba khái niệm phải tách rõ

- **Model**: mô hình ngôn ngữ.
- **Agent**: model có thể đọc file, gọi công cụ, sửa mã, chạy lệnh.
- **Harness**: phần bao quanh agent để nạp ngữ cảnh, áp quy tắc, gắn quy trình và buộc kiểm chứng.

**Harness không phải agent.**
Harness là lớp tổ chức và điều phối cách agent làm việc.

## 2. Harness gồm 4 phần gì?

### Phần 1. Hướng dẫn riêng của dự án
Đây là phần nói cho agent biết repo cụ thể này phải được xử lý như thế nào.

Nó thường trả lời các câu hỏi như:
- repo này là gì?
- phần nào nhạy cảm, không được sửa bừa?
- coding convention nào phải theo?
- debug theo cách nào?
- review theo checklist nào?

Ví dụ file:
- `AGENTS.md`
- `docs/prompt-examples.md`
- `docs/workflow-templates.md`
- `docs/security-review-template.md`
- `docs/research-template.md`

Trong repo này, ví dụ nằm ở:
- `examples/project-docs/`

### Phần 2. Đặc tả thay đổi
Đây là phần giữ yêu cầu, thiết kế và đầu việc ra ngoài phần chat.

Mục đích là để thay đổi không bị phụ thuộc hoàn toàn vào trí nhớ tạm của agent trong một phiên làm việc.

Ví dụ nội dung cần có:
- proposal
- design
- tasks
- lịch sử thay đổi đã hoàn tất

Công cụ tiêu biểu:
- OpenSpec

Trong repo này, ví dụ nằm ở:
- `examples/openspec/`

### Phần 3. Quy trình làm việc của agent
Đây là phần cải thiện cách agent làm việc.

Nó không nói project này là gì, mà nói agent nên xử lý công việc theo quy trình nào, ví dụ:
- phân tích yêu cầu trước khi code
- lập kế hoạch trước khi sửa nhiều chỗ
- kiểm thử trước và sau khi sửa
- gỡ lỗi có hệ thống thay vì đoán mò
- rà soát lại kết quả trước khi kết thúc

Công cụ tiêu biểu:
- Superpowers

### Phần 4. Kiểm chứng
Đây là phần buộc agent chứng minh là thay đổi đã đúng trước khi kết thúc.

Nếu không có phần này thì agent rất dễ nói “xong rồi” dù thực tế chưa kiểm tra gì.

Ví dụ:
- test
- build
- lint
- review
- tiêu chí hoàn thành rõ ràng

## 3. OpenSpec và Superpowers nằm ở đâu?

- **OpenSpec** nằm ở phần **đặc tả thay đổi**.
- **Superpowers** nằm ở phần **quy trình làm việc của agent**.

Chúng không phải toàn bộ harness.
Chúng chỉ là hai thành phần bên trong harness.

## 4. OpenSpec và Spec-Kit khác nhau thế nào?

- **OpenSpec** là một công cụ cụ thể để quản lý proposal, design, tasks.
- **Spec-Kit** là cách tổ chức hoặc bộ khung làm việc theo hướng đặc tả trước.

Nói ngắn:
- cần **tool cụ thể** để quản lý spec -> nhìn **OpenSpec**
- cần **cách tổ chức quy trình theo spec-first** -> nhìn **Spec-Kit**

## 5. Thêm harness vào project có sẵn như thế nào?

Làm bốn việc:

1. thêm hướng dẫn riêng của dự án
2. thêm phần đặc tả thay đổi
3. thêm quy trình làm việc của agent
4. thêm kiểm chứng

### 5.1. Thêm hướng dẫn riêng của dự án
Copy cả thư mục mẫu từ repo này sang project thật:

```bash
cp -R examples/project-docs /path/to/my-project/docs
cp examples/project-docs/AGENTS.md /path/to/my-project/AGENTS.md
```

Sau khi copy, project của mày sẽ có:
- `/path/to/my-project/AGENTS.md`
- `/path/to/my-project/docs/project-docs/prompt-examples.md`
- `/path/to/my-project/docs/project-docs/workflow-templates.md`
- `/path/to/my-project/docs/project-docs/security-review-template.md`
- `/path/to/my-project/docs/project-docs/research-template.md`

Nếu muốn gọn hơn, mày có thể đổi tên thư mục `project-docs` sau khi copy.

### 5.2. Thêm phần đặc tả thay đổi bằng OpenSpec

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

### 5.3. Thêm quy trình làm việc của agent bằng Superpowers

Superpowers là plugin / framework có thật. Cách cài phụ thuộc nền tảng.

#### Claude Code
```text
/plugin install superpowers@claude-plugins-official
```

hoặc:

```text
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

#### Cursor Agent
```text
/add-plugin superpowers
```

#### Codex app
Mở `Plugins`, tìm `Superpowers`, rồi cài.

#### OpenCode
Làm theo:
- https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.opencode/INSTALL.md

#### GitHub Copilot CLI
```text
copilot plugin marketplace add obra/superpowers-marketplace
copilot plugin install superpowers@superpowers-marketplace
```

#### Gemini CLI
```text
gemini extensions install https://github.com/obra/superpowers
```

### 5.4. Thêm kiểm chứng
Trong chính project của mày, phải xác định rõ:
- lệnh test
- lệnh build
- lệnh lint
- điều kiện được coi là hoàn thành

Nếu thiếu phần này thì harness chưa hoàn chỉnh.

## 6. Phần nào trong repo này có thể dùng lại?

- `examples/openspec/`
- `examples/project-docs/`
