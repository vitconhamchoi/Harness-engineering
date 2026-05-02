# AGENTS.md — Ví dụ Project Root

> File này là ví dụ minh hoạ cho một project thực tế. Copy và điều chỉnh cho phù hợp với project của bạn.
> Xem `AGENTS.md` ở root repo để biết cấu trúc đầy đủ với 14 skills.

---

## Nguyên tắc tối thượng

Trước khi làm BẤT CỨ ĐIỀU GÌ, kiểm tra xem có skill nào áp dụng không.  
**Không bao giờ nhảy thẳng vào code. Không bao giờ bỏ qua bước kiểm tra.**

---

## Skill Map — Dùng Skill Nào Khi Nào

| Tình huống | Thứ tự skill bắt buộc |
|---|---|
| Bắt đầu feature mới | `brainstorm` → `write-plan` → `worktree` → `tdd` |
| Test fail / bug | `investigate` → `tdd` → `verify` |
| Bug production | `investigate` → `tdd` → `receive-review` |
| Nhiều task độc lập | `dispatch-agents` → mỗi agent: `investigate` + `tdd` |
| Nhận code review feedback | `receive-review` → `tdd` → `verify` |
| Chuẩn bị merge | `verify` → `finish-branch` |

---

## 🎯 Core Workflow

### SKILL: brainstorm
**Quy trình:** Hỏi làm rõ → đề xuất 2-3 hướng với trade-off → đợi xác nhận → lưu design.md  
**Chi tiết:** `docs/skills/brainstorm.md`

### SKILL: write-plan
**Quy trình:** Chia task 2-5 phút → mỗi task có file path, code snippet, verify command → lưu plan.md → đợi duyệt  
**Chi tiết:** `docs/skills/write-plan.md`

### SKILL: execute-plan
**Quy trình:** Chạy 3-5 task/batch → dừng báo cáo → đợi xác nhận → batch tiếp  
**Chi tiết:** `docs/skills/execute-plan.md`

---

## 🧪 Testing & Debugging

### SKILL: tdd
**Luật sắt:** RED (viết test fail) → GREEN (code tối thiểu) → REFACTOR → commit. Viết code trước test = xóa đi làm lại  
**Chi tiết:** `docs/skills/tdd.md`

### SKILL: investigate
**Quy trình:** Isolate → Hypothesize → Test → Verify. Không đoán mò  
**Chi tiết:** `docs/skills/investigate.md`

### SKILL: verify
**Iron Law:** Chạy test/build/lint → dán output thực tế → mới được kết luận xong  
**Chi tiết:** `docs/skills/verify.md`

---

## 🌳 Git Workflows

### SKILL: worktree
**Quy trình:** Tạo git worktree mới → chạy test baseline → báo cáo trạng thái  
**Chi tiết:** `docs/skills/worktree.md`

### SKILL: finish-branch
**Quy trình:** Verify pass → trình bày 4 lựa chọn (merge/PR/keep/discard) → thực thi  
**Chi tiết:** `docs/skills/finish-branch.md`

---

## 📝 Code Review

### SKILL: review
**Quy trình:** So sánh với plan/spec → phân loại Critical/Warning/Info → báo cáo blockers trước  
**Chi tiết:** `docs/skills/review.md`

### SKILL: receive-review
**Quy trình:** KHÔNG implement ngay → đánh giá kỹ thuật → push back nếu sai → tdd nếu đúng → verify  
**Chi tiết:** `docs/skills/receive-review.md`

---

## ⚡ Advanced Development

### SKILL: subagent-dev
**Quy trình:** Mỗi task = 1 subagent → review 2 bước (spec match + code quality) → mới chuyển task tiếp  
**Chi tiết:** `docs/skills/subagent-dev.md`

### SKILL: dispatch-agents
**Quy trình:** Xác nhận task độc lập → dispatch song song → tổng hợp kết quả  
**Chi tiết:** `docs/skills/dispatch-agents.md`

---

## 🛠️ Meta

### SKILL: write-skill
**Quy trình:** TDD cho documentation — test với subagent không có skill → viết skill → verify compliance  
**Chi tiết:** `docs/skills/write-skill.md`

### SKILL: workflow-guide
**Quy trình:** Hướng dẫn toàn bộ hệ thống 14 skills  
**Chi tiết:** `docs/skills/workflow-guide.md`

---

## Verification Commands của project này

```
# Điền lệnh thực tế của project vào đây:
- Test:  [lệnh test — ví dụ: npm test / pytest / ./mvnw test]
- Build: [lệnh build — ví dụ: npm run build / ./mvnw package]
- Lint:  [lệnh lint — ví dụ: npm run lint / flake8 . / golangci-lint run]
```

---

## Những điều KHÔNG BAO GIỜ được làm

- Nói "xong" mà chưa chạy và dán output verify
- Viết code trước khi viết test (vi phạm TDD)
- Implement feedback ngay mà không đánh giá kỹ thuật
- Bỏ qua brainstorm vì "feature nhỏ thôi"
- Chạy hết plan một lèo không có checkpoint dừng lại
- Đoán nguyên nhân bug thay vì investigate có hệ thống
- Commit khi test/build/lint đang fail

---

## Thông tin project cụ thể

### Module nhạy cảm (không sửa bừa)
- `src/auth/` — authentication logic
- `src/payments/` — payment processing
- `src/admin/` — admin functions

### Coding conventions
- [Điền convention của project]

### Tài liệu chi tiết
- `docs/skills/` — 14 file skill riêng biệt
- `docs/workflow-templates.md` — workflow end-to-end
- `docs/prompt-examples.md` — ví dụ trigger tự nhiên
- `docs/security-review-template.md` — template review bảo mật
