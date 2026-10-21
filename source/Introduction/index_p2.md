# Unit 04 — Structured Programming and Data Manipulation

Welcome to the second Python programming block. We will build on variables,
conditions, loops, lists and plotting to organise reusable programs and turn
raw records into useful numerical and tabular information.

The examples connect programming to sensor readings, journey planning,
production, equipment inspections, energy use and sales analysis.

## Unit learning objectives

By the end of the unit, you should be able to:

- define, document and test functions with clear responsibilities;
- choose between lists, tuples and dictionaries and work with nested records;
- compare explicit loops and readable list comprehensions;
- use NumPy arrays for numerical operations and check dimensions;
- read and write files and verify CSV and JSON serialisation;
- load, inspect, filter and clean data with Pandas;
- combine tables, group records and interpret aggregates and plots.

Continue using the learning cycle:

> **predict → execute → compare → explain**

Use AI assistance within the limits of each activity, and test and explain every
suggestion you adopt.

## How to use this page

Each session includes its learning focus, presentation outline, follow-along,
practice notebook and related tutorials. Presentation links currently lead to
the slide outlines available in the course materials.

The block runs from **2 to 16 November 2026**. Session identifiers **17–23**
match the course calendar; consult that calendar for the intermediate dates.
The **partial exam is on 30 October**, before this block.

Sessions **18 and 19** use the same advanced iterables notebooks and slide
outline. Keep your work from Session 18 and continue it in Session 19.

---

## Session 17 — Functions and structured programming

**Date:** 2 November

**Focus:** Break a program into small functions with clear inputs, outputs and responsibilities.

We will define functions with `def`, use parameters and default values, distinguish `print()` from `return`, reason about local variables, and document and test function contracts. The guided example turns Arduino messages into useful sensor readings.

### Presentation

- [Session 17 presentation outline](../Modularization/slides/session-17-opening-active-learning-slide-deck.md): Opening activities, explanations and discussion prompts.

### Class materials

- [Session 17 follow-along](../Modularization/follow_along/Session%2017%20-%20Structured%20programming%20and%20functions%20-%20follow%20along.ipynb): Build and test small functions for processing sensor messages.
- [Session 17 practice](../Modularization/exercises/Session%2017%20-%20Structured%20programming%20and%20functions%20-%20practice.ipynb): Apply the session concepts through tracing, code review and independent problems.

### Related tutorials and extra materials

- [Functions](../Modularization/tutorials/Functions.ipynb): Review function definitions, arguments and return values.
- [Functions exercises](../Modularization/exercises/4.%20Functions.ipynb): Additional practice with function design.
- [Functions and variable lifecycle code cards](./exercises/Functions%20and%20variable%20lifecycle%20code%20cards.ipynb): Trace function calls and variable scope.

---

## Session 18 — Advanced iterables I — Lists, tuples and dictionaries

**Date:** See the course calendar

**Focus:** Choose a suitable collection and access or update its contents deliberately.

We will compare lists, tuples and dictionaries; use indexing and slicing; distinguish mutable and immutable structures; and work with named dictionary fields. The shared journey-planner notebook continues in Session 19.

### Presentation

- [Session 18 presentation outline](../Modularization/slides/session-18-opening-active-learning-slide-deck.md): Shared outline for Sessions 18–19.

### Class materials

- [Session 18 follow-along (shared notebook)](../Modularization/follow_along/Session%2018%20-%20Advanced%20iterables%20-%20follow%20along.ipynb): Start with sections 1–4: structure selection, slicing, mutability and dictionary fields.
- [Session 18 practice (shared notebook)](../Modularization/exercises/Session%2018%20-%20Advanced%20iterables%20-%20practice.ipynb): Use the tasks on lists, tuples, dictionaries and slicing; continue the remaining tasks in Session 19.

### Related tutorials and extra materials

- [Iterable Objects II](./tutorials/Iterable%20Objects%20II.ipynb): Review tuples, dictionaries and collection operations; save nested structures and comprehensions for Session 19.

---

## Session 19 — Advanced iterables II — Nested structures and comprehensions

**Date:** See the course calendar

**Focus:** Traverse collections of records and express simple transformations clearly.

We will iterate over dictionaries, combine structures into lists of records, pass collections to functions, and compare explicit loops with list comprehensions. We will complete the journey-planner example started in Session 18.

### Presentation

- [Session 19 presentation outline](../Modularization/slides/session-18-opening-active-learning-slide-deck.md): Shared outline for Sessions 18–19.

### Class materials

- [Session 19 follow-along (shared notebook)](../Modularization/follow_along/Session%2018%20-%20Advanced%20iterables%20-%20follow%20along.ipynb): Continue with sections 5–11: iteration, nested records, functions, transformations and comprehensions.
- [Session 19 practice (shared notebook)](../Modularization/exercises/Session%2018%20-%20Advanced%20iterables%20-%20practice.ipynb): Continue the shared practice with nested structures, collection transformations and comprehensions.

### Related tutorials and extra materials

- [Iterable Objects II](./tutorials/Iterable%20Objects%20II.ipynb): Review nested structures and comprehensions.
- [Iterables II code cards](./exercises/iterables%20II%20code%20cards.ipynb): Practise tracing and transforming collections.

---

## Session 20 — NumPy — Arrays and numerical operations

**Date:** See the course calendar

**Focus:** Represent numerical data with arrays and interpret vectorised operations.

We will inspect array shapes and types, select elements and regions, perform element-wise and matrix operations, check dimensional compatibility, and plot results. The guided example supports planning a small production run.

### Presentation

