# Unit 04 · Session 18 — Opening and active-learning slides

## Deck purpose

This block combines the opening of the lesson with a four-round active-learning activity. Students first choose suitable containers without seeing the Python names. The remaining rounds follow the sequence:

> formalise the concept → predict on paper → trace together → explain the result

### Printing plan

Print only slides **6, 9, 11 and 13**, one copy per pair. These pages are the student worksheets and must keep their tables blank. All other slides are projected.

---

## Slide 1

**Type:** `cover`

**Unit:** Unit 04 · Structured Programming and Data Manipulation in Python

**Session:** 18

**Title:** CHOOSING AND TRANSFORMING DATA STRUCTURES

**Subtitle:** Lists, tuples, dictionaries, slicing and list comprehensions

**Footer:** Computer Science · EDEM

**Speaker note:** Present the guiding question without naming every structure yet: “How should a program organise data so that it is clear, safe and easy to process?”

---

## Slide 2

**Type:** `lesson-goals`

**Title:** LESSON GOALS

**Goals:**

1. Choose a list, tuple or dictionary according to how the data will be used.
2. Select part of an ordered collection with indexing and slicing.
3. Access and update values in dictionaries and nested structures.
4. Transform and filter a collection with an explicit loop.
5. Write a readable list comprehension for a simple transformation or filter.

**Speaker note:** Explain that the aim is not to memorise three pieces of syntax. The aim is to make a justified data-design decision and then process the chosen structure.

---

## Slide 3

**Type:** `learning-path`

**Title:** TODAY'S LEARNING PATH

**Steps:**

1. **Choose** — match real data to a suitable container.
2. **Select** — retrieve individual values and useful subsequences.
3. **Combine** — model several records with nested structures.
4. **Transform** — use a loop and then a list comprehension.
5. **Build** — apply the ideas in a guided journey-planner notebook.
6. **Practise** — solve reinforcement and exam-style scenarios.

**Speaker note:** Make the rhythm explicit: each active-learning round adds one capability. Students should write a prediction before Python is used to check it.

---

## Slide 4

**Type:** `extended-concept`

**Title:** ONE CONTAINER DOES NOT FIT EVERY PROBLEM

**Lead:** A program may need to represent an ordered sequence, a fixed value or a record with named fields.

**Scenario:** A smart warehouse needs to store:

- recent package weights that may be corrected or extended;
- a shelf position formed by an aisle and a level;
- a package record containing an identifier, weight, destination and status.

**Question:** What properties should each container have?

**Supporting prompts:**

- Does order matter?
- Can the contents change?
- Do positions or meaningful names make the data clearer?

**Speaker note:** Reveal the three warehouse cases one at a time. Accept informal language such as “a sequence”, “something fixed” or “a form with labels”. Do not introduce `list`, `tuple` or `dict` yet.

---

## Slide 5

**Type:** `extended-concept`

**Title:** ACTIVE LEARNING — DESIGN THE DATA

**Lead:** Work in pairs. Each round has one printed worksheet and one decision to justify.

**Instructions:**

1. Read the case or code before writing.
2. Agree on a prediction and record it in the table.
3. Be ready to explain the reasoning, not only the answer.
4. Compare answers during the class discussion.
5. Correct the trace in a different colour after the reveal.

**Success criterion:** Your pair can explain what each container or expression contributes to the program.

**Speaker note:** Distribute the four worksheet pages now or hand out each one immediately before its round. Students do not need laptops during this activity.

---

## Slide 6

**Type:** `concept-table`

**Print:** yes — Round 1 worksheet

**Title:** ROUND 1 — CHOOSE A CONTAINER

**Description:** For each warehouse case, choose exactly one container and justify the property that makes it suitable.

**Available containers:**

- **A** — ordered positions; contents can change.
- **B** — ordered positions; contents are locked after creation.
- **C** — named fields; each value is found through a meaningful label.

| Warehouse case | A | B | C | Why does it fit? |
|---|:---:|:---:|:---:|---|
| Recent package weights; readings may be corrected or added | ☐ | ☐ | ☐ | |
| Shelf position: aisle and level; the pair should remain fixed | ☐ | ☐ | ☐ | |
| Package record: ID, weight, destination and status | ☐ | ☐ | ☐ | |

**Bottom prompt:** Which property mattered most in each decision: order, mutability or named access?

**Speaker note:** Expected choices: weights → A; shelf position → B; package record → C. Ask one pair to defend each choice before revealing the Python names.

---

## Slide 7

**Type:** `concept-table`

**Title:** LIST, TUPLE AND DICTIONARY REPRESENT DIFFERENT NEEDS

