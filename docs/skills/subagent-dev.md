# Skill: subagent-dev

## Mục đích (One-liner)
Dispatch subagent riêng cho từng task, review 2 bước sau mỗi task trước khi chuyển tiếp.

## Khi nào dùng
- Thực thi plan trong session hiện tại với nhiều task phức tạp
- Khi muốn isolation mạnh hơn giữa các task
- Task cần context riêng biệt

## Khi nào KHÔNG dùng
- Task đơn giản ít bước (dùng `execute-plan` trực tiếp)
- Khi subagent không available trong môi trường

## Quy trình bắt buộc
1. Đọc `plan.md` và chia tasks rõ ràng
2. Với **mỗi task**:
   - Chuẩn bị context đầy đủ cho subagent (spec, file paths, constraints)
   - Dispatch subagent với task rõ ràng
   - Subagent làm task, báo cáo kết quả
3. **Review 2 bước** sau mỗi task:
   - **Bước 1 — Spec match**: có implement đúng spec không? Đủ không? Thừa không?
   - **Bước 2 — Code quality**: test coverage? Edge cases? Naming? Complexity?
4. **Chỉ chuyển sang task tiếp theo** sau khi cả 2 bước review pass
5. Nếu review fail → subagent làm lại, không chuyển tiếp

## Anti-patterns (những gì không được làm)
- Chuyển task tiếp khi review chưa pass
- Review chỉ 1 bước (spec match nhưng bỏ qua code quality, hoặc ngược lại)
- Dispatch subagent với context thiếu thông tin
- Gộp nhiều task vào 1 subagent

## Ví dụ trigger tự nhiên
- "dùng subagent để làm plan này"
- "dispatch từng task riêng"
- khi plan phức tạp cần isolation

## Output mong đợi
```
## Subagent-dev: Plan feat/google-login

### Task 1: Tạo GoogleAuthProvider
[dispatch subagent với spec đầy đủ]
...subagent làm xong, báo cáo...

Review Task 1:
✅ Spec match: implement đủ interface, xử lý đúng OAuth2 flow
✅ Code quality: test coverage 85%, edge cases covered, naming clear

→ Chuyển sang Task 2

### Task 2: Tạo API endpoint
...
```
