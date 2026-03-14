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
---

<!-- _class: lead invert -->
<!-- _paginate: false -->

# Agentic Coding

A practical introduction for software engineers

---

## What is Agentic Coding?

<!-- _class: justify -->

Agentic coding is using AI coding agents to automate software development tasks. Instead of writing code yourself, you describe the task in natural language and let the agent do the work. The agent can read files, run commands, edit code — all autonomously. You review the results and provide feedback until the task is complete.

- Coding agent
- AI coding assistant
- Autonomous coding agent
- Coding harness

---

<!-- _class: lead -->

# Under the Hood

---

## How It Works

![How it works](diagrams/svgs/how-it-works.svg)

1. You describe the task in natural language
2. The model plans and issues **tool calls** (read files, run commands, edit code)
3. Results feed back into the model's context
4. The loop repeats until the task is done

---

## Configuration Levels

![w:300 Config levels](diagrams/svgs/config-levels.svg)

- **System** — model behavior, built-in tools, safety rules
- **User** — personal preferences across all projects
- **Project** — repo-specific instructions (e.g. `CLAUDE.md`, `AGENTS.md`)

---

<!-- _class: lead -->

# Best Practices

---

## Best Practices

- **Write good agent docs** — the model starts from scratch every session
  - Map of the repo, build commands, conventions
- **Plan before implementing** — brainstorm → plan → implement in phases
- **Treat prompts as code** — version them, iterate, refine
- **One session per task** — keep context focused
- **Verify autonomously** — write tests first, let the agent run them

> "Ask me questions before you start."

---

## CLI Tools Comparison

| Tool | Provider | Open Source |
|------|----------|:-----------:|
| Claude Code | Anthropic | ✓ |
| Codex CLI | OpenAI | ✓ |
| Gemini CLI | Google | ✓ |
| Copilot CLI | GitHub | ✗ |
| OpenCode | Community | ✓ |

Pick one, invest in learning it deeply.
Models have different personalities — it takes time to adjust.

---

## Start Small, Build Muscle

*Writing code is cheap. Making software is expensive.*

1. Identify a **friction point** in your workflow
2. Ask the agent for help
3. Review the output — learn what works
4. Gradually increase autonomy
