# Skill: review

## Mục đích (One-liner)
So sánh code với plan/spec, phân loại issue Critical/Warning/Info, báo cáo blockers trước.

## Khi nào dùng
- Sau mỗi task hoàn tất trong `execute-plan`
- Trước khi push code lên remote
- Trước khi tạo PR
- Khi cần self-review trước khi nhờ người khác review

## Khi nào KHÔNG dùng
- Khi cần review code của người khác (dùng `receive-review`)

## Quy trình bắt buộc
1. Đọc lại plan/spec gốc — đây là baseline so sánh
2. So sánh code đã viết với yêu cầu:
   - Có implement đủ không?
   - Có implement đúng không?
   - Có implement thừa không?
3. Phân loại mọi issue tìm thấy:
   - **Critical**: bug logic, security issue, missing requirement — phải sửa trước commit
   - **Warning**: code smell, performance concern, thiếu test — nên sửa
   - **Info**: style, naming preference — có thể sửa sau
4. Báo cáo **Critical trước**, sau đó Warning, sau đó Info
5. Không commit nếu còn Critical

## Anti-patterns (những gì không được làm)
- Báo cáo theo thứ tự tìm thấy, không theo severity
- Bury lỗi Critical ở cuối báo cáo
- Review code không có baseline so sánh (plan/spec)
- Bỏ qua review vì "thay đổi nhỏ"

## Ví dụ trigger tự nhiên
- "review code này trước khi push"
- "check lại trước khi tạo PR"
- "xem lại những gì vừa làm"
- sau khi hoàn tất một batch trong `execute-plan`

## Output mong đợi
```
## Review: feat/google-login

### So sánh với plan
✅ GoogleAuthProvider — implement đủ
✅ POST /auth/google endpoint — implement đúng
⚠️ Thiếu rate limiting cho endpoint auth

### Issues

**Critical (1)**
- [ ] Không có input validation cho Google token — có thể bị injection

**Warning (2)**
- [ ] Thiếu test case cho expired token scenario
- [ ] Magic string "google" ở dòng 42, nên dùng constant

**Info (1)**
- [ ] Tên biến `t` ở dòng 78 không rõ nghĩa, đổi thành `token`

---
Cần sửa 1 Critical trước khi commit.
```
