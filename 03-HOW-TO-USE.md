# How to use this repo

## Nếu chỉ muốn hiểu khái niệm
Đọc:
1. `README.md`
2. `01-FOUNDATIONS.md`

## Nếu muốn thêm harness vào một project có sẵn
Làm 4 việc:

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

## Nếu muốn lấy pattern local thay cho Superpowers
Dùng:
- `project-kit/local-superpower-patterns/`

## Nếu muốn lấy template nhét vào project thật
Chỉ nhìn vào:
- `project-kit/openspec/`
- `project-kit/local-superpower-patterns/`
- `project-kit/templates/`
