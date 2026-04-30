# Failure Taxonomy in Harness Engineering

## Purpose

Khi agent fail, phải phân loại đúng loại fail trước khi sửa harness.
Nếu không, rất dễ vá sai tầng.

## 1. Boundary failures

### Symptoms
- agent làm quá quyền
- agent sửa / gửi / xóa thứ không nên đụng
- agent trả lời ở context không phù hợp

### Usually missing
- permission boundary
- channel rule
- external action gate
- stopping condition

## 2. Memory failures

### Symptoms
- agent quên quyết định cũ
- kéo sai context
- dùng stale information
- nhầm implemented với planned

### Usually missing
- durable memory structure
- source-of-truth discipline
- better retrieval constraints
- compaction-safe summaries

## 3. Planning failures

### Symptoms
- nhảy vào code quá sớm
- fix symptom không fix root cause
- bỏ qua discovery
- chọn sai layer để sửa

### Usually missing
- proposal step
- lightweight planning gate
- investigation workflow
- explicit success criteria

## 4. Execution failures

### Symptoms
- dừng giữa chừng
- làm thiếu bước
- không verify
- thao tác lệch repo/path/session

### Usually missing
- execution checklist
- progress discipline
- verification requirement
- workdir / target isolation

## 5. Verification failures

### Symptoms
- output nghe đúng nhưng thật ra sai
- code compile không nổi
- dữ liệu live không được check
- security review kết luận vội

### Usually missing
- tests
- source verification
- structured review step
- quality gates

## 6. Orchestration failures

### Symptoms
- sub-agents làm trùng việc
- decomposition quá mức
- không có stop rule
- handoff giữa planner và executor bị đứt

### Usually missing
- task ownership clarity
- decomposition rule
- stop conditions
- artifact handoff discipline

## 7. Recovery failures

### Symptoms
- gặp lỗi là đứng luôn
- không retry hợp lý
- không fallback
- không báo blocker rõ ràng

### Usually missing
- retry strategy
- fallback path
- failure reporting format
- rollback or safe abort path

## 8. Observability failures

### Symptoms
- không biết agent đã làm gì
- khó audit quyết định
- khó debug vì thiếu trace
- không biết fail ở bước nào

### Usually missing
- logs
- status updates
- audit trail
- execution artifact capture

## How to use this taxonomy

Khi có lỗi lặp lại:
1. xếp nó vào nhóm fail chính
2. xác định harness layer đang thiếu
3. thêm cơ chế nhỏ nhất để chặn tái diễn
4. kiểm tra xem có tradeoff quá lớn không

## Bottom line

Không phải mọi lỗi agent đều là lỗi model.
Rất nhiều lỗi thật ra là:
- thiếu boundary
- thiếu verification
- thiếu memory discipline
- thiếu orchestration control
