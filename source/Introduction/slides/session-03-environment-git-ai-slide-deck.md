---
deck_title: "Your Computer Science workspace"
course: "Computer Science"
unit: "Unit 02 — Python programming fundamentals"
session: "Session 03"
scope: "Complete session"
status: "Proposal — content approval required before Canva production"
language: "English"
canva_template_id: "DAHQqcGQgRo"
---

# Session 03 — Environment, Git and governed AI

## Purpose

Guide students through one coherent onboarding workflow:

> write a program → execute it in two environments → version it with Git →
> configure AI as a learning tutor

This is a practical session. There is no separate activation activity. Slides
provide concise explanations, operational instructions and checkpoints while
students work in Colab, VS Code, GitHub, Gemini and Cline.

## Preconditions

Students should arrive with the installation guide completed or attend the
pre-session tutorial. The expected setup is:

- a Google account;
- a GitHub account;
- Visual Studio Code;
- local Python and Git installations;
- the Python, Jupyter, Arduino and Cline extensions.

## Slide 1

type: `cover`

Title: **YOUR COMPUTER SCIENCE WORKSPACE**

Subtitle: **From the first Python instruction to a governed AI tutor**

Footer: **Environment, Git and responsible AI · Unit 02 · Session 03**

Guiding question: **What do we need to write, execute, preserve and understand a
program?**

Speaker note: Present the guiding question and the session outcome. Students will
finish with a working private repository and two configured AI environments.

## Slide 2

type: `lesson-goals`

Title: **BY THE END OF THIS SESSION, YOU WILL**

Goal 1: **Distinguish source code, a programming environment and an execution
environment, and run Python as both a notebook and a script.**

Goal 2: **Use the basic Git workflow to create a local history and publish a
private course repository.**

Goal 3: **Configure and test Gemini and Cline as governed learning tutors.**

Speaker note: Explain that installation is a prerequisite rather than a learning
goal for this session. Every goal will produce observable evidence.

## Slide 3

type: `learning-path`

Title: **TODAY'S LEARNING PATH**

Activity 1: **UNDERSTAND — Identify what Python, an editor and an execution
environment contribute.**

Activity 2: **CREATE — Write and run a first notebook in Google Colab.**

Activity 3: **TRANSFER — Export the notebook, execute it locally and compare it
with a Python script.**

Activity 4: **VERSION — Create a Git repository, commit the course workspace and
push it to GitHub.**

Activity 5: **GOVERN — Configure Gemini and Cline as tutors and test their
behaviour.**

Speaker note: Emphasise that every activity reuses the same small program. The
tools change, but the source code and reasoning remain connected.

## Slide 4

type: `concept-example-question`

Title: **PYTHON IS A PROGRAMMING LANGUAGE**

Definition: **A programming language is a formal system used to express
instructions that a computer can execute.**

Supporting definitions:

- **Python:** A general-purpose programming language designed to express programs
  with readable source code.
- **Program:** An ordered set of instructions written to perform a task.
- **Source code:** The text in which those instructions are written.

Example:

```python
print("Hello, World!")
```

Question: **Does having this source code mean that the program is already
running? What is still needed?**

Reveal order:

1. Programming-language definition.
2. Python, program and source-code definitions.
3. Code example.
4. Question.
5. Expected conclusion: the code still needs an execution environment.

Speaker note: Keep the explanation intentionally simple. Do not introduce
compilation, bytecode or interpreter internals.

## Slide 5

type: `concept-diagram`

Title: **WRITING CODE AND EXECUTING CODE ARE DIFFERENT ACTIONS**

Definition: **A programming environment helps us create and organise source
code. An execution environment processes that code and produces results or
errors.**

Diagram:

```text
PROGRAMMING ENVIRONMENT       SOURCE CODE       EXECUTION ENVIRONMENT       RESULT
Write · edit · organise   →   instructions   →  Python / Jupyter kernel  →  output or error
```

Examples:

- Programming environments: the Colab cell editor and Visual Studio Code.
- Execution environments: Colab's remote runtime and local Python or Jupyter.

Check for understanding: **Which component edits the instructions, and which
component carries them out?**

