Slide deck outline for a talk on AI-assisted coding, targeting software
engineers with little or no experience in agentic coding.

---

# Under the hood

- Simple chat
- Tool calls
- Context window
- ? Tokens
- Compaction
- Loop
- Customization
    - AGENTS.md
    - Slash commands
    - Skills
    - Subagents

---

# Practices

- Agent docs
    - Map of repo
    - Workflows
        - nix-shell
        - build commands
        - run system
        - run tests
    - Conventions
    - Spread across subdirectories
    - Model starts from scratch: knows/understand nothing
- Reflect on mistakes
    - "Explain why you did the mistake."
    - "What can we do to prevent such mistakes in the future?"
    - "Include that into AGENTS.md"
- Treat prompts as code
- (Brainstorm ->) Plan -> Implement (in phases) (-> Review)

Spec-driven development
- bmad
- speckit
- openspec
- superpowers

- Keep implementation log, design notes
- Ask for alternatives with pros/cons, ordered by priority
- One session per task
- Dump intermediate progress into file, use it as context for next session
- "Ask me questions"
- Meta-prompting to feel-in unknowns and resolve ambiguities
- Progressive disclosure
- Use XML tags
- Learn to rewind/resume session
- Learn to see context usage
- Run asynchronous sessions in parallel
- `git worktree` for parallel sessions
- Vision for understanding and debugging
- Be lazy
- Voice-to-text
- Online chat to save tokens

Expect to invest into infrastructure:
- learning curve
- tools
- prompts
- workflows

- Build "AI muscle", learn its capabilities and limitations
- Start with the strongest model, stick to it for a while
- Models have different personalities, takes time to adjust

When to vibe and when not to?
- one-off personal tools - vibe
- dev tools, reusable tools - skim, well tested with docs
- production - thorough review
- ...

- Unreviewed code is hard to maintain and grow
- It is easier to review things that you know how to do by yourself

Speed-ups:
- less typing
- less web search (models are smart)
- automated exploration
- parallel sessions

Writing code is cheap. Making software is expensive (for now):
- domain knowledge
- design and architecture
- testing and debugging
- organization and communication
- ...

---

# Use Cases

**Things that are nice to have, but not high priority**

- one-off tools
- generate docs
- refactor obsolete code
- tedios tasks that require no creativity, but are time consuming
- ...

**Things that are hard to automate**

- data analysis and aggregation (logs, reports, metrics, email, slack, ...)
- debugging
- code review
- git operations
- ...

**Concrete Examples**

- this slides (tedious)
- online courses (unusual automation)
- vim syntax plugin (creative verification)
- ...

**Refactoring**

1. generate comprehensive high-level spec
2. generate tests verifying spec
3. refactor

**Debugging**

ROS2 Middleware
- Tell me what's wrong
- Here is my set up, run 10 experiments
- Save findings in LOG.md
- Read LOG.md and do 10 more experiments
- Here is the source code of middleware

**Benchmarking**

Similar to debugging.

**Agentic Workflows**

- Encode structured, predictable parts into executable scripts
- Leave AI only the hard-to-automate, unpredictable parts

**Microsoft Cowork, Claude Cowork, Codex App**

- cleaning up calendar
- rescheduling meetings
- reading/editing documents
- making slides/report

---

# Landscape

## Tools

- Claude Code
- OpenCode
- Codex CLI
- Gemini CLI
- Copilot CLI

numtide + nix-env

## Editors

VS Code
- Kilo
- Copilot
- Cursor
- Antigravity

## Cloud

- GitHub Coding Agents
- Google Jules

Safety and Security.

## Models & Providers

Cost, intelligence, subscriptions, 5-hour/weekly limits

- Anthropic: Sonnet 4.6, Opus 4.6
- OpenAI: GPT 5.3 Codex
- Google: Gemini 3 Flash/Pro
- GitHub Copilot
- Z.AI: GLM 5
- MiniMax: MiniMax M2.5

Agregators

- Cursor
- Augment Code
- OpenRouter

Privacy.

## Benchmarks

https://artificialanalysis.ai/
...

---

# Takeaways

- Identify friction point and ask for help
- Autonomous verification
    - Tips and hows
    - Do it first, before implementation
    - If don't know how, ask it
    - Be creative
- Context content and size
    - Why?
        - Scarcity

Main slide + one slide per topic
