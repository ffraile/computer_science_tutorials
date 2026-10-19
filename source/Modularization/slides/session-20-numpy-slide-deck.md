# Unit 04 · Session 20 — NumPy slide deck

## Deck purpose

This deck opens and closes the NumPy lesson. The opening connects familiar Python lists with numerical arrays and guides a three-round paper activity. The rounds deliberately follow the easiest observable operation first:

> transform all values → select positions and regions → describe the array formally

Slides **8, 11 and 14** are the student trace worksheets. They may be printed one per pair or projected and copied into a worksheet.

---

## Slide 1

**Type:** `cover`

**Unit:** Unit 04 · Structured Programming and Data Manipulation in Python

**Session:** 20

**Title:** COMPUTING WITH COMPLETE DATASETS

**Subtitle:** NumPy arrays, vectorised operations and dimensions

**Footer:** Computer Science · EDEM

**Speaker note:** Present the guiding question: “How can a program perform the same numerical operation on a complete dataset without processing every value manually?”

---

## Slide 2

**Type:** `lesson-goals`

**Title:** LESSON GOALS

**Goals:**

1. Create one- and two-dimensional NumPy arrays.
2. Interpret an array's `shape`, `size` and `dtype`.
3. Select elements, rows, columns and rectangular regions.
4. Apply vectorised numerical operations.
5. Distinguish element-wise multiplication from matrix multiplication.
6. Check whether dimensions are compatible before accepting a result.

**Speaker note:** Emphasise that students already know lists, loops, functions and slicing. NumPy changes how a numerical problem can be expressed; it does not replace the need to reason about the data.

---

## Slide 3

**Type:** `learning-path`

**Title:** TODAY'S LEARNING PATH

**Steps:**

1. **Compare** — predict what multiplication means for a list and an array.
2. **Transform** — calibrate every sensor reading with one expression.
3. **Select** — locate elements, rows, columns and regions.
4. **Describe** — interpret dimensions, number of values and data type.
5. **Model** — use arrays in a guided production-planning problem.
6. **Practise** — review code and make justified decisions.

**Speaker note:** Explain that every active-learning round follows the same routine: predict on paper, compare with another student, reveal the code and explain the result.

---

## Slide 4

**Type:** `concept-code-snippet`

**Title:** THE SAME SYMBOL CAN MEAN A DIFFERENT OPERATION

**Concept:** A Python list is a general-purpose ordered collection. A NumPy array is designed for numerical data and numerical operations.

**Code:**

```python
values_list = [1, 2, 3]
values_array = np.array([1, 2, 3])

values_list * 2
values_array * 2
```

**Prediction prompt:** Write both results before they are revealed.

**Expected results:**

```python
[1, 2, 3, 1, 2, 3]
array([2, 4, 6])
```

**Key message:** The list is repeated; every numerical array element is multiplied.

**Speaker note:** Reveal one result at a time. Ask which behaviour is more useful when calibrating measurements.

---

## Slide 5

**Type:** `extended-concept`

**Title:** ACTIVE LEARNING — CALIBRATE A SENSOR GRID

**Scenario:** Three sensors record one value at four consecutive times.

```text
              t0   t1   t2   t3
Sensor 0     508  512  515  520
Sensor 1     503  509  518  524
Sensor 2     510  514  521  528
```

**Working routine:**

1. Predict the requested result with your partner.
2. Record the trace before Python is used.
3. Compare your result during the class discussion.
4. Explain what remained unchanged and what changed.

**Speaker note:** Students work in pairs without assigned roles. The complete grid is a single two-dimensional array named `readings`.

---

## Slide 6

**Type:** `concept-code-snippet`

**Title:** A VECTORISED OPERATION TRANSFORMS EVERY ELEMENT

**Definition:** A **vectorised operation** applies an operation to all relevant elements of an array without writing an explicit Python loop.

**Code:**

```python
calibrated = readings * 0.1 - 50
```

**Interpretation:** For every raw reading:

```text
calibrated value = raw reading × 0.1 − 50
```

**Key message:** The result keeps the arrangement of the original data unless the operation explicitly changes it.

**Speaker note:** Do not discuss `shape` formally yet. Students can use informal language such as “same grid” during the first prediction.

---

## Slide 7

