+++
date = "2021-09-13T00:01:51+02:00"
highlight = true
math = false
tags = ["Projects"]
title = "Selecting Technology"

[header]
  caption = "(c) Hans N. Beck"
  image = "muster.jpg"

+++

## The start ##

Software projects just for fun are exact this: fun. This allows to take every time needed, to try out things and investigate many strategies of implementation.  And this is necessary, because the computer domain today provides many different implementations of the same thing, many levels of abstraction and many many programming languages and technologies. There are game engines, data bases, web frameworks, visualization frameworks etc.

In my case, this idea is two-fold: (new2)

+  a CAD like application which let create and read [USD](https://graphics.pixar.com/usd/docs/index.html) and OpenDrive files for traffic scenario modelling
+  the [Perry Rhodan MMO]({{< ref "perry-rhodan-mmo/index.md" >}}), a game with P2P concept for PC and AR/VR devices

Both projects require the same basic elements of architecture: 

![Basic elements](/src/BasicElements.png)

These elements seems to be obvious:  graphics, logic, persistence. Maybe the communicator could be a surprise, not for the MMO, but for the other thing. In order to elaborate the value of these elements for the resulting application, its role in aggregating functionality together with the other elements for building the behaviour of the application, I'll use the following functions introduced in [this post]({{< ref "ServerAndClient1.en.md" >}}):

| Command              | Description              | Example |
| ---------------------|--------------------------|---------|
| ?(S, A) | Query about the structure, returning A | Are there spaceships on the playfield? A would then contain all the ships with this predicate |
| !(S, S\*) | Applying all applicable rules R on S, resulting in S\*| This would be one tick of the pseudo time clock. For example take the rule that on every place only ship can be. If in the structure S 2 ships will be on the same place that must be a collision |
| +(S, F) | Calculate all effects out from structure S, resulting in new facts F | A spaceship has velocity v. The effect would be that the ship has moved after on tick of pseudotime according its v. The new fact is the new position |
| >(F, S, S\*) | Translate facts which are result of effects into new structure S\*| Look at the ship example above. Because S is a logical structure it may be or not that the new ship positions change something in the logical structure. If the new position induces a collision, then this will be a structural thing. If one ship free in space moves a little bit it will be still a free ship in space.|
| O(X) | Evaluate complexity related to amount of storage or time of X) | O(S) may count the predicates stored in S |

Thes functions are the consequence of my basic approach, to see everything as a combination of structure and effects induced by this structure. One basic example for this is a static charge which induces an electric field. The whole electrodynamics is shaped by structure of charges and currents. Behaviour and pyhsical properties of molecules are determined also by their structure. Having said this, functions related to structure are not inside the graphics element, this one is only showing the effects from the structure. Later I will explain this in more detail.


## The basic choice ##

The selection process for technologies in an commercial project is built on factors like cost and implementation time, sometimes also on knowlegde required from you team. This is necessary and inevitable. And it seems natural given you want to build many similar products like games or cars to aim to have a production system. To be faced with complicated technology decisions every product again and again is a time and cost factor, too. Once decided, it is so helpful if your selected technology stack would carry you through all your projects a long time. 

The alternative is what is expressed best for me with the term "crafting". Every piece of creation is shaped from the way of using the tools, the composition of basic elements using and the basic knowledge about these elements and their creation potential. Every product is the result of a common coincidence of doing, designing and imaginagtion. 

But these charactarizatiion is a little bit weak. To be more precise, I want ot fetch this words and look at them more deeply:

+ time
+ knowledge
+ factors

Assume we want to draw a picture. Let's say the tools for this are the canvas, colors, pencils and brushes. Now I can create a wonderful picture. Using my experience as a drawer, who knows about the effect of colors, perspective, who can observe and see, I paint from the empty canvas until my painting is finished. And finished means: I as the crafter and artist is satisfied.

*Time* would be high, *Knowledge* required would be high, and there are a lot of *Factors* to control.

Now we want to draw man pictures of this kind. One simple way yould be to make a sketch with pencil as a start, and copy this for every picture before drawing. In this way, you would eleminate some factors of composition and shape. If you annotate your sketch with the colors requered of every area in the sketch, some more factors are eleminated. I suppose that the required time is decreased. Using this "technology", our judgment may now this: 

*Time* is mid, *Knowlede* is mid, *Factors* are mid. 


Here the pictures have still some kind of orginiaty: the coloring and the production of the colors carry some uncertainy, or say some uncontrollability which induces variation. 

