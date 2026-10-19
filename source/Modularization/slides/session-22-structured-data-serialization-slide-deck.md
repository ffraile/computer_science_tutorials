# Unit 04 · Session 22 — Structured data and serialisation slide deck

## Deck purpose

This deck opens and closes the structured-data lesson. The opening starts with a familiar dictionary that exists only in memory and guides a three-round activity:

> compare representations → organise multiple records → choose a suitable format

Slides **8, 12 and 15** are student worksheets. They may be printed one per pair or projected and copied into a worksheet.

---

## Slide 1

**Type:** `cover`

**Unit:** Unit 04 · Structured Programming and Data Manipulation in Python

**Session:** 22

**Title:** WHEN THE PROGRAM STOPS, WHERE DOES THE DATA GO?

**Subtitle:** Structured records, files, CSV, JSON and serialisation

**Footer:** Computer Science · EDEM

**Speaker note:** Present the guiding question: “How can a program preserve and exchange its data after execution ends?”

---

## Slide 2

**Type:** `lesson-goals`

**Title:** LESSON GOALS

**Goals:**

1. Represent one record and a collection of records in Python.
2. Explain the difference between an in-memory object and a file representation.
3. Read and write files safely with `with open(...)`.
4. Serialise and deserialise CSV and JSON data.
5. Compare the information and types preserved by each format.
6. Select a format according to a professional requirement.

**Speaker note:** Explain that students already know lists and dictionaries. The new question is how to preserve or exchange those structures.

---

## Slide 3

**Type:** `learning-path`

**Title:** TODAY'S LEARNING PATH

**Steps:**

1. **Remember** — identify what happens to variables after a kernel restart.
2. **Represent** — compare a Python dictionary, one CSV row and one JSON object.
3. **Organise** — encode a collection of records.
4. **Choose** — match CSV or JSON to an information requirement.
5. **Build** — save and recover equipment-inspection records.
6. **Practise** — review files, formats, types and AI-generated proposals.

**Speaker note:** Make the round-trip objective explicit: the lesson is complete only when data can be written, read back and verified.

---

## Slide 4

**Type:** `concept-code-snippet`

**Title:** A VARIABLE LIVES IN THE PROGRAM'S CURRENT STATE

**Code:**

```python
reading = {
    "sensor_id": "TEMP-04",
    "value": 4.7,
    "unit": "C",
    "alert": False,
}
```

**Questions:**

- Where does `reading` exist while the notebook is running?
- What remains after restarting the kernel?
- How could another program use the record tomorrow?

**Key message:** A Python object in memory is temporary unless the program stores a representation outside its current execution state.

**Speaker note:** If useful, create the dictionary, restart the kernel and try to access it. Distinguish the notebook code from the runtime value held by the kernel.

---

## Slide 5

**Type:** `concept-code-snippet`

**Title:** A RECORD GROUPS NAMED FIELDS

**Definition:** A **record** represents one entity or event using related fields. Each field has a name and a value.

**Example:**

```python
reading = {
    "sensor_id": "TEMP-04",
    "timestamp": "2026-11-20T10:30:00",
    "value": 4.7,
    "unit": "C",
    "alert": False,
}
```

**Vocabulary:**

- Record: the complete reading.
- Field: `sensor_id`, `timestamp`, `value`, `unit` or `alert`.
- Value: the data associated with one field.

**Speaker note:** Connect the structure directly to the dictionaries and nested collections practised in Sessions 18 and 21.

---

## Slide 6

**Type:** `extended-concept`

**Title:** ACTIVE LEARNING — PRESERVE A SENSOR LOG

**Scenario:** An IoT system must preserve readings after the program stops and share them with other tools.

**Working routine:**

1. Inspect the requirement before selecting a format.
2. Record a prediction or decision with your partner.
3. Identify what information is explicit in each representation.
4. Compare answers during the class discussion.
5. Correct the worksheet after the reveal.

**Success criterion:** Your pair can explain not only how the data looks, but why one representation fits a requirement.

---

## Slide 7

**Type:** `concept-table`

**Title:** ONE RECORD CAN HAVE SEVERAL REPRESENTATIONS

**Definition:** A **representation** encodes information according to the rules of a particular language or format.

