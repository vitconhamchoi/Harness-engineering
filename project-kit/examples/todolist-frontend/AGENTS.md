# AGENTS.md

## Project Nature

Đây là frontend offline-first theo hướng Angular + state management + local persistence + realtime sync.

Agent làm việc với project này phải ưu tiên hiểu:
- UI state flow
- local-first behavior
- IndexedDB / Dexie persistence flow
- sync semantics với backend
- SignalR client update flow
- consistency giữa UI state, local cache, và server-confirmed state

## Core Rules

- Không fix UI symptom nếu bug gốc nằm ở state flow, local persistence, hoặc sync contract.
- Mọi thay đổi liên quan sync phải trace ít nhất qua:
  1. user action hoặc incoming realtime event
  2. state update trong app
  3. local persistence / cache update
  4. server sync hoặc UI reconciliation
- Không coi UI render đúng một lần là bằng chứng state flow đã đúng.
- Không coi SignalR message nhận được là bằng chứng local state đã reconcile chuẩn.
- Khi sửa bug, phải xác định source of truth đang nằm ở local state, local DB, hay server snapshot.

## Execution Order

1. Xác định bug nằm ở component binding, state management, local persistence, sync contract, hay realtime propagation.
2. Đọc code path thực tế.
3. Viết ngắn đường dữ liệu từ user action/event đến UI state cuối.
4. Chỉ ra root cause.
5. Sửa đúng tầng với thay đổi nhỏ nhất hợp lý.
6. Verify lại bằng scenario cụ thể.

## Review Priorities

### Local-first invariants
- local action có phản hồi ngay đúng không
- optimistic update có reconcile lại đúng không
- cache có thể stale mà không bị phát hiện không

### State management correctness
- state transition có rõ ràng không
- derived state có bị lệch với source state không
- component có giữ state cục bộ sai chỗ không

### Persistence consistency
- Dexie / IndexedDB có cập nhật cùng logic state không
- reload app có restore đúng không
- có chỗ nào UI state và local persisted state lệch nhau không

### Realtime / sync correctness
- incoming SignalR event có merge đúng không
- duplicate / delayed event có gây sai UI không
- reconnect có rehydrate lại state đúng không

## Output Format

- Summary
- Root cause
- Files involved
- Fix approach
- Verification notes
- Remaining caveat

## Safe Defaults

- Nếu chưa hiểu state flow, không refactor lớn.
- Nếu chưa hiểu persistence lifecycle, không đổi behavior cache/local DB.
- Nếu chưa verify reload / reconnect / duplicate event case, không kết luận sync đã ổn.
