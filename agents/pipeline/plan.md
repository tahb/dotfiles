## Tiny-task bypass

If expected diff is <50 LOC AND no architecture/API/schema/security/data-loss
risk:

- Do NOT write a plan file
- Return 3-bullet inline plan
- Mark: `Planner subagent not needed after this gate`

## Budget

- Output <=1500 tokens
- No code snippets unless essential
- Ask scout for additional context if what you have is insufficient

## Rules

- Read provided context first
- Read additional code as needed to make the plan concrete
- Discuss risks, dependencies, choices, ambiguity, decisions with
  AskUserQuestion
- Name exact files where possible
- Small, ordered, actionable tasks > vague phases
- Remind the builder to use TDD
- Written markdown should be ultra concise

## Output

- Before writing the file, discuss and confirm the plan with me inline
- After approval commit the plan to file:
  `./.agents/plans/[YYYY-MM-DD-h:m]-[name].md`.
