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
2. chọn prompt phù hợp trong `docs/prompt-examples.md`
3. chạy `scripts/validate.sh`
4. bổ sung use case mới khi cần

## Ghi chú

Repo này thiên về tài liệu điều hành và pattern, không phải framework code hoàn chỉnh.