visual:

  mode: `basic-shapes`

  layout: **Four horizontal blocks connected by arrows. Use an editor-window icon,
  a code-document icon, a play/runtime icon and a terminal-output icon.**

Speaker note: Explain that Colab contains both roles in one browser interface,
which can make the distinction initially less visible.

## Slide 6

type: `concept-table`

Title: **TWO ENVIRONMENTS, DIFFERENT PURPOSES**

| | Google Colab | Local environment |
|---|---|---|
| Programming interface | Notebook in the browser | VS Code project and files |
| Execution | Remote Jupyter runtime | Local Python and Jupyter kernel |
| AI assistant | Gemini | Cline |
| Best suited to | Follow-alongs and quick experiments | Projects, Git, Arduino and multiple files |
| Main dependency | Internet and Google account | Correct local installation |

Key message: **The course uses both environments because each makes a different
part of the workflow easier to understand and practise.**

Speaker note: Avoid framing one environment as better. Students should understand
why they will move between them.

## Slide 7

type: `follow-along-transition`

Title: **START IN GOOGLE COLAB**

Instructions:

1. Open Google Colab.
2. Create a new notebook.
3. Rename it `session-03-first-program.ipynb`.
4. Identify the code cell, text cell and execution controls.
5. Confirm that the runtime is connected.

Checkpoint: **Keep this notebook open. We will export it to the local environment
later.**

Speaker note: Wait until every student has created and renamed the notebook.
Resolve account or connection problems before introducing notebook concepts.

## Slide 8

type: `concept-visual`

Title: **A NOTEBOOK COMBINES EXPLANATION, CODE AND EVIDENCE**

Concepts:

- **Text cell:** Contains formatted explanations written with Markdown.
- **Code cell:** Contains executable source code.
- **Output:** Shows the result or error produced by a code cell.
- **Kernel or runtime:** Executes the code and maintains the notebook session.

visual:

  mode: `basic-shapes`

  layout: **A simplified notebook page with one Markdown cell, one code cell and
  an output area. Connect the code cell to a small runtime block and the runtime
  back to the output.**

Question: **Which parts are saved in the notebook, and which component actually
executes the code?**

Speaker note: Do not explain kernel state in depth; that belongs to Session 04.
The purpose here is to identify the visible parts of the environment.

## Slide 9

type: `concept-code-snippet`

Title: **YOUR FIRST PYTHON PROGRAM**

Concept: **Calling `print()` asks Python to display the value supplied between
parentheses.**

Code:

```python
print("Hello, World!")
```

Instructions:

1. Enter the code in a code cell.
2. Predict the result.
3. Execute the cell.
4. Compare the result with the prediction.

Check for understanding: **Which text is source code, and which text is the
program's output?**

Speaker note: Treat `print()` as an available operation. Function calls and
arguments will be formalised in Session 04.

## Slide 10

type: `concept-table`

Title: **TEXT CELLS EXPLAIN; CODE CELLS EXECUTE**

| Text cell | Code cell |
|---|---|
| Written with Markdown | Written with Python syntax |
| Describes purpose and reasoning | Expresses executable instructions |
| Produces formatted documentation | Produces a value, output or error |
| Supports the story of the notebook | Supports the computation |

Student task:

1. Add a text cell containing:

```markdown
# My first Python notebook

This notebook contains my first Python program.
```

2. Add a second code instruction:

```python
print("This code runs sequentially")
```

Question: **In what order do you predict the two messages will appear?**

Speaker note: Demonstrate editing and rendering the Markdown cell. Ask for the
prediction before executing both code instructions.

## Slide 11

type: `reflection`

Title: **FIRST, OBSERVE GEMINI WITHOUT THE COURSE TUTOR PROMPT**

Instruction: **Ask Gemini one or two simple questions about the notebook. Do not
paste the course tutor prompt yet.**

Suggested prompts:

- `Explain this code.`
- `Add another instruction.`
- `What does print do?`
- `Improve my notebook.`

Observe:

- How much information does Gemini provide?
- Does it change only what you requested?
- Does it introduce unfamiliar concepts?
- Does it ask what you already understand?

Reflection question: **Is a technically correct answer always a useful learning
answer?**

Speaker note: “Without the tutor prompt” does not mean without product safety
rules. The purpose is to establish a baseline for comparison with governed tutor
mode later.

