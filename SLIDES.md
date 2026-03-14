---
marp: true
theme: default
paginate: true
style: |
  section {
    font-family: 'Arial', sans-serif;
    padding-top: 120px;
    align-content: flex-start;
  }
  section h2 {
    position: absolute;
    top: 40px;
    left: 60px;
  }
  section.lead {
    align-content: center;
  }
  section.lead h1 {
    font-size: 2.5em;
    text-align: center;
  }
  section.lead p {
    text-align: center;
    font-size: 1.2em;
    color: #666;
  }
  section.invert {
    background: #1a1a2e;
    color: #eee;
  }
  section.split {
    display: flex;
    flex-direction: column;
  }
  section.justify p {
    text-align: justify;
  }
  table {
    font-size: 0.85em;
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
---

<!-- _class: lead invert -->
<!-- _paginate: false -->

# Agentic Coding

---

## What is Agentic Coding?

<!-- _class: justify -->

Agentic coding is using AI coding agents to automate software development tasks. Instead of writing code yourself, you describe the task in natural language and let the agent do the work. The agent can read files, run commands, edit code — all autonomously. You review the results and provide feedback until the task is complete.

- Coding agent
- Coding harness
- Coding assistant

---

<style scoped>
section { text-align: center; align-content: center; padding: 0 60px; }
</style>

![w:500](diagrams/claude.png) ![w:500](diagrams/opencode.png)

---

# Agenda

- Under The Hood
- Best Practices
- Use Cases
- Models & Providers
- Tooling

---

<!-- _class: lead -->

# Under the Hood

---

<style scoped>
section {
  display: flex;
  flex-direction: row;
  gap: 20px;
  padding: 120px 80px 80px;
}
pre {
  flex: 1;
  font-size: 0.55em;
  margin: 0;
  height: 480px;
}
</style>

## Simple Chat

```
curl openrouter.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d '{
    "model": "google/gemini-2.5-flash",
    "messages": [
      {
        "role": "user",
        "content": "Hi there."
      }
    ]
  }'
```

```
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hi! How can I help you today?"
      }
    }
  ]
}
```

---

<style scoped>
section {
  display: flex;
  flex-direction: row;
  gap: 20px;
  padding: 120px 80px 80px;
}
pre {
  flex: 1;
  font-size: 0.55em;
  margin: 0;
  height: 480px;
}
.hl {
  font-weight: bold;
}
</style>

## Simple Chat

<pre><code>curl openrouter.ai/api/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY" \
  -d '{
    "model": "google/gemini-2.5-flash",
    "messages": [
      {
        "role": "user",
        "content": "Hi there."
      },
      <span class="hl">{
        "role": "assistant",
        "content": "Hi! How can I help you today?"
      },
      {
        "role": "user",
        "content": "What is the capital of France?"
      }</span>
    ]
  }'</code></pre>

```
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "It is Paris."
      }
    }
  ]
}
```

---

<style scoped>
section {
  display: flex;
  flex-direction: row;
  gap: 20px;
  padding: 120px 80px 80px;
}
pre {
  flex: 1;
  font-size: 0.55em;
  margin: 0;
  height: 480px;
}
.hl {
  font-weight: bold;
}
</style>

## Tool Use

<pre><code>{
  <span class="hl">"tools": [
    {
      "name": "shell",
      "description": "Run a shell command.",
      "parameters": {
        "command": { "type": "string" }
      }
    }
  ],</span>
  "messages": [
    {
      "role": "user",
      "content": "List files in current directory."
    }
  ]
}</code></pre>

```
{
  "finish_reason": "tool_calls",
  "message": {
    "tool_calls": [
      {
        "name": "shell",
        "arguments": { "command": "ls -F" }
      }
    ]
  }
}
```

---

<style scoped>
section {
  display: flex;
  flex-direction: row;
  gap: 20px;
  padding: 120px 80px 80px;
}
pre {
  flex: 1;
  font-size: 0.55em;
  margin: 0;
  height: 480px;
}
.hl {
  font-weight: bold;
}
</style>

## Tool Use

<pre><code>{
  "tools": [ ... ],
  "messages": [
    {
      "role": "user",
      "content": "List files in current directory."
    },
    <span class="hl">{
      "role": "assistant",
      "tool_calls": [
        {
          "name": "shell",
          "arguments": { "command": "ls -F" }
        }
      ]
    },
    {
      "role": "tool",
      "content": "CLAUDE.md PLAN.md SLIDES.md"
    }</span>
  ]
}</code></pre>

```
{
  "finish_reason": "stop",
  "message": {
    "role": "assistant",
    "content": "
      Here is content of current directory:
      - CLAUDE.md
      - PLAN.md
      - SLIDES.md
    "
  }
}
```

---

