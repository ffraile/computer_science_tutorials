# Unit 02 · Session 06 — Opening and active-learning slides

## Slide 1
type: cover

Title: FROM VALUES TO DECISIONS
Subtitle: How can a program choose an action from current data?
Footer: Unit 02 · Session 06

## Slide 2
type: lesson-goals

Title: BY THE END OF THIS SESSION, YOU WILL

1. Evaluate comparisons and explain Boolean results.
2. Use `if`, `if-else` and `if-elif-else` to select actions.
3. Combine conditions and test boundary cases.

## Slide 3
type: learning-path

Title: TODAY'S LEARNING PATH

- ACTIVATE — Track inputs and program state.
- COMPARE — Produce Boolean values.
- DECIDE — Select a branch with `if`.
- COMBINE — Use `and`, `or` and `not`.
- PRIORITISE — Test multi-branch decisions.
- BUILD — Transfer the trace to Python.

## Slide 4
type: extended-concept

Title: PAIR TRACE: INPUTS → CONDITIONS → OUTPUT

For every projected case:

1. Record the input values.
2. Evaluate each comparison.
3. Evaluate the complete condition.
4. Select the branch that executes.
5. Record the final program state or output.

Use `True` and `False`. Do not run Python yet. Agree on one row per case.

Key idea: the trace table connects program state before and after a decision.

## Slide 5
type: concept-code-snippet

Title: COMPARISONS PRODUCE BOOLEAN VALUES

Concept: A comparison evaluates two operands and produces a Boolean value: `True` or `False`.

Supporting concepts:

- Operand: a value, literal or variable used in the comparison.
- Comparison operator: a symbol such as `>`, `<`, `>=`, `<=`, `==` or `!=`.

Syntax: `left_operand operator right_operand`

Example:

```python
temperature = 8.1
high_temperature = temperature > 8
```

## Slide 6
type: concept-table

Title: ROUND 1 — TRACE A COMPARISON

Description: Evaluate `temperature > 8` and record the Boolean result stored in `high_temperature`.

| Temperature | `temperature > 8` | `high_temperature` |
|---:|:---:|:---:|
| `7.5` | `False` | `False` |
| `7.9` | `False` | `False` |
| `8.0` | `False` | `False` |
| `8.1` | `True` | `True` |
| `9.0` | `True` | `True` |

## Slide 7
type: concept-code-snippet

Title: IF SELECTS AN OPTIONAL BRANCH

Concept: An `if` statement executes its indented block only when its condition is `True`. If the condition is `False`, that block is skipped.

Syntax:

```python
if condition:
    instruction
```

Example:

```python
status = "Normal"

if temperature > 8:
    status = "High temperature"
```

## Slide 8
type: concept-table

Title: ROUND 2 — TRACE AN IF STATEMENT

Description: Start every case with `status = "Normal"`. Evaluate the condition and record the final value of `status`.

| Temperature | `temperature > 8` | Final `status` |
|---:|:---:|---|
| `7.5` | `False` | `Normal` |
| `7.9` | `False` | `Normal` |
| `8.0` | `False` | `Normal` |
| `8.1` | `True` | `High temperature` |
| `9.0` | `True` | `High temperature` |

## Slide 9
type: concept-code-snippet

Title: AND REQUIRES BOTH CONDITIONS

Concept: The Boolean operator `and` produces `True` only when both of its operands are `True`.

Syntax: `condition_1 and condition_2`

Example:

```python
valid_temperature = (
    temperature >= 2
    and temperature <= 8
)
```

## Slide 10
type: concept-table

Title: ROUND 3A — TRACE AND

Description: Evaluate both comparisons first. Then combine their Boolean results with `and`.

| Temperature | Comparisons `>= 2 \| <= 8` | `valid_temperature` |
|---:|:---:|:---:|
| `1.9` | `False \| True` | `False` |
| `2.0` | `True \| True` | `True` |
| `5.0` | `True \| True` | `True` |
| `8.0` | `True \| True` | `True` |
| `8.1` | `True \| False` | `False` |

## Slide 11
type: concept-code-snippet

