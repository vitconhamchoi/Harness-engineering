# Skill: verify

## Mục đích (One-liner)
Chạy test/build/lint và dán output thực tế trước khi kết luận "xong".

## Khi nào dùng
- Trước KHI nói "xong", "hoàn tất", "done"
- Trước khi commit
- Trước khi tạo PR
- Sau mỗi fix (để xác nhận fix thực sự hoạt động)
- Sau mỗi batch trong `execute-plan`

## Khi nào KHÔNG dùng
Không có trường hợp nào được miễn verify trước khi commit code.

## Quy trình bắt buộc
1. Chạy lệnh **test** của project — dán output đầy đủ
2. Chạy lệnh **build** của project — dán output đầy đủ
3. Chạy lệnh **lint** nếu project có cấu hình — dán output
4. Nếu bất kỳ bước nào fail → dừng, báo cáo, sửa trước
5. Chỉ kết luận "hoàn tất" khi tất cả pass và có output bằng chứng

## Iron Law of Verification
> **"Nó nên hoạt động"** không phải verification.  
> **"Tôi nghĩ là pass rồi"** không phải verification.  
> Phải có **output thực tế** mới được kết luận.

## Anti-patterns (những gì không được làm)
- Commit khi chưa chạy test
- Nói "xong" mà chưa có output verify
- "Skip verify lần này vì thay đổi nhỏ"
- Chỉ chạy 1 trong 3 (test/build/lint) rồi bỏ qua phần còn lại
- Báo cáo "test pass" mà không dán output

## Ví dụ trigger tự nhiên
- "xong rồi"
- "commit đi"
- "push lên thôi"
- "merge được chưa?"
- "hoàn thành task này rồi"

## Output mong đợi
```
## Verify — [tên task/feature]

### Test
Lệnh: `npm test`
Output:
  PASS src/auth/validateEmail.test.ts
  PASS src/orders/OrderService.test.ts
  Test Suites: 2 passed, 2 total
  Tests: 15 passed, 15 total
✅ PASS

### Build
Lệnh: `npm run build`
Output:
  Successfully compiled 42 files in 3.2s
✅ PASS

### Lint
Lệnh: `npm run lint`
Output:
  No warnings or errors
✅ PASS

---
✅ Tất cả pass. Sẵn sàng commit.
```

Nếu fail:
```
### Test
Lệnh: `npm test`
Output:
  FAIL src/payments/PaymentService.test.ts
  ● calculateTotal › should handle discount
    Expected: 90, Received: 100
❌ FAIL — cần sửa trước khi commit
```
