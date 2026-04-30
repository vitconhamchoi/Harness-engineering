# Foundations

## Harness Engineering là gì
Harness Engineering là việc thêm lớp vận hành quanh model để AI làm việc đáng tin hơn trong dự án thật.

Công thức ngắn:

```text
Agent = Model + Harness
```

Harness thường gồm:
- spec / source-of-truth
- rules cho agent
- workflow debug / review / research
- verification discipline
- planning / execution discipline

## OpenSpec là gì
OpenSpec là external tool thật để quản lý spec cho từng thay đổi trong dự án.

Vai trò:
- lưu proposal
- lưu design
- lưu tasks
- giữ requirement ngoài chat history
- archive thay đổi sau khi hoàn tất

## Superpowers là gì
Superpowers thật là một external plugin / skills framework cho coding agents.

Nó không chỉ là vài file markdown.
Nó cung cấp:
- skills
- commands
- agent/subagent workflows
- auto skill activation trên một số platform

Ý chính: khi cài đúng vào agent platform được hỗ trợ, agent có thể tự dùng các workflow như brainstorming, planning, TDD, debugging, code review mà không cần mày phải tự soạn hết từ đầu mỗi lần.

## Spec-Kit là gì
Spec-Kit là một implementation/pattern khác cho spec-first workflow. Nó không phải alias của OpenSpec và cũng không phải synonym của Harness Engineering.

## Quan hệ giữa các khái niệm
- Harness Engineering = discipline tổng quát
- OpenSpec = tool thật cho spec layer
- Superpowers = plugin / skills framework thật cho agent workflow
- Spec-Kit = implementation/pattern khác
