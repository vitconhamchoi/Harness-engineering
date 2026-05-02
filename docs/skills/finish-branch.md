# Skill: finish-branch

## Mục đích (One-liner)
Verify pass → trình bày 4 lựa chọn kết thúc branch → thực thi đúng lựa chọn.

## Khi nào dùng
- Tất cả task trên branch đã hoàn tất
- Test pass, build pass, lint pass
- Sẵn sàng kết thúc work item

## Khi nào KHÔNG dùng
- Còn task chưa hoàn tất
- Verify chưa pass
- Đang còn conflict chưa resolve

## Quy trình bắt buộc
1. Chạy `verify` toàn bộ — xác nhận tất cả pass
2. Tóm tắt những gì đã làm trên branch (changelog ngắn)
3. Trình bày **4 lựa chọn**:
   - **A. Merge vào main**: merge trực tiếp (nếu có quyền)
   - **B. Tạo Pull Request**: tạo PR để review
   - **C. Giữ branch**: chưa merge, tiếp tục sau
   - **D. Discard**: xóa branch, không cần nữa
4. Đợi chọn
5. Thực thi đúng lựa chọn đó

## Anti-patterns (những gì không được làm)
- Merge mà không verify trước
- Tự quyết merge hay tạo PR mà không hỏi
- Bỏ qua tóm tắt changelog
- Force merge khi test fail

## Ví dụ trigger tự nhiên
- "xong hết task rồi"
- "merge branch này vào main đi"
- "tạo PR cho cái này"
- "kết thúc branch này"
- "hoàn tất feature này"

## Output mong đợi
```
## Finish Branch: feat/google-login

### Verify
✅ Tests: 52 passed
✅ Build: success
✅ Lint: no errors

### Tóm tắt thay đổi
- Thêm GoogleAuthProvider với OAuth2 flow
- Thêm endpoint POST /auth/google
- Thêm JWT generation sau xác thực Google
- 12 test cases mới cho auth flow

### 4 lựa chọn
A. Merge vào main trực tiếp
B. Tạo Pull Request (để team review)
C. Giữ branch feat/google-login (làm tiếp sau)
D. Discard branch (bỏ thay đổi)

👉 Bạn chọn lựa chọn nào?
```
