# Nền tảng

## 1. Harness là gì?
Harness là lớp điều phối bao quanh agent.

Nó không trực tiếp viết mã thay cho agent.
Nó quyết định agent được cung cấp ngữ cảnh gì, phải theo quy trình nào và phải chứng minh kết quả ra sao.

## 2. Harness có phải agent không?
Không.

- **Model** là mô hình ngôn ngữ.
- **Agent** là model có khả năng thao tác với file và công cụ.
- **Harness** là lớp bao quanh agent để điều khiển cách agent làm việc.

## 3. Vì sao cần harness?
Nếu chỉ có model hoặc agent thô, việc làm thường phụ thuộc nhiều vào prompt tạm thời trong phiên chat.
Điều đó dễ dẫn tới:
- thiếu ngữ cảnh
- làm sai quy trình
- sửa quá tay
- kết luận xong khi chưa kiểm chứng

Harness được thêm vào để giảm các vấn đề đó.

## 4. Một harness thường gồm gì?

### Hướng dẫn riêng của dự án
Định nghĩa repo này là gì, quy tắc nào bắt buộc, chỗ nào nhạy cảm.

### Đặc tả thay đổi
Lưu yêu cầu, thiết kế, đầu việc và lịch sử thay đổi ra ngoài phần chat.

### Quy trình làm việc của agent
Buộc agent phân tích, lập kế hoạch, kiểm thử, gỡ lỗi và rà soát theo cách có kiểm soát hơn.

### Kiểm chứng
Buộc agent chạy test, build, lint hoặc review trước khi kết thúc.

## 5. OpenSpec nằm ở đâu?
OpenSpec là công cụ cho phần **đặc tả thay đổi**.

Nó thường được dùng để lưu:
- proposal
- design
- tasks
- thay đổi đã hoàn thành

## 6. Superpowers nằm ở đâu?
Superpowers là plugin / framework cho phần **quy trình làm việc của agent**.

Nó cải thiện cách agent:
- phân tích yêu cầu
- lập kế hoạch
- thực hiện từng bước
- kiểm thử
- gỡ lỗi
- rà soát mã nguồn

## 7. Phân biệt OpenSpec và Spec-Kit
OpenSpec và Spec-Kit đều liên quan đến phần đặc tả, nhưng không phải là một.

- **OpenSpec** là công cụ cụ thể dùng để quản lý proposal, design, tasks và thay đổi.
- **Spec-Kit** là cách tổ chức hoặc bộ khung làm việc theo hướng đặc tả trước.

Hiểu đơn giản:
- OpenSpec trả lời câu hỏi: dùng công cụ nào để quản lý đặc tả?
- Spec-Kit trả lời câu hỏi: tổ chức quy trình theo đặc tả trước như thế nào?

## 8. Kết luận
Harness không phải agent.
Harness là lớp tổ chức và điều phối cách agent làm việc.
