# Debug Workflow

## Goal
Debug đúng tầng, không vá symptom UI.

## Standard Flow

### Step 1. Classify the failure
Bug thường rơi vào một trong 5 nhóm:
- component / binding issue
- state management issue
- local persistence / Dexie issue
- sync contract issue
- SignalR / realtime propagation issue

### Step 2. Reconstruct the data path
Viết ngắn gọn:
- user action hoặc incoming event bắt đầu từ đâu
- effect/service/store nào xử lý
- state đổi ở đâu
- local persistence ghi ở đâu
- sync với backend khi nào
- UI render lại dựa trên source nào

### Step 3. Identify source of truth
Phải xác định rõ:
- source of truth hiện tại là store state, local DB, hay server-confirmed state
- optimistic UI có đang che lỗi reconcile không

### Step 4. Check invariant break
Câu hỏi bắt buộc:
- UI cuối có đúng không
- state store có đúng không
- local persisted state có đúng không
- reload / reconnect có giữ đúng state không
- duplicate / delayed event có làm sai không

### Step 5. Fix smallest correct layer
- bug ở component thì sửa component
- bug ở state flow thì sửa state flow
- bug ở persistence thì sửa persistence
- bug ở realtime/sync thì sửa contract hoặc merge logic
- tránh vá template/UI để che lỗi gốc

### Step 6. Verify scenarios
Ít nhất check lại:
- happy path
- reload app
- reconnect realtime
- duplicate / delayed event
- offline -> online transition nếu bug liên quan sync

## Debug Output Template
- Symptom
- True layer of failure
- Root cause
- Fix
- Verified scenarios
- Open risks