The pictures are great success. Everyone wants to buy one, so what will we do? We concentrate the steps of sketching and coloring in one step: printing. And in addition, we use standardised colors, meaning the production of the colors follows a exact described algorithm. So your canvas will just be printed. As a consequence, every picture looks nearly equal and is created in a just a moment. Meaning: 

*Time* is low, *Knowledge* is low, *Factors* are low. 

Everything is clear, yes? Unfortunately, things are not that easy. I'm pretty sure (but I can not go into details here, it requires a deep philosophical investigation) that time, knowlegde and factors in sum are not decreasing. They are spreaded over differnt people and domains. To do a printing machine is far from trivial, using such technological beasts not even less. And it is not important if factors, tima and knowledge rooted in the mechanics, the software algorithms or something else of the production machine - like the printer.

The example above let make another observation. In the first case, nothing but the tools limit the design of the picture. Then the variation of shape is given up, then that of the colors vanished. For me that means two things: 

+ the lower the free factor set, the lower the variation. Free factor set means the factors controllable by the creator or user of a production machine
+ the lower the free factor set, the idea of what the product could be is narrowed or predetermined. 

Giving up the shape by using a pre-defined sketch means the idea of a picture is fixed by this sketch. Many production systems show this fact: a printer can only print printable colors and sizes. A game engine is composed of geometric objects moving in space and carring a texture. To extent the limits of your production system it may be necessary to put in a lot of time and knowlege. In a game engine you can create effects not intended as first citizen in the engine, but you have to know details about the engine, shaders, filters etc.

Now, I can preciceise  my criteria for my selection of technology:

+ *time* is the "**time-**" learning and using the tools or the production system and the "**time+**" to create the product
+ *knowledge* is the "**knowlege+**"" I want to learn and  **knowlege-**"" I don't want the learn but need it
+ *factors* are the "**factors+**" of design, the freedom of variation and the "**factors-**" I have to control and I could not control of the tools or production system.



## What is now ##


I started my journey at the requirements an AR/VR device need. Visualization is the plan. Well, I don't deny gaming at all, and to some extent I want to keep a small little backdoor open to this. But the very first reason to look for AR/VR is visualization. To be more precise, 3D graphs is the thing which attracts me. Graphs are exciting, you can do a lot of things with it. But their usefulness depends on what you can recognize. As the AR/VR products become known, my imagination got energy and I saw myself rotate big networks flying in my room, scale them and select nodes with my fingers. 

Now, graphs are not the things offered from the start by the well-known costomer products. Determined by price and availability, I checked Oculus Quest, NReal and Lynx, how to create own software for them, software which are not games in the first place. It turned out that all these devices runs with Android. I never had done anything with android, so the obvious step was to read a little bit about. Then I installed the android studio, and also Idea/J for Kotlin. This was a straightforward thing. The exciting moment was there now, as comes all the time when trying out a new technology: how to get the hello world running on my Ouest? After hours of reading documentation how to use Android I learned there is an Oculus SDK, and a OpenXR SDK. The latter is wounderful, it promise to write AR/VR code once, because, what a great luck, OpenXR is from the Khronos Group. This is the same instution which created the OpenGL standard. Such bright future in mind I tried examples, I updated, tried other examples and got nothing to run. Time heals everything, I thought and headed to another aspect for my projects: logic.

I'm a logic programming guy, I love Prolog and its silbling, miniKanren. If one talk and think about logic programming, Domain Specific Languages (DSL) and the dualism of code and data is not far away. Following down my roots as a philospher, logic programming is connected strongly with creating structures. So it was clear to me, as a condition of my way of thinking and as a objective of research, logic programming has to be in my projects. With SWI Prolog, I have a very nice package to follow this interest. It has a little downside, which I got aware of remembering the big question I have always and every time: how to deploy, how to I get an small executable? Under Windows 10 at this time, SWI Prolog could create an executable, but it was not simple. You have to handle with dlls, and I hate that. This attidued I gained on my work with Pharo Smallalkt, where you can take an Pharo.exe and and image file anywhere on your file system, without installation, without complicated requirements or wired pre-installations, and it just works. Consequently I scanned different implementations of miniKanren, because miniKanren can embbed logic programming in every standard programming language. So easy I thought, but as time goes on I learned that many implementations are not complete, do hard compromises because of the language it was implemented in and more. The orignial miniKanren, a wonderful small but powerful thing, was implemented in Scheme. When trying out Kotlin, which was a natural consequence beacuse of my AR/VR tests, I found and microKanren implementation looking promising. So yay, I could do Android code with Kotlin and logic and the solution of the OpenXR problem my come in future. 


