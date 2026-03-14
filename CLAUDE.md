# Agentic Coding Slides

Slide deck for a talk on AI-assisted coding, targeting software engineers with
little or no experience in agentic coding.

## Project Structure

- `PLAN.md` — talk outline and content notes
- `SLIDES.md` — Marp slide deck
- `diagrams/` — Mermaid source files (`.mmd`)
- `diagrams/svgs/` — generated SVGs (do not edit by hand)

## Conventions

- Consult `PLAN.md` for the talk structure and content direction
- Keep slides concise — prefer visuals and bullet points over walls of text
- Use Mermaid for diagrams (see Diagrams section below)
- Use plain, jargon-light language appropriate for the target audience

## Diagrams

- Write Mermaid diagrams in `diagrams/*.mmd`
- Generate SVGs with mermaid-cli (available via `shell.nix`):
  `nix-shell --run "mmdc -i diagrams/<name>.mmd -o diagrams/svgs/<name>.svg"`
- Embed in slides as `![alt](diagrams/svgs/<name>.svg)`
- Always regenerate SVGs after editing `.mmd` sources

## Debugging Slides

To visually check how a slide renders, use `scripts/render-slide`:
- `nix-shell --run "scripts/render-slide --index 5 SLIDES.md"`
- `nix-shell --run "scripts/render-slide --search 'keyword' SLIDES.md"`

Then read the output image path to inspect the result.

Render one slide at a time — do not batch multiple renders into a single command.
