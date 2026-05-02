# Agent Instructions — Harness Engineering

> File này là entry point cho Google Antigravity (và bất kỳ agent nào đọc `AGENTS.md`).
> Antigravity tự đọc file này khi mở workspace. Không cần slash command — agent trigger skill từ ngữ cảnh câu nói.

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
| Task phức tạp nhiều bước | `write-plan` → `subagent-dev` |
| Thiết kế lại hệ thống | `brainstorm` → `write-plan` → `worktree` → `tdd` |
| Học/khám phá skill mới | `write-skill` |

---

## 🎯 Core Workflow

### SKILL: brainstorm
**Khi nào dùng:** Thiết kế feature mới, chưa chắc về hướng đi, bắt đầu project mới, yêu cầu mơ hồ.

**Quy trình bắt buộc:**
1. Đặt câu hỏi làm rõ ý định trước khi đề xuất bất cứ thứ gì
2. Trình bày 2-3 hướng tiếp cận khác nhau kèm trade-off rõ ràng
3. Đợi xác nhận hướng đi từ người dùng
4. Lưu design đã được duyệt ra file `design.md`

**Không được làm:** Đề xuất giải pháp ngay khi chưa hỏi rõ yêu cầu. Chọn hướng đi thay người dùng.

---

### SKILL: write-plan
**Khi nào dùng:** Sau khi design được duyệt, trước khi bắt đầu implement.

**Quy trình bắt buộc:**
1. Đọc lại design đã được duyệt
2. Chia nhỏ thành các task 2-5 phút mỗi task
3. Mỗi task phải có: đường dẫn file chính xác, code snippet đầy đủ, lệnh verify, output mong đợi
4. Lưu ra `plan.md`
5. Đợi xác nhận plan trước khi execute

**Output tối thiểu:** 10+ task nhỏ, không được viết task chung chung kiểu "implement feature X".

---

### SKILL: execute-plan
**Khi nào dùng:** Khi plan đã được duyệt, cần thực thi theo batch có checkpoint.

**Quy trình bắt buộc:**
1. Đọc `plan.md`, đánh giá lại plan trước khi chạy
2. Thực thi 3-5 task một batch
3. Dừng lại, báo cáo kết quả, đợi xác nhận trước khi chạy batch tiếp
4. Không chạy hết một lèo không dừng lại

---

## 🧪 Testing & Debugging

### SKILL: tdd (Test-Driven Development)
**Khi nào dùng:** MỌI thay đổi code — feature, bugfix, refactor. Không có ngoại lệ.

**Quy trình bắt buộc (RED → GREEN → REFACTOR):**
1. **RED:** Viết test thất bại TRƯỚC. Chạy test, xác nhận thấy lỗi đúng mong đợi.
2. **GREEN:** Viết code tối thiểu để test pass. Chạy lại, xác nhận pass.
3. **REFACTOR:** Dọn dẹp code, chạy lại test, xác nhận vẫn pass.
4. Commit.

**Luật sắt:** Nếu đã viết code trước test → XÓA code đó đi, bắt đầu lại từ test.  
**Không được làm:** Bỏ qua TDD cho "thay đổi nhỏ". Không có thay đổi nào là đủ nhỏ để bỏ qua.

---

### SKILL: investigate (Systematic Debugging)
**Khi nào dùng:** Test fail, bug xuất hiện, hành vi bất thường. Không được đoán mò.

**Quy trình 4 bước bắt buộc:**
1. **Isolate:** Reproduce lỗi một cách đáng tin cậy. Thu hẹp phạm vi.
2. **Hypothesize:** Đưa ra lý thuyết có căn cứ từ bằng chứng, không phải đoán.
3. **Test:** Kiểm chứng từng lý thuyết bằng thử nghiệm cụ thể.
4. **Verify:** Xác nhận root cause và fix thực sự giải quyết vấn đề.

**Không được làm:** Thử fix ngẫu nhiên cho đến khi "có vẻ hoạt động".

---

### SKILL: verify (Verification Before Completion)
**Khi nào dùng:** Trước KHI nói "xong", trước commit, trước PR, sau mỗi fix.

**Quy trình bắt buộc:**
1. Chạy lệnh test của project, dán output thực tế vào báo cáo
2. Chạy lệnh build, dán output
3. Chạy lint nếu có cấu hình
4. Chỉ được kết luận "hoàn tất" sau khi có bằng chứng pass

