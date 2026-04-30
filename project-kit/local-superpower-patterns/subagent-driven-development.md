# Subagent-driven Development

## Đây là gì
Đây là local pattern doc, không phải official Superpowers command/plugin.

## Dùng khi nào
- task đủ lớn để chia thành nhiều phần độc lập
- cần nhiều worker/sub-agent đọc chung spec nhưng làm khác phần

## Kỷ luật
- mỗi sub-agent phải đọc spec liên quan trước
- task ownership rõ
- không để 2 sub-agent sửa cùng vùng logic nếu không có coordination
- phải có bước tổng hợp và review cuối
