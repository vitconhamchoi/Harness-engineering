# Harness Engineering

Harness Engineering là cách thêm lớp điều phối quanh AI agent để agent làm việc theo quy trình rõ hơn, giữ ngữ cảnh tốt hơn và tự kiểm tra trước khi kết thúc.

## Diagram

```text
Người dùng
   │
   ▼
Harness
   ├─ Hướng dẫn riêng của dự án
   │  └─ AGENTS.md, docs/
   │
   ├─ Đặc tả thay đổi
   │  └─ OpenSpec
   │
   ├─ Quy trình làm việc của agent
   │  └─ Superpowers
   │
   └─ Kiểm chứng
   │  └─ test, build, lint, CI gate
   │
   ▼
Agent
   │
   ▼
Mã nguồn và công cụ
```

## Khái niệm chính

- **Model**: lõi suy luận và sinh câu trả lời.
- **Agent**: hệ thống dùng model, đồng thời có tool để đọc file, sửa mã và chạy lệnh.
- **Harness**: lớp bao quanh agent để nạp ngữ cảnh, gắn quy trình và áp kiểm chứng.

**Harness không phải agent. Agent không phải model.**

## 1. Hướng dẫn riêng của dự án
Dùng để nói cho agent biết repo này phải được xử lý như thế nào.

Ví dụ file:
- `AGENTS.md`
- `docs/prompt-examples.md`
- `docs/workflow-templates.md`
- `docs/security-review-template.md`

Ví dụ trong repo này:
- `examples/project-root/AGENTS.md`
- `examples/project-root/docs/`

## 2. Đặc tả thay đổi
Dùng để giữ yêu cầu, thiết kế và đầu việc ra ngoài phần chat.

Ví dụ cấu trúc:
```text
openspec/
  changes/
    add-login/
      proposal.md
      design.md
      tasks.md
      specs/
        requirements.md
  changes/archive/
```

Ý nghĩa file:
- `proposal.md`: vì sao cần thay đổi này
- `design.md`: hướng thiết kế kỹ thuật
- `tasks.md`: các bước triển khai
- `requirements.md`: yêu cầu chi tiết

Cài và dùng OpenSpec:
```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
```

Lệnh chính:
- `/opsx:propose <ten-thay-doi>`
- `/opsx:apply`
- `/opsx:archive`
- `openspec update`

Ví dụ trong repo này:
- `examples/project-root/openspec/`

## 3. Quy trình làm việc của agent
Dùng để buộc agent làm việc theo bước, không nhảy vào code bừa.

Ví dụ workflow:
1. phân tích yêu cầu
2. viết kế hoạch
3. sửa mã theo từng bước
4. chạy kiểm tra
5. review lại kết quả

Một cách triển khai phần này là **Superpowers**.

Ví dụ cài Superpowers:

### Claude Code
```text
/plugin install superpowers@claude-plugins-official
```

hoặc:

```text
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

### Cursor Agent
```text
/add-plugin superpowers
```

Ví dụ lệnh / workflow thường gặp:
- `/brainstorm`
- `/write-plan`
- `/execute-plan`

Ý nghĩa thực tế:
- `/brainstorm`: chốt yêu cầu và hướng làm trước khi code
- `/write-plan`: bẻ công việc thành bước nhỏ
- `/execute-plan`: thực hiện kế hoạch theo từng bước có checkpoint

## 4. Kiểm chứng
Mục tiêu là không cho agent chỉ nói “xong rồi” mà không có bằng chứng.

Cơ chế thực tế gồm 4 bước:

### Bước 1. Đặt rule trong project
Ví dụ trong `AGENTS.md`:
```md
- Không được kết luận hoàn tất nếu chưa chạy test hoặc build.
- Báo cáo cuối phải ghi rõ các lệnh kiểm tra đã chạy.
- Nếu lệnh kiểm tra thất bại, phải báo fail thay vì nói đã xong.
```

### Bước 2. Agent tự chạy lệnh kiểm tra
Ví dụ:
```bash
./mvnw test
./mvnw verify
npm test
npm run build
npm run lint
dotnet test
dotnet build
```

### Bước 3. Workflow không cho bỏ qua verify
Ví dụ flow:
```text
plan -> code -> test/build/lint -> review -> done
```

### Bước 4. Chặn cứng ở CI
Ví dụ GitHub Actions:
```yaml
name: ci
on: [pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-java@v4
        with:
          distribution: temurin
          java-version: '21'
      - name: Run tests
        run: ./mvnw test
```

Sau đó bật branch protection cho `main` và yêu cầu check `test` phải pass trước khi merge.

Khi đó:
- agent có thể tự chạy kiểm tra trước
- CI chạy lại trên môi trường chuẩn
- nếu CI fail thì không merge được
