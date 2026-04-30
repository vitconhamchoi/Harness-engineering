# Harness Engineering

Bộ tài liệu nền để thiết kế, vận hành, và mở rộng một AI agent harness theo hướng thực dụng.

## Harness là gì, hiểu ngắn gọn

Harness không phải framework code để import vào app.
Nó là **bộ luật vận hành cho AI khi làm việc với một dự án**.

Công thức ngắn:

```text
Agent = Model + Harness
```

Trong đó model chỉ là phần sinh output, còn harness là toàn bộ lớp bao quanh để làm agent usable trong thực tế:
- rules và constraints
- tools và orchestration
- memory / state management
- verification và quality gates
- observability / audit trail
- stopping rules / recovery paths

Nó giúp trả lời các câu:
- agent được làm gì
- khi nào phải đọc code trước khi kết luận
- khi nào cần web search
- khi nào được sửa file
- output nên theo format nào
- debug / review / research nên đi theo quy trình gì

Nói dễ hiểu: harness giống **SOP + playbook + prompt pack + quality control layer** cho AI trong dự án.

## Mục tiêu

Repo này dùng để:
- định nghĩa tư duy thiết kế harness
- chuẩn hóa rule cho agent
- gom các prompt mẫu thường dùng
- có script validation cơ bản để kiểm tra cấu trúc docs

## Cấu trúc

### A. Tài liệu giải thích / framework tư duy
Nhóm này dùng để **đọc hiểu khái niệm**, không phải cứ copy nguyên vào repo dự án.

- `README.md` - tổng quan và roadmap
- `docs/implementation-mapping.md` - phân biệt Harness Engineering với implementation cụ thể
- `docs/implementation-comparison.md` - so sánh OpenSpec, Spec-Kit, Recursive Mode
- `docs/failure-taxonomy.md` - phân loại lỗi agent theo từng tầng harness
- `docs/evolution-path.md` - lộ trình nâng harness từ nhẹ đến production-grade

### B. Tài liệu template / playbook dùng để áp dụng
Nhóm này là **tài liệu vận hành**, có thể copy hoặc adapt vào dự án thật.

- `docs/AGENTS.md` - rule tổng quát cho agent/harness
- `docs/prompt-examples.md` - prompt mẫu theo nhóm use case
- `docs/workflow-templates.md` - template workflow cho audit, market, config, project review
- `docs/security-review-template.md` - khung review security thực dụng
- `docs/research-template.md` - khung research có source discipline

### C. Ví dụ áp vào dự án thật
Nhóm này là **mẫu project-specific**, gần nhất với thứ sẽ nhét vào repo thật.

- `examples/todolist-backend/AGENTS.md`
- `examples/todolist-backend/docs/debug-workflow.md`
- `examples/todolist-backend/docs/review-checklist.md`
- `examples/todolist-backend/docs/prompt-examples.md`

### D. Repo hygiene
- `CONTRIBUTING.md` - nguyên tắc đóng góp
- `LICENSE` - giấy phép MIT
- `.gitignore` - ignore cơ bản
- `scripts/validate.sh` - kiểm tra nhanh cấu trúc file

## Roadmap 4 giai đoạn

### Giai đoạn 1. Foundation
- xác định role của harness
- định nghĩa input/output contract
- chốt nguyên tắc an toàn, quyền hạn, memory, tool usage
- chuẩn hóa format cho task execution

### Giai đoạn 2. Task Orchestration
- phân loại task: chat, research, coding, audit, automation
- xác định khi nào dùng direct execution, khi nào spawn sub-agent
- chuẩn hóa progress update, completion signal, failure handling

### Giai đoạn 3. Quality and Reliability
- thêm checklist validate output
- thêm anti-hallucination pattern
- chuẩn hóa source verification, especially với market/security/dev work
- giảm context bloat bằng compaction-aware prompting

### Giai đoạn 4. Production Hardening
- telemetry và audit trail
- rate limit / retry / timeout strategy
- permission boundaries
- channel-specific behavior cho Telegram, Discord, web

## Cách dùng