**Type:** `concept-code-snippet`

**Title:** ONE EXPRESSION REPLACES A REPETITIVE LOOP

**Loop version:**

```python
calibrated = []
for sensor_readings in readings:
    calibrated_row = []
    for value in sensor_readings:
        calibrated_row.append(value * 0.1 - 50)
    calibrated.append(calibrated_row)
```

**Vectorised version:**

```python
calibrated = readings * 0.1 - 50
```

**Question:** Which version expresses the numerical rule more directly?

**Speaker note:** The purpose is not to claim that loops are wrong. Loops remain useful when each iteration requires different control flow or several side effects.

---

## Slide 8

**Type:** `code-snippet-code-trace`

**Print:** yes — Round 1 worksheet

**Title:** ROUND 1 — TRANSFORM THE COMPLETE GRID

**Description:** Apply the calibration rule to the selected values. Then predict what the complete result preserves.

**Code:**

```python
calibrated = readings * 0.1 - 50
```

| Position | Raw value | Multiply by `0.1` | Subtract `50` | Calibrated value |
|---|---:|---:|---:|---:|
| Sensor 0, `t0` | 508 | | | |
| Sensor 1, `t2` | 518 | | | |
| Sensor 2, `t3` | 528 | | | |

**Bottom prompts:**

- Will the result still have three rows and four columns?
- Does the expression modify `readings` or create a new array?

**Speaker note:** Expected selected values: `0.8`, `1.8`, `2.8`. The result has the same arrangement and is assigned to a new name. Use this observation to motivate formal array dimensions later.

---

## Slide 9

**Type:** `concept-code-snippet`

**Title:** TWO INDICES LOCATE ONE VALUE

**Definition:** In a two-dimensional array, the first index selects a row and the second index selects a column.

**Syntax:**

```python
array[row_index, column_index]
```

**Example:**

```python
readings[1, 2]   # Sensor 1 at t2 → 518
```

**Key message:** NumPy indices start at `0`, just like list indices.

**Speaker note:** Mark the row and column labels visibly. Students should explain the access path in words before reading the result.

---

## Slide 10

**Type:** `concept-code-snippet`

**Title:** A COLON SELECTS A COMPLETE DIMENSION OR A REGION

**Code:**

```python
readings[0, :]       # complete row
readings[:, 1]       # complete column
readings[1:3, 2:4]  # rectangular region
```

**Rules:**

- `:` means every position in that dimension.
- `start:stop` includes `start` and excludes `stop`.
- Row and column selections are separated by a comma.

**Speaker note:** Connect explicitly to the one-dimensional slicing introduced in Session 18. Multidimensional slicing is the same half-open rule applied independently to rows and columns.

---

## Slide 11

**Type:** `code-snippet-code-trace`

**Print:** yes — Round 2 worksheet

**Title:** ROUND 2 — LOCATE VALUES AND REGIONS

**Description:** Mark the selected cells on the sensor grid and write the expected result.

**Code:**

```python
readings = np.array([
    [508, 512, 515, 520],
    [503, 509, 518, 524],
    [510, 514, 521, 528],
])
```

| Expression | Selected positions | Expected result |
|---|---|---|
| `readings[1, 2]` | | |
| `readings[0, :]` | | |
| `readings[:, 1]` | | |
| `readings[1:3, 2:4]` | | |

**Bottom prompt:** Which expressions return one value, and which return another array?

**Speaker note:** Expected results: `518`; `[508, 512, 515, 520]`; `[512, 509, 514]`; `[[518, 524], [521, 528]]`.

---

## Slide 12

**Type:** `concept-code-snippet`

**Title:** AN ARRAY HAS A SHAPE, A SIZE AND A DATA TYPE

**Definitions:**

- **`shape`**: number of positions along each dimension.
- **`size`**: total number of stored elements.
- **`dtype`**: common numerical data type used to store the elements.

**Code:**

```python
readings.shape
readings.size
readings.dtype
```

**For the sensor grid:**

```text
shape → (3, 4)
size  → 12
dtype → integer type
```

**Speaker note:** Read `(3, 4)` as “three rows by four columns”, not as twelve. Explain that NumPy generally stores array elements using one common data type.

---

## Slide 13

**Type:** `concept-code-snippet`

