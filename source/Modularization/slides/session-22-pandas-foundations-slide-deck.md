# Unit 04 · Session 22 — Pandas foundations slide deck

## Deck purpose

This deck opens and closes the first Pandas lesson. It connects the structured records and CSV files from Session 21 with a tabular workflow:

> load → inspect → select and filter → detect problems → define cleaning rules

Slides **8, 12 and 16** are student worksheets. Each active-learning round first formalises the required concepts and then asks pairs to reason over the same defective sensor dataset.

---

## Slide 1

**Type:** `cover`

**Unit:** Unit 04 · Structured Programming and Data Manipulation in Python

**Session:** 23

**Title:** CAN WE TRUST THIS TABLE?

**Subtitle:** Pandas, DataFrames, selection, filtering and cleaning

**Footer:** Computer Science · EDEM

**Speaker note:** Present the guiding question: “How can we convert records into a table that is reliable enough to support a decision?”

---

## Slide 2

**Type:** `lesson-goals`

**Title:** LESSON GOALS

**Goals:**

1. Create a DataFrame from records and load one from CSV.
2. Distinguish a Series, a DataFrame and its index.
3. Inspect structure, types, missingness and numerical distributions.
4. Select rows and columns with labels and positions.
5. Filter records with Boolean conditions.
6. Apply and verify justified type-conversion and cleaning rules.

---

## Slide 3

**Type:** `learning-path`

**Title:** TODAY'S LEARNING PATH

**Steps:**

1. **Transform** — convert familiar records into a DataFrame.
2. **Inspect** — determine what the table contains before changing it.
3. **Select** — retrieve relevant rows and columns.
4. **Filter** — express conditions as Boolean masks.
5. **Clean** — apply explicit rules to types, missing values and duplicates.
6. **Verify** — compare the original and prepared datasets.

---

## Slide 4

**Type:** `concept-code-snippet`

**Title:** RECORDS CAN BECOME A LABELLED TABLE

**Code:**

```python
readings = [
    {"sensor_id": "T-01", "value": 4.7, "alert": False},
    {"sensor_id": "T-02", "value": 5.1, "alert": True},
]

data = pd.DataFrame(readings)
```

**Definitions:**

- A **DataFrame** is a two-dimensional table with labelled rows and columns.
- A **Series** is a one-dimensional labelled collection, commonly one column.
- The **index** labels the rows and is not necessarily a data column.

**Question:** Where do the column names come from?

---

## Slide 5

**Type:** `concept-table`

**Title:** THE DATAFRAME HAS STRUCTURE AND MEANING

| Component | Example | Meaning |
|---|---|---|
| Row | Index `2` | One observation or record |
| Column | `value` | One variable or field |
| Index | `0`, `1`, `2`, … | Row labels |
| Value | `4.7` | One observation for one variable |
| Data type | `float64` | How a column's values are represented |

**Key message:** A rectangular shape does not guarantee that the contents are correct, complete or consistently typed.

---

## Slide 6

**Type:** `extended-concept`

**Title:** ACTIVE LEARNING — AUDIT A SENSOR DATASET

**Scenario:** A cold-storage monitoring team receives a table that may contain missing, inconsistent or invalid records.

**Working routine:**

1. Record evidence before proposing a correction.
2. Distinguish an observation from an interpretation.
3. State the rule that would justify each change.
4. Identify what information could be lost.
5. Define how the result should be verified.

---

## Slide 7

**Type:** `concept-code-snippet`

**Title:** INSPECTION ANSWERS DIFFERENT QUESTIONS

```python
data.head()       # sample rows
data.shape        # number of rows and columns
data.columns      # column labels
data.dtypes       # type selected for each column
data.info()       # structure, non-null counts and types
data.describe()   # numerical summary
```

**Definition:** **Data inspection** is the systematic examination of structure, types, missingness and distributions before analysis or cleaning.

**Key message:** `head()` is useful, but it is not a complete quality check.

---

## Slide 8

**Type:** `concept-table`

**Print:** yes — Round 1 worksheet

**Title:** ROUND 1 — INSPECT BEFORE YOU ACT

| Index | `sensor_id` | `timestamp` | `value` | `unit` | `status` |
|---:|---|---|---:|---|---|
| 0 | T-01 | 2026-11-26 10:00 | 4.7 | C | active |
| 1 | T-02 | 2026-11-26 10:00 | — | C | active |
| 2 | T-01 | 2026-11-26 10:05 | 4.9 | C | active |
| 3 | T-03 | incorrect | 85.0 | C | active |
| 4 | T-02 | 2026-11-26 10:05 | `5.2` | C | inactive |

| Inspection question | Prediction or evidence |
|---|---|
| Expected `shape` | |
| Likely type problem | |
| Missing value | |
| Potential range problem | |
| Information needed before cleaning | |

**Speaker note:** A suspicious value is not automatically an error. The acceptable temperature range is a domain rule that must be supplied.

---

## Slide 9

**Type:** `concept-code-snippet`

**Title:** SELECTING ONE OR MORE COLUMNS CHANGES THE RESULT TYPE

```python
data["value"]                # Series
data[["sensor_id", "value"]]  # DataFrame
```

**Key distinction:**

- One pair of brackets with one label normally selects a Series.
- A list of column labels selects a DataFrame.

**Question:** Why might preserving a DataFrame be useful for a later tabular operation?

---

## Slide 10

**Type:** `concept-code-snippet`

**Title:** `loc` USES LABELS; `iloc` USES POSITIONS

```python
data.loc[2]                         # row whose index label is 2
data.iloc[2]                        # third row by position
data.loc[1:3, ["sensor_id", "value"]]
data.iloc[1:4, [0, 2]]
```

**Definitions:**

