# Unit 04 · Session 24 — Pandas analysis slide deck

## Deck purpose

This deck guides the opening activity and closes the second Pandas lesson. The conceptual sequence is:

> identify table grain and keys → join → validate correspondences → group → aggregate → interpret

Slides **8, 12 and 16** are student worksheets.

---

## Slide 1

**Type:** `cover`

**Unit:** Unit 04 · Structured Programming and Data Manipulation in Python

**Session:** 24

**Title:** FROM SEPARATE TABLES TO DECISIONS

**Subtitle:** Joins, grouping, aggregation and visualisation

**Footer:** Computer Science · EDEM

---

## Slide 2

**Type:** `lesson-goals`

**Title:** LESSON GOALS

1. Describe what one row represents in each table.
2. Identify a suitable key and expected relationship.
3. Combine tables with `inner` and `left` joins.
4. Detect unmatched records and duplicated lookup keys.
5. Sort, group and aggregate records.
6. Verify totals and interpret a visual summary.

---

## Slide 3

**Type:** `learning-path`

**Title:** TODAY'S LEARNING PATH

1. **Define** — state the grain and keys of each table.
2. **Match** — connect related records.
3. **Validate** — investigate missing and repeated matches.
4. **Summarise** — group and aggregate.
5. **Rank** — order the result.
6. **Communicate** — visualise and interpret the evidence.

---

## Slide 4

**Type:** `concept-table`

**Title:** TWO TABLES ANSWER DIFFERENT PARTS OF THE QUESTION

**Sensors**

| `sensor_id` | `location` | `sensor_type` |
|---|---|---|
| S-01 | Cold room A | temperature |
| S-02 | Cold room B | temperature |
| S-03 | Loading area | humidity |

**Readings**

| `reading_id` | `sensor_id` | `value` |
|---|---|---:|
| R-101 | S-01 | 4.7 |
| R-102 | S-02 | 5.1 |
| R-103 | S-01 | 4.9 |

**Question:** How can each reading acquire its sensor location without copying it manually?

---

## Slide 5

**Type:** `concept-code-snippet`

**Title:** GRAIN AND KEYS DEFINE THE RELATIONSHIP

**Definitions:**

- **Grain:** what one row represents.
- **Key:** one or more fields used to identify or relate records.
- **Cardinality:** how many records on one side may correspond to a record on the other.

```text
readings grain → one recorded measurement
sensors grain  → one registered sensor
relationship   → many readings to one sensor
```

**Key message:** Define the intended relationship before writing `merge()`.

---

## Slide 6

**Type:** `concept-code-snippet`

**Title:** `merge()` MATCHES RECORDS THROUGH A KEY

```python
enriched = readings.merge(
    sensors,
    on="sensor_id",
    how="left",
)
```

- The left table provides the rows we want to preserve.
- `on` identifies the common key.
- Columns from matching sensor records are added.
- The expected result grain remains one reading.

---

## Slide 7

**Type:** `concept-table`

**Title:** `INNER` AND `LEFT` ANSWER DIFFERENT QUESTIONS

| Join | Keeps | Useful question |
|---|---|---|
| `inner` | Only rows with a match on both sides | Which readings have registered sensors? |
| `left` | Every left row, with missing values when no match exists | Did every reading find a registered sensor? |

**Key message:** Choose according to which records the result must preserve.

---

## Slide 8

**Type:** `concept-table`

**Print:** yes — Round 1 worksheet

**Title:** ROUND 1 — BUILD THE JOIN

| `reading_id` | `sensor_id` | `value` | Matching location | Matching type |
|---|---|---:|---|---|
| R-101 | S-01 | 4.7 | | |
| R-102 | S-02 | 5.1 | | |
| R-103 | S-01 | 4.9 | | |

**Questions:**

1. What does one result row represent?
2. How many rows should the result contain?
3. Which table should be on the left if every reading must remain visible?

---

## Slide 9

**Type:** `concept-code-snippet`

**Title:** UNMATCHED KEYS AND DUPLICATES CHANGE THE RESULT

Add these cases:

```text
reading R-104 uses unknown sensor S-99
sensor table contains S-01 twice
```

**Consequences:**

- An `inner` join drops R-104.
- A `left` join keeps R-104 with missing sensor fields.
- Repeated S-01 records can duplicate every matching reading.

**Key message:** Successful execution does not prove that the join preserved the intended grain.

---

## Slide 10

**Type:** `concept-code-snippet`

**Title:** ASK PANDAS TO VALIDATE THE ASSUMPTION

```python
enriched = readings.merge(
    sensors,
    on="sensor_id",
    how="left",
    indicator=True,
    validate="many_to_one",
)
```

- `indicator=True` records whether a match was found.
- `validate="many_to_one"` requires the right-hand key to be unique.

