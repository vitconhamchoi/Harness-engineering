# Evolving a Harness from Simple to Production-grade

## Purpose

Không phải team nào cũng cần harness nặng ngay từ đầu.
Tài liệu này mô tả cách nâng harness theo từng mức trưởng thành.

## Level 0. Raw prompting

### Characteristics
- chỉ có prompt
- gần như không có rule cố định
- ít hoặc không có verification

### Good for
- thử nghiệm nhanh
- personal usage rất nhỏ

### Main risk
- output thất thường
- khó lặp lại chất lượng
- fail pattern quay lại liên tục

## Level 1. Prompt + basic rules

### Add
- AGENTS-style rules
- output format
- basic safety defaults
- lightweight task classification

### Result
- câu trả lời ổn định hơn
- ít làm bừa hơn

## Level 2. Workflow discipline

### Add
- debug workflow
- review checklist
- research template
- source verification rules

### Result
- agent bắt đầu làm việc theo process thay vì phản xạ ngắn hạn
- dễ review và debug hơn

## Level 3. Project-specific harness

### Add
- project-specific AGENTS
- domain invariants
- repo-specific prompt pack
- implementation boundaries

### Result
- agent hiểu đúng codebase hơn
- ít sửa sai tầng hơn
- quality tăng rõ với bugfix / review / refactor

## Level 4. Multi-step execution control

### Add
- planning gates
- delegated execution rules
- progress reporting discipline
- structured verification after change

### Result
- làm task dài ổn hơn
- ít bỏ dở hoặc mất kiểm soát hơn

## Level 5. Production-grade harness

### Add
- observability and audit trail
- strong permission boundaries
- stopping rules
- recovery / fallback path
- CI integration and automatic checks

### Result
- human supervision giảm
- failures dễ trace hơn
- system đáng tin hơn trong production

## Upgrade rule of thumb

Không nên nhảy lên harness nặng nếu chưa có problem tương ứng.
Nên nâng level khi thấy failure pattern lặp lại.

### Good pattern
- thấy lỗi lặp lại
- phân loại lỗi
- thêm đúng mechanism nhỏ nhất
- verify improvement

### Bad pattern
- nhồi thêm workflow vì thấy người khác làm vậy
- tăng orchestration nhưng không tăng reliability
- paperwork hóa quy trình mà không giảm lỗi thật

## Bottom line

Harness tốt không phải harness nặng nhất.
Harness tốt là harness:
- đủ để chặn lỗi lặp lại
- đủ để tăng reliability
- nhưng vẫn nhẹ đến mức team chấp nhận dùng thật
