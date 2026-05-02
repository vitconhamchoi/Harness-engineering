# Skill: write-plan

## Mục đích (One-liner)
Chia task thành các bước 2-5 phút có file path, code snippet và lệnh verify cụ thể.

## Khi nào dùng
- Sau khi `brainstorm` cho ra design được duyệt
- Trước bất kỳ implement nào có hơn 1-2 file thay đổi
- Khi cần chia sẻ kế hoạch để người khác review trước khi làm

## Khi nào KHÔNG dùng
- Hotfix khẩn cấp 1-2 dòng (nhưng vẫn phải `tdd`)
- Khi plan đã tồn tại và còn hợp lệ

## Quy trình bắt buộc
1. Đọc lại `design.md` đã được duyệt
2. Liệt kê toàn bộ file sẽ thay đổi
3. Chia nhỏ thành task, mỗi task:
   - Đặt tên rõ nghĩa (động từ + đối tượng)
   - Ghi đường dẫn file chính xác
   - Ghi code snippet hoặc pseudocode
   - Ghi lệnh verify sau task
   - Ghi output mong đợi
4. Đảm bảo mỗi task ≤ 5 phút (ước tính cho developer đọc hiểu và review, không phải thời gian agent chạy)
5. Lưu ra `plan.md`
6. **Đợi xác nhận plan** trước khi execute

## Anti-patterns (những gì không được làm)
- Viết task kiểu "implement feature X" — quá chung chung
- Bỏ qua lệnh verify ở mỗi task
- Bắt đầu code trước khi plan được duyệt
- Gộp nhiều file thay đổi vào 1 task lớn

## Ví dụ trigger tự nhiên
- "bắt đầu implement cái này đi"
- "design xong rồi, giờ làm thế nào?"
- "lên kế hoạch cho tôi"
- "chia nhỏ task ra"

## Output mong đợi
```markdown
# Plan: [tên feature]

## Tổng quan
- Design: link/path tới design.md
- Ước tính: X task × ~3 phút = ~Y phút

## Tasks

### Task 1: Tạo interface AuthProvider
- File: `src/auth/AuthProvider.ts`
- Code:
  ```typescript
  export interface AuthProvider {
    login(credentials: Credentials): Promise<User>
    logout(): Promise<void>
  }
  ```
- Verify: `npx tsc --noEmit`
- Expected: không có lỗi TypeScript

### Task 2: Viết test cho GoogleAuthProvider
...
```

Sau khi duyệt → dùng `execute-plan` để thực thi.
