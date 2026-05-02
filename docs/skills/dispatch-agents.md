# Skill: dispatch-agents

## Mục đích (One-liner)
Xác nhận task độc lập → chạy song song → tổng hợp kết quả.

## Khi nào dùng
- Có 2+ task không phụ thuộc vào nhau
- Task không share state hay file conflict
- Muốn tối ưu thời gian bằng parallelism

## Khi nào KHÔNG dùng
- Task có dependency (A phải xong trước B mới làm được)
- Task share cùng file và có thể conflict
- Môi trường không support parallel agent (ví dụ: agent chỉ chạy 1 session tại một thời điểm, không có concurrent execution)

## Quy trình bắt buộc
1. **Xác nhận independence**:
   - Liệt kê tất cả file mỗi task sẽ touch
   - Xác nhận không có overlap
   - Xác nhận không có state dependency
2. Nếu có dependency → đừng dispatch song song, dùng `execute-plan` tuần tự
3. Dispatch 1 agent per task với context đầy đủ
4. Chạy song song
5. Thu thập kết quả từng agent
6. **Tổng hợp và resolve conflict** nếu có (dù đã check, vẫn có thể có unexpected overlap)
7. Chạy `verify` sau khi tổng hợp

## Anti-patterns (những gì không được làm)
- Dispatch song song mà không kiểm tra independence trước
- Không resolve conflict sau khi tổng hợp
- Bỏ qua verify sau khi merge kết quả
- Assume task độc lập mà không kiểm tra file list

## Ví dụ trigger tự nhiên
- "làm 3 task này song song đi"
- "cái này cái kia không liên quan nhau, chạy cùng lúc được không?"
- "dispatch nhiều agent"
- khi có nhiều bugfix độc lập cần làm cùng lúc

## Output mong đợi
```
## Dispatch Agents

### Kiểm tra independence
Task A (fix login bug): touches src/auth/login.ts, test/auth/login.test.ts
Task B (add export feature): touches src/export/*, test/export/*
Task C (update README): touches README.md

✅ Không có file overlap → an toàn để dispatch song song

### Dispatch
[Agent A] → Task A: fix login bug
[Agent B] → Task B: add export feature
[Agent C] → Task C: update README
(chạy song song)

### Kết quả
[Agent A] ✅ DONE — login bug fixed, 3 tests pass
[Agent B] ✅ DONE — export feature added, 8 tests pass
[Agent C] ✅ DONE — README updated

### Verify tổng hợp
Lệnh: `npm test`
Output: 58 tests pass
✅ Tất cả pass sau khi merge kết quả
```