Title: IF-ELSE SELECTS ONE OF TWO BRANCHES

Concept: An `if-else` statement selects exactly one of two branches. The `if` block runs when the condition is `True`; otherwise, the `else` block runs.

Syntax:

```python
if condition:
    instruction_when_true
else:
    instruction_when_false
```

Example:

```python
if valid_temperature:
    status = "Normal"
else:
    status = "Temperature alert"
```

## Slide 12
type: concept-table

Title: ROUND 3B — TRACE IF-ELSE

Description: Use `valid_temperature` to select one branch and record the final value of `status`.

| Temperature | `valid_temperature` | Final `status` |
|---:|:---:|---|
| `1.9` | `False` | `Temperature alert` |
| `2.0` | `True` | `Normal` |
| `5.0` | `True` | `Normal` |
| `8.0` | `True` | `Normal` |
| `8.1` | `False` | `Temperature alert` |

## Slide 13
type: concept-code-snippet

Title: OR COMBINES ALTERNATIVE CONDITIONS

Concept: The Boolean operator `or` produces `True` when at least one of its operands is `True`. It produces `False` only when both operands are `False`.

Syntax: `condition_1 or condition_2`

Example:

```python
temperature_alert = (
    temperature < 2
    or temperature > 8
)
```

## Slide 14
type: concept-table

Title: ROUND 4A — TRACE OR

Description: Evaluate both comparisons first. Then combine their Boolean results with `or`.

| Temperature | Comparisons `< 2 \| > 8` | `temperature_alert` |
|---:|:---:|:---:|
| `1.9` | `True \| False` | `True` |
| `2.0` | `False \| False` | `False` |
| `5.0` | `False \| False` | `False` |
| `8.0` | `False \| False` | `False` |
| `8.1` | `False \| True` | `True` |

## Slide 15
type: concept-code-snippet

Title: NOT REVERSES A BOOLEAN VALUE

Concept: The Boolean operator `not` reverses one Boolean value: `True` becomes `False`, and `False` becomes `True`.

Syntax: `not condition`

Example:

```python
same_alert = not valid_temperature
```

## Slide 16
type: concept-table

Title: ROUND 4B — TRACE NOT

Description: Start from `valid_temperature` and apply `not` to obtain `same_alert`.

| Temperature | `valid_temperature` | `same_alert` |
|---:|:---:|:---:|
| `1.9` | `False` | `True` |
| `2.0` | `True` | `False` |
| `5.0` | `True` | `False` |
| `8.0` | `True` | `False` |
| `8.1` | `False` | `True` |

## Slide 17
type: concept-code-snippet

Title: IF-ELIF-ELSE SELECTS THE FIRST TRUE BRANCH

Concept: An `if-elif-else` statement evaluates conditions from top to bottom. Only the first branch whose condition is `True` executes. The `else` branch runs only if every previous condition is `False`.

Syntax:

```python
if condition_1:
    first_action
elif condition_2:
    second_action
else:
    default_action
```

Example:

```python
if sensor_error:
    status = "Sensor unavailable"
elif temperature_alert:
    status = "Temperature alert"
elif door_open:
    status = "Check the door"
else:
    status = "Normal operation"
```

## Slide 18
type: concept-table

Title: ROUND 5 — TRACE IF-ELIF-ELSE

Description: Evaluate the conditions from top to bottom. Record the first true condition and the resulting `status`.

| Sensor inputs: temperature / connection / door | First true condition | Final `status` |
|---|---|---|
| `5.0 / offline / closed` | `sensor_error` | `Sensor unavailable` |
| `9.0 / online / open` | `temperature_alert` | `Temperature alert` |
| `5.0 / online / open` | `door_open` | `Check the door` |
| `9.0 / offline / open` | `sensor_error` | `Sensor unavailable` |
| `5.0 / online / closed` | `else` | `Normal operation` |

## Slide 19
type: follow-along-transition

Title: FROM TRACE TABLE TO PYTHON

- Open today's follow-along notebook.
- Predict each Boolean result.
- Execute the conditional statement.
- Compare the output with the manual trace.
- Test the boundary values.
- Explain why the selected branch executes.
