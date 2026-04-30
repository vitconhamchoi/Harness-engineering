# Harness Engineering vs Concrete Implementations

## Core framing

Harness Engineering nên được hiểu là **discipline tổng quát**, không phải một tool đơn lẻ.

Công thức ngắn:

```text
Agent = Model + Harness
```

Trong đó harness là toàn bộ hệ thống bao quanh model:
- rules và constraints
- tool access và orchestration
- memory / state management
- verification và quality gates
- observability và audit trail
- stopping rules và recovery mechanisms

## Important implication

Khi agent fail lặp đi lặp lại, câu hỏi đúng không phải luôn là:
- có nên đổi model không?

Mà thường là:
- harness đang thiếu guardrail gì?
- thiếu verification loop gì?
- thiếu source-of-truth nào?
- thiếu stopping rule hay rollback path nào?

## OpenSpec + Superpowers in this picture

OpenSpec + Superpowers không đối lập với Harness Engineering.
Nó là **một implementation cụ thể của tư duy harness engineering**.

### Mapping

| Harness layer | Purpose | OpenSpec + Superpowers style implementation |
| --- | --- | --- |
| Memory / Context | Persistent state, durable understanding | `specs/`, archive, spec history |
| Specification | Scope boundary, source of truth | propose/spec workflow |
| Planning | Structured reasoning before execution | brainstorming, plan-writing |
| Execution | Task delegation and action | sub-agents, structured workflows |
| Quality | Prevent bad output from shipping | TDD, verification, review |
| Human-in-the-loop | Approval and steering | proposal review, final review gates |

## Why this distinction matters

Nếu không tách 2 lớp này ra, người ta rất dễ nhầm rằng:
- dùng đúng tool là đủ
- copy workflow của team khác là tự động reliable

Thực tế không phải vậy.

Tool chỉ là implementation.
Điều quan trọng hơn là:
- constraint có đúng không
- source-of-truth có rõ không
- verification loop có đủ không
- handoff giữa human và agent có sạch không

## Practical takeaway

Một team có thể làm harness engineering mà:
- không dùng OpenSpec
- không dùng Superpowers
- không dùng sub-agent heavy workflow

Miễn là họ có một harness đủ tốt để:
- giảm lỗi lặp lại
- tăng reliability
- giảm human supervision cần thiết
- giữ output nằm trong boundary mong muốn

Ngược lại, một team dùng OpenSpec + Superpowers vẫn có thể làm harness yếu nếu:
- spec không thật sự là source-of-truth
- review gate chỉ làm hình thức
- verification không bắt được regression
- orchestration quá nặng nhưng không tăng chất lượng

## Recommended framing for this repo

Repo này nên coi Harness Engineering là:
- phương pháp thiết kế hệ vận hành cho agent
- tập trung vào reliability, control, recovery, verification
- tách biệt khỏi từng tool hoặc stack cụ thể

Còn các bộ như OpenSpec + Superpowers, Spec-Kit, Recursive Mode nên được trình bày như:
- concrete implementations
- implementation families
- reference patterns

## Bottom line

Harness Engineering = discipline.
OpenSpec + Superpowers = one concrete harness implementation.

Đây là quan hệ tổng quát -> cụ thể, không phải đối lập.