### Nếu mày chỉ muốn hiểu khái niệm
Đọc theo thứ tự:
1. `README.md`
2. `docs/implementation-mapping.md`
3. `docs/failure-taxonomy.md`
4. `docs/evolution-path.md`
5. `docs/implementation-comparison.md`

### Nếu mày muốn áp vào dự án thật
Không phải copy cả repo này vào project.
Cách đúng thường là:

1. đọc phần giải thích để hiểu harness cần giải quyết cái gì
2. chọn template phù hợp trong `docs/`
3. tạo bộ file riêng cho project của mày
4. copy hoặc adapt các file cần thiết vào repo dự án thật

### Thứ thường copy vào dự án thật
Thông thường mày sẽ copy hoặc chỉnh lại các file kiểu này:
- `AGENTS.md`
- `docs/debug-workflow.md`
- `docs/review-checklist.md`
- `docs/prompt-examples.md`
- thêm security/research template nếu dự án cần

### Thứ thường KHÔNG cần copy nguyên vào dự án
Mấy file mang tính giải thích / framework tư duy thường không cần nhét nguyên vào repo project:
- `docs/implementation-mapping.md`
- `docs/implementation-comparison.md`
- `docs/failure-taxonomy.md`
- `docs/evolution-path.md`

Mấy file này để người vận hành đọc và hiểu cách thiết kế harness, không phải tài liệu runtime cho project.

### Quy trình áp thực tế cho một dự án
Ví dụ với `todolist-backend`:

1. tạo `AGENTS.md` trong repo backend
2. thêm `docs/debug-workflow.md`
3. thêm `docs/review-checklist.md`
4. thêm `docs/prompt-examples.md`
5. chỉnh các file đó theo domain của project
6. từ đó về sau, mọi task giao cho AI sẽ bám các file này

### Nói cực ngắn
- **Tài liệu giải thích** = để đọc hiểu
- **Tài liệu template** = để adapt
- **Tài liệu example project** = thứ gần nhất với file sẽ nhét vào repo thật

## Harness áp được vào những mảng nào

Harness không chỉ để code. Nó áp được ít nhất vào:

- **Code execution**: thêm feature, sửa bug, refactor
- **Debugging**: điều tra lỗi theo đúng tầng, không vá symptom
- **Code review / architecture review**: check invariants, risk, coupling
- **Research**: tra cứu có source discipline, không trả lời mò
- **Security / repo hygiene**: review secret exposure, scripts, config risk
- **Docs / communication**: viết status, progress, design note, technical explanation

## Ví dụ áp vào dự án thật

Repo này hiện có ví dụ cho:
- `examples/todolist-backend/`

Với project này, harness được dùng để:
- chuẩn hóa cách debug sync bug
- review logic offline-first / event-driven
- giao việc cho AI mà không bị sửa bừa ở sai tầng
- giữ cho agent luôn trace qua state, snapshot, và realtime notification trước khi kết luận

## Harness Engineering vs implementation cụ thể

Điểm quan trọng của repo này là:
- **Harness Engineering** là discipline tổng quát
- còn những bộ như **OpenSpec + Superpowers**, **Spec-Kit**, **Recursive Mode** là các implementation hoặc pattern cụ thể

Nói ngắn gọn:
- Harness Engineering = triết lý và phương pháp dựng "dây cương" cho AI
- OpenSpec + Superpowers = một bộ dây cương cụ thể đang chạy trong một số team

Xem thêm:
- `docs/implementation-mapping.md`
- `docs/implementation-comparison.md`
- `docs/failure-taxonomy.md`
- `docs/evolution-path.md`

## Bộ này phù hợp với ai

- người đang thiết kế AI harness / agent wrapper
- người cần quy tắc vận hành agent thực dụng
- người muốn chuẩn hóa quy trình audit, research, market snapshot, config troubleshooting

## Định hướng phát triển tiếp

- thêm template cho multi-agent orchestration
- thêm checklist cho channel behavior
- thêm pattern cho memory discipline và compaction-safe prompting
- thêm docs cho approval boundary và external action control

## Ghi chú

Repo này thiên về tài liệu điều hành và pattern, không phải framework code hoàn chỉnh.