**Definition:** A **data structure** organises related values and defines how a program can access and modify them.

| Structure | Main idea | Can values change? | Access | Warehouse example |
|---|---|:---:|---|---|
| `list` | Ordered sequence | Yes | Integer index | Recent weights |
| `tuple` | Ordered, fixed sequence | No | Integer index | Shelf position |
| `dict` | Record of key–value pairs | Yes | Key | Package record |

**Code examples:**

```python
weights = [12.4, 8.7, 21.3]
shelf_position = (4, 2)
package = {"id": "PKG-101", "weight": 12.4, "status": "ready"}
```

**Key message:** Choose according to the meaning and expected use of the data, not according to which syntax is shortest.

**Speaker note:** Connect A, B and C to `list`, `tuple` and `dict`. Define *mutable* as “can be changed after creation” and *immutable* as “cannot be changed after creation”. Clarify that tuples can contain several types of value; their purpose here is to communicate a fixed ordered group.

---

## Slide 8

**Type:** `concept-code-snippet`

**Title:** A SLICE SELECTS PART OF AN ORDERED COLLECTION

**Concept:** A **slice** creates a new sequence containing a selected range from a list, tuple or string.

**Syntax:**

```python
sequence[start:stop]
```

**Rules:**

- `start` is included.
- `stop` is excluded.
- An omitted boundary means “from the beginning” or “to the end”.
- A negative index counts backwards from the end.

**Example:**

```python
weights = [12.4, 8.7, 21.3, 16.5, 7.8, 10.2]
inspection_window = weights[1:4]
```

**Result:**

```python
[8.7, 21.3, 16.5]
```

**Question:** Why is the value at index `4` not included?

**Speaker note:** Mark indices `0` to `5` above the values. Emphasise the half-open interval: start included, stop excluded. Do not introduce the step component or multidimensional slicing in this session.

---

## Slide 9

**Type:** `code-trace`

**Print:** yes — Round 2 worksheet

**Title:** ROUND 2 — SELECT AN INSPECTION WINDOW

**Description:** Predict which indices and values each slice selects. Complete one row before discussing it.

**Code:**

```python
weights = [12.4, 8.7, 21.3, 16.5, 7.8, 10.2]
# indices:     0    1     2     3    4     5
```

| Expression | Selected indices | Result |
|---|---|---|
| `weights[1:4]` | | |
| `weights[:3]` | | |
| `weights[3:]` | | |
| `weights[-2:]` | | |

**Bottom prompt:** Complete the rule: a slice includes the __________ position and excludes the __________ position.

**Speaker note:** Expected traces: `[1:4]` → indices 1, 2, 3 → `[8.7, 21.3, 16.5]`; `[:3]` → 0, 1, 2 → `[12.4, 8.7, 21.3]`; `[3:]` → 3, 4, 5 → `[16.5, 7.8, 10.2]`; `[-2:]` → 4, 5 → `[7.8, 10.2]`. The final rule is “start” and “stop”.

---

## Slide 10

**Type:** `concept-code-snippet`

**Title:** NESTED STRUCTURES MODEL COLLECTIONS OF RECORDS

**Concept:** A **nested structure** places one data structure inside another. A list of dictionaries represents an ordered collection of records with named fields.

**Code:**

```python
packages = [
    {"id": "PKG-101", "weight": 12.4, "status": "ready"},
    {"id": "PKG-102", "weight": 21.3, "status": "pending"},
    {"id": "PKG-103", "weight": 8.7, "status": "ready"},
]
```

**Access pattern:**

```python
collection[index][key]
```

**Example:**

```python
packages[0]["id"]
```

**Result:**

```python
'PKG-101'
```

**Key message:** Read chained brackets from left to right: first select the record, then select its field.

**Speaker note:** Physically point to the second dictionary when explaining `packages[1]`, then point to the `"weight"` key. Mention that dictionary keys should be meaningful and consistent across records.

---

## Slide 11

**Type:** `code-trace`

**Print:** yes — Round 3 worksheet

**Title:** ROUND 3 — NAVIGATE A COLLECTION OF RECORDS

**Description:** For each expression, describe the selection path and predict the value returned or the change produced.

**Code:**

```python
packages = [
    {"id": "PKG-101", "weight": 12.4, "status": "ready"},
    {"id": "PKG-102", "weight": 21.3, "status": "pending"},
    {"id": "PKG-103", "weight": 8.7, "status": "ready"},
]
```

| Expression | Selection path | Result or change |
|---|---|---|
| `packages[1]` | | |
| `packages[1]["weight"]` | | |
| `packages[2]["status"]` | | |
| `packages[1]["status"] = "ready"` | | |

