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

### Sau khi init thường sẽ có cấu trúc kiểu

```text
openspec/
  changes/
    <feature-name>/
      proposal.md
      design.md
      tasks.md
      specs/
        requirements.md
  archive/
```

## 2. Superpowers

Repo này hiện không cung cấp official Superpowers plugin/package.

### Trong repo này có gì?
Có:
- `project-kit/local-superpower-patterns/`

Đây chỉ là local patterns để mô phỏng workflow như:
- brainstorming
- writing-plans
- TDD
- sub-agent execution
- git worktree discipline

### Điều cần hiểu rõ
- có mấy file markdown này không có nghĩa là mày đã cài official Superpowers
- nếu cần implementation/plugin thật, phải verify theo nguồn gốc tool/repo ngoài
