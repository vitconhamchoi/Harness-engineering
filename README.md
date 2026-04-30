# Harness Engineering

Repo này có 2 phần:

## 1. Explanation ở root
Dùng để hiểu khái niệm và cách thiết kế harness.

- `implementation-mapping.md`
- `implementation-comparison.md`
- `failure-taxonomy.md`
- `evolution-path.md`

## 2. Project kit trong `project-kit/`
Dùng để copy hoặc adapt vào dự án thật.

- `project-kit/openspec/` → hướng dẫn dùng **OpenSpec thật**
- `project-kit/local-superpower-patterns/` → pattern local phỏng theo tinh thần superpowers, **không phải official package**
- `project-kit/examples/` → ví dụ áp vào project thật

## Rất quan trọng
- **OpenSpec** là external tool thật, có lệnh cài.
- `local-superpower-patterns/` trong repo này chỉ là local skill docs/patterns, không có nghĩa là mày đã cài official “Superpowers” package/plugin.

Nếu muốn nhét vào dự án thật, đừng copy cả repo. Hãy lấy thứ cần từ `project-kit/`.
