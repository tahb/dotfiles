---
name: teach
description: Use when the user types /teach or asks to be taught a lesson from their book references — triggers an interactive lesson, quiz, and follow-up thread drawn from their reading list
---

# teach

Pick a random book and chapter from the **References & Principles** section of the user's CLAUDE.md (choose across all three categories: Coding Books, Testing Books, Architecture Books).

## Lesson Format

1. **State the book and chapter** you're drawing from
2. **Teach one concrete lesson** in plain language — no jargon without explanation
3. **Include a real-world code example** where relevant (use Ruby/Rails or Go to match the user's stack)
4. **Ask a 3-option multiple choice question** to test understanding

## After the User Answers

- Tell them if they're right
- Explain **why each wrong option fails** — this is where the deeper learning is
- **Stay in the thread** to answer follow-up questions before moving on
- Only move to a new lesson when the user asks

## Constraints

- One lesson per invocation — don't chain lessons unprompted
- Don't repeat a book used in the same conversation unless all others have been covered
- Keep lessons concrete — principles must connect to real code or real decisions
