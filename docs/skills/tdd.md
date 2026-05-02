# Skill: tdd

## Mục đích (One-liner)
RED → GREEN → REFACTOR — viết test fail trước, rồi mới viết code tối thiểu để pass.

## Khi nào dùng
**MỌI thay đổi code** — feature mới, bugfix, refactor, thay đổi config ảnh hưởng logic. Không có ngoại lệ.

## Khi nào KHÔNG dùng
Không có trường hợp nào được miễn TDD khi thay đổi code logic.  
(Thay đổi thuần documentation, comment, hay formatting không cần TDD.)

## Quy trình bắt buộc

### Bước 1 — RED (Viết test thất bại)
1. Tạo hoặc mở file test tương ứng
2. Viết test mô tả behavior mong muốn
3. **Chạy test** — xác nhận test fail với lý do đúng (không phải lỗi syntax)
4. Dán output test fail vào báo cáo

### Bước 2 — GREEN (Viết code tối thiểu)
1. Viết code ít nhất có thể để test pass
2. Không thêm logic không cần thiết để pass test
3. **Chạy test** — xác nhận test pass
4. Dán output test pass vào báo cáo

### Bước 3 — REFACTOR (Dọn dẹp)
1. Dọn dẹp code: đặt tên tốt hơn, remove duplication, tách function
2. **Chạy test lại** sau mỗi refactor nhỏ
3. Xác nhận test vẫn pass sau refactor

### Bước 4 — Commit
1. Commit với message mô tả behavior, không phải implementation

## Luật sắt
> Nếu đã viết code trước khi viết test → **XÓA code đó đi**, bắt đầu lại từ bước RED.

## Anti-patterns (những gì không được làm)
- "Thay đổi nhỏ quá, không cần test" — không có ngoại lệ
- Viết test sau khi đã có code (đây là test sau, không phải TDD)
- Viết nhiều test cùng lúc trước khi làm GREEN
- Refactor code mà không có test cover
- Commit khi test đang fail

## Ví dụ trigger tự nhiên
- "thêm validation cho email"
- "sửa bug tính tổng đơn hàng"
- "refactor hàm authenticate"
- "implement endpoint tạo user"
- bất kỳ yêu cầu thay đổi code nào

## Output mong đợi
```
## TDD: Thêm validation email

### RED
Test viết:
```typescript
it('should reject invalid email', () => {
  expect(validateEmail('not-an-email')).toBe(false)
})
```
Chạy: `npm test -- validateEmail`
Output: FAIL — Expected: false, Received: undefined ✅ (test fail đúng)

### GREEN
Code viết:
```typescript
function validateEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
}
```
Chạy: `npm test -- validateEmail`
Output: PASS (1 test) ✅

### REFACTOR
Không có refactor cần thiết lần này.

Commit: "feat: add email validation"
```
