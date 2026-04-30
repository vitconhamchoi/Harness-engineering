# OpenSpec vs Spec-Kit vs Recursive Mode

## Important note first

Tài liệu này không cố chốt ai “tốt hơn tuyệt đối”.
Mục tiêu là phân biệt các implementation family theo kiểu harness they optimize for.

## 1. OpenSpec + Superpowers

### Strengths
- spec-driven workflow rõ ràng
- proposal / planning / execution / verification tách pha khá sạch
- phù hợp team muốn source-of-truth bằng spec
- tốt khi cần human review gates rõ ràng

### Weaknesses
- dễ nặng token nếu mọi task đều qua full workflow
- có thể tạo overhead cao với task nhỏ
- nếu spec quality yếu thì toàn bộ flow yếu theo

### Best fit
- team làm feature delivery có nhiều bước
- codebase cần planning discipline
- workflow ưu tiên clarity và reviewability

## 2. Spec-Kit

### Strengths
- gần với tư duy spec-first nhẹ hơn
- dễ dùng làm scaffold cho team đang muốn chuẩn hóa proposal / requirement / implementation flow
- phù hợp để tạo consistency giữa nhiều contributor

### Weaknesses
- nếu dùng máy móc dễ thành paperwork
- không tự đảm bảo execution reliability nếu thiếu verification loop

### Best fit
- team muốn standard hóa spec lifecycle
- môi trường cần tài liệu rõ trước khi code

## 3. Recursive Mode

### Strengths
- mạnh ở decomposition và recursive task breakdown
- hợp với problem phức tạp, nhiều nhánh, nhiều subtask
- phù hợp khi orchestration là vấn đề lớn hơn documentation

### Weaknesses
- dễ sinh orchestration overhead
- nếu thiếu stop rules dễ phân rã quá mức
- có thể tăng complexity mà không tăng quality tương xứng

### Best fit
- task discovery nặng
- cần chia bài toán lớn thành nhiều worker/sub-agent
- exploratory engineering hoặc research-heavy execution

## Comparison Table

| Dimension | OpenSpec + Superpowers | Spec-Kit | Recursive Mode |
| --- | --- | --- | --- |
| Primary optimization | Spec-driven delivery | Spec lifecycle consistency | Recursive decomposition |
| Heaviness | Medium to high | Light to medium | Medium to high |
| Best for | Feature delivery with review | Standardization | Complex task orchestration |
| Main risk | Token/process overhead | Bureaucratic paperwork | Orchestration sprawl |
| Core dependency | Good specs | Good templates and discipline | Good stop rules and coordination |

## Practical reading

Không nên hỏi:
- tool nào best?

Nên hỏi:
- failure mode chính của team mình là gì?
- team mình thiếu planning, thiếu consistency, hay thiếu orchestration?
- harness nên tối ưu cho điểm nghẽn nào trước?

## Bottom line

- OpenSpec + Superpowers mạnh khi cần workflow spec-driven đầy đủ.
- Spec-Kit mạnh khi cần chuẩn hóa nhẹ hơn.
- Recursive Mode mạnh khi bài toán cần decomposition và orchestration sâu.

Cả 3 đều có thể là harness tốt, nếu dùng đúng context.