**Luật sắt (Iron Law of Verification):** "Nó nên hoạt động" không phải verification. Phải có output thực tế.  
**Không được làm:** Commit hoặc nói "xong" khi chưa chạy và dán output kiểm tra.

---

## 🌳 Git Workflows

### SKILL: worktree
**Khi nào dùng:** Bắt đầu feature mới hoặc bugfix, trước khi execute plan.

**Quy trình bắt buộc:**
1. Xác định điểm branch hợp lý
2. Tạo git worktree mới trên branch mới
3. Chạy test trong worktree để xác nhận baseline sạch
4. Báo cáo trạng thái worktree trước khi bắt đầu code

---

### SKILL: finish-branch
**Khi nào dùng:** Khi tất cả task trên branch đã hoàn tất và test pass.

**Quy trình bắt buộc:**
1. Chạy `verify` toàn bộ, xác nhận pass
2. Trình bày 4 lựa chọn: merge vào main / tạo PR / giữ branch / discard
3. Đợi chọn, thực thi đúng lựa chọn đó

---

## 📝 Code Review

### SKILL: review (Self-Review)
**Khi nào dùng:** Sau mỗi task hoàn tất, trước khi push, trước khi tạo PR.

**Quy trình bắt buộc:**
1. So sánh code với plan/spec gốc — có implement đúng không?
2. Kiểm tra code quality: phân loại issue theo **Critical / Warning / Info**
3. Báo cáo blockers trước, không được bury lỗi nghiêm trọng cuối báo cáo

---

### SKILL: receive-review
**Khi nào dùng:** Khi nhận feedback từ code review của người khác.

**Quy trình bắt buộc:**
1. KHÔNG implement feedback ngay
2. Đánh giá từng feedback: có kỹ thuật chính xác không? Có context đầy đủ không?
3. Nếu feedback sai → giải thích lý do kỹ thuật rõ ràng, push back lịch sự
4. Nếu feedback đúng → dùng `tdd` để implement
5. Chạy `verify` sau khi implement

**Không được làm:** Implement mọi suggestion một cách mù quáng.

---

## ⚡ Advanced Development

### SKILL: subagent-dev
**Khi nào dùng:** Thực thi plan trong session hiện tại với nhiều task phức tạp.

**Quy trình bắt buộc:**
1. Với mỗi task trong plan: dispatch một subagent riêng biệt
2. Mỗi subagent làm đúng 1 task, không làm sang task khác
3. Sau mỗi task: review 2 bước — (1) có match spec không? (2) code quality ổn không?
4. Chỉ chuyển sang task tiếp theo sau khi review pass

---

### SKILL: dispatch-agents
**Khi nào dùng:** Có 2+ task độc lập không chia sẻ state với nhau.

**Quy trình bắt buộc:**
1. Xác nhận các task thực sự độc lập (không share state, không conflict file)
2. Dispatch 1 agent per task, chạy song song
3. Mỗi agent báo cáo kết quả độc lập
4. Tổng hợp kết quả sau khi tất cả xong, resolve conflict nếu có

---

## 🛠️ Meta

### SKILL: write-skill
**Khi nào dùng:** Cần tạo hoặc cải thiện một skill mới cho team.

**Quy trình bắt buộc (TDD cho documentation):**
1. Test trước: dùng subagent không có skill → xác nhận nó làm sai
2. Viết skill dưới dạng file markdown với cấu trúc chuẩn
3. Verify: test lại với subagent được cấp skill → xác nhận nó làm đúng
4. Commit skill vào `docs/skills/`

---

### SKILL: workflow-guide (trước đây là "superpowers")
**Khi nào dùng:** Khi cần hướng dẫn tổng quan về hệ thống, onboard thành viên mới, hoặc giải thích cách dùng.

**Quy trình:**
1. Đọc `AGENTS.md` (file này) để hiểu toàn bộ skill map
2. Đọc `docs/skills/` để hiểu chi tiết từng skill
3. Đọc `docs/prompt-examples.md` để thấy cách trigger tự nhiên
4. Đọc `docs/workflow-templates.md` để thấy workflow end-to-end

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
- Bỏ qua Iron Law of Verification với bất kỳ lý do nào

---

## Tài liệu chi tiết

- `docs/skills/` — file skill riêng cho từng trong 14 skills
- `docs/workflow-templates.md` — workflow end-to-end cho các tình huống phổ biến
- `docs/prompt-examples.md` — ví dụ trigger skill bằng ngôn ngữ tự nhiên
- `docs/security-review-template.md` — template review bảo mật
