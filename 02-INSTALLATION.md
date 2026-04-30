# Cài đặt

## 1. Cài OpenSpec

OpenSpec là công cụ có thật dùng để quản lý đặc tả thay đổi trong dự án.

### Cài đặt

```bash
npm install -g @fission-ai/openspec@latest
```

### Khởi tạo trong project

```bash
cd my-project
openspec init
```

## 2. Cài Superpowers

Superpowers là plugin / framework có thật, nhưng cách cài phụ thuộc vào nền tảng đang dùng.

### Claude Code, dùng kho plugin chính thức
```text
/plugin install superpowers@claude-plugins-official
```

### Claude Code, dùng kho Superpowers marketplace
```text
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

### Cursor Agent
```text
/add-plugin superpowers
```

### Codex app
Mở thanh bên `Plugins`, tìm `Superpowers`, rồi bấm `+` để cài.

### OpenCode
Làm theo tài liệu cài đặt chính thức của Superpowers cho OpenCode:
- https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.opencode/INSTALL.md

Theo tài liệu hiện tại, plugin được khai báo trong `opencode.json`.

### GitHub Copilot CLI
```text
copilot plugin marketplace add obra/superpowers-marketplace
copilot plugin install superpowers@superpowers-marketplace
```

### Gemini CLI
```text
gemini extensions install https://github.com/obra/superpowers
```

## Điều cần hiểu rõ
- OpenSpec là công cụ riêng cho phần đặc tả.
- Superpowers là plugin / framework riêng cho quy trình làm việc của agent.
