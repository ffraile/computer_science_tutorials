# Unit 04 · Session 17 — Opening and active-learning slides

## Slide 1
type: cover

Title: FROM CALLING TO CREATING FUNCTIONS
Subtitle: How can we divide a program into reusable and testable operations?
Footer: Structured programming and functions · Unit 04 · Session 17

## Slide 2
type: lesson-goals

Title: BY THE END OF THIS SESSION, YOU WILL

1. Explain how a function gives one part of a program a clear responsibility.
2. Define and call functions using parameters, arguments and returned values.
3. Decompose a problem into small functions and test their behaviour.

## Slide 3
type: learning-path

Title: TODAY'S LEARNING PATH

- **ACTIVATE** — Recover what we already know about function calls.
- **DISCOVER** — Infer the contract of an unknown operation.
- **CONSTRUCT** — Build and formalise a function definition.
- **BUILD** — Decompose an event budget into collaborating functions.
- **PRACTISE** — Implement, review and test small functions.
- **REVIEW** — Explain the key decisions behind a structured program.

## Slide 4
type: extended-concept

Title: TODAY'S ACTIVITY — DESIGN A FUNCTION

Scenario: An event organiser repeatedly calculates the cost associated with attendees. We need to identify the operation, describe its contract and finally construct its Python definition.

Work in pairs:

1. Study the evidence before proposing Python code.
2. Identify the inputs, process and output.
3. Predict the result of each call.
4. Use descriptive names for the operation and its data.
5. Explain every decision before the answer is revealed.

Key idea: first understand the responsibility of an operation; then express it as a function.

## Slide 5
type: concept-table

Title: ROUND 1 — DISCOVER THE OPERATION

Context: An event-management team needs to estimate one component of an event budget. The two inputs represent the number of attendees and the cost associated with each attendee. They use a *machine* with the following behavior:

| Input_1  | Input_2 | Output |
|---:|---:|---:|
| `20` | `12` | `240` |
| `35` | `10` |  350|
| `0` | `15` | `0` |

Fill in the following form to describe the machine :

- Name: 
- Receives:
- Does:
- Produces:

Speaker note: Do not show Python syntax yet. The context and meaning of the inputs are provided, but pairs must still infer the multiplication and formulate the operation's responsibility.

## Slide 6
type: concept-visual

Title: A FUNCTION HAS A CONTRACT

Concept: A function is a named block of instructions with a defined responsibility. Its contract describes the inputs it receives, the task it performs and the result it produces.

Definitions:

- **Function:** a reusable block of instructions that performs a defined task.
- **Input:** information provided to the function.
- **Process:** instructions applied by the function.
- **Output:** the result produced by the function.
- **Responsibility:** the specific task assigned to the function.

Visual:

```text
INPUTS                    FUNCTION                         OUTPUT
20 attendees ───────▶  calculate attendee cost  ───────▶  €240
€12 per attendee          multiply both values
```

Key contract:

```text
Receives: number of attendees and cost per attendee
Does: multiplies both values
Produces: total attendee cost
```

Visual direction: Use three simple rounded blocks connected horizontally by arrows. Highlight the central function block with the template accent colour.

## Slide 7
type: code-trace

Title: ROUND 2 — USE THE SAME FUNCTION

Description: The same named operation can be called with different arguments. Identify the two arguments and predict the returned value.

Code:

```python
calculate_attendee_cost(20, 12)
calculate_attendee_cost(35, 10)
calculate_attendee_cost(0, 15)
```

Trace table:

| Function call | First argument | Second argument | Expected result |
|---|---:|---:|---:|
| `calculate_attendee_cost(20, 12)` |  |  |  |
| `calculate_attendee_cost(35, 10)` |  |  |  |
| `calculate_attendee_cost(0, 15)` |  |  |  |

Speaker note: Ask why the order of the arguments matters and which part of every call remains unchanged.

## Slide 8
type: concept-code-snippet

Title: ARGUMENTS PROVIDE VALUES TO A CALL

Concept: A function call asks a function to execute. Arguments are the concrete values supplied between parentheses when the function is called.

Supporting concepts:

- **Function call:** an expression that asks a function to execute.
- **Argument:** a concrete value supplied in a function call.
- **Return value:** the result delivered by the function after the call.
- **Order:** each positional argument is associated with its corresponding input by position.

Syntax:

```python
function_name(argument_1, argument_2)
```

Example:

```python
calculate_attendee_cost(20, 12)
```

Interpretation:

```text
20 → number of attendees
12 → cost per attendee
returned value → 240
```

## Slide 9
type: concept-code-snippet

Title: ROUND 3 — CONSTRUCT THE DEFINITION

Concept: These fragments describe the operation used in the previous rounds, but they are not yet a valid Python function.

Task:

1. Put the fragments in the correct order.
2. Apply the required indentation.
3. Identify the function name and its inputs.
4. Identify the instruction that delivers the result.

