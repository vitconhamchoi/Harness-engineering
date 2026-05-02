# Skill: worktree

## Mục đích (One-liner)
Tạo git worktree sạch cho feature/bugfix, xác nhận baseline trước khi code.

## Khi nào dùng
- Bắt đầu feature mới
- Bắt đầu bugfix không trivial
- Cần làm việc song song trên nhiều branch
- Trước khi `execute-plan` trên feature lớn

## Khi nào KHÔNG dùng
- Hotfix khẩn 1-2 dòng trực tiếp trên branch hiện tại
- Khi đã có worktree và chưa cần thêm

## Quy trình bắt buộc
1. Xác định base branch hợp lý (thường là `main` hoặc `develop`)
2. Đặt tên branch có nghĩa: `feat/[tên-feature]` hoặc `fix/[mô-tả-bug]`
3. Tạo git worktree:
   ```bash
   git worktree add ../[tên-worktree] -b [tên-branch]
   ```
4. Chạy test trong worktree mới để xác nhận **baseline sạch**
5. Báo cáo trạng thái worktree trước khi bắt đầu code

## Anti-patterns (những gì không được làm)
- Code trực tiếp trên `main` / `master`
- Bỏ qua bước chạy test baseline
- Đặt tên branch chung chung: `fix`, `test`, `feature1`
- Tạo worktree từ branch đã có uncommitted changes

## Ví dụ trigger tự nhiên
- "bắt đầu làm tính năng mới"
- "tạo branch cho task này"
- "setup worktree trước khi code"
- sau khi `write-plan` được duyệt và trước `execute-plan`

## Output mong đợi
```
## Worktree: feat/google-login

Branch: feat/google-login (từ main @ abc1234)
Worktree: ../harness-google-login/

### Baseline test
Lệnh: `npm test`
Output:
  Test Suites: 8 passed, 8 total
  Tests: 47 passed, 47 total
✅ Baseline sạch — sẵn sàng bắt đầu implement

Bước tiếp theo: `execute-plan` theo plan.md
```