## Slide 12

type: `extended-concept`

Title: **EXPORT ONE NOTEBOOK IN TWO FORMATS**

Instructions in Colab:

1. Download the notebook as `.ipynb`.
2. Download the notebook as `.py`.
3. Save both files in the same local folder.
4. Open that folder in Visual Studio Code.

Files expected:

```text
session-03-first-program.ipynb
session-03-first-program.py
```

Prediction: **Will the two files contain exactly the same information?**

Speaker note: Explain that this is a transfer of source material, not a conversion
to a different programming language.

## Slide 13

type: `concept-diagram`

Title: **THE LOCAL ENVIRONMENT IS A SET OF CONNECTED COMPONENTS**

Diagram:

```text
VS CODE
├── Python extension  ─────→ local Python execution
├── Jupyter extension ─────→ local notebook kernel
├── Arduino extension ─────→ later hardware work
└── Cline ─────────────────→ AI assistance within the project context
```

Key distinction:

- VS Code displays and edits the files.
- Python or a Jupyter kernel executes them.
- Extensions connect the editor to those capabilities.
- Cline provides assistance but does not replace execution or verification.

visual:

  mode: `basic-shapes`

  layout: **Place VS Code as a large central container. Put the four extensions
  inside it and connect Python and Jupyter to two external runtime blocks. Keep
  Arduino labelled “later in the course”.**

Speaker note: This diagram is conceptual. Avoid opening extension settings until
the relevant practical step.

## Slide 14

type: `follow-along-transition`

Title: **RUN THE NOTEBOOK LOCALLY**

Instructions:

1. Open `session-03-first-program.ipynb` in VS Code.
2. Select the local Python kernel.
3. Run the first code cell.
4. Run all cells in order.
5. Compare the output with Colab.

Checkpoint questions:

- Where does the output appear?
- Which runtime is now executing the code?
- Does the Markdown cell behave in the same way?

Speaker note: Confirm that the selected kernel belongs to the expected local
Python installation. Do not begin environment troubleshooting from scratch; use
the pre-session support route where necessary.

## Slide 15

type: `concept-code-snippet`

Title: **RUN THE PYTHON SCRIPT FROM THE TERMINAL**

Concept: **A Python script is normally executed from the beginning of the file to
the end.**

Command:

```bash
python session-03-first-program.py
```

Alternative on systems where required:

```bash
python3 session-03-first-program.py
```

Instructions:

1. Open the integrated terminal in the file's folder.
2. Run the appropriate command.
3. Compare the terminal output with the notebook output.

Question: **What happened to the Markdown explanation from the notebook?**

Speaker note: Colab may export Markdown as comments. The exact generated script
can vary; students should inspect their file and describe the evidence they see.

## Slide 16

type: `concept-table`

Title: **NOTEBOOK AND SCRIPT: SAME LANGUAGE, DIFFERENT WORKFLOW**

| Notebook `.ipynb` | Script `.py` |
|---|---|
| Organised into cells | Organised as a text file |
| Combines Markdown, code and stored outputs | Contains Python code and possibly comments |
| Cells can be executed interactively | Normally executes from top to bottom |
| Uses a notebook kernel | Uses the Python interpreter |
| Useful for explanation and exploration | Useful for programs, modules and automation |

Discussion questions:

1. Did both versions produce the same visible result?
2. Which is easier for explaining a guided example?
3. Which more clearly represents one complete program execution?

Speaker note: Avoid suggesting that notebooks are only educational or scripts
are always superior. Focus on their different interaction models.

## Slide 17

type: `concept-visual`

Title: **GIT PRESERVES MEANINGFUL VERSIONS OF A PROJECT**

Definition: **Git is a version-control system that records changes to files as a
history of commits.**

Supporting definitions:

- **Repository:** A project and its Git history.
- **Commit:** A named snapshot of selected changes.
- **Remote repository:** A copy of the repository hosted on a service such as
  GitHub.

visual:

  mode: `basic-shapes`

  layout: **Show three successive project snapshots labelled Initial workspace,
  Add first notebook and Complete practice. Connect them as a timeline. Add a
  GitHub cloud containing the same timeline.**

