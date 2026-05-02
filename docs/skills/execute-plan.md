# Skill: execute-plan

## Mục đích (One-liner)
Thực thi plan theo batch 3-5 task, dừng checkpoint sau mỗi batch.

## Khi nào dùng
- Sau khi `write-plan` và plan đã được duyệt
- Khi cần thực thi nhiều task có trình tự rõ ràng

## Khi nào KHÔNG dùng
- Chưa có plan được duyệt (dùng `write-plan` trước)
- Task đơn lẻ không cần batch

## Quy trình bắt buộc
1. Đọc toàn bộ `plan.md` để hiểu tổng thể trước khi bắt đầu
2. Đánh giá lại plan — nếu có gì cần điều chỉnh thì nói trước
3. Thực thi **batch đầu tiên** (3-5 task):
   - Mỗi task: thực hiện → chạy verify command → xác nhận output
   - Nếu task fail: dừng lại, báo cáo, không tiếp tục batch
4. **Dừng sau batch**, báo cáo kết quả:
   - Task nào pass / fail
   - Output verify thực tế
   - Vấn đề gặp phải (nếu có)
5. **Đợi xác nhận** trước khi chạy batch tiếp theo
6. Lặp lại cho đến hết plan

## Anti-patterns (những gì không được làm)
- Chạy hết toàn bộ plan một lèo không dừng
- Bỏ qua verify command sau mỗi task
- Tiếp tục batch tiếp khi có task fail
- Báo cáo "đã xong" mà không có output thực tế

## Ví dụ trigger tự nhiên
- "plan ok rồi, làm đi"
- "bắt đầu thực thi thôi"
- "execute cái plan đó"
- "chạy các task trong plan.md"

## Output mong đợi
```
## Batch 1/3 — Task 1-4

✅ Task 1: Tạo interface AuthProvider
   Verify: `npx tsc --noEmit` → PASS (0 errors)

✅ Task 2: Viết test cho GoogleAuthProvider
   Verify: `npm test -- --testPathPattern=auth` → PASS (3 tests)

❌ Task 3: Implement GoogleAuthProvider
   Lỗi: Cannot find module 'google-auth-library'
   Đề xuất: cần `npm install google-auth-library` trước

---
Batch 1 kết quả: 2/3 task pass, 1 fail
Cần xử lý Task 3 trước khi tiếp tục.
Bạn xác nhận xử lý thế nào?
```
