+++
date = "2022-05-17T18:00:00+01:00"
publishdate ="2022-05-16"
highlight = true
math = false
tags = ["Programming", "Basics"]
title = "Form of Systems"

[header]
  caption = "(c) Hans N. Beck"
  image = "bricks.jpg"

+++

### One Question

Beeing a programmer, I always was faced with systems. Big systems, small systems, interconnected system, operating systems and more. Although computer science is not as old as the mechanic engineering, and despite computer science is deeply rooted in mathematics, the "science" is on the way to become an "engineering". Everyone touched computers professionally learned about models, algorithms, data structures and enginneering tools like UML, high level programming languages, requirements and much more. 

I've got introduced to many programmers, professionals as well as hobbists. After a lot of talks with them and cooperation as well as own practices, I still have no clear insight how to build a system from an engineering perspective. And this is strange, because I'm an electronics engineer. As such I've learned the building blocks of electronics, the basic parts like resistors and transistors, digital logic, electro-magnetics and how to assemble them. Every thing has its role, its place in the world of physics and it the world of engineering, too. *But what are the constituting elements of software?*

### Path through the Programmers World

My professional carrier started 30 years ago as software developer. During this time I've got introduced to a lot of programming languages. Some were nice, some helpful. Three of them had the most influence on my working and thinking, and these are **Smalltalk**, **LISP** and **Prolog**.

The story **Smalltalk** told me is that everthing can be thought as a network of communicating objects. Today, the concept of objects has many interpretations, but as it belongs to Smalltalk, an object is just a unit receiving and sending messages and is capable of computing in any form. The simple but powerful mechanism of the language Smalltalk allows even functional style, and of course objects could be aggregated, building subnetworks or just describe records.  

From  **LISP** I learned what can be one by just this simple model of manipulating lists by functions. Arranging data in lists was an efficient way to do calculations of the elements, and together with functions concatenating or dividing lists, sorting them give a powerful tool in the hand of coders. 

It's not a long time ago when I meet **Prolog**. Suddenly, calculation or algorithms were pushed to back stage, the logical structure of data - or better what is known and what is to be find out - now was prominent on stage. Of course, data structures is im an important thing in any programming languange, but in Prolog these data structure were pushed many levels up to a knowledge management. 

These languages, Smalltalk, Lisp and Prolog pushed things in the light which may be good candidates to be the building blocks of software from an engineering perspektive. And they are: 

-  data processing, meaning there organisation and access
-  number processing, meaning all computation what every computer does since bits are pushed around from a CPU 
-  message processing, meaning the excange of data

### One Question, more Precise

We all know the methods of *top down* and *bottom up*. Sometimes it seems that discussions are induced with the energy of a war. A system is built to fullfil some needs. Elements are not completly free to choose, because not every element required is available on the market, or need such hughe investmens of money or time to draw it unreliable. Consequently, a system designer has to look what its element set provides, meaning that bottom up has its value. 

At this point, I would like to transform the question "what are the constituting elements of software" to "what determins the form of software", what are the formal, material and effective causes, as Aristotels would ask.

Many applications today are built on a lot of different libraries. From practice, this seems natural, because in a money driven world costs for implementing something want to be  kept low as far as possible. But the question is, if the inner idea and logic, the Aristoteles causes of the libraries used determine the form of the system too much, narrow its possibilities to much. So we have another transformation of the basic question: 
*"What narrows the potatial form of the system?"*
As an example consider the common task to draw some graphics on the screen. This can be done by the very basic API of a Vulcan or DirectX device driver. This is so-called low level, you have to setup camera, buffers and nearly everything of the graphics pipeline with a lot of API calls. More abstraction is provided by 2D/3D Graphics library, which allows you to thing in geometric shapes and device independend Coordiante systems. At high level there are Graphic Engines, which render everthing on every device they support. Now you have things like collision, sound, movement of many objects, and yes, the model of thinking is now less graphics, much more objects with behavior.

The different abstraction level and thinking model can be observed at the API. The Vulcan API allows to do nearly everything the graphics hardware can do, but your thinking is bound to the material and formal cause of this hardware. You have maximim freedom to shape the effective cause. The great demo szene shows what can be done if everthing of the hardwar is under control of the programmer The game engine let you do only for what the game engine is designed for - 2D games, 3D games, sprites. A good engine still allows a lot to do what the hardware provides. But your influces as a programmer HOW this is done is limited. That means, the formal and material cause is defined by the game engine, the effective cause is predefined.

Now, in ouer daily buisness this all makes sense. Graphic professionals can code their knowledge in game engines, and the user of game engines can focus on its game buisness. But this game artist has to agree about the models and ideas, or in other words it has to be accepted the material, formal effective AND ideal causes of the library or subsystem designer!

Material and Formal Cause at one side, effective Cause and ideal Cause have theirfore much influence of the material, formal and effective cause of the everall system build from theses elements (libraries, subsystems)

### Data are not equal to data

und 

{{< figure src="/img/svg_test.svg" class="myimg" title="SVG TEst" width="100" height="100" >}}

Basic parts of a system are 
-  !(S, S\*) Structure change - What are structures for data, message sending computation systems
- +(S, F) Effect triggering
- \>(F, S, S\*) Effects changing structure











 