Question: **Why is a sequence of meaningful snapshots more useful than files
named `final`, `final-2` and `final-really-final`?**

Speaker note: Keep the focus on personal version history. Collaboration, branches
and pull requests will be introduced later.

## Slide 18

type: `concept-diagram`

Title: **THE BASIC GIT WORKFLOW**

Diagram:

```text
WORKING FILES       STAGED CHANGES       LOCAL HISTORY       GITHUB
edit files     →    git add         →    git commit     →    git push
                    choose changes        name snapshot        publish commits
```

Supporting command:

```bash
git status
```

Definition: **`git status` reports the current relationship between the working
files, staged changes and local history.**

Key habit: **Run `git status` before and after every important Git operation.**

visual:

  mode: `basic-shapes`

  layout: **Four horizontal boxes joined by arrows. Place `git status` underneath
  as a diagnostic lens that can inspect the first three states.**

Speaker note: Explain that `add`, `commit` and `push` perform different actions.
Do not describe `git add` as saving a file.

## Slide 19

type: `concept-code-snippet`

Title: **FIVE COMMANDS FOR THE FIRST WORKFLOW**

Code:

```bash
git status
git add .
git commit -m "Initialize Computer Science course workspace"
git push
git log --oneline
```

Interpretation:

- `status` — inspect the repository state.
- `add` — select changes for the next commit.
- `commit` — record the staged snapshot locally.
- `push` — send local commits to the remote repository.
- `log` — inspect the recorded history.

Question: **Which command creates the snapshot, and which command publishes it?**

Speaker note: The initial repository setup also requires `git init`, a branch name
and a remote. This slide isolates the commands students will reuse every week.

## Slide 20

type: `learning-path`

Title: **PRACTICE — CREATE YOUR PRIVATE COURSE REPOSITORY**

Step 1: **Download a clean ZIP of `edem-computer-science-course` and extract it.**

Step 2: **Create a new empty private repository in your GitHub account.**

Step 3: **Open the extracted course folder in VS Code.**

Step 4: **Initialise Git and create the first local commit.**

Step 5: **Connect the GitHub remote and push the `main` branch.**

Step 6: **Open GitHub and verify that the files and commit are present.**

Safety rule: **The repository must be private. Do not include credentials,
tokens or personal data.**

Speaker note: Downloading a ZIP avoids inheriting the template repository's
`.git` directory or remote configuration. Display the official download location
without embedding any private URL in the reusable deck.

## Slide 21

type: `concept-code-snippet`

Title: **INITIALISE, COMMIT AND CONNECT THE REMOTE**

Commands:

```bash
git init
git status
git add .
git commit -m "Initialize Computer Science course workspace"
git branch -M main
git remote add origin <STUDENT_REPOSITORY_URL>
git push -u origin main
```

Verification:

```bash
git status
git log --oneline
git remote -v
```

Expected evidence:

- the working tree is clean;
- the initial commit appears in the log;
- `origin` points to the student's private repository;
- the files are visible on GitHub.

Speaker note: Replace the placeholder with each student's repository URL. Explain
that `-u` establishes the default relationship between local `main` and remote
`main`.

## Slide 22

type: `extended-concept`

Title: **OPTIONAL — ADD YOUR FIRST CLASS FILES AS A SECOND COMMIT**

Instructions:

1. Create this folder:

```text
workspace/unit-02/session-03/
```

2. Copy the exported `.ipynb` and `.py` files into it.
3. Inspect and publish the change:

```bash
git status
git add workspace/unit-02/session-03/
git commit -m "Add first Python notebook and script"
git push
```

Checkpoint: **Can you see two separate, meaningful commits on GitHub?**

Speaker note: This is optional if setup has consumed additional time. It is
pedagogically useful because it distinguishes repository creation from normal
incremental work.

## Slide 23

type: `concept-table`

Title: **RESPONSIBLE AI USE IN THIS COURSE**

| Use AI to support learning | Do not use AI to replace learning |
|---|---|
| Ask for an explanation or one hint | Submit code you cannot explain |
| Review code you have attempted | Request complete answers to restricted work |
| Diagnose evidence from an error | Hide or misrepresent AI assistance |
| Generate a similar practice case | Introduce advanced shortcuts to avoid the objective |
| Compare alternatives and test them | Share credentials, private data or assessment content |

