# Prompt Examples

## 1. Debug a sync/UI bug

```text
Audit bug này trong todolist-frontend.

Làm theo thứ tự:
1. xác định bug nằm ở component, state management, Dexie/local persistence, sync contract, hay SignalR
2. đọc code path thực tế
3. viết ngắn đường dữ liệu từ user action/event đến final UI state
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

## 2. Review a change

```text
Review thay đổi này cho todolist-frontend theo góc độ local-first, state consistency, và realtime correctness.

Check:
- UI có phản ánh đúng source state không
- local persistence có còn consistent không
- SignalR merge có đúng không
- optimistic update có reconcile đúng không
- có risk duplicate / delayed / reconnect issue không

Kết luận theo mức:
- Safe
- Safe with caveat
- Risky
- Needs redesign
```

## 3. Investigate wrong UI final state

```text
Có case UI final state bị sai.
Hãy trace từ user action hoặc realtime event vào đến store state, local persistence, và UI render cuối.

Đừng fix bề mặt ở template nếu source of truth sai ở tầng dưới.
```

## 4. Add a feature safely

```text
Thêm feature mới cho todolist-frontend.

Yêu cầu:
- đọc structure hiện tại trước
- giữ đúng local-first behavior
- không phá sync behavior đang có
- nếu cần optimistic update thì phải nói rõ reconcile path
- thêm verification notes sau khi sửa
```
