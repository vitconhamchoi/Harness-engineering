# Prompt Examples for todolist-backend

## 1. Debug sync bug

```text
Audit bug sync này trong todolist-backend.

Làm theo thứ tự:
1. xác định bug nằm ở API, domain state, snapshot persistence hay SignalR
2. đọc code path thực tế
3. viết ngắn đường dữ liệu từ input đến output
4. chỉ ra root cause thật
5. sửa đúng tầng với thay đổi nhỏ nhất
6. verify lại bằng scenario cụ thể

Output:
- Summary
- Root cause
- Files involved
- Fix
- Verification
- Caveat
```

## 2. Review feature change

```text
Review thay đổi này cho todolist-backend theo góc độ offline-first và event-driven correctness.

Check:
- state transition có đúng không
- event có idempotent không
- snapshot có còn consistent không
- SignalR emit có đúng thời điểm không
- có risk out-of-order hoặc duplicate apply không

Kết luận ngắn theo mức:
- Safe
- Safe with caveat
- Risky
- Needs redesign
```

## 3. Investigate wrong final state

```text
Có case task về state cuối bị sai.
Hãy trace từ request/event vào đến state cuối, snapshot và SignalR notification.

Đừng fix bề mặt. Hãy chỉ ra source of truth đang sai ở đâu.
```

## 4. Add a new endpoint safely

```text
Thêm endpoint mới cho todolist-backend.

Yêu cầu:
- đọc structure hiện tại trước
- giữ đúng invariants domain
- không phá sync behavior đang có
- nếu cần emit SignalR thì phải xác định rõ emit sau bước nào
- thêm verification notes sau khi sửa
```
