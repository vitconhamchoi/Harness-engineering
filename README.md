# Harness Engineering

Repo này có 2 phần rõ ràng:

## 1. Explanation ở root
Dùng để hiểu khái niệm, tư duy, và cách thiết kế harness.

Các file chính:
- `implementation-mapping.md`
- `implementation-comparison.md`
- `failure-taxonomy.md`
- `evolution-path.md`

## 2. Project kit trong `project-kit/`
Dùng để copy hoặc adapt vào dự án thật.

Bên trong có:
- `project-kit/openspec/` → phần spec + memory
- `project-kit/superpowers/` → phần design + execution skills
- `project-kit/examples/` → ví dụ áp vào project thật

## Ý ngắn gọn
- **OpenSpec** = quản lý spec + archive + memory của thay đổi
- **Superpowers** = quản lý brainstorming, planning, TDD, sub-agent execution, worktree discipline
- **Harness Engineering** = tư duy tổng quát để ghép các lớp này thành một hệ agent reliable hơn

Nếu muốn nhét vào dự án thật, đừng copy cả repo. Hãy lấy thứ cần từ `project-kit/`.
