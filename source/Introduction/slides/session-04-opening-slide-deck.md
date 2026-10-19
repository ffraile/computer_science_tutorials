---
deck_title: "From instructions to execution"
course: "Computer Science"
unit: "Unit 02 — Python programming fundamentals"
session: "Session 04"
scope: "Opening and active-learning activity"
status: "Proposal — content approval required before Canva production"
language: "English"
canva_template_id: "DAHQqcGQgRo"
---

# Session 04 — Opening slide deck proposal

## Purpose

Activate the idea that a program is an ordered set of precise instructions,
introduce the vocabulary needed to reason about the first Python examples, and
present function calls as instructions that reuse already available behaviour.

Keep this opening conceptual. Detailed use of built-in functions, libraries,
imports, package installation, notebook state and basic errors belongs to the
follow-along and practice blocks.

## Slide 1

type: `cover`

Title: **From instructions to execution**

Guiding question: **How does a computer turn code into action?**

Subtitle: **Introduction to Python programs**

Unit and session: **Unit 02 · Session 04**

Speaker note: Introduce the question without answering it. Explain that the
class will move from precise instructions to their execution in Python.

## Slide 2

type: `lesson-goals`

Title: **By the end of this session, you will be able to**

Goal 1: **Explain how Python executes instructions sequentially and how notebook
state can affect execution.**

Goal 2: **Recognise a function call, identify its arguments and use initial
built-in functions.**

Goal 3: **Install a Python package, import a module or function, and call a
library function.**

Speaker note: Present the goals as observable outcomes. Do not explain the
technical vocabulary in detail yet.

## Slide 3

type: `learning-path`

Title: **Today's learning path**

Activity 1: **Activate — Predict what an ordered set of instructions will do.**

Activity 2: **Recruit — Select function cards, minimise the crew cost and order
the calls needed to prepare a menu.**

Activity 3: **Build — Follow along in a notebook and test built-in and library
functions.**

Activity 4: **Practise — Solve certification-style cases and review short code
examples.**

Activity 5: **Explain — Retrieve the key ideas, record the evidence and commit
your work.**

Speaker note: Make the active structure of the class explicit. The physical
activity will introduce precision, order and arguments before these ideas are
formalised in Python.

## Slide 4

type: `concept-visual`

Title: **The basic architecture of a program**

Definition: **A computer program is an ordered sequence of instructions written
to make a computer perform a task.**

Supporting definition: **An instruction is a precise command that tells the
computer to carry out one operation.**

Example sequence:

1. Read two values.
2. Add the values.
3. Display the result.

visual:

  mode: `generated-image`

  prompt: **Minimal flat educational illustration on a light neutral background.
  Show three large numbered cards connected from left to right by simple arrows.
  Card 1 uses an input icon representing two values, card 2 uses a plus symbol,
  and card 3 uses a monitor/output icon. Use dark navy and cyan-blue accents,
  generous whitespace, no people, no decorative text, and no Python syntax.
  Landscape composition suitable for the image area of a 16:9 teaching slide.**

  alt_text: **Three numbered instruction cards connected in order: read two
  values, add them, and display the result.**

Reflection question: **What could happen if correct instructions were executed
in the wrong order?**

Reveal order:

1. Title.
2. Definition of *computer program*.
3. Definition of *instruction*.
4. Generated visual showing the ordered example.
5. Reflection question.

Speaker note: Emphasise that a collection of individually correct instructions
may still produce an incorrect result when their order is wrong. Do not mention
the sandwich activity yet; use this slide to establish the general architecture
of a program. The visual prompt requires approval before image generation.

## Slide 5

type: `concept-example-question`

Title: **From source code to execution**

Definition: **Source code is the text containing the instructions of a program,
written in a programming language such as Python.**

Supporting definitions:

- **Literal:** A value written directly in the source code, such as `5`,
  `3.14`, or `"Hello"`.
- **Execution:** The process of carrying out the instructions in a program.
- **Sequential execution:** Executing instructions one after another, in the
  order in which they appear.

Example:

```python
print("Hello")
print(5)
```

