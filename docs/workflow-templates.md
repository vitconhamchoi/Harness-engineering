# Workflow Templates — Antigravity + 14 Skills

Template end-to-end cho các tình huống phổ biến. Antigravity sẽ tự nhận diện tình huống từ ngữ cảnh và follow workflow tương ứng.

---

## Template 1: Feature Development (Từ đầu đến cuối)

**Trigger:** "thêm chức năng X", "implement feature Y", "làm tính năng Z"

### Bước 1 — Làm rõ yêu cầu (`brainstorm`)
```
User: "thêm đăng nhập bằng Google"

Agent:
- Hỏi: endpoint mới hay thêm vào flow hiện tại?
- Hỏi: JWT hay session?
- Hỏi: chỉ web hay cả mobile?
→ Đề xuất 3 hướng với trade-off
→ Đợi xác nhận
→ Lưu design.md (ở root hoặc docs/ theo convention của project)
```

### Bước 2 — Lên kế hoạch (`write-plan`)
```
→ Chia thành 10-15 task nhỏ
→ Mỗi task: file path + code snippet + verify command
→ Lưu plan.md
→ Đợi duyệt
```

### Bước 3 — Tạo worktree (`worktree`)
```
git worktree add ../feat-google-login -b feat/google-login
→ Chạy test baseline → xác nhận sạch
```

### Bước 4 — Thực thi từng batch (`execute-plan` + `tdd`)
```
Batch 1 (3-5 task):
  Task 1: Viết test cho GoogleAuthProvider [RED]
  Task 2: Implement GoogleAuthProvider [GREEN]
  Task 3: Viết test cho API endpoint [RED]
→ Dừng, báo cáo, đợi xác nhận
→ Batch 2...
```

### Bước 5 — Review (`review`)
```
→ So sánh với plan.md
→ Phân loại Critical/Warning/Info
→ Sửa Critical trước
```

### Bước 6 — Verify và kết thúc (`verify` → `finish-branch`)
```
→ Chạy toàn bộ test/build/lint
→ Dán output
→ Trình bày 4 lựa chọn kết thúc branch
```

---

## Template 2: Bug Investigation & Fix

**Trigger:** "có bug", "lỗi X", "test fail", "API trả về sai"

### Bước 1 — Điều tra (`investigate`)
```
1. Isolate: reproduce bug một cách đáng tin cậy
2. Hypothesize: đặt 2-3 lý thuyết có căn cứ
3. Test: kiểm chứng từng lý thuyết
4. Verify: xác nhận root cause
```

### Bước 2 — Fix với TDD (`tdd`)
```
RED: Viết test reproduce bug → xác nhận fail
GREEN: Fix bug → xác nhận pass
REFACTOR: Dọn code → xác nhận vẫn pass
```

### Bước 3 — Xác nhận (`verify`)
```
→ Chạy toàn bộ test suite
→ Xác nhận không có regression
→ Dán output
```

---

## Template 3: Code Review & Feedback

**Trigger:** "nhận được review comment", "reviewer nói X", "có feedback trên PR"

### Bước 1 — Đánh giá feedback (`receive-review`)
```
→ Đọc kỹ từng comment, KHÔNG implement ngay
→ Phân loại: đúng / sai / preference
→ Push back nếu sai với lý do kỹ thuật rõ
```

### Bước 2 — Implement feedback đúng (`tdd`)
```
→ Với mỗi feedback hợp lệ:
   RED → GREEN → REFACTOR
```

### Bước 3 — Verify (`verify`)
```
→ Chạy test/build/lint
→ Dán output
→ Update PR
```

---

## Template 4: Parallel Task Execution

**Trigger:** "có 3 bug độc lập cần fix", "làm song song mấy task này"

### Bước 1 — Kiểm tra independence (`dispatch-agents`)
```
→ Liệt kê file mỗi task touch
→ Xác nhận không overlap
→ Xác nhận không state dependency
```

### Bước 2 — Dispatch song song
```
[Agent 1] → Task A (fix login bug)
[Agent 2] → Task B (fix export bug)
[Agent 3] → Task C (update docs)
(chạy cùng lúc)
```

### Bước 3 — Tổng hợp và verify
```
→ Thu kết quả từng agent
→ Resolve conflict nếu có
→ Chạy verify tổng hợp
```

---

## Template 5: Daily Workflow

### Buổi sáng — Bắt đầu ngày làm việc
```
1. Đọc plan.md (nếu có) hoặc tạo plan ngày hôm nay
2. Kiểm tra CI status
3. Nếu có task mới → brainstorm nếu cần → write-plan
4. Tạo worktree cho task ngày hôm nay
```

### Trong ngày — Coding
```
→ execute-plan theo batch
→ Sau mỗi batch: verify → báo cáo → đợi xác nhận
→ Mọi code change phải qua tdd
```

### Khi debug
```
→ investigate (không đoán mò)
→ tdd để fix
→ verify
```

### Cuối ngày / Khi ship
```
→ verify toàn bộ
→ review self (so với plan)
→ finish-branch → tạo PR
```
