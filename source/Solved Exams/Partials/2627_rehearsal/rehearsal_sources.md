# Ensayo resuelto: selección y notas

El original `main.tex` no se modifica. Las unidades 1 (CPU) y 3 (Arduino) se conservan literalmente, incluidas sus soluciones. Se asume que son las unidades de Gabriel Modia por la estructura del examen. Las seis preguntas Python proceden de los notebooks de práctica; se añaden soluciones y puntuaciones. Q3 incorpora un fragmento de código ilustrativo y Q6 aclara las variables entre paréntesis.

Todos los notebooks están en `source/Introduction/exercises/`. Las celdas se numeran desde 1 e incluyen Markdown.

| Ensayo | Notebook | Pregunta original | Celdas | Puntos |
|---|---|---|---|---|
| Q1 | Session 04 - Python execution, functions and libraries - practice.ipynb | Scenario 4 — Requesting a concise import | 30 | 0.375 |
| Q2 | Session 05 - Variables, types and numeric operations - practice.ipynb | Scenario 2 — Packing devices | 27 | 0.375 |
| Q3 | Session 06 - Boolean expressions and selection control flow - practice.ipynb | Scenario 4 — Secure document access | 27 | 0.375 |
| Q4 | Session 08 - Loops, lists and visualisation - practice.ipynb | B7. Diagnosing an index error | 33 | 0.375 |
| Q5 | Session 06 - Boolean expressions and selection control flow - practice.ipynb | A7. Prioritise outcomes | 17, 18 | 0.75 |
| Q6 | Session 08 - Loops, lists and visualisation - practice.ipynb | A5. Preserve a running series | 14, 15 | 0.75 |

## Verificación y notas

- Q3 añade una plantilla `if` con `<condition>` para contextualizar las opciones.
- Q5 trabaja `if-elif-else`, prioridades y el límite de 5 segundos, sustituyendo la conversión de tiempos.
- Q6 identifica `initial_users` y `new_users_by_week` entre paréntesis.
- Se mantienen los valores y las opciones de los notebooks originales.
- Soluciones Python verificadas por ejecución y comprobación de condiciones.
- Se mantienen las erratas de puntuación originales y se explica cómo obtener 10 puntos en las notas del profesor.
- Las soluciones Arduino originales cuentan repetidamente mientras se mantiene pulsado el botón. Las notas explican esta limitación y ofrecen una solución por flanco para entradas sin rebote, sin añadir tareas al ensayo.

## Compilar

Desde este directorio:

```sh
pdflatex -interaction=nonstopmode -halt-on-error rehearsal_solved.tex
pdflatex -interaction=nonstopmode -halt-on-error rehearsal_solved.tex
```
