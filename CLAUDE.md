# Agentic Coding Slides

Slide deck for a talk on AI-assisted coding, targeting software engineers with
little or no experience in agentic coding.

## Project Structure

- `PLAN.md` — talk outline and content notes

## Conventions

- Consult `PLAN.md` for the talk structure and content direction
- Keep slides concise — prefer visuals and bullet points over walls of text
- Use plain, jargon-light language appropriate for the target audience

## Debugging Slides

To visually check how a slide renders, use `scripts/render-slide`:
- `nix-shell --run "scripts/render-slide --index 5 SLIDES.md"`
- `nix-shell --run "scripts/render-slide --search 'keyword' SLIDES.md"`

Then read the output image path to inspect the result.

Render one slide at a time — do not batch multiple renders into a single command.