**Bottom prompt:** After the last instruction, what is the status of each package?

**Speaker note:** Expected results: the complete `PKG-102` dictionary; `21.3`; `'ready'`; the second record changes from `'pending'` to `'ready'`. Final statuses are all `'ready'`. Reinforce that the list index selects a record and the dictionary key selects or updates a field.

---

## Slide 12

**Type:** `concept-code-snippet`

**Title:** A LOOP CAN FILTER AND TRANSFORM DATA

**Concepts:**

- A **filter** keeps only the elements that satisfy a condition.
- A **transformation** produces a new value from each selected element.
- An **accumulator** stores the partial result while the loop runs.

**General pattern:**

```python
result = []

for element in iterable:
    if condition:
        result.append(expression)
```

**Warehouse example:**

```python
heavy_package_ids = []

for package in packages:
    if package["weight"] > 10:
        heavy_package_ids.append(package["id"])
```

**Question:** Which part filters the records, and which part transforms a record into an ID?

**Speaker note:** The condition is the filter; `package["id"]` is the transformation; `heavy_package_ids` is the accumulator. Remind students that they already know every instruction in the explicit loop—the novelty is applying them to dictionaries inside a list.

---

## Slide 13

**Type:** `code-trace`

**Print:** yes — Round 4 worksheet

**Title:** ROUND 4 — TRACE A FILTERED TRANSFORMATION

**Description:** Trace the accumulator after every package. Write the result even when the list does not change.

**Code:**

```python
heavy_package_ids = []

for package in packages:
    if package["weight"] > 10:
        heavy_package_ids.append(package["id"])
```

| Package examined | Is `weight > 10`? | State of `heavy_package_ids` |
|---|:---:|---|
| `PKG-101` — `12.4` | | |
| `PKG-102` — `21.3` | | |
| `PKG-103` — `8.7` | | |

**Complete the recipe:** For each __________, if __________, add __________ to the result.

**Speaker note:** Expected states: after `PKG-101` → `['PKG-101']`; after `PKG-102` → `['PKG-101', 'PKG-102']`; after `PKG-103` → unchanged. Recipe: package; its weight is greater than 10; its ID.

---

## Slide 14

**Type:** `concept-code-snippet`

**Title:** A LIST COMPREHENSION STATES THE SAME SIMPLE RECIPE

**Concept:** A **list comprehension** creates a new list by applying an expression to the elements of an iterable, with an optional filtering condition.

**Syntax:**

```python
[expression for element in iterable if condition]
```

**Equivalent code:**

```python
# Explicit loop
heavy_package_ids = []

for package in packages:
    if package["weight"] > 10:
        heavy_package_ids.append(package["id"])

# List comprehension
heavy_package_ids = [
    package["id"]
    for package in packages
    if package["weight"] > 10
]
```

**Read it as:** Collect each package ID, for every package, if its weight is greater than 10.

**Readability rule:** Use a comprehension for one clear transformation and an optional simple filter. Keep the explicit loop when the process has several steps or needs explanation.

**Speaker note:** Do not present comprehensions as the “better” form. Ask which version makes each stage easier to observe and debug. Point out the same three ingredients in both versions: expression, iteration and condition.

---

## Slide 15

**Type:** `follow-along-transition`

**Title:** NEXT — BUILD A JOURNEY PLANNER

**Left column — Concepts ready to use:**

- lists and slicing;
- tuples for fixed coordinates;
- dictionaries for named station data;
- lists of records;
- explicit loops;
- simple list comprehensions;
- functions that receive and return data structures.

**Right column — Follow-along challenge:**

Build a small journey planner that represents a route, selects part of it, inspects station records and creates useful derived lists.

**Guiding question:** What representation makes each piece of information easiest to understand and use?

**Call to action:** Open the Session 18 follow-along notebook. Predict each result before running the cell.

**Speaker note:** The follow-along deliberately changes context from warehouse data to travel data. This tests transfer: the syntax is the same, but the meaning and design decisions are different.

---

## Facilitator timing guide

| Segment | Slides | Suggested time |
|---|---:|---:|
| Opening and goals | 1–3 | 4 min |
| Activation and instructions | 4–5 | 4 min |
| Round 1: choose a container | 6–7 | 6 min |
| Round 2: slicing | 8–9 | 6 min |
| Round 3: nested structures | 10–11 | 6 min |
| Round 4: filter and transform | 12–14 | 7 min |
| Transition to follow-along | 15 | 2 min |

**Estimated total:** 35 minutes. If time is limited, discuss only `weights[1:4]` and `weights[-2:]` in Round 2; students can complete the other two rows during the follow-along.
