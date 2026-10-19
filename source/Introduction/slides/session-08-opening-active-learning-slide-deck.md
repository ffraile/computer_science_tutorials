# Unit 02 · Session 08 — Opening and active-learning slides

## Slide 1
type: cover

Title: FROM READINGS TO SERIES
Subtitle: How can a program process multiple values and preserve every result?
Footer: Iterables, repetition, lists and visualisation · Unit 02 · Session 08

## Slide 2
type: lesson-goals

Title: BY THE END OF THIS SESSION, YOU WILL

1. Trace a `for` loop and explain how it visits an iterable.
2. Transform values and preserve the results in a list.
3. Use indices to locate relevant values and represent an ordered series.

## Slide 3
type: learning-path

Title: TODAY'S LEARNING PATH

- **ACTIVATE** — Review basic concepts: lists and for loops.
- **EXPERIMENT** — Transform sensor readings, locate anomalies and plot the series.
- **BUILD** — Dive into details by solving practical use cases in a notebook.
- **PRACTISE** — Answer questions and analyse applications.
- **REVIEW** — Review key concepts and lessons learnt.


## Slide 4
type: extended-concept

Title: TODAY'S ACTIVITY

Scenario: An Arduino has captured four successive analogue sensor readings. We need to inspect every reading, calibrate it, identify values that require attention and represent the resulting series.

Work in pairs:

1. Read the code before using the trace table.
2. Complete one row for each iteration or plotted value.
3. Track the current value and the complete program state.
4. Predict before each result is revealed.
5. Explain what changes and what remains constant.

Key idea: repetition applies the same instructions to successive values while the program state evolves.

## Slide 5
type: concept-code-snippet

Title: A LIST IS AN ITERABLE

Concept: An iterable is an object that provides one value at a time during repetition.

Supporting concepts:

- **List:** an ordered collection of values.
- **Element:** one value contained in a list.
- **Iterable:** an object that can be iterated over in a for loop.
- **For loop:** used to repeat a block of codes a number of times
- **Iteration:** A repetition of the indented block in a for loop
- **Loop variable:** the variable that receives the current element during each iteration.

Syntax:

```python
for item in iterable:
    indented_block
```

Example:

```python
raw_readings = [510, 518, 525, 530]

for reading in raw_readings:
    print(reading)
```

## Slide 6
type: code-trace

Title: ROUND 1 — TRACE THE READINGS

Description: Execute the loop once for each list element. Record the value assigned to `reading` and the printed output.

Code:

```python
raw_readings = [510, 518, 525, 530]

for reading in raw_readings:
    print(reading)
```

Trace table:

| Iteration | `reading` | Output |
|---:|---:|---:|
| `1` | ` ` | `` |
| `2` | ` ` | ` ` |
| `3` | ` ` | ` ` |
| `4` | ` ` | ` ` |



## Slide 7
type: concept-code-snippet

Title: APPEND 

Concept: A new list can preserve the result produced during every iteration.

Supporting concepts:

- **Empty list:** a list created with no elements using `[]`.
- **Processed value:** the result of applying a transformation to the current element.
- **append()**: a list method that adds one value at the end of a list.

Syntax:

```python
output_list = []

for item in input_list:
    processed_value = transformation
    output_list.append(processed_value)
```

Example:

```python
calibrated_readings = []

for reading in raw_readings:
    calibrated = reading - 4
    calibrated_readings.append(calibrated)
```

## Slide 8
type: code-trace

Title: ROUND 2 — TRACE CALIBRATION AND APPEND

Description: Apply the calibration offset and record the complete list state after each call to `append()`.

Code:

```python
calibrated_readings = []

for reading in raw_readings:
    calibrated = reading - 4
    calibrated_readings.append(calibrated)
```

Trace table:

| `reading` | `calibrated` | `calibrated_readings` |
|---:|---:|---|
| `510` | ` ` |  |
| `518` | ` ` |  |
| `525` | ` ` |  |
| `530` | ` ` |  |

Speaker note: Reveal one row at a time. Ask which objects change and why the input list remains unchanged.

## Slide 9
type: concept-code-snippet

Title: INDICES IDENTIFY POSITIONS

Concept: An index identifies the position of an element. A loop can generate every valid index and use it to access the corresponding value.

Supporting concepts:

- **Index:** the position of an element in an ordered collection.
- **Zero-based indexing:** the first element has index `0`.
- **`len(values)`:** returns the number of elements in a collection.
- **`range(stop)`:** generates integers from `0` up to, but not including, `stop`.
- **`values[index]`:** retrieves the element stored at a particular position.

Syntax:

```python
for index in range(len(values)):
    value = values[index]
```

Example:

```python
alert_indices = []

for index in range(len(calibrated_readings)):
    reading = calibrated_readings[index]

    if reading > 520:
        alert_indices.append(index)
```

## Slide 10
type: code-trace

Title: ROUND 3 — LOCATE PROBLEMATIC READINGS

Description: Generate each valid index, retrieve its reading and preserve the index only when the known condition is `True`.

Code:

```python
alert_indices = []

for index in range(len(calibrated_readings)):
    reading = calibrated_readings[index]

    if reading > 520:
        alert_indices.append(index)
```

Trace table:

| `index` | `reading` | `alert_indices` |
|---:|---:|---|
| `0` |  |  |
| `1` |  |  |
| `2` |  |  |
| `3` |  |  |

Speaker note: Reveal one row at a time. Ask pairs to distinguish the index from the value stored at that position and explain why preserving the index can be useful.

## Slide 11
type: concept-code-snippet

Title: A PLOT REPRESENTS AN ORDERED SERIES

Concept: A graph can use the generated indices as horizontal coordinates and the corresponding list values as vertical coordinates.

Supporting concepts:

- Sample position: the zero-based position of a reading in the list.
- Series: an ordered collection of related values.
- `plt.plot()`: a library function that represents the values as connected points.

Syntax:

```python
plt.plot(x_values, y_values)
```

Example:

```python
import matplotlib.pyplot as plt

sample_indices = range(len(calibrated_readings))

plt.plot(sample_indices, calibrated_readings, marker="o")
plt.xlabel("Sample")
plt.ylabel("Calibrated reading")
plt.show()
```

## Slide 12
type: code-trace

Title: ROUND 4 — TRACE THE PLOTTED SERIES

Description: Match every list position and calibrated value with the point that Matplotlib places on the graph.

Code:

```python
sample_indices = range(len(calibrated_readings))
plt.plot(sample_indices, calibrated_readings, marker="o")
```

Trace table:

| List position | Calibrated value | Plotted point |
|---:|---:|:---:|
| `0` | `506` | `(0, 506)` |
| `1` | `514` | `(1, 514)` |
| `2` | `521` | `(2, 521)` |
| `3` | `526` | `(3, 526)` |

Speaker note: Ask pairs to sketch the four points before revealing the table. Emphasise that Python positions start at zero.

## Slide 13
type: follow-along-transition

Title: FROM SENSOR DATA TO A SAVINGS PLAN

- Open today's follow-along notebook.
- Use `range()` to represent successive months.
- Update the balance during every iteration.
- Preserve each balance with `append()`.
- Plot the resulting series.
- Change the inputs and predict the graph before executing.

Key transfer question: Which parts of the repetition pattern stay the same when the application changes?