At this time, I thought about doing Computer Graphics (CG). To be honest, I like the simple way, I like if things are easy. Structural easy. And I want to understand whats going on. Curious as it is my nature, I tried out the big Game Engines, Unity, Stride and took also a short look to Godot. Hey, they can ready for all important plattforms, even Oculus and others. Maybe a game engine solve my render problem for AR/VR devices? A great look, the installation was easy, and there a very good tutorials for learning. And more tutorials, and more, video tutorials, many hours long in sum. After some first tutorials I got the principle, and I also understand the basic mechanisms of this production tool. But I'm also dissolved in the mechanisms and thinking of that engines. Graphics is a scene graph, graphics has nodes and scripts etc... With some melancholy I remembered the wounderful books of Jim Blinn, "A trip down the graphics pipeline", where I learned to think about your problem and optimze the right things. Graphics there was an algorithm, not an product of an heavy framework do magic things for you. At this point I decided: no. No game engine, maybe as fall back, if the AR/VR render problem remains, but not from the beginning. 

So, which is also a some mood of mine, I've done the straight opposite: I started to learn Vulcan. But not by using C++. I don't like C++, have used it in some jobs, and I got more and more the impression during this time that it is complex even for simple things. C is wounderful, clear, easy and full of potential. Looking in more detail about graphics, even AR/VR, games it came out that C and C++ are still the base, the dirt needed that everthing can growing. So really, am I really required to do C? What are about the logic programming? And then I learned about [Racket](https://racket-lang.org), a modern Scheme. 

The wounderful thing at Racket is it great ability to connect to C. It has a very clever FFI packages which seems to enable the programmer to create a binding to a C header really easily. Oh happiness!. And the best: it is Scheme, meaning there is the best miniKanren implementation available. Next step therefore was clear, learning Vulkan with Racket. God damn, but to use Vulkan it is needed to use GLWF3, which is a plattform independent C++ library for managing windows and canvases for OPenGL and Vulkan. After getting some small panic, I got the Racket binding for GLFW3 running, and thanks to the universe, my train is rolling, I can proceed. 

Still there questions left, the way of communication and persistence was open. Related to the persistence, it was clear that logic and non-sql data bases fit best. Well, it is an assumption, but induced by experience with relational dbs and graph dbs. For my job I used the triple store of SWI Prolog, and it worked very well. Of course it may not the only type of data base which matches the thinking and modeling of logic programming. But I was used to it. Therefore I started an survey of triple stores in different programming environments. Java has one from the Apache project, the Jena project. This should work theoretically with Kotlin, so may Android/Java/Kotlin chain would work. What happiness! But bad, for Racket I could not found an attractive package connecting to non-sql databases or implementing them directly. The bad feeling was healed a little bit that there are embeddable non-sql stores with C headers, for example unqlite. Uff. 

Once upon a time...I got in contact with the [Croquet](http://www.opencobalt.net/) project (current incarnation [Croquet.io](https://croquet.io/)). It was about serverless distributed computing, by replicating operations on every node. Instead of broadcast data, which is common today, thy broad cast the operations in exact this time sequence on every node. This was the root that I'm still interested in blockchain and its P2P approach. I read a little bit of the Ethereum documentation and dreamed about to introduce a P2P like network replicating logical queries. But there was another ingredient, rooted in my history. It was [XMPP](https://xmpp.org/), or Jabber, as it was called in earlier days. All these things let grow my dream of building a network of small nodes talking over such a simple protocol like XMPP. And if I say "talking" this means communication in the best sense, not just exchange of some data. My first contact with such package oriented communication was the ASTERIX protocol still used in the Air Traffic Control domain. And to be honest, yes some SciFi movies too put petroleum in the fire..... Taking this spirit with me I read and searched and read. After some time, I got to know that not much XMPP implementations are available - but one for Java is there! Racket and logic programming seems to fit if I would have to implement my own XMPP. This protocol is not hard, it is easy to understand, so go on! Lightweight server components are available, top!

.Net, Hololens, processing

From this journey, I learned a lot about myself and what I want. The latter is connected with my very nature, evolved over many years of programming jobs, engineerin jobs and the experiences lived through. And this is the most important point:

> + Things are easy. Everything in the universe is easy in its nature and roots. And therefore, I want to create things build on easy, understandable things.
> + I want to express ideas and way of thinking in the way my applications are implemented. If I'm free of commercial constraints, and as a hobbist I am, neither time nor effort is important. The expression is important.


Our world of computing is constraint from multiplicity - many things are many times implemented - and variability - every implementation lacks some important points. Therefore production systems have their value if commercial or time constraints for creating a product hold. 



## What may be ##

