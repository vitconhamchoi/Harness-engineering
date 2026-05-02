# Skill: brainstorm

## Mục đích (One-liner)
Làm rõ yêu cầu, đề xuất hướng đi có trade-off, đợi xác nhận trước khi design.

## Khi nào dùng
- Bắt đầu feature mới hoặc thay đổi lớn
- Yêu cầu mơ hồ, chưa rõ hướng giải quyết
- Có nhiều cách implement khác nhau đáng cân nhắc
- Trước khi viết `write-plan` cho bất kỳ thứ gì phức tạp

## Khi nào KHÔNG dùng
- Bugfix nhỏ đã có reproduce rõ ràng (dùng `investigate` trực tiếp)
- Task đã có plan chi tiết được duyệt rồi (dùng `execute-plan`)
- Câu hỏi đơn giản không cần thiết kế

## Quy trình bắt buộc
1. Đặt câu hỏi làm rõ — hỏi về: mục tiêu kinh doanh, constraint kỹ thuật, user affected, timeline
2. Không đề xuất gì cho đến khi có đủ thông tin cần thiết
3. Trình bày **2-3 hướng tiếp cận** khác nhau, mỗi hướng có:
   - Mô tả ngắn gọn
   - Ưu điểm
   - Nhược điểm / rủi ro
   - Độ phức tạp ước tính
4. Đợi người dùng chọn hướng đi
5. Lưu decision và lý do vào file `design.md`

## Anti-patterns (những gì không được làm)
- Đề xuất solution ngay lập tức khi chưa hỏi rõ yêu cầu
- Chỉ đề xuất 1 hướng và "bán" nó thay vì đưa ra lựa chọn
- Bắt đầu code trong khi đang brainstorm
- Bỏ qua bước lưu design.md sau khi xác nhận

## Ví dụ trigger tự nhiên
- "thêm chức năng đăng nhập Google"
- "muốn refactor module thanh toán"
- "cần xây hệ thống notification"
- "nghĩ tới việc migrate database"
- "có ý tưởng cải thiện performance"

## Output mong đợi
```
## Câu hỏi làm rõ
1. [câu hỏi 1]
2. [câu hỏi 2]
...

## 3 hướng tiếp cận

### Hướng A: [tên]
- Mô tả: ...
- Ưu: ...
- Nhược: ...
- Phức tạp: Thấp / Trung bình / Cao

### Hướng B: [tên]
...

### Hướng C: [tên]
...

👉 Bạn muốn đi theo hướng nào?
```

Sau khi xác nhận → tạo `design.md` với quyết định và lý do.
