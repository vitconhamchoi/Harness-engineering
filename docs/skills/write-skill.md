# Skill: write-skill

## Mục đích (One-liner)
TDD cho documentation — test với subagent không có skill → viết skill → verify compliance.

## Khi nào dùng
- Tạo skill mới cho team
- Cải thiện skill hiện có vì team hay làm sai
- Onboard pattern mới vào workflow

## Khi nào KHÔNG dùng
- Thay đổi nhỏ trong skill đã có (edit trực tiếp)
- Khi chỉ cần document, không cần enforce behavior

## Quy trình bắt buộc (TDD cho documentation)

### Bước 1 — RED: Xác nhận vấn đề
1. Chạy subagent **không có skill** này
2. Cho subagent một task liên quan
3. Ghi lại cách subagent làm sai
4. Đây là "test fail" — behavior cần được fix

### Bước 2 — GREEN: Viết skill
1. Tạo file markdown với cấu trúc chuẩn:
   ```
   # Skill: [tên]
   ## Mục đích (One-liner)
   ## Khi nào dùng
   ## Khi nào KHÔNG dùng
   ## Quy trình bắt buộc (numbered steps)
   ## Anti-patterns (những gì không được làm)
   ## Ví dụ trigger tự nhiên
   ## Output mong đợi
   ```
2. Viết rõ ràng, cụ thể, có ví dụ thực tế
3. Đặc biệt chú ý Anti-patterns — đây thường là chỗ skill có giá trị nhất

### Bước 3 — VERIFY: Xác nhận compliance
1. Chạy subagent **với skill mới**
2. Cho cùng task như bước 1
3. Xác nhận subagent làm đúng theo skill
4. Nếu vẫn sai → sửa skill và verify lại

### Bước 4 — Commit
1. Lưu skill vào `docs/skills/[tên-skill].md`
2. Thêm skill vào Skill Map trong `AGENTS.md`

## Anti-patterns (những gì không được làm)
- Viết skill mà không test trước khi có
- Viết quá trừu tượng, không có ví dụ cụ thể
- Bỏ qua phần Anti-patterns
- Không verify skill sau khi viết

## Ví dụ trigger tự nhiên
- "tạo skill mới cho [pattern]"
- "team hay làm sai [X], cần document lại"
- "viết documentation cho workflow này"

## Output mong đợi
```
## Write Skill: tdd-for-migrations

### RED (test trước khi có skill)
Task cho subagent: "Write a database migration"
Subagent làm: Viết migration không có rollback, không test
Ghi nhận: thiếu rollback + test là 2 anti-pattern cần fix

### GREEN (viết skill)
[tạo file docs/skills/tdd-for-migrations.md]
Nội dung: quy trình viết migration với test, rollback, verify

### VERIFY (test sau khi có skill)
Task cho subagent (với skill): "Write a database migration"
Subagent làm: ✅ Viết migration CÓ rollback, CÓ test, verify pass

Skill hoạt động → commit vào docs/skills/
```
