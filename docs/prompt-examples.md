# Prompt Examples — Trigger Skills Bằng Ngôn Ngữ Tự Nhiên

Không cần slash command. Nói tự nhiên — agent sẽ nhận diện và vào đúng skill.

---

## 🎯 Core Workflow

### Trigger `brainstorm`
```
"muốn thêm chức năng thanh toán bằng VNPay"
"đang nghĩ tới việc refactor module auth"
"cần xây notification system, chưa biết bắt đầu từ đâu"
"muốn thêm dark mode cho app"
"có ý tưởng tối ưu database query, không biết hướng nào tốt hơn"
```

### Trigger `write-plan`
```
"design xong rồi, giờ lên kế hoạch implement đi"
"chia task ra để tôi biết làm gì trước"
"trước khi làm, viết plan chi tiết cho tôi"
"list out các bước cần làm"
```

### Trigger `execute-plan`
```
"plan ok rồi, bắt đầu làm đi"
"chạy theo plan.md"
"implement theo kế hoạch đã duyệt"
"bắt đầu từ task 1"
```

---

## 🧪 Testing & Debugging

### Trigger `tdd`
```
"thêm validation cho phone number"
"implement hàm tính discount"
"sửa bug tính tổng không đúng"
"refactor UserService"
"thêm error handling cho API call"
```
*(Bất kỳ yêu cầu thay đổi code nào đều trigger TDD)*

### Trigger `investigate`
```
"tại sao test này fail?"
"API bị lỗi 500 ở endpoint tạo đơn"
"có bug ở màn hình checkout, không biết do đâu"
"intermittent error xuất hiện vài lần trong ngày"
"performance đang chậm bất thường từ hôm qua"
"output của function này sai mà không hiểu tại sao"
```

### Trigger `verify`
```
"xong rồi, commit thôi"
"test lại trước khi push"
"check lại toàn bộ trước khi tạo PR"
"đảm bảo không break gì trước khi merge"
"hoàn thành task, kiểm tra lần cuối"
```

---

## 🌳 Git Workflows

### Trigger `worktree`
```
"tạo branch cho feature này"
"setup worktree để bắt đầu làm"
"cần môi trường sạch để develop feature X"
"bắt đầu task mới, tạo branch trước"
```

### Trigger `finish-branch`
```
"xong hết rồi, merge vào main đi"
"tạo PR cho branch này"
"feature hoàn thành, giờ làm gì?"
"kết thúc task này, merge hay PR?"
"ship cái này thôi"
```

---

## 📝 Code Review

### Trigger `review`
```
"review code tôi vừa viết"
"kiểm tra lại trước khi push"
"self-review trước khi tạo PR"
"có gì cần sửa không trước khi submit?"
```

### Trigger `receive-review`
```
"reviewer comment là nên dùng dependency injection thay vì singleton"
"PR của tôi nhận feedback này: [paste comment]"
"teammate nói code này cần refactor"
"có comment: 'this method is too long'"
"reviewer reject, nói cần thêm error handling"
```

---

## ⚡ Advanced

### Trigger `subagent-dev`
```
"plan phức tạp quá, dùng subagent cho từng task"
"dispatch từng task riêng biệt"
"muốn review kỹ từng task trước khi chuyển tiếp"
```

### Trigger `dispatch-agents`
```
"3 bug này độc lập nhau, fix song song đi"
"có 2 task không liên quan, chạy cùng lúc được không?"
"parallel execution cho mấy task này"
```

### Trigger `write-skill`
```
"team hay quên viết migration rollback, document lại đi"
"tạo skill mới cho pattern này"
"document workflow cho database schema change"
```

### Trigger `workflow-guide`
```
"hướng dẫn tôi dùng hệ thống này"
"onboard member mới, giải thích workflow"
"tóm tắt tất cả skills có"
"cheat sheet cho workflow"
```

---

## 💬 Ví dụ hội thoại thực tế

### Ví dụ 1: Bắt đầu feature mới
```
User: "muốn thêm 2FA cho account"

Agent: [nhận diện → brainstorm]
"Tôi cần làm rõ vài điều trước:
1. SMS OTP hay TOTP app (Google Authenticator)?
2. Bắt buộc hay optional cho user?
3. Có ảnh hưởng gì tới admin account không?
..."

User: "TOTP, optional, không ảnh hưởng admin"

Agent: [tiếp tục brainstorm → đề xuất 3 hướng...]
```

### Ví dụ 2: Bug production
```
User: "user báo không đăng nhập được từ sáng nay"

Agent: [nhận diện → investigate]
"Bắt đầu điều tra...
Bước 1 — Isolate: Reproduce với test account..."
```

### Ví dụ 3: Nhận review feedback
```
User: "reviewer nói class này vi phạm Single Responsibility Principle"

Agent: [nhận diện → receive-review]
"Đọc kỹ feedback trước khi làm bất cứ thứ gì...
Đánh giá: Reviewer đúng — class này đang làm cả data fetching và business logic.
→ Dùng TDD để tách ra..."
```
