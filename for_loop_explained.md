# 🔄 How a `for` Loop Works — Complete Guide

## Syntax

```c
for (i = 0; i < 3; i++) {
//   ①Init  ②Cond  ④Update
    print(i);  // ③ Body
}
```

---

## The 4 Phases

| # | Phase | Code | Runs |
|---|-------|------|------|
| ① | **Init** | `i = 0` | Once only — at the very start |
| ② | **Condition** | `i < 3` | Before **every** iteration |
| ③ | **Body** | `print(i)` | Only when condition is `TRUE` |
| ④ | **Update** | `i++` | After every iteration |

---

## Flowchart

```
        ┌─────────────────┐
        │  ① Init: i = 0  │  ◄── Runs ONCE
        └────────┬────────┘
                 │
                 ▼
        ┌─────────────────┐
   ┌───►│ ② Condition:    │
   │    │    i < 3 ?      │
   │    └────────┬────────┘
   │             │
   │      ┌──────┴──────┐
   │   TRUE             FALSE
   │      │                │
   │      ▼                ▼
   │  ┌───────────┐   ┌──────────┐
   │  │ ③ Body:   │   │ ⑤ EXIT   │
   │  │ print(i)  │   │  loop    │
   │  └─────┬─────┘   └──────────┘
   │        │
   │        ▼
   │  ┌───────────┐
   └──│ ④ Update: │
      │   i++     │
      └───────────┘
```

---

## Step-by-Step Trace — `for (i = 0; i < 3; i++)`

```
① Init       → i = 0

② Condition  → i < 3 → 0 < 3 → TRUE ✅
③ Body       → print(i)  →  prints "0"
④ Update     → i++       →  i = 0 + 1 = 1

② Condition  → i < 3 → 1 < 3 → TRUE ✅
③ Body       → print(i)  →  prints "1"
④ Update     → i++       →  i = 1 + 1 = 2

② Condition  → i < 3 → 2 < 3 → TRUE ✅
③ Body       → print(i)  →  prints "2"
④ Update     → i++       →  i = 2 + 1 = 3

② Condition  → i < 3 → 3 < 3 → FALSE ❌
⑤ EXIT loop
```

**Output:**
```
0
1
2
```

---

## ⚠️ Your Original Loop — `i < 0` (Never Runs!)

```c
for (i = 0; i < 0; i++) {
    print(i);   // ← NEVER reached
}
```

```
① Init       → i = 0
② Condition  → i < 0 → 0 < 0 → FALSE ❌  (fails immediately!)
⑤ EXIT loop  → body never executes, zero iterations
```

> **Why?** Because `0 < 0` is **false** — zero is not less than zero.  
> You likely meant `i < 10` or `i <= 0` or another valid range.

---

## Common Variants

| Loop | Condition | Iterations | Output |
|------|-----------|------------|--------|
| `for(i=0; i<0; i++)` | `0 < 0` → false | **0** (never runs) | _(nothing)_ |
| `for(i=0; i<1; i++)` | `0 < 1` → true once | **1** | `0` |
| `for(i=0; i<3; i++)` | runs 3 times | **3** | `0 1 2` |
| `for(i=0; i<5; i++)` | runs 5 times | **5** | `0 1 2 3 4` |
| `for(i=1; i<=3; i++)` | runs 3 times | **3** | `1 2 3` |

---

## Key Rules to Remember

> [!IMPORTANT]
> **Init runs only once.** The condition is checked **before** every iteration — if it's false from the start, the body never runs even once.

> [!TIP]
> `i++` is shorthand for `i = i + 1`. It runs **after** the body, not before.

> [!NOTE]
> The loop exits as soon as the condition becomes `FALSE`. At that point, the body and update are **skipped** and execution continues after the closing `}`.

> [!CAUTION]
> Forgetting to update `i` (e.g., removing `i++`) creates an **infinite loop** — the condition stays true forever!

---

## Memory Aid

```
for (  INIT  ;  CONDITION  ;  UPDATE  ) {
         ↓           ↓            ↓
      "Start"    "Keep going?"  "Change i"
      (once)     (each time)   (after body)
}
```
