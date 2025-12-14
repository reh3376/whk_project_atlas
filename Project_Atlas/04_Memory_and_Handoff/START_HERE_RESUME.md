# Resume protocol (START HERE)

This project is meant to survive long gaps. Assume any chat assistant has zero memory.

## The 30-second resume method

1. Open `04_Memory_and_Handoff/PROJECT_STATE.md`
2. Read the **Current Phase**, **Current Sprint**, and **Next 3 tasks**
2a. If you are using Linear, open the matching Project link under **Linear Links** in `PROJECT_STATE.md`.
3. Open the corresponding phase’s `Start_Here.md`
4. Run `Tools/make_context_packet.py` to refresh `CONTEXT_PACKET.md`
5. Paste the contents of `CONTEXT_PACKET.md` into your new chat/session

## The rule

If it matters, write it down:
- Decisions → `DECISION_JOURNAL.md` (+ ADRs in the phase deliverables)
- Progress → `PROJECT_STATE.md`
- Open questions → `OPEN_THREADS.md`
- Daily notes → `WORK_LOG.md`

## Don’t leak secrets

Never store credentials, tokens, or internal IP in this repo.

## “AI handoff” practice

At the end of every sprint:
- update `PROJECT_STATE.md`
- add a “Sprint Summary” section to `WORK_LOG.md`
- ensure key decisions are in ADRs and the decision journal
- regenerate `CONTEXT_PACKET.md`