| Representation | Example | Where field names appear |
|---|---|---|
| Python dictionary | `{"sensor_id": "TEMP-04", "value": 4.7, "alert": False}` | Beside every value |
| CSV row | `TEMP-04,4.7,False` | Normally in a separate header row |
| JSON object | `{"sensor_id": "TEMP-04", "value": 4.7, "alert": false}` | Beside every value |

**Key message:** Similar-looking text does not necessarily follow the same syntax or preserve the same types.

**Speaker note:** Point out `False` versus `false`. A Python dictionary and JSON object are related representations, but they are not interchangeable pieces of syntax.

---

## Slide 8

**Type:** `concept-table`

**Print:** yes — Round 1 worksheet

**Title:** ROUND 1 — READ THE REPRESENTATION

**Description:** Compare the three encodings of the same sensor reading.

| Question | Python dictionary | CSV row | JSON object |
|---|---|---|---|
| Is the field name stored beside every value? | | | |
| Is the Boolean written as `False` or `false`? | | | |
| Can the representation be stored as text? | | | |
| Can Python use it directly as a dictionary without parsing? | | | |

**Bottom prompt:** Which differences are merely visual, and which differences affect how a program must interpret the data?

**Speaker note:** A Python object must first be encoded before writing. CSV and JSON are textual formats. JSON must be parsed to recover Python objects; CSV must be parsed into rows and fields.

---

## Slide 9

**Type:** `concept-code-snippet`

**Title:** CSV REPRESENTS A TABLE

**Definition:** **CSV** stores tabular data as rows of values separated by a delimiter. A header row normally identifies the columns.

**Example:**

```csv
sensor_id,timestamp,value,unit,alert
TEMP-04,2026-11-20T10:30:00,4.7,C,False
TEMP-05,2026-11-20T10:30:00,5.1,C,True
```

**Strengths:**

- Compact and widely supported.
- Natural for rows with the same fields.
- Easy to inspect in spreadsheets and tabular tools.

**Limitation:** CSV text does not by itself preserve Python types or nested structures.

---

## Slide 10

**Type:** `concept-code-snippet`

**Title:** JSON REPRESENTS OBJECTS AND NESTED STRUCTURES

**Definition:** **JSON** is a text format that represents objects, arrays and primitive values using a standard syntax.

**Example:**

```json
[
  {"sensor_id": "TEMP-04", "value": 4.7, "alert": false},
  {"sensor_id": "TEMP-05", "value": 5.1, "alert": true}
]
```

**Strengths:**

- Field names remain attached to values.
- Lists and nested objects are represented naturally.
- Commonly used to exchange data between applications.

**Limitation:** JSON is not a Python dictionary and must be parsed before Python can work with it as an object.

---

## Slide 11

**Type:** `concept-code-snippet`

**Title:** A COLLECTION OF RECORDS NEEDS AN OUTER STRUCTURE

**Python:**

```python
readings = [
    {"sensor_id": "TEMP-04", "value": 4.7, "alert": False},
    {"sensor_id": "TEMP-05", "value": 5.1, "alert": True},
]
```

**CSV:** one header followed by one row per record.

**JSON:** an array containing one object per record.

**Key message:** A single record and a collection of records require different outer structures.

---

## Slide 12

**Type:** `concept-table`

**Print:** yes — Round 2 worksheet

**Title:** ROUND 2 — ORGANISE MULTIPLE READINGS

**Description:** Complete the missing parts for a second reading: `TEMP-05`, `5.1`, `C`, alert active.

**CSV:**

| `sensor_id` | `value` | `unit` | `alert` |
|---|---:|---|---|
| `TEMP-04` | `4.7` | `C` | `False` |
| | | | |

**JSON object to add:**

```json
{
  "sensor_id": "____________",
  "value": ____________,
  "unit": "____________",
  "alert": ____________
}
```

**Bottom prompts:** Where are the field names repeated? Which format makes the Boolean type more explicit?

---

## Slide 13

**Type:** `concept-code-snippet`

**Title:** SERIALISATION TURNS AN OBJECT INTO A STORABLE REPRESENTATION

**Definitions:**

- **Serialisation:** converting an in-memory object into a representation that can be stored or transmitted.
- **Deserialisation:** reading that representation and reconstructing usable program data.

**Round trip:**

```text
Python object
    ↓ serialise
text representation
    ↓ write
file
    ↓ read
text representation
    ↓ deserialise
Python object
```

