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


## 1. Hướng dẫn riêng của dự án
Dùng để nói cho agent biết repo này phải được xử lý như thế nào.

Ví dụ file:
- `AGENTS.md`
- `docs/prompt-examples.md`
- `docs/workflow-templates.md`
- `docs/security-review-template.md`

Ví dụ nội dung thường có:
- module nào nhạy cảm, không được sửa bừa
- coding convention nào bắt buộc
- lệnh build, test, lint của project
- format báo cáo cuối mà agent phải trả về

Trong project thật, phần này thường nằm ở:
- `AGENTS.md`
- `docs/`

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

Sau `openspec init`, project sẽ có thư mục `openspec/`.
Các file bên trong `openspec/changes/...` thường được tạo tiếp khi dùng `/opsx:propose`.

OpenSpec có hai nhóm lệnh khác nhau:

### Lệnh terminal
Dùng để cài và cập nhật OpenSpec trong project.

```bash
npm install -g @fission-ai/openspec@latest
cd /path/to/my-project
openspec init
openspec update
```

### Lệnh chat của agent
Dùng để vận hành workflow hằng ngày sau khi OpenSpec đã được gắn vào project.

```text
/opsx:propose <ten-thay-doi>
/opsx:apply
/opsx:archive
```

Các bước thực hiện một yêu cầu với OpenSpec:

### Bước 1. Tạo thay đổi mới
Tạo một change với tên ngắn, rõ nghĩa.

Ví dụ:
```text
/opsx:propose add-google-login
```

### Bước 2. Mô tả yêu cầu rõ hơn trong chat
Ngay sau lệnh propose, mô tả rõ yêu cầu để agent dựng proposal, design và tasks đúng hướng.

Ví dụ:
```text
/opsx:propose add-google-login

Yêu cầu:
- thêm đăng nhập bằng Google cho web app
- chỉ chấp nhận email đã được Google xác thực
- nếu email đã tồn tại thì liên kết với tài khoản cũ
- backend xác thực Google token và phát JWT nội bộ
- frontend thêm nút đăng nhập Google ở màn hình login
```

### Bước 3. Xem lại các file đặc tả được tạo ra
Sau bước propose, OpenSpec thường tạo ra các file như:
- `proposal.md`
- `design.md`
- `tasks.md`
- `specs/requirements.md`

Lúc này cần đọc lại và chỉnh nếu proposal hoặc design đi sai hướng.

### Bước 4. Bắt đầu triển khai
Khi proposal, design và tasks đã ổn, yêu cầu agent thực hiện:
```text
/opsx:apply
```

### Bước 5. Lưu thay đổi đã hoàn tất
Khi thay đổi đã xong và đã kiểm chứng, lưu vào archive:
```text
/opsx:archive
```

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

Điểm cần hiểu rõ:
- mục tiêu tốt nhất là agent **tự** vào đúng workflow theo ngữ cảnh
- slash command chỉ nên là **cách gọi tay khi cần ép mode**, không nên là cách dùng chính hằng ngày

Nếu tập trung vào hai môi trường đang dùng nhiều là VS Code và Antigravity thì nên hiểu phần này như sau:

- **VS Code**: có thể dùng Superpowers theo hướng tích hợp với Copilot ở mức workspace.
- **Antigravity**: hiện chưa thấy tài liệu chính thức rõ về tích hợp Superpowers.

Ví dụ cài Superpowers cho VS Code:
```bash
cd /path/to/project
curl -fsSL https://raw.githubusercontent.com/earchibald/vsc-superpowers/main/install-superpowers.sh | bash
```

Sau khi cài, Copilot trong workspace sẽ đọc thêm instruction và prompt của Superpowers.
Mục tiêu là agent tự vào đúng workflow theo ngữ cảnh. Slash command chỉ là cách gọi tay khi cần ép workflow.

Ví dụ:
- user: "thêm chức năng đăng nhập bằng Google" -> agent nên tự làm rõ yêu cầu và thiết kế trước khi code
- user: "debug lỗi 500 ở API tạo đơn hàng" -> agent nên tự đi theo workflow gỡ lỗi có hệ thống

## Dùng với Google Antigravity

### Không cần cài đặt gì thêm

```bash
git clone https://github.com/vitconhamchoi/Harness-engineering
# Mở thư mục trong Antigravity — xong
```

Antigravity tự đọc `AGENTS.md` khi mở workspace. Toàn bộ 14 skills của Superpowers đã được viết vào file đó.

### Antigravity đọc AGENTS.md như thế nào

