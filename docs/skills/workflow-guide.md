# Skill: workflow-guide

## Mục đích (One-liner)
Hướng dẫn tổng quan hệ thống 14 skills — onboarding, tra cứu, và reference.

## Khi nào dùng
- Onboard thành viên mới vào team
- Khi không biết dùng skill nào cho tình huống hiện tại
- Khi cần giải thích hệ thống cho người khác
- Khi muốn review lại toàn bộ workflow

## Khi nào KHÔNG dùng
- Khi đã biết cần dùng skill nào (đi thẳng vào skill đó)

## Quy trình

### Để hiểu hệ thống
1. Đọc `AGENTS.md` → Skill Map ở đầu file
2. Đọc `docs/skills/` → file skill riêng cho từng kỹ năng
3. Đọc `docs/workflow-templates.md` → workflow end-to-end
4. Đọc `docs/prompt-examples.md` → ví dụ trigger thực tế

### Để trigger skill
Không cần slash command. Nói tự nhiên là agent sẽ nhận diện:
- "thêm feature X" → `brainstorm` → `write-plan` → `worktree` → `tdd`
- "debug lỗi Y" → `investigate` → `tdd` → `verify`
- "nhận review comment Z" → `receive-review`
- "xong rồi, commit đi" → `verify` → (nếu pass) commit

### 14 Skills — Tóm tắt nhanh

| # | Skill | Khi nào |
|---|---|---|
| 1 | `brainstorm` | Feature mới, yêu cầu mơ hồ |
| 2 | `write-plan` | Sau design, trước implement |
| 3 | `execute-plan` | Plan đã duyệt |
| 4 | `tdd` | MỌI thay đổi code |
| 5 | `investigate` | Bug, test fail |
| 6 | `verify` | Trước commit, trước "xong" |
| 7 | `worktree` | Bắt đầu feature/bugfix |
| 8 | `finish-branch` | Kết thúc work item |
| 9 | `review` | Self-review trước push |
| 10 | `receive-review` | Nhận feedback từ người khác |
| 11 | `subagent-dev` | Task phức tạp cần isolation |
| 12 | `dispatch-agents` | Task độc lập, muốn song song |
| 13 | `write-skill` | Tạo/cải thiện skill mới |
| 14 | `workflow-guide` | File này — tổng quan hệ thống |

## So sánh với Superpowers

| Tính năng | Superpowers | Workflow-guide (file này) |
|---|---|---|
| 14 skills có cấu trúc | ✅ | ✅ |
| TDD bắt buộc | ✅ | ✅ |
| Iron Law of Verification | ✅ | ✅ |
| Trigger từ ngữ cảnh tự nhiên | ✅ | ✅ |
| Hook chặn commit tự động | ✅ | ❌ (cần enforce thủ công hoặc CI) |
| Slash commands như shortcut | ✅ | ❌ (không cần — trigger từ ngữ cảnh) |
| Cần cài đặt | ✅ (cần install) | ❌ (chỉ cần git clone) |
| Dùng với Antigravity | ❌ (chưa có tích hợp) | ✅ (native) |