Example interpretation:

- The source code contains two instructions.
- `"Hello"` and `5` are literals.
- Python executes the first instruction before the second.

Reflection question: **What output do you predict, and in what order will it
appear?**

Reveal order:

1. Title.
2. Definition of *source code*.
3. Definitions of *literal*, *execution* and *sequential execution*.
4. Code example.
5. Reflection question.
6. Example interpretation, after collecting predictions.

Speaker note: Ask for predictions before revealing the interpretation. Students
are not expected to explain the internal implementation of `print()` yet.

## Slide 6

type: `concept-code-snippet`

Title: **Calling functions**

Concept: **A function is a named, reusable block of code that performs a
specific task.**

Supporting concepts:

- **Function call:** An instruction that asks Python to execute a function.
- **Argument:** A value supplied to a function when the function is called.

Syntax:

```python
function_name(argument)
```

Example:

```python
print("Hello world")
```

Example interpretation:

- `print` is the function name.
- `"Hello world"` is a literal passed as an argument.
- Calling the function asks Python to display the argument.

Check for understanding: **What is the function name, and what is the
argument?**

Reveal order:

1. Title and concept definition.
2. Definitions of *function call* and *argument*.
3. General syntax.
4. Concrete example.
5. Check-for-understanding question.
6. Example interpretation, after collecting answers.

Speaker note: Introduce only calls to functions that already exist. Do not
introduce `def`, parameters, return values or student-defined functions.

## Slide 7

type: `extended-concept`

Title: **GALLEY CREW — BUILD THE MENU WITH FUNCTIONS**

Scenario: **You are the chefs aboard an adventure ship. Select the smallest-cost
crew of function cards capable of preparing each menu.**

Challenge:

1. Select the functions your kitchen needs.
2. Add the cost of the selected cards.
3. Write the function calls in execution order.
4. Check that every sandwich matches the menu.
5. Explain why no cheaper valid crew exists.

Key question: **Which functions do we need, and in what order must we call
them?**

Visual assets:

- `source/Introduction/activities/session-04-function-cards/add-bread-card-v1.png`
- `source/Introduction/activities/session-04-function-cards/add-cheese-card-v1.png`
- `source/Introduction/activities/session-04-function-cards/add-ham-card-v1.png`
- `source/Introduction/activities/session-04-function-cards/add-protein-card-v2.png`
- `source/Introduction/activities/session-04-function-cards/add-vegetable-card-v1.png`

Speaker note: Organise students in pairs and distribute one complete card set to
each pair. Explain that the cards are original course characters and that the
cost system is a simplified classroom model.

## Slide 8

type: `concept-visual`

Title: **HOW TO READ A FUNCTION CARD**

Visual: **Display the `add_protein(protein_type)` card at large size and annotate
only its three information areas.**

Annotations:

1. **Function call pattern** — the available operation and its required input.
2. **Cost** — the cost of adding this function to the selected crew.
3. **Description and allowed values** — the function's behaviour and valid
   arguments.

Rules:

- Pay a card's cost once when the function joins the crew.
- A selected function can be called as many times as the menu requires.
- Repeated calls do not require repeated cards.
- The calls must still appear in the correct execution order.
- Every argument must be one of the values allowed by its card.

Definition: **Crew cost is the sum of the costs of the different cards selected.**

Important note: **The cost is a simplified resource model for this activity, not
a real performance measurement of Python.**

Speaker note: Check the distinction between selecting a function and calling it.
Ask whether selecting `add_bread()` once is sufficient when bread must be added
twice.

## Slide 9

type: `extended-concept`

Title: **ROUND 1 — THE CHEESE SANDWICH**

Menu order:

```text
One cheese sandwich
```

Available cards: **All five function cards.**

Pair task:

1. Select the minimum-cost crew.
2. Calculate its total cost.
3. Write the complete sequence of calls.
4. Be ready to explain why the first and last calls are related.

Answer template:

```text
Selected cards: ______________________________
Crew cost: ___________________________________

Call 1: ______________________________________
Call 2: ______________________________________
Call 3: ______________________________________
```