- `loc` selects with row and column labels.
- `iloc` selects with integer positions.

**Important:** Label slicing with `loc` includes the final label; positional slicing with `iloc` excludes the stop position.

---

## Slide 11

**Type:** `concept-code-snippet`

**Title:** A CONDITION CREATES A BOOLEAN MASK

```python
mask = data["sensor_id"] == "T-01"
selected = data.loc[mask]
```

**Combined conditions:**

```python
selected = data.loc[
    (data["value"] > 4.8) &
    (data["status"] == "active")
]
```

**Rules:** Use `&`, `|` and `~` for Series conditions, and place each comparison inside parentheses.

---

## Slide 12

**Type:** `concept-table`

**Print:** yes — Round 2 worksheet

**Title:** ROUND 2 — SELECT AND FILTER

| Request | Pandas expression | Expected labels or values | Result type |
|---|---|---|---|
| Select only `value` | | | |
| Keep `sensor_id` and `value` | | | |
| Select row label `2` | | | |
| Select the third row by position | | | |
| Keep readings from sensor T-01 | | | |
| Keep active readings above 4.8 | | | |

**Bottom prompt:** Which requests require labels, positions or a Boolean mask?

---

## Slide 13

**Type:** `concept-code-snippet`

**Title:** MISSING, INVALID AND UNUSUAL ARE DIFFERENT IDEAS

```python
data.isna().sum()
pd.to_numeric(data["value"], errors="coerce")
pd.to_datetime(data["timestamp"], errors="coerce")
```

**Definitions:**

- **Missing:** no usable value is present.
- **Invalid:** the value violates a syntax, type or domain rule.
- **Unusual:** the value is rare or surprising but may still be valid.

**Key message:** `errors="coerce"` turns unparseable values into missing values so they can be detected; it does not decide what should happen next.

---

## Slide 14

**Type:** `concept-code-snippet`

**Title:** CLEANING REQUIRES AN EXPLICIT RULE

```python
clean_data = raw_data.copy()
clean_data["value"] = pd.to_numeric(
    clean_data["value"], errors="coerce"
)
clean_data = clean_data.drop_duplicates()
```

**For every change, document:**

1. Evidence of the problem.
2. Rule being applied.
3. Records affected.
4. Information that may be lost.
5. Verification after the change.

**Key message:** Cleaning is not “making warnings disappear”.

---

## Slide 15

**Type:** `concept-table`

**Title:** NOT EVERY PROBLEM HAS THE SAME RESPONSE

| Problem | Possible action | Required justification |
|---|---|---|
| Numeric text | Convert with `to_numeric()` | Column should be numerical |
| Invalid timestamp | Coerce, flag or correct | Trusted source or business rule exists |
| Missing essential value | Exclude, recover or flag | Analysis cannot proceed without it |
| Duplicate record | Remove one copy | Records are demonstrably identical duplicates |
| Extreme value | Keep, flag or exclude | Valid domain range is known |

---

## Slide 16

**Type:** `concept-table`

**Print:** yes — Round 3 worksheet

**Title:** ROUND 3 — DEFINE THE CLEANING DECISION

| Observed issue | Evidence | Proposed rule | Possible information loss | Verification |
|---|---|---|---|---|
| Missing `value` at index 1 | | | | |
| Text value `"5.2"` at index 4 | | | | |
| Invalid timestamp at index 3 | | | | |
| Temperature `85.0` | | | | |

**Bottom prompt:** Which issue can be corrected from the available evidence, and which requires additional domain information?

---

## Slide 17

**Type:** `transition`

**Title:** TURN THE AUDIT INTO A REPRODUCIBLE PIPELINE

**Next questions:**

- How can a DataFrame be loaded consistently from CSV?
- Which inspection sequence should always run first?
- How do selections preserve the meaning of rows and columns?
- Which conversions expose invalid values?
- How can the original data remain available for comparison?

**Call to action:** Open the follow-along and use **predict → inspect → transform → verify → explain**.

---

## Slide 18

**Type:** `wrap-up`

**Title:** KEY IDEAS FROM TODAY

- A DataFrame is a labelled two-dimensional table; a Series is one-dimensional.
- Inspection must cover structure, types, missingness and distributions.
- `loc` uses labels; `iloc` uses positions.
- Boolean conditions select records that satisfy explicit rules.
- Type conversion and cleaning are separate decisions.
- Missing, invalid and unusual values are not equivalent.
- Keep raw data and verify every transformation.

---

## Slide 19

**Type:** `certification-question`

**Title:** REVIEW — SHOULD EVERY MISSING ROW BE DELETED?

**Scenario:** An assistant proposes `data.dropna()` immediately after loading a business dataset.

**Question:** What is the best response?

**Options:**

A. Accept it because every missing value is an error.  
B. First inspect which columns are missing, why they matter and how many records would be removed.  
C. Replace every missing value with zero.  
D. Convert the DataFrame to JSON.

**Speaker note:** Best answer: B.

---

## Slide 20

**Type:** `certification-question`

**Title:** REVIEW — WHY DID THE FILTER FAIL?

**Scenario:** An assistant proposes:

```python
data["value"] > 5 & data["status"] == "active"
```

**Question:** Which correction is clearest?

```python
(data["value"] > 5) & (data["status"] == "active")
```

**Key message:** Each comparison must be grouped before combining Series masks.

---

## Slide 21

**Type:** `exit-ticket`

**Title:** EXPLAIN BEFORE YOU LEAVE

1. Name one quality problem detected in the dataset.
2. State the rule you would apply.
3. Identify information that could be lost.
4. Describe one check that would demonstrate the cleaning worked.

**Speaker note:** Use the answers to decide whether Session 23 needs a short review of types, masks or validation before joins and grouping.
