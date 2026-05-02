# Skill: receive-review

## Mục đích (One-liner)
Đánh giá kỹ thuật feedback trước khi implement — push back nếu sai, TDD nếu đúng.

## Khi nào dùng
- Nhận được feedback từ code review của người khác
- Reviewer comment trên PR
- Teammate đề xuất thay đổi code

## Khi nào KHÔNG dùng
- Self-review code của mình (dùng `review`)
- Bug report từ user (dùng `investigate`)

## Quy trình bắt buộc
1. **KHÔNG implement feedback ngay** — dừng lại, đọc kỹ
2. Đánh giá từng feedback item:
   - Lý thuyết kỹ thuật có chính xác không?
   - Reviewer có đủ context không?
   - Suggestion có phù hợp với architecture không?
   - Có trade-off nào không được nhắc đến không?
3. Phân loại:
   - **Đúng và quan trọng** → dùng `tdd` implement
   - **Đúng nhưng minor** → implement sau hoặc comment giải thích
   - **Sai/thiếu context** → push back với giải thích kỹ thuật rõ ràng
   - **Preference** → discuss, không nhất thiết thay đổi
4. Respond từng item với stance rõ ràng
5. Nếu implement → chạy `verify`

## Anti-patterns (những gì không được làm)
- Implement mọi suggestion một cách mù quáng
- Bỏ qua push back vì ngại conflict
- Không giải thích lý do khi push back
- Implement mà không có `tdd` và `verify`
- Agree hết rồi không làm gì

## Ví dụ trigger tự nhiên
- "reviewer comment là..."
- "PR nhận được feedback này..."
- "teammate nói cần sửa..."
- "có comment trên PR của tao"
- paste nội dung review comment vào

## Output mong đợi
```
## Receive Review: PR #42

### Feedback 1: "Nên dùng async/await thay vì Promise.then"
Đánh giá: ✅ Đúng — cải thiện readability
Action: Implement với TDD
→ [chạy tdd flow]

### Feedback 2: "Class này quá lớn, nên tách ra"
Đánh giá: ⚠️ Đúng nhưng cần context
Response: "Đồng ý về nguyên tắc, nhưng tách lúc này sẽ là refactor lớn ngoài scope PR này.
Tôi đề xuất tạo issue riêng để refactor có kế hoạch."
Action: Tạo issue #50, không implement trong PR này

### Feedback 3: "Đổi tên method thành processPaymentTransaction thay vì pay"
Đánh giá: ❌ Preference, không phải issue kỹ thuật
Response: "Tên `pay` ngắn gọn và consistent với naming convention hiện tại của project
(xem src/billing/Billing.ts:23). Nếu team muốn thay đổi convention thì nên thảo luận riêng."
Action: Không implement, giải thích lý do

---
Tổng: 1 implement, 1 defer (issue tạo), 1 push back
```
