# How to add Harness Engineering to an existing project

## Làm tối thiểu 4 việc

1. thêm spec layer
2. thêm AGENTS.md
3. thêm workflow docs
4. thêm verification discipline

## Cụ thể

### Bước 1. Thêm spec layer
Nếu dùng OpenSpec:

```bash
npm install -g @fission-ai/openspec@latest
cd my-project
openspec init
```

### Bước 2. Thêm AGENTS.md
Copy hoặc adapt từ:
- `project-kit/templates/AGENTS.md`

### Bước 3. Thêm workflow docs
Copy hoặc adapt từ:
- `project-kit/templates/prompt-examples.md`
- `project-kit/templates/workflow-templates.md`
- `project-kit/templates/security-review-template.md`
- `project-kit/templates/research-template.md`

### Bước 4. Thêm verification discipline
Ít nhất phải chốt:
- build command
- test command
- lint command
- khi nào được coi là done
