# Review Checklist for todolist-backend

## 1. Domain correctness
- logic chuyển trạng thái task có đúng không
- complete / reopen / delete có giữ invariant không
- state merge có làm mất dữ liệu mới hơn không

## 2. Event handling
- event có idempotent không
- duplicate event có gây double-apply không
- out-of-order event có bị rollback state sai không

## 3. Persistence
- snapshot có được cập nhật cùng logic state không
- khởi động lại server có restore đúng không
- có nguy cơ state trên RAM và snapshot dưới disk lệch nhau không

## 4. Realtime / SignalR
- event emit sau khi state ổn định chưa
- reconnect có đồng bộ lại đúng không
- có dùng SignalR như source of truth sai cách không

## 5. API behavior
- request validation đã đủ chưa
- response có phản ánh đúng state cuối không
- API có che mất lỗi domain bên dưới không

## 6. Operational quality
- có log đủ để trace bug sync không
- có test case cho scenario quan trọng không
- có chỗ nào fix tạm nhưng tăng technical debt quá mạnh không

## Review Verdict Labels
- Safe
- Safe with caveat
- Risky
- Needs redesign
