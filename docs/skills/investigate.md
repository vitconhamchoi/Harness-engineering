# Skill: investigate

## Mục đích (One-liner)
Tìm root cause có hệ thống theo 4 bước: Isolate → Hypothesize → Test → Verify.

## Khi nào dùng
- Test fail không rõ lý do
- Bug xuất hiện trong production hoặc staging
- Hành vi bất thường, kết quả không đúng mong đợi
- Lỗi intermittent (lúc có lúc không)

## Khi nào KHÔNG dùng
- Lỗi đã biết rõ nguyên nhân (đi thẳng vào `tdd` để fix)
- Câu hỏi chung về cách dùng thư viện (đọc docs)

## Quy trình bắt buộc

### Bước 1 — Isolate (Thu hẹp phạm vi)
1. Reproduce lỗi một cách đáng tin cậy — viết minimal reproduction case
2. Xác định: lỗi xảy ra ở đâu? (module, function, line)
3. Xác định: lỗi xảy ra khi nào? (điều kiện, input, timing)
4. Loại bỏ các yếu tố không liên quan

### Bước 2 — Hypothesize (Đặt lý thuyết)
1. Dựa vào bằng chứng từ bước Isolate, đưa ra 2-3 lý thuyết có căn cứ
2. Sắp xếp theo xác suất cao đến thấp
3. Với mỗi lý thuyết: nếu đúng thì sẽ thấy gì?
4. Không đoán không có căn cứ

### Bước 3 — Test (Kiểm chứng)
1. Kiểm chứng lý thuyết xác suất cao nhất trước
2. Thêm logging hoặc viết test nhỏ để xác nhận/bác bỏ lý thuyết
3. Ghi lại kết quả từng lý thuyết
4. Tiếp tục cho đến khi xác nhận được root cause

### Bước 4 — Verify (Xác nhận root cause)
1. Xác nhận root cause đã tìm được bằng test trực tiếp
2. Dùng `tdd` để viết test reproduce bug, rồi fix
3. Xác nhận fix giải quyết vấn đề gốc, không chỉ che triệu chứng

## Anti-patterns (những gì không được làm)
- Thử fix ngẫu nhiên cho đến khi "có vẻ hoạt động"
- Kết luận root cause trước khi có bằng chứng
- Bỏ qua bước Isolate, nhảy thẳng vào fix
- Fix triệu chứng mà không tìm nguyên nhân
- "Tôi nghĩ là do X" mà không test lý thuyết đó

## Ví dụ trigger tự nhiên
- "tests đang fail không hiểu tại sao"
- "API bị lỗi 500"
- "có bug ở màn hình thanh toán"
- "tại sao kết quả tính toán sai?"
- "cái này lúc chạy lúc không"

## Output mong đợi
```
## Investigate: API 500 khi tạo đơn hàng

### Isolate
- Reproduce: POST /api/orders với body { items: [], total: 0 }
- Lỗi: 500 Internal Server Error
- Stack trace: NullPointerException tại OrderService.java:142
- Thu hẹp: chỉ xảy ra khi items array rỗng

### Hypothesize
1. (80%) Không có null check trước khi iterate items
2. (15%) Database constraint violation
3. (5%) Race condition

### Test
- Test lý thuyết 1: thêm log trước vòng lặp → xác nhận items là null khi array rỗng
- Lý thuyết 1 xác nhận ✅

### Verify
- Root cause: thiếu null check ở OrderService.java:142
- Fix: thêm kiểm tra `if (items == null || items.isEmpty())`
- Test reproduce bug đã viết, fix đã pass
```