<style scoped>
section {
  display: flex;
  flex-direction: row;
  gap: 20px;
  padding: 120px 80px 80px;
}
pre {
  flex: 1;
  font-size: 0.55em;
  margin: 0;
  height: 480px;
}
.hl {
  font-weight: bold;
}
</style>

## System Instructions

<pre><code>{
  "messages": [
    <span class="hl">{
      "role": "system",
      "content": "
        You are a helpful assistant,
        called Sauron.
      "
    },</span>
    {
      "role": "user",
      "content": "Who are you?"
    }
  ]
}</code></pre>

```
{
  "message": {
    "role": "assistant",
    "content": "
      I am Sauron, your helpful assistant.
      One does not simply walk into Mordor,
      but one can simply ask me anything.
    "
  }
}
```

---

## Agentic Loop

```python
while True:
    history.append(user_prompt())
    while True:
        response = inference(history, tools, system_instructions)
        history.append(response)
        if not response.get("tool_calls"): break
        for tool_call in msg["tool_calls"]:
            tool_result = execute(tool_call)
            history.append(tool_result)
```

- Get user input
- Run inference with full context
- Execute tool calls until no more are issued

---

## Context

- System instructions
- Tool definitions
- Complete conversation history

**Context Window**

Amount of information the model can consider at once.
Limited by model architecture, 200k - 1M tokens.

**Context Rot**

As conversation history grows, model starts losing track of earlier information, leading to mistakes and hallucinations.

---

## System Instructions

- Coding harness: personality, behavior, rules, safety constraints
- `~/.opencode/AGENTS.md` — personal preferences across all projects
- `AGENTS.md` — repo-specific instructions:
  - dev commands
  - conventions
  - coding style
  - rough repo map

**Keep small. Update only when model consistently makes mistakes.**

---

## Slash Commands

Some tools can be invoked directly from the user prompt using slash commands.

- `/clear` — start new session
- `/rewind` — undo recent messages to recover context (has shortcut)
- `/resume` — resume an old session
- `/context` — context usage and token breakdown (status line)
- `/plan` — enable Plan Mode (has shortcut)

---

## Slash Commands

Reusable prompts can be defined as custom slash commands.

- `.claude/commands/<command>.md`

Example: `/commit`

```markdown
---
description: Commit modified files
---

- Extract diff of modified files
- Propose commit message
- Ask for confirmation
- Stage and commit changes
```

---

<!-- _class: "" -->
<style scoped>
pre { font-size: 0.75em; }
</style>

## Skills

Instructions for specific tasks that can be invoked by the model when relevant.

```
.claude/skills/pptx/
  SKILL.md
  references/
    pptx-format.md
  scripts/
    md_to_pptx.py
```

`SKILL.md` appended to the context only when model decides it is relevant.

```markdown
---
description: Use this skill whenever you need to create `.pptx`
---

PPTX format is described in `references/pptx-format.md`.
Use `scripts/md_to_pptx.py` to convert markdown to PPTX.
```

---

## Skills

- https://github.com/anthropics/skills - `skill-creator`
- https://github.com/obra/superpowers

---

## Subagents

Subagents are separate agentic sessions with their own context.

The main agent can spawn subagents for specific subtasks, then read their results.

Examples:
- Codebase exploration
- Execution of multiple smaller tasks
- Reading documentation
- Summarizing long outputs

Use `Task` tool to spawn one-off subagents.
Store reusable subagents in `.claude/agents/<agent>.md`

---

<!-- _class: lead -->

# Best Practices

---

## Keep Sessions Focused

- Model performs best when focused on one task at a time
- One task per session
- Limit scope
- Dump intermediate progress into file, use it as context for next session

---

## Plan -> Implement

- State problem and ask agent to generate an implementation plan
- Iterate on the plan until it looks good
- Once the plan is solid, ask to execute it
- Use **Plan Mode** or dump as PLAN.md

---

## Plan -> Implement

- **Brainstorm** high-level specification -> SPEC.md
- **Design** architecture and components -> DESIGN.md
- **Task breakdown** into smaller steps -> TASKS.md
- **Implement** each task in a separate session
  - Reflect on challenges and deviations from the original plan in LOG.md
- **Review** final implementation

---

## Spec-Driven Development

Structured workflow for building complex features.

- https://github.com/bmad-code-org/BMAD-METHOD
- https://github.com/github/spec-kit
- https://github.com/Fission-AI/OpenSpec

---

## Compaction

Replace conversation history with summary of the conversation.

- Triggered automatically when context usage gets high
- Triggered manually through `/compact`
- Lossy — details are lost, only summaries remain
- Resets the model's "working memory"

---

## Maintain Design Notes

What:
- Design decisions, motivation
- Constraints
- Challenges, lessons learned
- Non-obvious algorithms

Where:
- `docs/design-notes.md`
- Inline comments
- Commit messages

---

## Reflect on Mistakes

- "Explain why you did that mistake."
- "What can we do to prevent such mistakes in the future?"
- "Include it in AGENTS.md/comments/docs."

