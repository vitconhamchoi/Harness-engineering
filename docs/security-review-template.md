# Security Review Template

Template dùng khi agent làm việc với code nhạy cảm liên quan đến authentication, authorization, payment, hoặc user data.

---

## Khi nào dùng template này

Bắt buộc khi task liên quan đến:
- Authentication / Authorization (login, JWT, OAuth, session)
- Payments (thanh toán, billing, stripe, vnpay)
- User data (PII, profile, password, email)
- Admin functions (role management, permissions)
- External API với credentials (API keys, webhooks)
- File upload / download
- Database migrations ảnh hưởng data nhạy cảm

---

## Checklist Review Bảo Mật

### 1. Input Validation
- [ ] Tất cả input từ user đều được validate trước khi xử lý
- [ ] Có kiểm tra kiểu dữ liệu, độ dài, format
- [ ] Không tin tưởng input từ client — validate cả ở server
- [ ] SQL injection: dùng parameterized query / ORM, không string concat
- [ ] XSS: escape output khi render HTML
- [ ] Path traversal: không dùng user input trực tiếp làm file path

### 2. Authentication & Authorization
- [ ] Mọi endpoint cần auth đều có middleware kiểm tra
- [ ] Token/session được verify đúng cách, không chỉ kiểm tra existence
- [ ] JWT: verify signature, không chỉ decode
- [ ] OAuth: verify state parameter để chống CSRF
- [ ] Password: dùng bcrypt/argon2, không dùng md5/sha1 hoặc hash không có salt
- [ ] Không expose sensitive info trong error message ("User not found" vs "Invalid credentials")

### 3. Data Handling
- [ ] PII không được log (email, phone, password, CCCD)
- [ ] Sensitive data được encrypt at rest nếu cần
- [ ] Database query không trả về field nhạy cảm không cần thiết (SELECT * là anti-pattern)
- [ ] Soft delete thay vì hard delete cho user data (audit trail)

### 4. Payments
- [ ] Không lưu full card number, chỉ lưu last 4 digits và token từ payment processor
- [ ] Amount được tính ở server, không tin client gửi lên
- [ ] Idempotency key cho payment request để tránh double charge
- [ ] Webhook từ payment provider phải verify signature

### 5. Secrets & Configuration
- [ ] Không hardcode API key, secret, password trong code
- [ ] Không commit `.env` file
- [ ] Secrets được load từ environment variable hoặc secret manager
- [ ] Không expose secret trong log output
- [ ] Rotate secret nếu đã bị expose

### 6. Rate Limiting & Abuse Prevention
- [ ] Auth endpoints (login, reset password) có rate limiting
- [ ] API endpoints có rate limiting hợp lý
- [ ] Có cơ chế detect và block brute force

### 7. Dependency Security
- [ ] Không dùng thư viện có CVE chưa patch
- [ ] Lock file được commit (package-lock.json, yarn.lock, poetry.lock)
- [ ] Định kỳ chạy `npm audit` / `pip audit` / `cargo audit`

---

## Output Format khi báo cáo security review

```markdown
## Security Review: [tên feature/PR]

### Tóm tắt
[Mô tả ngắn về scope review]

### Critical Issues (phải sửa trước merge)
1. [Mô tả issue] — [File:Line] — [Cách fix]

### Warning (nên sửa)
1. [Mô tả issue] — [File:Line] — [Đề xuất]

### Passed Checks
- ✅ Input validation
- ✅ Auth middleware
- ...

### Không trong scope review này
- [Những gì chưa review và lý do]
```

---

## Ví dụ trigger

```
"review security cho auth module này"
"check cái payment flow trước khi ship"
"có gì risk không trong đoạn code xử lý user data này?"
"security audit cho PR này"
```
