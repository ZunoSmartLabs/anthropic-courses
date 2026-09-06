# Claude Certified Developer: Foundations

Working notes and notebooks for the Anthropic Academy **Claude Certified Developer:
Foundations** track.

## Setup

**API key.** One `.env` at the *repo root* serves every course folder — `load_dotenv()`
walks up from the notebook's directory to find it, so there is no per-course copy to keep
in sync:

```bash
# from the repo root
echo 'ANTHROPIC_API_KEY=sk-ant-...' > .env
```

**Environment.** The venv at `../building_with_claude_api/.venv` already has `anthropic`,
`python-dotenv`, and `ipykernel`, so it can run these notebooks as-is. For a fresh one:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install anthropic python-dotenv jupyterlab
```

`.venv/` and `.env` are both covered by the repo `.gitignore` at any depth.

## Running the notebooks

JupyterLab in the browser — no editor required:

```bash
# from the repo root, using whichever venv you picked
./building_with_claude_api/.venv/bin/jupyter lab
```

That opens a file browser at the repo root; navigate into any course folder and the
notebooks run against the root `.env`. Requires `pip install jupyterlab` in that venv.

## Notebook conventions

Same as [`../building_with_claude_api`](../building_with_claude_api): each notebook
opens by loading the environment and building a client, then works top-to-bottom.

```python
from dotenv import load_dotenv
from anthropic import Anthropic

load_dotenv()

client = Anthropic()
model = "claude-sonnet-5"
```

## Structure

A folder per module group, and a notebook per module inside it:

```
claude_certified_developer_foundations/
├── 2_production_grade_prompting_agents_tool_use/  <- module group
│   ├── 0_python_primer.ipynb                     <- prerequisite, no API key needed
│   ├── 2_prompting_craft.ipynb                   <- module
│   ├── 3_extended_thinking.ipynb
│   └── 4_tool_schemas.ipynb
└── 4_production_engineering_evals_security/
    └── 2_evals_and_judges.ipynb
```

Both the group folder and the notebook keep their number from the course. Notebooks are
committed with outputs so the notes stay readable on GitHub.

## Modules

### 2 — Production Grade Prompting, Agents and Tool Use

- `0_python_primer.ipynb` — every piece of Python syntax the other notebooks use,
  from zero. Runs offline, no API key, no cost.
- `2_prompting_craft.ipynb` — diagnosing prompt failures, the four techniques (system
  prompts, XML, few-shot, output constraints), and structured outputs
- `3_extended_thinking.ipynb` — adaptive thinking, `output_config.effort`, thinking
  display, and why `budget_tokens` is gone
- `4_tool_schemas.ipynb` — the tool-use loop, block pairing rules, schema anatomy,
  description-driven tool selection, and MCP

### 4 — Production Engineering, Evals and Security

- `2_evals_and_judges.ipynb` — the design document, eval pipeline, choosing a grading
  method, and building then calibrating an LLM judge

Prior work that already maps onto this certification lives in
`../building_with_claude_api`:

- Accessing Claude with the API — `../building_with_claude_api/1_accessing_claude_with_api`
- Prompt evaluation — `../building_with_claude_api/2_prompt_evaluation`