---

## "Ask me questions"

Make sure agent fully understands the task, your preferences, scope and constraints before starting the task.

"List all unknowns and ambiguities. Ask me questions to clarify them. Each question should have multiple choices, with pros/cons and your recommendation. Ask one question at a time, wait for my answer before asking the next question."

---

## Ask for Alternatives

- Don't just ask "What is the best way to do X?"
- Often, there are multiple valid approaches with different trade-offs
- It may surprise you with solutions you haven't thought of
- You may learn about new techniques and tools
- Ask for pros/cons and recommendations to make informed decisions

---

## Automate Verification

- When starting a task, think how agent can verify its own work
- If don't know, ask the agent to come up with automated verification strategy
- Manual verification is time-consuming and error-prone
- Unit tests for components
- End-to-end tests for overall feature

---

## To Vibe or Not to Vibe?

> If you don't know how your code works, you can't make it work reliably

- One-off, personal tools - run once and forget
- Dev tools, shared scripts - review critical parts; tests and docs for everything else
- Production - thorough review, tests and docs

It is easier to review code that you would write yourself
Limit scope to amount of code you are comfortable reviewing

---

## It Feels Slow

> "But I can write this code myself in 5 minutes!"

Expect to be slow at the beginning
Speed will come with practice (precise prompts) and infrastructure (docs, tests, tools)

- Less typing
- Less web search
- Automated exploration
  - Codebase comprehension
  - Brainstorming
  - Debugging
  - Experimenting
- Parallel sessions

---

## Learning Curve

- Start with the strongest model, stick to it for a while
- Learn model's capabilities and limitations
- Models have different "personalities", takes time to adjust
- "Be lazy" to understand limitations
- Rewind failed prompts, to keep context clean
- Reword failed prompts, to learn how to communicate better with the model
- Empathize with the agent

---

## Visual Reasoning

- Use visual reasoning to understand and debug complex issues
- Teach your agent to retrieve and interpret screenshots, visual data

---

<!-- _class: lead -->

# Use Cases

---

## Things that are nice to have, but not high priority

- One-off tools
- Docs
- Refactoring obsolete code
- Tedios tasks that require no creativity, but are time consuming

---

## Things that are hard to automate

- Data analysis and aggregation (logs, reports, metrics, email, slack, ...)
- Debugging
- Code review
- git operations

---

## Refactoring

1. Generate comprehensive high-level spec
2. Generate tests verifying each item of spec
3. Refactor
4. Review

---

## Benchmarking

1. "Propose 10 implementations of this algorithm and benchmark them against different payloads"
2. "Save findings in LOG.md"
3. "Read LOG.md and benchmark 10 more implementations"
4. ...

---

## Debugging

Debugging ROS2 Middleware.

1. "Tell me what's wrong"
2. "Here is my set up, run 10 experiments"
3. "Save findings in LOG.md"
4. "Read LOG.md and do 10 more experiments"
...
5. "Here is the source code of middleware"
6. "Create patch"

---

## Autonomous Research

https://github.com/karpathy/autoresearch

---

## Microsoft Copilot Cowork, Claude Cowork, Codex App

- Cleaning up calendar
- Rescheduling meetings
- Reading/editing documents
- Making slides/report

---

## Agentic Workflows

- Encode structured, predictable parts into executable scripts
- Leave AI only the hard-to-automate, unpredictable parts

---

<!-- _class: lead -->

# Models & Providers

---

## Providers

- Anthropic: Opus 4.6, Sonnet 4.6
- OpenAI: GPT 5.4, GPT 5.3 Codex
- Google: Gemini 3 Flash/Pro
- Z.AI: GLM 5
- MiniMax: MiniMax M2.5

Tiered subscriptions: Free, Entry, Pro, Enterprise
5-hour/daily/weekly quotas
Subscription tokens are N times cheaper than pay-as-you-go

---

## Aggregators

- Cursor
- Augment Code
- GitHub Copilot
- OpenRouter

---

## My Recommendations

- Beginner: OpenAI 20$
- Anthropic 100$
- OpenAI or Anthropic 200$
- Cheap: GLM-5 30$ or Gemini Flash 20$

---

## Benchmarks

https://artificialanalysis.ai/

- Intelligence
- Cost
- Token efficiency
- Hallucination rate

---

<!-- _class: lead -->

# Tooling

---

## Tools

- Claude Code
- OpenCode
- Codex CLI
- Gemini CLI
- Copilot CLI
- many more...

https://github.com/numtide/llm-agents.nix

---

## Editors

VS Code Extensions
- Claude Code
- Codex
- Kilo
- Copilot

Cursor
Antigravity

---

# Takeaways

- Identify friction points and ask "How can you help me?"
- Know your context
  - Wrong context
  - Context rot
- Automate verification
- Read generated code
