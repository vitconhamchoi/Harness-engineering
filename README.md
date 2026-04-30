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

- `README.md` - tổng quan và roadmap
- `docs/AGENTS.md` - quy tắc vận hành agent/harness
- `docs/prompt-examples.md` - prompt mẫu theo nhóm use case
- `docs/workflow-templates.md` - template workflow cho audit, market, config, project review
- `docs/security-review-template.md` - khung review security thực dụng
- `docs/research-template.md` - khung research có source discipline
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

1. đọc `docs/AGENTS.md`
2. chọn template phù hợp trong `docs/`
3. chọn prompt phù hợp trong `docs/prompt-examples.md`
4. nếu có project thật, tạo một pack riêng trong `examples/<project-name>/`
5. chạy `scripts/validate.sh`
6. bổ sung use case mới khi cần

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