**Speaker note:** Stress that “saving” includes both choosing an encoding and writing it somewhere. “Loading” includes reading and interpreting it.

---

## Slide 14

**Type:** `concept-table`

**Title:** THE REQUIREMENT SHOULD DETERMINE THE FORMAT

| Requirement | CSV is strong when… | JSON is strong when… |
|---|---|---|
| Shape of the data | Records form a regular table | Data can be nested or irregular |
| Field names | A shared header is sufficient | Every object should carry its keys |
| Types | Conversion can be handled after reading | Numbers, Booleans and nulls should be represented |
| Typical consumer | Spreadsheet or tabular analysis tool | Application, service or configuration reader |

**Key message:** There is no universally best format; there is a best fit for a specific exchange requirement.

---

## Slide 15

**Type:** `concept-table`

**Print:** yes — Round 3 worksheet

**Title:** ROUND 3 — CHOOSE AND JUSTIFY A FORMAT

**Description:** Select CSV or JSON. State the requirement that drives each decision.

| Scenario | CSV | JSON | Deciding requirement |
|---|:---:|:---:|---|
| Export a regular measurement table for spreadsheet analysis | ☐ | ☐ | |
| Store a device configuration containing nested calibration settings | ☐ | ☐ | |
| Send a structured message between two applications | ☐ | ☐ | |
| Prepare a regular dataset for the next Pandas lesson | ☐ | ☐ | |

**Bottom prompt:** Could the other format technically work? Why is your choice still preferable?

**Speaker note:** Expected default choices: CSV, JSON, JSON, CSV. Accept alternatives when the requirement-based justification is sound.

---

## Slide 16

**Type:** `transition`

**Title:** NOW COMPLETE THE ROUND TRIP

**Next questions:**

- How does `with open(...)` manage a file safely?
- What do `csv.DictWriter` and `csv.DictReader` add?
- What do `json.dump` and `json.load` add?
- Which types return after reading each format?
- How can one verify that the recovered data still means the same thing?

**Call to action:** Open the follow-along notebook and continue using **predict → trace → run → compare → explain**.

---

## Slide 17

**Type:** `wrap-up`

**Title:** KEY IDEAS FROM TODAY

**Concepts:**

- A record groups named fields about one entity or event.
- A list of dictionaries can represent a collection of records in memory.
- Files preserve representations beyond the current execution.
- Serialisation and file writing are related but distinct steps.
- CSV naturally represents regular tables.
- JSON naturally represents objects and nested structures.
- CSV readers normally return text that may require conversion.
- A round trip must be verified, not merely executed.

---

## Slide 18

**Type:** `certification-question`

**Title:** REVIEW — THE CODE EXECUTES, BUT IS THE TYPE CORRECT?

**Scenario:** A CSV row contains `completed=False`. After reading it, an assistant proposes:

```python
completed = bool(row["completed"])
```

**Question:** What is the best review?

**Options:**

A. Accept it because `bool()` converts text into its written Boolean value.  
B. Reject it because any non-empty string, including `"False"`, becomes `True`; compare or parse the expected text explicitly.  
C. Convert the value with `float()` first.  
D. CSV cannot contain Boolean information.

**Speaker note:** Best answer: B. Demonstrate `bool("False")` if necessary.

---

## Slide 19

**Type:** `certification-question`

**Title:** REVIEW — DO NOT BUILD JSON BY CONCATENATING VALUES

**Scenario:** An assistant suggests joining strings manually to create JSON from user-provided records.

**Question:** Why is `json.dump()` or `json.dumps()` preferable?

**Options:**

A. It applies the JSON syntax and escaping rules consistently.  
B. It automatically stores the data in a database.  
C. It guarantees every input value is trustworthy.  
D. It converts every value into an integer.

**Speaker note:** Best answer: A. Serialisation does not replace input validation.

---

## Slide 20

**Type:** `exit-ticket`

**Title:** EXPLAIN BEFORE YOU LEAVE

**Prompts:**

1. Define serialisation and deserialisation in your own words.
2. Choose CSV or JSON for a collection of sensor readings and justify the choice from one explicit requirement.
3. State one check you would perform after reading the file.

**Speaker note:** Use the answers to identify whether the Pandas introduction needs additional review of records, fields or CSV types.
