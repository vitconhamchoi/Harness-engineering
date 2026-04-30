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
OpenSpec là tool thật từ bên ngoài, dùng để quản lý spec cho từng thay đổi trong dự án.

Vai trò:
- lưu proposal
- lưu design
- lưu tasks
- giữ requirement ngoài chat history
- archive thay đổi sau khi hoàn tất

## Superpowers là gì
Trong framing của repo này, Superpowers là lớp design + execution skills như:
- brainstorming
- writing-plans
- TDD
- sub-agent execution
- git worktree discipline

Quan trọng:
Repo này KHÔNG ship official Superpowers plugin/package.
Thư mục `project-kit/local-superpower-patterns/` chỉ là pattern local để mô phỏng tinh thần đó.

## Spec-Kit là gì
Spec-Kit là một implementation/pattern khác cho spec-first workflow. Nó không phải alias của OpenSpec và cũng không phải synonym của Harness Engineering.

## Quan hệ giữa các khái niệm
- Harness Engineering = discipline tổng quát
- OpenSpec = một tool thật cho spec + memory
- Superpowers = capability layer cho design + execution
- Spec-Kit = một implementation/pattern khác

## Failure taxonomy ngắn
Khi agent fail, lỗi thường rơi vào một trong các nhóm:
- boundary
- memory
- planning
- execution
- verification
- orchestration
- recovery
- observability

## Evolution path ngắn
Một project thường đi từ:
1. raw prompting
2. prompt + rules
3. workflow discipline
4. project-specific harness
5. multi-step execution control
6. production-grade harness
