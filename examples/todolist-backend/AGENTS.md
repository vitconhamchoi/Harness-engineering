# AGENTS.md for todolist-backend

## Project Nature

Đây là backend offline-first, event-driven, có realtime sync qua SignalR và lưu state/snapshot theo hướng nhất quán.

Agent làm việc với project này phải ưu tiên hiểu:
- domain flow
- event flow
- snapshot consistency
- realtime update semantics
- conflict handling

## Core Working Rules

- Không sửa nhanh theo cảm tính ở controller/API layer nếu bug gốc nằm ở domain state hoặc sync flow.
- Mọi thay đổi liên quan sync phải trace ít nhất qua 4 điểm:
  1. incoming request/event
  2. domain state transition
  3. persistence/snapshot update
  4. outgoing client notification
- Không kết luận conflict-resolution đúng chỉ vì API trả 200.
- Không coi SignalR message gửi thành công là state đã đúng.
- Khi sửa bug, ưu tiên fix invariant và source of truth trước, đừng chỉ fix output.

## Expected Investigation Order

1. Xác định bug nằm ở API contract, domain logic, snapshot persistence, hay realtime propagation.
2. Đọc code thực tế ở path liên quan.
3. Viết lại đường dữ liệu ngắn gọn từ input đến output.
4. Chỉ ra root cause.
5. Chọn fix nhỏ nhất nhưng đúng tầng.
6. Verify lại bằng scenario thực tế hoặc test.

## Review Focus Areas

### 1. Offline-first invariants
- có làm vỡ local-first assumptions không
- có làm sync behavior phụ thuộc sai vào timing không
- có tạo mismatch giữa local snapshot và server snapshot không

### 2. Event-driven behavior
- event có idempotent không
- out-of-order event có gây sai state không
- event duplicate có phá consistency không

### 3. State and snapshot consistency
- snapshot có phản ánh đúng state cuối không
- state merge có monotonic hợp lý không
- có chỗ nào update state nhưng quên update snapshot hoặc ngược lại không

### 4. Realtime propagation
- SignalR event có chỉ là notification hay là source of truth
- client có thể nhận event trước khi state ổn định không
- reconnect scenario có gây lệch không

## Output Format for This Project

- Summary
- Root cause
- Files involved
- Fix approach
- Verification notes
- Remaining caveat

## Safe Defaults

- Nếu chưa hiểu event flow, không refactor lớn.
- Nếu chưa hiểu snapshot lifecycle, không đổi persistence behavior.
- Nếu chưa verify reconnect/out-of-order case, không kết luận sync đã ổn.
