# Reasoning with AI

## Introduction

Conversational Artificial Intelligence (AI) assistants like [ChatGPT](https://chat.openai.com/), [Gemini](https://gemini.google.com), or 
[Copilot](https://copilot.microsoft.com) are becoming increasingly popular tools that can really step up
your game in the world of programming, no matter what your current level is. In this Notebook we are going to explore
the capabilities of conversational AI and how it can be used to help you with your programming problems. As the online book, this
section focuses on beginner level exercises, but the same principles can be applied to more advanced problems.

One of the main goals of using AI assistance is to be practical and shift the focus from rote coding and theoretical
knowledge to understanding the key concepts and how to apply them in real life.

We will be using the ChatGPT website to reason with the assistance and learn faster and better how to write code. In the
very unlikely case that you are not familiar with the website, you can check
the [ChatGPT website](https://chat.openai.com/) to get more information. This entry is largely based on
the [ChatGPT blog post Prompt
Engineering](https://platform.openai.com/docs/guides/prompt-engineering), and the research paper [Assigning AI: Seven
Approaches for Students, with Prompts](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4475995) by Ethan and Lilach
Mollick.

Basically, this page provides few basic **prompt engineering** tips adapted to the course. A prompt is a piece of text
that you provide to ChatGPT with instructions to produce the result you want. Entering a prompt in the chat will trigger
a response from an AI model. Prompt engineering is the process of designing, curating, and storing for later use prompts
that are very useful for a specific purpose. In this case, we are going to use prompts to reason with the AI model
behind ChatGPT to help us learn how to code and get inspired to create new interesting projects.

The combination of exercises and AI reasoning can be really powerful and in that sense, the following sections will
provide some sample prompts that can help you use ChatGPT to adapt the learning rate to your specific needs. It will not
only help you to get an answer, but also to understand the how and why behind it, which is invaluable for deeper
learning and application.

## General prompting tips

![general prompting tips](img/ChatGPT_prompting_tips.png)

### Tip 1: Do not give up reasoning - Use AI as an assistant 🤔

Before you start using AI assistant, make yourself the following question: Why should I walk if there are electric
scooters out there?
To reflect on this question, take a look at the following clip from Pixar's movie Wall-e:

<iframe width="560" height="315" src="https://www.youtube.com/embed/Yw7WAq_GZY8?si=TswGg0jspEhG4Jsx" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

The movie depicts a future were humans have delegated all physical tasks into robots. What are the consequences? Well,
in the movie, humans are barely able to move. Actually, while it is a very unlikely future for humanity, it is a very
likely future to individuals that do not exercise their bodies. Evolution has given our body precise tools to become a
very efficient machine in terms of energy consumption, and since muscles consume a lot of energy, it happens that  
our body does not develop muscular tissue if it is not needed.

The development and maintenance of the connections in our brain is ruled by the same principles. So, try to think what
could happen if we externalize the learning process entirely to AI reasoning.

Instead, we need to use AI as a **reasoning tool**, a tool we use to reason more effectively. For instance, it is ok
to use AI reasoning to get help to do exercises, but it is very important that you try to solve the exercises first.
This will help you understand the problem better and also give you a chance to think about the solution. Remember that,
if you are stuck, you can always ask ChatGPT for help, but just the act of trying is already a big step forward in your
learning process. Additionally, if you get an answer on your own, you can always ask ChatGPT to check it for you and
give you feedback, tell you where you went wrong, or even give you a hint on how to solve it. So, don't be afraid to try
and fail, because that is the best way to learn.

For instance, you can use ChatGPT as an interactive assistant to help you solve the exercises. For instance, start a
conversation with this prompt:

:::{admonition} Sample prompt
:class: hint
You are an upbeat, encouraging tutor who helps Python programming students understand basic concepts by helping them
to solve problems and to answer analysis questions.
Start by introducing yourself to the student as their AI-Tutor who is happy to help them and ask for
the exercise or analysis question they want to solve. Wait for the response.
Once you have read the exercise or analysis question, give the student an answer acknowledging that you understand the
exercise and ask the student what is the answer so far. Wait for the response.
Assess their level from the response and specifically ask them about their level and performance in the course. Wait for
the response.
Given this information, help students solve the exercise and lead them to the solution. Do not provide the right answer
to the question in your answers. Instead, guide the student to the solution by asking leading questions, identifying and
explaining key concepts, potential problems, and providing hints.
If the students are struggling with the exercise, try to give them a partial solution and ask them to complete the task,
but do not provide the complete answer unless the students says "I give up, give me the right answer".
Wait for the response. Once the student has solved the exercise, move the conversation to a close and tell them you are
happy to provide further assistance.
:::

Then, in your next prompts, you can provide the exercise or analysis question you want to solve. Once you have found out
the right answer, you can ask ChatGPT to explain the answer for you and help you deepen the knowledge following the next
tips.

#### Turn your prompts into reasoning tools

The prompt in the example has been specifically engineered to turn your AI assistant into an AI tutor. However, this is
not the only role that an AI assistant can take to help you reason with problems. According to [Ethan and Lilach
Mollick](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4475995), there are seven different approaches to use AI
assistance as a tool to reason with when learning:

| **Role**      | **Description**                                                                                                                                                                                                                                                            |
|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **MENTOR**    | Provides feedback to guide learning, offering insights and suggestions that encourage critical thinking, reflection, and personal growth. Engages in discussions that help students evaluate their progress and identify areas for improvement.                            |
| **TUTOR**     | Offers direct instruction on specific topics, breaking down complex concepts into simpler parts, and providing step-by-step explanations. Adapts teaching methods to the student's learning style and needs, aiming to clarify doubts and enhance understanding.           |
| **COACH**     | Encourages self-reflection and self-regulation, prompting students to think about their learning strategies, goals, and progress. Helps students build confidence and develop skills in decision-making, problem-solving, and overcoming challenges.                       |
| **TEAMMATE**  | Collaborates as a member of a learning team, offering different viewpoints and solutions to enhance team performance. Provides support, motivation, and constructive criticism, fostering a sense of camaraderie and shared purpose among team members.                    |
| **STUDENT**   | Takes on the role of a learner, asking questions and seeking explanations to understand concepts better. Simulates the behavior of a student who is curious, eager to learn, and willing to explore new ideas by engaging with the material from a beginner's perspective. |
| **SIMULATOR** | Provides scenarios and exercises for deliberate practice, allowing students to apply their knowledge and skills in a controlled environment. Offers opportunities to practice problem-solving, critical thinking, and decision-making in simulated real-world contexts.    |
| **TOOL**      | Acts as an aid to accomplish specific tasks, helping students perform calculations, organize information, or generate ideas more efficiently. Assists in breaking down tasks into manageable steps and provides suggestions and shortcuts to save time and effort.         |

Now, let us decompose the sample prompt above to provide general guidelines you can use to use any of these approaches. 
These steps are also based on [Ethan and Lilach
Mollick's research](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4475995):

1. **Tell the AI what is the role it must take**. In the example, the sentence "You are an upbeat, encouraging
   tutor ..." is used to configure the AI assistant as a **tutor**, but you can
   change it to adapt it to the specific use of AI that you are using, for instance, "For example, you are a friendly,
   helpful mentor that gives students".
2. **Tell the AI what is the end goal of the reasoning process.**  The sentence, "who helps Python programming students
   understand basic concepts by helping them
   to solve problems and to answer analysis questions." in the sample prompt is telling the AI what is the end goal you
   are
   using it for. Remember to clearly specify the goal in your prompts. For instance, help you with exercises, explain
   you
   complex concepts, help you organise your time, prepare an exam, or come up with ideas for an assignment. The
   possibilities are endless! .
3. **Give detailed instructions** We will delve into this concept in the next tips, but it is really important that you
   provide the AI assistant a clear picture of what you expect. Note that in the sample prompt we provide a description
   of when we expect interactions (e.g. "wait for the next prompt"). It is important that you provide guidelines and
   step-by-step instructions for the assistant. For instance, you can provide an exercise and ask the tool to
   help you understand [the concept/topic/problem] and then provide you similar exercises for you to solve.
4. **Personalize your prompts**. Note that the prompt template is personalized for computer science students. The
   AI assistant will use this context to personalize it responses. You can adapt this personalization to better tailor
   the
   answers to your specific needs. For instance, you can specifically mention your
   level [familiar but not deeply knowledgeable about
   the topic/are new to the topic].
5. **Add pedagogy**. Remember, you want to use AI assistance to learn, so it is important that you add instructions to 
   render the assistant into a pedagogical tool (a tool that helps you to learn). In the prompt, sentences like "help 
   students solve the exercise and lead them to the solution." or "Do not provide the right answer to the question in 
   your answers. Instead, guide the student to the solution by asking leading questions." have been added to make sure 
   it works as an efficient tutor. As you use the tool, do not hesitate to correct it and provide further guidance to 
   make sure it behaves as instructed. 
6. **Add constraints**: This is related to point 3 above. It is important that your instructions include constraints
   that specifically tell the AI assistant the output that you expect. **Providing examples**, **Specifying the length 
   of the output**, or **using templates** are good techniques you can use to make sure the output is as expected.

### Tip 2: Give ChatGPT context 🌍

It is important to give ChatGPT the right context about the field, the subject, and your background.
Clearly, it is a really powerful tool, and you can just copy the description of the problem and paste it into the chat
window and ask for a solution in Python. However, it is important to give ChatGPT some additional context to help it
understand the problem better and give you a more accurate answer. For example, if you are a beginner, you can tell
ChatGPT that you are a beginner and that you are trying to learn how to code. This will help it understand that you are
not an expert and that you need a more detailed explanation. On the other hand, you can also tell ChatGPT what are you
studying so that it can better contextualize responses (for instance real-world application examples).

For instance, once you have configured your assistance, you can start a prompt with the following text:

:::{admonition} Sample prompt
:class: hint
I am a student of Engineering and Management, and I am taking a course on Computer Programming with Python. The
following
exercise is part of the unit on Python built-in functions, and I am trying to solve it: "Write a Python program to find
the largest number among three input numbers provided by the user." Remember that I do not want you to provide the
solution. wait for my answer to the exercise and then guide me to the solution.
:::

This will give ChatGPT the context it needs to understand the problem better and give you more accurate answers.

### Tip 3: Be specific 🔍

Note that providing context does not mean that you have to write a whole lot of text. In fact, it is better to be as
specific as possible. Following the example above, if you are trying to solve a problem, you can tell ChatGPT what you
have tried so far and what you are stuck on. This will help it understand the problem better and give you a more
accurate answer.

For instance, when ChatGPT asks you what you have tried so far, you can complete the prompt with the following text:

:::{admonition} Sample prompt
:class: hint

    I have tried to solve it by using the max() function, but I am not sure if it is the right approach. This is the code of my solution:

    num1 = input("Enter first number: ")

    num2 = input("Enter second number: ")

    num3 = input("Enter third number: ")

    largest = max(num1, num2, num3)

    print("The largest number is", largest)

    Tell me if the approach is correct and if so, fix the code for me. If the approach is not correct, please provide an alternative solution in Python.

:::

Normally, what really works for me is to provide high-level context in the first sentences and then very specific
instructions in the last sentences.

#### Use delimiters to clearly indicate the code parts of your input.

In the last prompt, we combined code parts and natural language parts in the same prompt. In these situations, it is
convenient to use **code delimiters** (triple quotation marks) to let your assistant clearly know what is actually your
code. For instance, you could update the last prompt as:

:::{admonition} Sample prompt
:class: hint

    I have tried to solve it by using the max() function, but I am not sure if it is the right approach. This is the code of my solution:

    ```python
    num1 = input("Enter first number: ")

    num2 = input("Enter second number: ")

    num3 = input("Enter third number: ")

    largest = max(num1, num2, num3)

    print("The largest number is", largest)
    ```

    Tell me if the approach is correct and if so, fix the code for me. If the approach is not correct, please provide an alternative solution in Python.

:::

Note that we have entered our code inside triple quotation delimiters. Before and the start of the code, we added new
lines, first to tell the AI assistant that the next lines are Python code:

```markdown
```python
# Enter your code here
```

And finally, after the code, a new line with triple quotation delimiters to tell the assistant that the code snippet
is over. This way the AI assistant does not need to figure out which parts are code and which ones aren't, improving the
results.

### Tip 4: Divide and Conquer — Split Complex Tasks into Smaller Subtasks

When working with AI assistance, tackling a complex task all at once can be overwhelming for your assistant and may lead
to vague or incomplete responses. Instead, try to break down the complex task into smaller, more manageable subtasks.
This "divide and conquer" strategy allows the AI to provide more specific and accurate information, step-by-step, which
you can then combine to solve the larger problem. By focusing on one subtask at a time, you can refine your
understanding, identify any gaps, and progressively build toward a complete solution.

For instance, imagine that you would like to use AI assistance to come up with an original IoT application for smart
homes. A prompt like this could yield interesting results:

:::{admonition} Sample prompt
:class: caution

    How do I design a smart home IoT system?

:::

By trying to solve a complex task in one step, you are hindering the AI assistant's ability to provide useful insights.
Instead, you could try to divide the complex problem into smaller parts, using a bottom-up approach. For instance,
following the example, we could start asking the AI what is the hardware typically used in the smart home domain:

:::{admonition} Sample prompt
:class: hint

    I am a student of Engineering and Management and I am taking a course on Computer Science. As par of the course, I 
    need to ideate an original IoT system project and implement a proof of concept using Arduino and Python. I decided 
    that my project should be a smart home IoT system. In my next prompts, I am going to ask you some questions to help 
    me design an IoT system that is desirable (answers to real user needs), feasible (I can implement a proof of 
    concept during the course, and viable (it is economically viable and scales up). First, can you explain what sensors 
    and actuators are typically used in smart home IoT systems?

:::

By addressing one specific aspect of the system at a time (in this case, the most fundamental aspect, the hardware), you
not
only give the AI assistant the opportunity to provide more refined answers, additionally, you gain a clearer
understanding of the solution, and have the opportunity to guide the AI assistant and personalise the solution. In the
next prompts, following the example, you can provide specific interests and context to make the IoT project yours, for
instance:

:::{admonition} Sample prompt
:class: hint

    I live in Valencia (Spain), and water is a very scarce resource. I am interested in the use of water leak sensors to 
    detect water leakages. In your answer, you mentioned that I could use this information to control water shut-off 
    valves to prevent flooding. What other sensors and actuators could I incorporate into my project to improve water 
    efficiencies in south east Spain?

:::

#### Using AI to debug your code

You can also use this strategy when you are coding, to **debug** your code. Code debugging is the process of
identifying, analyzing, and fixing errors or bugs in a program's code to ensure it runs correctly and efficiently.
It involves systematically testing the program, understanding the causes of errors, and modifying the code to eliminate
issues and improve performance.

For small project, you can just copy the code and paste it in a prompt and ask your AI assistant to fix it for you.
However, if you do so, you will not learn what was the cause of the problem in the first place, how to identify it by
yourself (so that you can program more efficiently in the future), or what are other common mistakes can cause the same
type of error. Now, if you think of larger projects, note that all these will be valuable insights, so you can always
use this strategy no matter how large your project is.

For instance, imagine that you are testing your program, and you get a ```SyntaxError``` error. Before you try to fix it
with AI assistance, you could use AI to answer the following questions:

:::{admonition} Sample prompt
:class: hint

    I am currently studying a Bachelor degree´s on Engineering and Management and I am taking a course on computer 
    science. We are learning Python using Google Colabs as programming environment. I am trying an exercise and I got a
    ```TypeError``` in my script. How do I identify the source of a TypeError in my Python script?"

:::

Next, you can continue to deepen your understanding of the problem by asking what are other common causes of the same
problem so that you do not stumble on it again (at least not so frequently):

:::{admonition} Sample prompt
:class: hint

What are common causes of SyntaxError in Python?

:::

And, next ask how to resolve them or avoid them:

:::{admonition} Sample prompt
:class: hint

How can I resolve syntax errors in Python?

:::

This will level up your game, providing you insights on the type of error and helping you to avoid it in the future!

### Tip 5: Deepen your understanding 🌱

You do not need to stop at the answer, you can also ask ChatGPT to explain the answer to you. This will help you
understand the problem better and also give you a chance to think about the solution. You can also ask for alternative
solutions, relate to your field (Engineering and Management), or even ask for a real-world application example. For
instance, you can continue reasoning with the following prompts:

:::{admonition} Sample prompt
:class: hint

    Can you explain step-by-step the solution to me? Summarize what each line of code is doing.

:::

:::{admonition} Sample prompt
:class: hint

    What are the key programming concepts that I need to understand to solve this problem?

:::

:::{admonition} Sample prompt
:class: hint

    Are there any built-in functions or Python standard library tools that can make the solution easier?

:::

:::{admonition} Sample prompt
:class: hint

    Is there more whan way to solve this? Can you give me an alternative solution in Python?

:::

:::{admonition} Sample prompt
:class: hint

    What are common pitfalls or mistakes to avoid in this type of exercise?

:::

:::{admonition} Sample prompt
:class: hint

    Why is this type of exercise important for my field (Engineering and Management)?

:::

:::{admonition} Sample prompt
:class: hint

    Can you give me a real-world application example of this type of exercise?

:::

:::{admonition} Sample prompt
:class: hint

    I got this error message: "TypeError: '>' not supported between instances of 'str' and 'int'". What does it mean and how can I fix it?

:::

After getting an answer or explanation, spend a moment reflecting on it and try to understand it. Compare the answers
with other sources (for instance this book) and make sure the answer is consistent, or if you find anything that you
would do differently according to other sources, reason with ChatGPT to understand why. This reflection process is very
important for your learning process and will help you consolidate the knowledge you have gained.

### Tip 6: Test the knowledge you have gained 📝

You can use ChatGPT to test yourself, asking it to propose similar exercises, open analysis questions, and test
questions. This will help you consolidate the knowledge you have gained and also give you a chance to think about the
solution. For instance, you can continue reasoning with the following prompts:

:::{admonition} Sample prompt
:class: hint

    Can you propose a similar exercise for me to solve?

:::

:::{admonition} Sample prompt
:class: hint

    Can you propose five test questions related to the programming concepts used in the solution of this exercise for me to solve?

:::

:::{admonition} Sample prompt
:class: hint

    Can you propose five open analysis questions related to the programming concepts used in the solution of this exercise for me to solve?

:::

### Tip 7: Verify and cross-check ✅

It is always a good idea to test the code you have received from ChatGPT. You can do this by running the code in your
computer and checking the results. For instance, you can just create a new Python file and paste the code you have
received from ChatGPT. Then, you can run the code and check the results, or even better, create
a [Jupyter Notebook](Jupyter%20Notebook%20Hello%20World.ipynb) to log your learning process and test the code (more on
this later). You should also verify and double-check the information you receive, while the assistant is quite accurate,
checking other sources will definitively help your comprehension and retention.

### Tip 8: Document Your journey 📔

Maintaining a journal or log where you save the prompts you find useful, the answers you received, and the code you have
tested is a great way to document your learning process. This journal will serve as an excellent review material and
help you reuse the prompts you found useful in previous lectures.

As a piece of advice, create your journal as a collection of Jupyter Notebook files. For instance, open in Collabs the
class exercises file companion to each lecture and use it as a template of your coding journal. Then, you can add your
prompts and the code you have received from ChatGPT and test it. Make sure you ask ChatGPT to explain the code to you
and also ask for questions and alternative problems (as per previous tips). Also, you can add your own notes and
comments to the notebook. This will help you document your learning process and also create a great review material for
your exams.

### Tip 9: Share your prompts 👫

You can share your prompts with your fellow students, particularly those that you find more interesting. As each one of
you will have a different and personalized reasoning experience, your conversations will be different and sharing them
with each other will help you learn faster and better.

I would also like to encourage you to share your prompts and responses you find interesting with your teachers. This
will help them understand your learning process better and also give them a chance to provide you with additional
feedback and guidance.