1. Khi mở workspace, Antigravity load `AGENTS.md` vào context
2. Agent đọc Skill Map và 14 skill definitions
3. Khi user nói chuyện tự nhiên, agent nhận diện tình huống và trigger đúng skill
4. Không cần slash command — trigger từ ngữ cảnh câu nói

### Cách trigger skill bằng ngôn ngữ tự nhiên

| Bạn nói | Agent tự làm |
|---|---|
| "thêm chức năng đăng nhập Google" | `brainstorm` → hỏi rõ → `write-plan` → `worktree` → `tdd` |
| "debug lỗi 500 ở API" | `investigate` 4 bước → `tdd` fix → `verify` |
| "nhận được review comment..." | `receive-review` → đánh giá → `tdd` nếu đúng |
| "xong rồi, commit đi" | `verify` → dán output → mới commit |
| "có 3 bug độc lập, fix song song" | `dispatch-agents` → tổng hợp |

### So sánh: Superpowers cài vs dùng file này

| Tính năng | Superpowers (cài đặt) | File AGENTS.md (repo này) |
|---|---|---|
| 14 skills có cấu trúc | ✅ | ✅ |
| TDD bắt buộc | ✅ | ✅ |
| Iron Law of Verification | ✅ | ✅ |
| Trigger từ ngữ cảnh tự nhiên | ✅ | ✅ |
| Dùng với Antigravity | ❌ | ✅ |
| Cần cài đặt | ✅ | ❌ |
| Cần tài khoản Claude Code / Copilot | ✅ | ❌ |
| Hook chặn commit tự động | ✅ | ❌ (dùng CI thay thế) |

### File cần đọc sau khi clone

- `AGENTS.md` — entry point, Skill Map, 14 skills
- `docs/skills/` — chi tiết từng skill
- `docs/prompt-examples.md` — ví dụ trigger thực tế
- `docs/workflow-templates.md` — workflow end-to-end

---

## 4. Kiểm chứng
Mục tiêu là không cho agent chỉ nói “xong rồi” mà không có bằng chứng.

Làm phần này theo 4 bước cụ thể sau.

### Bước 1. Ghi rule chặn trong project
Việc phải làm:
1. mở `AGENTS.md`
2. thêm rule bắt agent phải chạy kiểm tra trước khi kết thúc

Ví dụ nội dung:
```md
## Verification Rules
- Không được kết luận hoàn tất nếu chưa chạy lệnh kiểm tra bắt buộc.
- Báo cáo cuối phải ghi rõ lệnh nào đã chạy và kết quả pass/fail.
- Nếu test, build hoặc lint fail thì phải báo fail, không được nói đã xong.
```

Kết quả mong muốn:
- agent có luật rõ để bám vào khi làm việc

### Bước 2. Chốt bộ lệnh kiểm tra của project
Việc phải làm:
1. xác định project dùng lệnh nào để test, build, lint
2. ghi chúng vào `AGENTS.md` hoặc `docs/workflow-templates.md` trong project

Ví dụ Spring Boot dùng Maven:
```md
## Verification Commands
- Test: ./mvnw test
- Build: ./mvnw verify
```

Ví dụ Node.js:
```md
## Verification Commands
- Test: npm test
- Build: npm run build
- Lint: npm run lint
```

Kết quả mong muốn:
- agent biết chính xác phải chạy lệnh nào, không phải đoán

### Bước 3. Ép verify vào quy trình làm việc
Việc phải làm:
1. ghi rõ trong workflow rằng sau khi sửa mã phải chạy verify
2. không cho bước “done” xuất hiện trước bước verify

Ví dụ ghi trong `docs/workflow-templates.md`:
```text
1. đọc yêu cầu
2. viết kế hoạch
3. sửa mã
4. chạy test/build/lint
5. nếu fail thì sửa tiếp
6. nếu pass thì mới được review và kết thúc
```

Kết quả mong muốn:
- verify trở thành một bước bắt buộc trong flow, không phải bước tùy hứng

### Bước 4. Tạo chặn kỹ thuật ở CI
Việc phải làm:
1. tạo file workflow CI, ví dụ `.github/workflows/ci.yml`
2. cấu hình CI chạy đúng lệnh kiểm tra của project
3. bật branch protection
4. yêu cầu check CI phải pass trước khi merge

Ví dụ GitHub Actions cho Spring Boot:
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
      - name: Verify build
        run: ./mvnw verify
```

Việc phải làm tiếp trên GitHub:
1. vào `Settings -> Branches`
2. tạo branch protection rule cho `main`
3. bật `Require status checks to pass before merging`
4. chọn job `test`

Kết quả mong muốn:
- agent có thể nói đã xong, nhưng nếu CI đỏ thì vẫn không merge được
