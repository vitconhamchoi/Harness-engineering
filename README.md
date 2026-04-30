# Harness Engineering

Repository này giải thích cách bổ sung lớp điều phối xung quanh AI agent để agent làm việc đúng quy trình hơn trong một dự án phần mềm.

## 1. Ba khái niệm phải tách rõ

- **Model**: mô hình ngôn ngữ.
- **Agent**: model có thể đọc file, gọi công cụ, sửa mã, chạy lệnh.
- **Harness**: phần bao quanh agent để nạp ngữ cảnh, áp quy tắc, gắn quy trình và buộc kiểm chứng.

**Harness không phải agent.**
Harness là lớp tổ chức và điều phối cách agent làm việc.

## 2. Mô hình tổng quát

```text
Người dùng
   │
   ▼
Harness
   ├─ Hướng dẫn riêng của dự án
   ├─ Đặc tả thay đổi
   ├─ Quy trình làm việc của agent
   └─ Kiểm chứng
   │
   ▼
Agent
   │
   ▼
Mã nguồn và công cụ
```

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

## 5. Một harness tối thiểu gồm gì?

### Hướng dẫn riêng của dự án
Cho agent biết repo này phải làm theo quy tắc nào.

Ví dụ file:
- `AGENTS.md`
- `docs/prompt-examples.md`
- `docs/workflow-templates.md`
- `docs/security-review-template.md`
- `docs/research-template.md`

### Đặc tả thay đổi
Giữ yêu cầu, thiết kế và đầu việc ra ngoài phần chat.

Ví dụ công cụ:
- OpenSpec

### Quy trình làm việc của agent
Cải thiện cách agent phân tích, lập kế hoạch, kiểm thử, gỡ lỗi và rà soát.

Ví dụ công cụ:
- Superpowers

### Kiểm chứng
Buộc agent chứng minh là thay đổi đã đúng.

Ví dụ:
- test
- build
- lint
- review

## 6. Thêm harness vào project có sẵn như thế nào?

Làm bốn việc:

1. thêm hướng dẫn riêng của dự án
2. thêm phần đặc tả thay đổi
3. thêm quy trình làm việc của agent
4. thêm kiểm chứng

### 6.1. Thêm hướng dẫn riêng của dự án
Copy từ repo này sang project thật:

- `examples/templates/AGENTS.md` -> `/path/to/my-project/AGENTS.md`
- `examples/templates/prompt-examples.md` -> `/path/to/my-project/docs/prompt-examples.md`
- `examples/templates/workflow-templates.md` -> `/path/to/my-project/docs/workflow-templates.md`
- `examples/templates/security-review-template.md` -> `/path/to/my-project/docs/security-review-template.md`
- `examples/templates/research-template.md` -> `/path/to/my-project/docs/research-template.md`

### 6.2. Thêm phần đặc tả thay đổi bằng OpenSpec

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

### 6.3. Thêm quy trình làm việc của agent bằng Superpowers

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

### 6.4. Thêm kiểm chứng
Trong chính project của mày, phải xác định rõ:
- lệnh test
- lệnh build
- lệnh lint
- điều kiện được coi là hoàn thành

Nếu thiếu phần này thì harness chưa hoàn chỉnh.

## 7. Phần nào trong repo này có thể dùng lại?

- `examples/openspec/`
- `examples/templates/`
