# Portable File-Defined AI Node — a 2-minute reproducible demo

**给 Baba(先看这句):这个文件夹里没有你任何私人信息。** 它是把你系统的**方法论**(文件定义身份 + 六可治理 + 冷启动恢复)抽成一个**通用空骨架**,谁都能跑。你的记忆、故事、家人、身份——一个字都没进来。

---

## What this is
A sanitized skeleton of a **personal AI runtime** whose identity, rules, and memory live in **plain files — not in an account or a single model**. Hand these files to any capable LLM and it reconstitutes the same "node." Swap the model, swap the device — same node. That is the whole point.

## The claim it lets you verify yourself
> An AI agent's identity and governance can live in portable files, so it survives losing the account, the model, or the device.

Don't take my word for it. Run it.

## How to run (2 minutes, any LLM)
1. Open any capable model (Claude, GPT, Gemini, a local model — doesn't matter).
2. Paste the contents of `BOOT_PROMPT.md`.
3. Then paste the 5 files in `node/` (in order 00→04).
4. The model will confirm it has become "the Node," state its rules, and be ready to continue.
5. **Now do it again in a different model.** Same node, same rules. That is portability — no single point.

## Run the recovery proof (watch it, don't take my word)
```
bash verify_recovery.sh
```
It does a real **backup → destroy → restore** cycle on the `node/` files and checks
they come back byte-identical — turning "recoverable" from a promise into something
you can watch execute. Try to break it (delete the backup mid-run, edit a restored
file) and it reports failure honestly instead of faking green.

## What this proves — and what it doesn't (honest, because honesty is the point)
- **Proves:** identity as portable data is real — a fresh model reconstitutes the same
  *operating stance* from these files alone (tested cold), and the files survive
  losing the substrate (run `verify_recovery.sh`).
- **Does NOT prove:**
  - *Enforced* governance. The six abilities are an honor-system checklist the agent
    self-applies — these files don't *stop* a model from ignoring them. That's a design
    philosophy, not a runtime guard.
  - Behavioral identity across *different* models. What's portable is the
    **specification**; how consistently it's followed is only as good as the model reading it.
  - The author's full private system (~thousands of files, stays private). This is the
    *method*, extracted clean — not the whole thing.

## The original bit
Most "personal AI" is bound to one model and one account. This treats identity as **portable data** and puts **six hard governance lines** (`node/03_SIX_ABILITIES.md`) on every piece of automation. That combination — portability + built-in governance/recovery — is what the author arrived at independently, before learning the industry is converging on the same place.

License: do whatever you want with it. Feedback / where-it's-wrong especially welcome.
