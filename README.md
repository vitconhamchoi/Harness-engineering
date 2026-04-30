# Harness Engineering

Harness Engineering là cách tổ chức thêm các lớp hỗ trợ xung quanh AI agent để việc phân tích, lập kế hoạch, triển khai và kiểm tra trong dự án phần mềm diễn ra ổn định hơn.

Mục tiêu của nó là giảm việc agent làm theo cảm tính của từng phiên chat, đồng thời giữ yêu cầu, quy trình và tiêu chí kiểm chứng ở trạng thái rõ ràng hơn.

## Diagram

```text
Người dùng
   │
   ▼
Harness
   ├─ Hướng dẫn riêng của dự án
   │  └─ ví dụ: AGENTS.md, docs/
   │
   ├─ Đặc tả thay đổi
   │  └─ ví dụ công cụ: OpenSpec
   │
   ├─ Quy trình làm việc của agent
   │  └─ ví dụ công cụ / framework: Superpowers
   │
   └─ Kiểm chứng
   │  └─ ví dụ: test, build, lint, review
   │
   ▼
Agent
   │
   ▼
Mã nguồn và công cụ
```

## Khái niệm chính

- **Model**: mô hình ngôn ngữ, tức lõi sinh câu trả lời và suy luận.
- **Agent**: hệ thống dùng model làm bộ não, đồng thời có thêm khả năng đọc file, gọi công cụ, sửa mã, chạy lệnh và làm việc nhiều bước.
- **Harness**: lớp bao quanh agent để nạp ngữ cảnh, áp quy tắc, gắn quy trình và buộc kiểm chứng.

**Harness không phải agent. Agent cũng không phải model.**

## Bốn phần của harness

### 1. Hướng dẫn riêng của dự án
Cho agent biết repo cụ thể này phải được xử lý như thế nào.

Ví dụ:
- `AGENTS.md`
- tài liệu prompt
- tài liệu workflow
- tài liệu review

Trong repo này:
- `examples/project-root/AGENTS.md`
- `examples/project-root/docs/`

### 2. Đặc tả thay đổi
Giữ yêu cầu, thiết kế, đầu việc và lịch sử thay đổi ra ngoài phần chat.

Đây là nơi trả lời các câu hỏi như:
- thay đổi này nhằm giải quyết vấn đề gì?
- phạm vi thay đổi là gì?
- hướng thiết kế kỹ thuật là gì?
- cần làm những đầu việc nào?
- yêu cầu chi tiết và tình huống cần đáp ứng là gì?

Ví dụ cấu trúc thường gặp:
- `openspec/changes/<ten-thay-doi>/proposal.md`: mô tả mục tiêu và phạm vi thay đổi
- `openspec/changes/<ten-thay-doi>/design.md`: hướng thiết kế kỹ thuật
- `openspec/changes/<ten-thay-doi>/tasks.md`: danh sách đầu việc cần thực hiện
- `openspec/changes/<ten-thay-doi>/specs/requirements.md`: yêu cầu chi tiết
- `openspec/changes/archive/`: nơi lưu các thay đổi đã hoàn tất

Trong tầng này:
- **OpenSpec** là một công cụ cụ thể để quản lý đặc tả

Trong repo này:
- `examples/project-root/openspec/`

### 3. Quy trình làm việc của agent
Cải thiện cách agent phân tích, lập kế hoạch, kiểm thử, gỡ lỗi và rà soát.

Trong tầng này:
- **Superpowers** là plugin / framework giúp agent làm việc theo workflow mạnh hơn

### 4. Kiểm chứng
Mục tiêu của phần này là không để agent chỉ nói bằng miệng rằng đã xong.

Kiểm chứng thường diễn ra theo các bước sau:

#### Bước 1. Đặt quy tắc hoàn thành
Trong hướng dẫn của project phải ghi rõ agent không được kết luận hoàn tất nếu chưa có kết quả kiểm tra.

Ví dụ:
- không được nói đã xong nếu chưa chạy test
- không được chốt thay đổi nếu build còn lỗi
- phải kèm kết quả kiểm tra trong báo cáo cuối

#### Bước 2. Buộc agent tự chạy lệnh kiểm tra
Agent phải dùng tool hoặc shell để tự chạy các lệnh kiểm tra, thay vì để con người chạy tay.

Ví dụ:
- Spring Boot: `./mvnw test`, `./mvnw verify`
- Gradle: `./gradlew test`, `./gradlew build`
- Node.js: `npm test`, `npm run build`, `npm run lint`
- .NET: `dotnet test`, `dotnet build`

Nếu các lệnh này thất bại thì agent không được kết luận là thay đổi đã hoàn tất.

#### Bước 3. Gắn bước kiểm tra vào workflow
Workflow phải có checkpoint kiểm tra trước khi kết thúc.

Ví dụ:
1. phân tích yêu cầu
2. lập kế hoạch
3. sửa mã
4. chạy test / build / lint
5. rà soát lại kết quả
6. chỉ sau đó mới được kết luận hoàn tất

#### Bước 4. Dùng chặn kỹ thuật ở CI
Đây là lớp chặn cứng, không phụ thuộc vào việc agent có trung thực hay không.

Ví dụ cách làm:
- tạo pipeline CI để chạy test, build, lint
- bật branch protection trên GitHub hoặc GitLab
- cấu hình required status checks
- không cho merge nếu các check chưa xanh

Ví dụ thực tế với GitHub:
1. tạo GitHub Actions chạy `./mvnw test` hoặc lệnh tương đương
2. bật branch protection cho `main`
3. yêu cầu PR phải pass các check bắt buộc
4. nếu CI fail thì PR không merge được, dù agent có nói xong

#### Bước 5. Giữ báo cáo cuối có bằng chứng
Báo cáo cuối của agent nên nêu rõ:
- đã chạy lệnh gì
- lệnh nào pass
- lệnh nào fail
- còn giới hạn gì chưa kiểm tra được

Tóm lại, phần kiểm chứng không dựa vào việc con người tự chạy tay.
Nó dựa vào việc agent tự chạy lệnh kiểm tra, workflow không cho bỏ qua bước verify, và CI chặn merge nếu chưa đạt.