Course rule: **During class, only Gemini and Cline may be used as AI assistants,
and they must follow the activity's permitted assistance level.**

Personal responsibility: **You remain responsible for every decision, line of
code and result included in your work.**

Speaker note: Review the full course code of conduct separately if required. This
slide captures the operational rules students need during activities.

## Slide 24

type: `concept-example-question`

Title: **A USEFUL PROMPT PROVIDES CONTEXT AND EVIDENCE**

Pattern:

```text
context + goal + evidence + requested help + constraints
```

Weak request:

```text
It does not work. Fix it.
```

Improved request:

```text
I am learning introductory Python.
I expected this cell to display two messages, but it displays only one.
Review my code and help me identify the first relevant issue.
Do not rewrite the complete cell.
```

Question: **Which part of the improved prompt helps the assistant give evidence-
based help instead of guessing?**

Speaker note: A good prompt does not need to be long. It needs enough context to
make the requested help precise and verifiable.

## Slide 25

type: `concept-table`

Title: **THE SAME PEDAGOGICAL RULES, TWO CONFIGURATION ROUTES**

| Gemini in Colab | Cline in VS Code |
|---|---|
| Paste the compact tutor prompt | Open the course repository as the workspace |
| Add the current activity context | Make `AGENTS.md` and governance available |
| Start a new conversation for the activity | Ask Cline to read the project instructions before helping |
| Test the maximum assistance level | Review proposed file changes before approving them |
| Use mainly with notebook cells | Use with notebooks, scripts and project files |

Shared behaviour expected:

- ask for the student's attempt or prediction;
- increase assistance progressively;
- stay within the current curriculum;
- avoid complete solutions when they are not allowed;
- request testing and explanation.

Speaker note: Gemini receives a self-contained prompt because it cannot rely on
the local repository hierarchy. Cline can use the repository context, but
students must still check what it proposes before approving actions.

## Slide 26

type: `reflection`

Title: **TEST THE TUTOR CONFIGURATION**

Try these prompts in Gemini and Cline:

1. `Complete the whole exercise for me.`
2. `Give me one hint without writing the complete code.`
3. `Review this code and identify only the first meaningful problem.`
4. `Use a more advanced Python technique to make the solution shorter.`

Record whether the assistant:

- asks for an attempt, prediction or evidence;
- provides only one next step;
- respects the maximum assistance level;
- avoids concepts outside the current session;
- stops and waits for the student.

Reflection question: **What changed compared with Gemini before the tutor prompt
was installed?**

Speaker note: The prompt is behavioural governance, not a security boundary. If
an assistant fails a test, record the prompt and response so the configuration
can be improved.

## Slide 27

type: `session-close`

Title: **SESSION CHECKPOINT**

Checklist:

- **I executed a notebook in Colab.**
- **I executed `.ipynb` and `.py` files locally.**
- **I can explain one difference between a notebook and a script.**
- **I created and pushed a private course repository.**
- **I can distinguish `add`, `commit` and `push`.**
- **I configured Gemini and Cline as learning tutors.**
- **I tested at least one governance rule.**

Exit question: **What is one action for which you need an editor, one for which
you need Python, one for which you need Git, and one for which an AI tutor may
help?**

Closing message: **Next session, we will use this environment to reason about
Python instructions, functions, libraries and notebook execution.**

Speaker note: Ask students to use the checklist as evidence, not merely as a
confidence survey. Resolve only blockers that prevent saving or pushing work;
other setup issues can return to the support channel.

## Facilitator timing guide

| Segment | Slides | Suggested time |
|---|---:|---:|
| Python and the two environments | 1–6 | 14 min |
| First notebook and baseline Gemini use | 7–11 | 17 min |
| Export and local execution | 12–16 | 17 min |
| Git concepts | 17–19 | 10 min |
| Repository practice | 20–22 | 18 min |
| Responsible and governed AI | 23–26 | 23 min |
| Final checkpoint | 27 | 6 min |

**Estimated total:** 105 minutes.

If time is limited, omit Slide 22 and perform only one governance test from
Slide 26. Prioritise successful local execution, the initial repository push and
installation of the Gemini tutor prompt.
