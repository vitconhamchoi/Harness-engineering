# Debug Workflow for todolist-backend

## Goal
Debug đúng tầng, không vá symptom.

## Standard Flow

### Step 1. Classify the failure
Bug thường rơi vào một trong 4 nhóm:
- API contract issue
- domain state transition issue
- snapshot persistence issue
- SignalR / realtime propagation issue

### Step 2. Reconstruct the data path
Viết ngắn gọn:
- request hoặc event vào từ đâu
- handler nào xử lý
- state thay đổi ở đâu
- snapshot ghi ở đâu
- SignalR bắn ra khi nào
- client nhận gì

### Step 3. Identify the true source of truth
Phải xác định rõ:
- source of truth là in-memory state, persisted snapshot, hay event log
- notification chỉ là thông báo hay có vai trò đồng bộ state

### Step 4. Check invariant break
Câu hỏi bắt buộc:
- state cuối có đúng không
- snapshot có đúng không
- event bắn ra có phản ánh state cuối không
- nếu event đến trễ hoặc lặp lại thì có sai không

### Step 5. Fix smallest correct layer
- bug ở domain thì sửa domain
- bug ở persistence thì sửa persistence
- bug ở notification thì sửa notification
- tránh sửa UI/API response để che lỗi gốc

### Step 6. Verify scenarios
Ít nhất check lại:
- happy path
- retry / duplicate event
- reconnect / delayed notification
- out-of-order update nếu case liên quan sync

## Debug Output Template
- Symptom
- True layer of failure
- Root cause
- Fix
- Verified scenarios
- Open risks
