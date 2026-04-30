# Workflow Templates

## Meta Workflow: Build or improve a harness

### Goal
Improve agent reliability by changing the harness, not only the prompt or model.

### Steps
1. Identify repeated failure pattern
2. Classify the failure: boundary, memory, orchestration, verification, recovery, or observability
3. Add the smallest harness mechanism that prevents recurrence
4. Verify whether the new mechanism actually catches the old failure
5. Keep the harness lighter if reliability gain is not worth the added complexity

### Output Template
- Repeated failure
- Harness gap
- Mechanism added
- Why this is better than only changing model/prompt
- Tradeoff introduced

## 1. Security Audit Workflow

### Goal
Quickly determine whether a repo or environment is actually dangerous, merely messy, or basically safe.

### Steps
1. Inspect remotes and local config
2. Scan for secret exposure
3. Check hooks, scripts, executables, startup paths
4. Separate confirmed risk from noise
5. Recommend smallest high-impact fixes first

### Output Template
- Summary
- Confirmed findings
- Non-findings / false alarms
- Risk level
- Immediate actions

## 2. Market Snapshot Workflow

### Goal
Produce a concise live-data-backed view for a coin or watchlist.

### Steps
1. Pull live market data
2. Cross-check at least 2 sources when feasible
3. Extract price, market cap, 24h change, volume
4. Map obvious nearby support / resistance
5. Give practical conclusion: watch, buy slowly, wait breakout, avoid chasing

### Output Template
- Summary
- Key data
- Risk / caveat
- Practical conclusion

## 3. Project Status Audit Workflow

### Goal
Understand what is implemented vs. planned in a project.

### Steps
1. Read README, progress docs, manifests
2. Inspect actual source structure
3. Identify completed capabilities
4. Identify claimed-but-not-implemented items
5. Recommend next milestone

### Output Template
- Current state
- What is truly implemented
- Biggest gap
- Recommended next step

## 4. Config Troubleshooting Workflow

### Goal
Find the real root cause instead of random symptoms.

### Steps
1. Locate config inputs
2. Compare defaults vs actual runtime values
3. Find bottleneck parameter
4. Apply lowest-risk correction
5. Verify after change

### Output Template
- Root cause
- Secondary contributing factors
- Change applied
- Verification
- Remaining caveats
