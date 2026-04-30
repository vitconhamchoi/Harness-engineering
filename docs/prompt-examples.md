# Prompt Examples

## 1. Repo Security Review

```text
Audit repo này theo góc độ security và secret exposure.

Làm lần lượt:
1. kiểm tra git remote có lộ token không
2. scan secret patterns trong source thật, bỏ qua node_modules/.git/build output
3. kiểm tra git hooks lạ
4. chỉ ra file/generated artifact nào không nên push
5. kết luận repo nào nguy hiểm thật, repo nào chỉ cần dọn vệ sinh

Output ngắn theo format:
- Summary
- Findings
- Risk level
- Recommended actions
```

## 2. Market Snapshot

```text
Cho tôi snapshot nhanh coin này.

Yêu cầu:
- tra live data trước
- lấy giá, market cap, 24h change, volume
- nêu hỗ trợ/kháng cự gần nếu có thể suy ra hợp lý từ nguồn
- nếu dữ liệu lệch giữa các nguồn, nói rõ là lệch snapshot
- kết luận kiểu thực dụng: mua đuổi, chờ breakout, hay chỉ quan sát

Trả lời ngắn, chắc, không hype.
```

## 3. Project Status Audit

```text
Đọc toàn bộ project và cho tôi biết:
- đã làm được gì
- cái gì chỉ mới ở mức docs/plan
- risk kỹ thuật lớn nhất hiện tại là gì
- bước tiếp theo nên làm là gì

Không đoán mò. Chỉ kết luận từ file thực tế.
```

## 4. Build a New Documentation Pack

```text
Tạo cho tôi một bộ tài liệu repo mới gồm:
- README.md
- docs/AGENTS.md
- docs/prompt-examples.md
- scripts/validate.sh

Mục tiêu là tạo nền cho một harness engineering repo.
Viết theo hướng practical, concise, usable ngay.
```

## 5. Config Troubleshooting

```text
Đi tìm nguyên nhân cấu hình gây lỗi.

Làm theo thứ tự:
1. tìm config liên quan
2. chỉ ra giá trị nào là nguyên nhân chính
3. phân biệt root cause và yếu tố phụ
4. nếu có fix low-risk thì áp dụng luôn
5. verify sau khi sửa

Đừng chỉ mô tả, hãy xử lý nếu rõ đường.
```

## 6. Message Draft for Boss / Group

```text
Viết cho tôi 2 bản:
1. bản 3-4 dòng cực ngắn cho sếp đọc phát hiểu
2. bản 5-7 dòng có thêm một chút bối cảnh

Tone: chuyên nghiệp, ngắn, kết luận rõ, không hype.
```