- [Session 20 presentation outline](../Modularization/slides/session-20-numpy-slide-deck.md): Opening activities, explanations and discussion prompts.

### Class materials

- [Session 20 follow-along](../Modularization/follow_along/Session%2020%20-%20NumPy%20arrays%20and%20numerical%20operations%20-%20follow%20along.ipynb): Model a production run with arrays, matrix operations and plots.
- [Session 20 practice](../Modularization/exercises/Session%2020%20-%20NumPy%20arrays%20and%20numerical%20operations%20-%20practice.ipynb): Apply the session concepts through tracing, code review and independent problems.

### Related tutorials and extra materials

- [NumPy tutorial](../Applied%20Mathematics/tutorials/Numpy%20tutorial.ipynb): Review arrays and numerical operations.
- [Linear Algebra with NumPy](../Applied%20Mathematics/tutorials/Linear%20Algebra%20with%20Numpy.ipynb): Explore vectors, matrices and dimensional reasoning.
- [NumPy arrays exercises](../Applied%20Mathematics/exercises/Numpy%20arrays.ipynb): Additional numerical practice.

---

## Session 21 — Structured data, files and serialisation

**Date:** See the course calendar

**Focus:** Save and recover records while preserving their meaning and structure.

We will read and write text files, represent records as CSV and JSON, distinguish serialisation from file operations, recover data types, and verify round trips. The guided example uses equipment-inspection records.

### Presentation

- [Session 21 presentation outline](../Modularization/slides/session-21-structured-data-serialization-slide-deck.md): Opening activities, explanations and discussion prompts.

### Class materials

- [Session 21 follow-along](../Modularization/follow_along/Session%2021%20-%20Structured%20data%20and%20serialisation%20-%20follow%20along.ipynb): Store equipment-inspection records in CSV and JSON and verify the recovered data.
- [Session 21 practice](../Modularization/exercises/Session%2021%20-%20Structured%20data%20and%20serialisation%20-%20practice.ipynb): Apply the session concepts through tracing, code review and independent problems.

### Related tutorials and extra materials

- [Introduction to Data Manipulation](../Data%20Manipulation/tutorials/Introduction.ipynb): Review structured and tabular data concepts.
- [Files](../Data%20Manipulation/tutorials/Files.ipynb): Review file operations and data formats.
- [Files exercises](../Data%20Manipulation/exercises/Files%20exercises.ipynb): Additional practice with files and records.

---

## Session 22 — Pandas I — Loading, inspection and cleaning

**Date:** See the course calendar

**Focus:** Load tabular data, inspect its quality and apply explicit cleaning rules.

We will create and load DataFrames, select columns and rows with `loc` and `iloc`, filter with Boolean masks, convert types, and handle missing values and duplicates. The guided example prepares campus energy records for analysis.

### Presentation

- [Session 22 presentation outline](../Modularization/slides/session-22-pandas-foundations-slide-deck.md): Opening activities, explanations and discussion prompts.

### Class materials

- [Session 22 follow-along](../Modularization/follow_along/Session%2022%20-%20Pandas%20foundations%20-%20follow%20along.ipynb): Inspect and clean campus energy records while preserving the raw data.
- [Session 22 practice](../Modularization/exercises/Session%2022%20-%20Pandas%20foundations%20-%20practice.ipynb): Apply the session concepts through tracing, code review and independent problems.

### Related tutorials and extra materials

- [Pandas tutorial](../Data%20Manipulation/tutorials/Pandas%20tutorial.ipynb): Review Series, DataFrames, selection and filtering.
- [Pandas DataFrames exercises](../Data%20Manipulation/exercises/Pandas%20Dataframes.ipynb): Additional practice with tabular data; focus on loading, selection and cleaning.

---

## Session 23 — Pandas II — Joins, grouping and analysis

**Date:** 16 November

**Focus:** Combine tables and produce summaries that answer a concrete question.

We will identify keys and table grain, compare joins, check unmatched and duplicate records, sort and group data, reconcile aggregate totals, and visualise results. The guided example combines orders with a product catalogue.

### Presentation

- [Session 23 presentation outline](../Modularization/slides/session-23-pandas-analysis-slide-deck.md): Opening activities, explanations and discussion prompts.

### Class materials

- [Session 23 follow-along](../Modularization/follow_along/Session%2023%20-%20Pandas%20analysis%20-%20follow%20along.ipynb): Join orders to a product catalogue, validate the relationship and summarise sales.
- [Session 23 practice](../Modularization/exercises/Session%2023%20-%20Pandas%20analysis%20-%20practice.ipynb): Apply the session concepts through tracing, code review and independent problems.

### Related tutorials and extra materials

- [Pandas tutorial](../Data%20Manipulation/tutorials/Pandas%20tutorial.ipynb): Review joins, sorting, grouping and aggregation.
- [Pandas code cards](../Data%20Manipulation/exercises/Pandas%20code%20cards.ipynb): Practise reading and explaining data transformations.
- [Matplotlib tutorial](../Data%20Manipulation/tutorials/Matplotlib%20tutorial.ipynb): Review plotting tools for presenting analytical results.

---

## Additional resources

These materials extend the block and are not part of the Sessions 17–23 sequence.

- [Modules](../Modularization/tutorials/Modules.ipynb): Extend function-based organisation across Python files.
- [Object-oriented programming](../Modularization/tutorials/Objects.ipynb): Optional introduction to classes and objects, beyond this block.
- [Serial communication](../Data%20Manipulation/tutorials/Serial%20Communication.ipynb): Revisit communication with external devices from the Arduino unit.