Speaker note: Allow approximately two minutes. Do not reveal whether the same
card may be used twice; direct students back to the rules on Slide 8.

## Slide 10

type: `concept-code-snippet`

Title: **ROUND 1 — ONE FUNCTION, MORE THAN ONE CALL**

Minimum-cost crew:

```text
add_bread() — COST 1
add_cheese() — COST 2
TOTAL COST: 3
```

Execution sequence:

```python
add_bread()
add_cheese()
add_bread()
```

Formalisation:

- A **function** represents reusable behaviour.
- A **function call** asks for that behaviour to be executed now.
- The same function can be called more than once.
- Sequential execution makes the order of the calls meaningful.

Check for understanding: **Why are there two selected cards but three function
calls?**

Speaker note: Build the sandwich physically or reveal one call at a time. Reject
sequences that put both bread calls together, even if they contain the correct
functions.

## Slide 11

type: `extended-concept`

Title: **ROUND 2 — TWO SANDWICHES, A LARGER MENU**

Menu order:

```text
1. Cheese sandwich
2. Club sandwich: ham and cheese
```

Possible strategies:

- select specialised functions such as `add_cheese()` and `add_ham()`;
- select the reusable `add_protein(protein_type)` function.

Pair task:

1. Find two valid crews.
2. Calculate the cost of each crew.
3. Write the calls required by both sandwiches.
4. Select the valid crew with the lower cost.

Question: **Can one function perform different actions without changing its
name?**

Speaker note: Give pairs approximately four minutes. Require two complete
solutions before comparing their costs.

## Slide 12

type: `concept-table`

Title: **ROUND 2 — COMPARE THE TWO CREWS**

| Strategy | Selected cards | Crew cost | Can prepare both sandwiches? |
|---|---|---:|:---:|
| Specialised | `add_bread()`, `add_cheese()`, `add_ham()` | `1 + 2 + 2 = 5` | Yes |
| Parametrised | `add_bread()`, `add_protein(protein_type)` | `1 + 3 = 4` | Yes |

Decision: **The parametrised crew is the lowest-cost valid solution.**

Evidence from the card:

```text
Allowed: ham · cheese · chicken · baked fish
```

Question: **Which two specialised cards can `add_protein(protein_type)` replace
in this menu?**

Speaker note: The saving comes from selecting fewer capabilities under the
activity's cost model. Do not claim that the parametrised function necessarily
runs faster in real Python.

## Slide 13

type: `concept-code-snippet`

Title: **ROUND 2 — ARGUMENTS CUSTOMISE A FUNCTION CALL**

Cheese sandwich:

```python
add_bread()
add_protein("cheese")
add_bread()
```

Club sandwich:

```python
add_bread()
add_protein("ham")
add_protein("cheese")
add_bread()
```

Formalisation:

- An **argument** is a value supplied when a function is called.
- Different arguments allow the same function to produce different actions.
- The value must satisfy the function's expected interface.
- Here, `"ham"` and `"cheese"` are text literals used as arguments.

Check for understanding: **What remains the same in the two
`add_protein(...)` calls, and what changes?**

Speaker note: Avoid defining parameters formally with `def`. Students only need
to identify the function name, parentheses and supplied argument.

## Slide 14

type: `concept-table`

Title: **ROUND 3 — THE ADVENTURE MENU**

| Sandwich | Required filling |
|---|---|
| Garden cheese | cheese, tomato and lettuce |
| Chicken garden | chicken, lettuce and onion |
| Baked fish sandwich | baked fish, tomato and cucumber |

Available cards: **All five function cards.**

Pair task:

1. Select the minimum-cost crew for the complete menu.
2. Calculate the crew cost.
3. Write one ordered sequence for each sandwich.
4. Check every argument against the allowed values printed on the cards.

Constraint: **Every sandwich begins and ends with bread.**

Speaker note: Give pairs approximately five minutes. Ask them to mark which card
validates every argument rather than relying only on culinary intuition.

## Slide 15

type: `extended-concept`

Title: **ROUND 3 — RECORD YOUR SOLUTION**

Crew selection:

