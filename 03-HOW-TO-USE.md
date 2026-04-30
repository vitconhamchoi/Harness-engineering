# How to use

## Cách 1. Dùng OpenSpec để thêm spec layer vào project có sẵn

Trong repo project của mày:

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

Sau đó dùng OpenSpec cho proposal, design, tasks.

## Cách 2. Dùng Superpowers thật

Nếu platform của mày hỗ trợ plugin, cài Superpowers theo `02-INSTALLATION.md`.

Sau khi cài, cách dùng đúng là:
- agent có thể tự activate skill phù hợp theo context
- hoặc mày gọi command/skill khi cần

Ví dụ workflow phổ biến:
- brainstorm trước khi code
- write plan sau khi chốt design
- execute plan / subagent-driven-development khi bắt đầu implementation
- TDD trong lúc code
- code review trước khi kết thúc

## Ý nghĩa thực tế của Superpowers
Superpowers không có giá trị nếu chỉ là mấy file md phải tự đọc tay mỗi lần.
Giá trị của nó là khi nó được cài vào agent platform và trở thành workflow có thể invoke hoặc auto-activate.

## Cách 3. Copy docs/template vào project thật

### Copy từ đâu vào đâu

#### AGENTS.md
Nguồn:
- `project-kit/templates/AGENTS.md`

Đích:
- `/path/to/my-project/AGENTS.md`

#### Prompt examples
Nguồn:
- `project-kit/templates/prompt-examples.md`

Đích:
- `/path/to/my-project/docs/prompt-examples.md`

#### Workflow templates
Nguồn:
- `project-kit/templates/workflow-templates.md`

Đích:
- `/path/to/my-project/docs/workflow-templates.md`

#### Security review template
Nguồn:
- `project-kit/templates/security-review-template.md`

Đích:
- `/path/to/my-project/docs/security-review-template.md`

#### Research template
Nguồn:
- `project-kit/templates/research-template.md`

Đích:
- `/path/to/my-project/docs/research-template.md`

## `project-kit/local-superpower-patterns/` dùng để làm gì?
Chỉ để tham khảo hoặc adapt khi:
- platform của mày chưa cài được Superpowers thật
- mày muốn mượn workflow ideas

Nó không phải bản thay thế đầy đủ cho official Superpowers plugin/framework.