Unordered fragments:

```python
    return attendee_cost

def calculate_attendee_cost(attendees, cost_per_attendee):

    attendee_cost = attendees * cost_per_attendee
```

Speaker note: Give pairs time to agree on the order before revealing the valid definition. Do not introduce `print()` versus `return` in this activity.

## Slide 10
type: concept-code-snippet

Title: A DEFINITION DESCRIBES THE FUNCTION

Concept: A function definition specifies its name, parameters and indented body. The `return` statement delivers a result to the code that made the call.

Supporting concepts:

- **Definition:** the code that describes a function's behaviour.
- **Parameter:** a name in the definition that represents an input.
- **Body:** the indented instructions executed during a call.
- **Return statement:** the instruction that delivers a result to the caller.

Syntax:

```python
def function_name(parameter_1, parameter_2):
    instructions
    return result
```

Example:

```python
def calculate_attendee_cost(attendees, cost_per_attendee):
    attendee_cost = attendees * cost_per_attendee
    return attendee_cost
```

## Slide 11
type: code-trace

Title: ROUND 3 — TRACE THE DEFINED FUNCTION

Description: Connect the arguments in the call with the parameters in the definition and follow the value returned to the caller.

Code:

```python
def calculate_attendee_cost(attendees, cost_per_attendee):
    attendee_cost = attendees * cost_per_attendee
    return attendee_cost

result = calculate_attendee_cost(35, 10)
```

Trace table:

| Step | `attendees` | `cost_per_attendee` | `attendee_cost` | Value delivered |
|---|---:|---:|---:|---:|
| Arguments assigned to parameters |  |  | — | — |
| Function body executed |  |  |  | — |
| `return` executed |  |  |  |  |
| Value stored in `result` | — | — | — |  |

Speaker note: Reveal one row at a time. Emphasise that the parameter names belong to the definition, while `35` and `10` are arguments in this particular call.

## Slide 12
type: follow-along-transition

Title: FROM ONE FUNCTION TO A STRUCTURED PROGRAM

- Open today's follow-along notebook.
- Compare displaying a value with returning it.
- Inspect variables created inside a function.
- Divide an event budget into functions with separate responsibilities.
- Combine their returned values.
- Test normal cases and boundary cases.
- Reuse the functions with lists, loops and a plot.

Key transfer question: What should each function know, do and return?

## Slide 13
type: extended-concept

Title: WRAP-UP — FUNCTIONS GIVE PROGRAMS STRUCTURE

A well-designed function has a clear contract:

- **Responsibility** — one specific task.
- **Parameters** — the information the function expects.
- **Arguments** — the concrete values supplied in a call.
- **Local state** — temporary variables used inside the function.
- **Return value** — the result delivered to the caller.

Key idea: the main program coordinates the work; each function should know only what it needs, perform one understandable operation and return a useful result.

## Slide 14
type: concept-code-snippet

Title: REVIEW TOGETHER — PRINT OR RETURN?

Concept: A logistics notebook must calculate a route cost and then compare it with a budget. An AI assistant proposes this function:

```python
def calculate_route_cost(distance, price_per_km):
    cost = distance * price_per_km
    print(cost)

route_cost = calculate_route_cost(120, 0.45)
within_budget = route_cost <= 60
```

Question: Why can the comparison not use the calculated cost?

Choose the best correction:

A. Add another `print()` statement.  
B. Replace `print(cost)` with `return cost`.  
C. Move the budget comparison inside every cost function.  
D. Copy the displayed value into a new variable.

Speaker note: Ask students to predict the value stored in `route_cost` before revealing the answer. Connect the result explicitly with `None`.

## Slide 15
type: concept-code-snippet

Title: REVIEW TOGETHER — DEFAULTS AND NAMED ARGUMENTS

Concept: Default parameter values represent common choices. Named arguments make an exceptional choice explicit while preserving the remaining defaults.

Definition:

```python
def prepare_export(
    file_name,
    include_header=True,
    compress=False
):
    ...
```

Question: We want to export `sales.csv`, keep the default header and enable compression. Which call communicates that intention most clearly?

A. `prepare_export("sales.csv", True, True)`  
B. `prepare_export("sales.csv", compress=True)`  
C. `prepare_export(compress=True, "sales.csv")`  
D. `prepare_export("sales.csv", include_header=False)`

Speaker note: Ask students to identify the required parameter, both defaults and the named argument before choosing an answer.

## Slide 16
type: extended-concept

Title: BEFORE YOU LEAVE — EXPLAIN YOUR DESIGN

Choose one function from today's notebooks and answer:

1. What is its single responsibility?
2. Which parameters define its inputs?
3. Does any parameter have a sensible default value?
4. What does the function return, and where is that value used?
5. Which local variable remains inside the function?
6. Which normal and boundary tests support your confidence?

Exit sentence:

> This function receives ..., does ..., and returns ... so that ...