**Title:** OPERATIONS CAN CHANGE THE DATA TYPE WITHOUT CHANGING THE SHAPE

**Code:**

```python
calibrated = readings * 0.1 - 50

calibrated.shape
calibrated.size
calibrated.dtype
```

**Prediction:**

- Which property remains `(3, 4)`?
- Which property remains `12`?
- Why are the calibrated values no longer stored as integers?

**Key message:** Structure and representation are related but different properties.

**Speaker note:** Multiplication by `0.1` produces decimal values, so the resulting array uses a floating-point type.

---

## Slide 14

**Type:** `code-snippet-code-trace`

**Print:** yes — Round 3 worksheet

**Title:** ROUND 3 — DESCRIBE THE RESULT FORMALLY

**Description:** Compare the original and calibrated arrays using NumPy vocabulary.

**Code:**

```python
calibrated = readings * 0.1 - 50
```

| Array | Number of rows | Number of columns | `shape` | `size` | Expected `dtype` |
|---|---:|---:|---|---:|---|
| `readings` | | | | | |
| `calibrated` | | | | | |

**Bottom prompt:** Complete the statement: the operation changed the __________ but preserved the __________ and the total number of elements.

**Speaker note:** Expected statement: it changed the values and data type but preserved the shape. Accept “representation” in place of data type if the reasoning is correct, then formalise `dtype`.

---

## Slide 15

**Type:** `transition`

**Title:** FROM A SENSOR GRID TO A NUMERICAL MODEL

**Lead:** The same array ideas can represent quantities, resource requirements and production plans.

**Next questions:**

- What is the difference between transforming each element and combining rows with columns?
- What does `@` calculate that `*` does not?
- How can dimensions predict whether an operation is valid?

**Call to action:** Open the follow-along notebook. Continue using **predict → trace → run → compare → explain**.

---

## Slide 16

**Type:** `wrap-up`

**Title:** KEY IDEAS FROM TODAY

**Concepts:**

- Arrays organise numerical values in one or more dimensions.
- `shape`, `size` and `dtype` describe different properties.
- Two indices select one value from a matrix.
- Slices select rows, columns or rectangular regions.
- Vectorised expressions transform complete arrays.
- `*` operates element by element; `@` combines compatible dimensions.
- Dimensions should be checked before trusting a numerical result.

**Speaker note:** Ask students to give one example for each statement rather than reading the list aloud.

---

## Slide 17

**Type:** `certification-question`

**Title:** REVIEW — WHICH OPERATION ANSWERS THE QUESTION?

**Scenario:** An assistant receives a matrix containing the material required per unit of two products and a vector containing the planned quantities. It proposes:

```python
total_materials = requirements * production_plan
```

**Question:** What should you check before accepting the proposal?

**Options:**

A. Whether both variables contain the same number of total values.  
B. Whether the goal is an element-wise calculation or totals obtained by combining each resource row with the production vector.  
C. Whether both variables were originally created from tuples.  
D. Whether the variable names contain the word `array`.

**Speaker note:** Best answer: B. If totals by resource are required and dimensions are compatible, `requirements @ production_plan` expresses the intended model.

---

## Slide 18

**Type:** `certification-question`

**Title:** REVIEW — INTERPRET A SHAPE ERROR

**Scenario:** Python rejects `left @ right`. The arrays have shapes `(3, 2)` and `(4,)`.

**Question:** What is the most useful first explanation?

**Options:**

A. NumPy cannot multiply two arrays with different shapes.  
B. The inner dimensions do not match: the first operand expects a vector with two values, but the second contains four.  
C. Matrix multiplication only accepts integer arrays.  
D. The second array must be converted into a list.

**Speaker note:** Best answer: B. Ask students to propose a compatible right-hand shape without changing the left-hand matrix.

---

## Slide 19

**Type:** `exit-ticket`

**Title:** EXPLAIN BEFORE YOU LEAVE

**Prompts:**

1. State one advantage of a NumPy array for numerical work.
2. Explain the difference between `*` and `@` in one sentence.
3. Write one dimension check you would perform before accepting code proposed by an AI assistant.

**Speaker note:** Students answer individually. Use the responses to identify whether the next lesson needs a short review of dimensions or matrix multiplication.
