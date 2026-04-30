# Nền tảng

## Harness Engineering là gì?
Harness Engineering là cách tổ chức AI coding agent làm việc bài bản trong một dự án phần mềm.

Thay vì chỉ đưa prompt rồi để agent tự làm, người làm dự án bổ sung thêm các lớp hỗ trợ để agent:
- hiểu đúng yêu cầu
- đi đúng quy trình
- kiểm tra lại kết quả
- giảm làm ẩu hoặc làm sai hướng

Công thức ngắn:

```text
Agent = Model + Harness
```

## Một harness thường gồm những gì?
Một harness thường có bốn phần chính:

### 1. Lớp đặc tả
Dùng để quản lý:
- yêu cầu
- thiết kế
- đầu việc
- lịch sử thay đổi

Mục tiêu là không để toàn bộ ngữ cảnh nằm hết trong phần chat.

### 2. Lớp quy trình làm việc của agent
Dùng để cải thiện cách agent làm việc, ví dụ:
- phân tích yêu cầu trước khi code
- lập kế hoạch trước khi sửa nhiều chỗ
- kiểm thử trước và sau khi sửa
- gỡ lỗi theo quy trình thay vì đoán mò
- rà soát kết quả trước khi kết thúc

### 3. Lớp hướng dẫn riêng của dự án
Đây là nơi dự án nói cho agent biết:
- repo này là gì
- chỗ nào nhạy cảm
- quy ước nào bắt buộc
- cách debug, review, nghiên cứu trong repo này

### 4. Lớp kiểm chứng
Dùng để buộc agent chứng minh là nó đã làm đúng.
Ví dụ:
- test
- build
- lint
- review

## OpenSpec nằm ở đâu?
OpenSpec thuộc **lớp đặc tả**.

Nó là công cụ dùng để lưu:
- proposal
- design
- tasks
- thay đổi đã hoàn thành

## Superpowers nằm ở đâu?
Superpowers thuộc **lớp quy trình làm việc của agent**.

Nó là plugin / framework giúp agent làm việc tốt hơn ở các khâu như:
- brainstorm
- viết kế hoạch
- thực hiện kế hoạch
- test-driven development
- gỡ lỗi có hệ thống
- code review

## Spec-Kit nằm ở đâu?
Spec-Kit cũng liên quan đến phần đặc tả và quy trình làm việc, nhưng nó là một hướng tổ chức khác.
Nó không phải tên khác của OpenSpec, và cũng không đồng nghĩa với Harness Engineering.
