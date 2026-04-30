# Installation

## 1. OpenSpec

OpenSpec là external tool thật.

### Cài đặt

```bash
npm install -g @fission-ai/openspec@latest
```

### Khởi tạo trong project

```bash
cd my-project
openspec init
```

## 2. Superpowers

Superpowers là plugin / skills framework thật, nhưng cách cài phụ thuộc platform.

### Claude Code official marketplace
```text
/plugin install superpowers@claude-plugins-official
```

### Claude Code via Superpowers marketplace
```text
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

### Cursor Agent
```text
/add-plugin superpowers
```

### Codex app
Mở sidebar `Plugins` -> tìm `Superpowers` -> bấm `+` để cài.

### OpenCode
Làm theo install doc chính thức của repo Superpowers cho OpenCode:
- https://raw.githubusercontent.com/obra/superpowers/refs/heads/main/.opencode/INSTALL.md

Theo doc hiện tại, plugin được khai báo trong `opencode.json`.

### GitHub Copilot CLI
```text
copilot plugin marketplace add obra/superpowers-marketplace
copilot plugin install superpowers@superpowers-marketplace
```

### Gemini CLI
```text
gemini extensions install https://github.com/obra/superpowers
```

## Điều quan trọng
- Superpowers thật là plugin/framework có install path thật.
- `project-kit/local-superpower-patterns/` trong repo này không phải official Superpowers plugin.
- Thư mục local đó chỉ là tài liệu/pattern tham khảo.
