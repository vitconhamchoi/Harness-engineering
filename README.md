# Harness Engineering

Bộ tài liệu nền để thiết kế, vận hành, và mở rộng một AI agent harness theo hướng thực dụng.

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
4. chạy `scripts/validate.sh`
5. bổ sung use case mới khi cần

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