**Checks:** row count, unmatched keys, duplicate lookup keys and result grain.

---

## Slide 11

**Type:** `concept-table`

**Title:** PREDICT THE EFFECT BEFORE MERGING

| Situation | Expected effect |
|---|---|
| Unknown key in left table + `inner` | Left record disappears |
| Unknown key in left table + `left` | Record remains with missing right fields |
| Duplicate key in lookup table | Matching left rows multiply |
| Unique lookup key | Many-to-one relationship can be validated |

---

## Slide 12

**Type:** `concept-table`

**Print:** yes — Round 2 worksheet

**Title:** ROUND 2 — AUDIT THE JOIN

| Question | Prediction | Evidence after merge |
|---|---|---|
| Rows expected before adding the duplicate sensor | | |
| Result for R-104 with `inner` | | |
| Result for R-104 with `left` | | |
| Effect of duplicate S-01 | | |
| Validation that should fail | | |

**Bottom prompt:** Which result could look plausible while silently changing the grain?

---

## Slide 13

**Type:** `concept-code-snippet`

**Title:** GROUPING DEFINES WHICH RECORDS BELONG TOGETHER

```python
grouped = enriched.groupby("location")
```

**Definition:** `groupby()` partitions rows according to one or more key values. It does not yet decide which summary to calculate.

**Question:** What groups are formed from the three matched readings?

---

## Slide 14

**Type:** `concept-code-snippet`

**Title:** AGGREGATION DEFINES THE SUMMARY FOR EACH GROUP

```python
summary = (
    enriched
    .groupby("location", as_index=False)
    .agg(
        reading_count=("reading_id", "count"),
        mean_value=("value", "mean"),
        min_value=("value", "min"),
        max_value=("value", "max"),
    )
)
```

**Key distinction:** Grouping determines membership; aggregation determines the reported measures.

---

## Slide 15

**Type:** `concept-code-snippet`

**Title:** SORTING AND VISUALISATION SUPPORT INTERPRETATION

```python
ranked = summary.sort_values(
    "mean_value",
    ascending=False,
)

ranked.plot.bar(
    x="location",
    y="mean_value",
)
```

**Warning:** A chart communicates the aggregation choices; it does not validate them.

---

## Slide 16

**Type:** `concept-table`

**Print:** yes — Round 3 worksheet

**Title:** ROUND 3 — GROUP AND SUMMARISE

| Location | Values assigned to group | Count | Mean | Minimum | Maximum |
|---|---|---:|---:|---:|---:|
| Cold room A | | | | | |
| Cold room B | | | | | |

**Questions:**

1. Which reading is excluded if only matched records are used?
2. What information is no longer visible in the summary?
3. Which total or count should be checked after aggregation?

---

## Slide 17

**Type:** `transition`

**Title:** BUILD A COMPLETE ANALYSIS PIPELINE

```text
inspect both tables
→ define grain and key
→ validate uniqueness
→ merge
→ audit matches and row count
→ calculate derived values
→ group and aggregate
→ verify totals
→ visualise and interpret
```

**Call to action:** Open the follow-along and continue with **predict → execute → validate → interpret**.

---

## Slide 18

**Type:** `wrap-up`

**Title:** KEY IDEAS FROM TODAY

- Define grain, key and expected cardinality before merging.
- `inner` keeps matches; `left` preserves every left record.
- Unknown keys and duplicate lookup keys require different responses.
- `indicator` and `validate` turn assumptions into checks.
- Grouping selects membership; aggregation creates summaries.
- Sorting and charts aid interpretation but do not prove correctness.
- Reconcile counts and totals after transformations.

---

## Slide 19

**Type:** `certification-question`

**Title:** REVIEW — WHY DID THE ROW COUNT INCREASE?

An orders table has 100 rows. After joining a product catalogue, the result has 106. What should be checked first?

A. Whether product keys are duplicated in the catalogue.  
B. Whether the result is sorted.  
C. Whether all prices are floats.  
D. Whether the chart has a title.

**Speaker note:** Best answer: A. A supposedly many-to-one join may actually be many-to-many.

---

## Slide 20

**Type:** `certification-question`

**Title:** REVIEW — DID THE SUMMARY PRESERVE THE TOTAL?

```python
summary["sales"].sum()
enriched["sales"].sum()
```

**Question:** Why compare these values?

**Answer:** To verify that grouping and aggregation have neither lost nor duplicated sales records included in the analysis.

---

## Slide 21

**Type:** `exit-ticket`

**Title:** EXPLAIN BEFORE YOU LEAVE

1. State one check required before a join.
2. State one check required immediately after a join.
3. Explain the difference between grouping and aggregation.
4. State one reconciliation check required after summarising.