```text
Selected cards: __________________________________________
Crew cost: _______________________________________________
Why is it minimal? _______________________________________
```

Call sequences:

```text
GARDEN CHEESE
1. ____________________  2. ____________________
3. ____________________  4. ____________________
5. ____________________

CHICKEN GARDEN
1. ____________________  2. ____________________
3. ____________________  4. ____________________
5. ____________________

BAKED FISH
1. ____________________  2. ____________________
3. ____________________  4. ____________________
5. ____________________
```

Final check: **Underline every argument and connect it to the card that declares
it valid.**

Speaker note: This slide can be printed as an A4 worksheet or copied into a
simple handout. Each sandwich deliberately requires five calls.

## Slide 16

type: `concept-table`

Title: **ROUND 3 — MINIMUM-COST CREW AND VALID CALLS**

Minimum-cost crew:

```text
add_bread() — COST 1
add_protein(protein_type) — COST 3
add_vegetable(vegetable_type) — COST 3
TOTAL COST: 7
```

| Sandwich | Calls between the two `add_bread()` calls |
|---|---|
| Garden cheese | `add_protein("cheese")`, `add_vegetable("tomato")`, `add_vegetable("lettuce")` |
| Chicken garden | `add_protein("chicken")`, `add_vegetable("lettuce")`, `add_vegetable("onion")` |
| Baked fish | `add_protein("baked fish")`, `add_vegetable("tomato")`, `add_vegetable("cucumber")` |

Question: **Why are `add_cheese()` and `add_ham()` unnecessary for this complete
menu?**

Speaker note: Add `add_bread()` before and after each row when reading the full
sequence aloud. Ask different pairs to justify each sandwich.

## Slide 17

type: `code-question`

Title: **FINAL CHECK — WHICH CALLS VIOLATE THE CARDS?**

Code:

```python
add_protein()
add_protein("tomato")
add_vegetable("ham")
add_bread("wholegrain")
add_vegetable
```

Pair task: **For each line, decide whether it is a valid call and identify the
first piece of card evidence that supports your decision.**

Expected diagnoses:

1. Missing required argument.
2. Unsupported protein value.
3. Unsupported vegetable value.
4. `add_bread()` does not accept an argument.
5. The function is named but not called because parentheses are missing.

Speaker note: Reveal one diagnosis at a time. Emphasise that reading an interface
is more reliable than guessing what a function accepts.

## Slide 18

type: `follow-along-transition`

Title: **FROM THE GALLEY CREW TO PYTHON FUNCTIONS**

What the activity established:

- A program executes instructions in a meaningful order.
- A function represents reusable behaviour.
- A call asks Python to execute that behaviour.
- The same function can be called repeatedly.
- Arguments customise a call.
- Valid calls must respect the function's interface.
- Selecting an appropriate available function is a design decision.

Next step: **Open the Session 04 follow-along and apply the same reasoning to
Python built-in and library functions.**

Transfer question: **When you see `max(0b1010, 0xF, 12)`, what corresponds to the
card name, the call and the supplied arguments?**

Speaker note: Use the transfer question to move directly into the notebook. Do
not explain `max()` before students identify its visible structure.

## Activity timing guide

| Segment | Slides | Suggested time |
|---|---:|---:|
| Explain the game and cost model | 7–8 | 3 min |
| Round 1: function reuse and order | 9–10 | 4 min |
| Round 2: arguments and lower-cost crew | 11–13 | 6 min |
| Round 3: compose the complete menu | 14–16 | 7 min |
| Validate calls and transfer to Python | 17–18 | 4 min |

**Estimated activity time:** 24 minutes.

## Scope boundary for the next design stage

Do not add the following concepts to this opening block:

- Notebook kernel state and restart.
- Detailed behaviour of `print()`, `input()`, `type()` and `help()`.
- Built-in functions versus library functions.
- Package installation with `pip`.
- `import`, aliases and `from ... import ...`.
- Syntax and runtime errors.
- Function definitions with `def`, parameters and return values.

These concepts will be sequenced through the follow-along and practice before
the closing slides are drafted.
