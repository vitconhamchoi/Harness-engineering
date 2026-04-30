# Review Checklist

## 1. UI and state correctness
- UI có phản ánh đúng source state không
- derived/computed state có lệch không
- optimistic update có rollback/reconcile đúng không

## 2. State management
- action / reducer / effect / service flow có rõ không
- state transition có tạo race condition không
- component có giữ state local đáng lẽ phải ở store không

## 3. Persistence
- Dexie / IndexedDB có được update cùng logic state không
- reload app có khôi phục đúng không
- có nguy cơ stale cache kéo UI về state sai không

## 4. Realtime / sync
- SignalR event có merge đúng không
- duplicate / delayed event có double-apply không
- reconnect có đồng bộ lại đúng không

## 5. API contract usage
- frontend có giả định sai về response shape không
- retry / error path có hợp lý không
- UI có che lỗi sync thay vì expose đúng trạng thái không

## 6. Operational quality
- log/debug signal có đủ để trace bug không
- test có cover scenario quan trọng không
- fix có tăng technical debt quá mạnh không

## Review Verdict Labels
- Safe
- Safe with caveat
- Risky
- Needs redesign
