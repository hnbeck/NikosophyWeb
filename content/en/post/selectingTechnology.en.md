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

### The start ###

Software projects just for fun are exact this: fun. This allows to take every time needed, to try out things, investigate and learn many strategies of implementation.  And this is necessary, because the computer domain today provides so many different implementations of the same thing, many levels of abstraction and many many programming languages or technologies. There are game engines, data bases, web frameworks, visualization frameworks etc. 

Thats what I faced when I got the idea to start these projects:

+  a CAD like application which let create and read [USD](https://graphics.pixar.com/usd/docs/index.html) and [OpenDrive](https://www.asam.net/standards/detail/opendrive/) files for traffic scenario modeling
+  the [Perry Rhodan MMO]({{< ref "Perry Rhodan MMO" >}}), a game with a P2P concept for PC and AR/VR devices


Both projects require the same basic elements of architecture: 

![Basic elements](/src/BasicElements.png)

These elements seems to be obvious:  graphics, logic, persistence. Maybe the communicator could be a surprise, not for the MMO, but for the other thing. In order to elaborate the value of these elements for the targeted application, its role in aggregating functionality together with the other elements for building the overall behaviour, I'll use the following functions introduced in [this post]({{< ref "ServerAndClient1.en.md" >}}):

| Command              | Description              | Example |
| ---------------------|--------------------------|---------|
| ?(S, A) | Query about the structure, returning A | Are there spaceships on the playfield? A would then contain all the ships with this predicate |
| !(S, S\*) | Applying all applicable rules R on S, resulting in S\*| This would be one tick of the pseudo time clock. For example take the rule that on every place only ship can be. If in the structure S 2 ships will be on the same place that must be a collision |
| +(S, F) | Calculate all effects out from structure S, resulting in new facts F | A spaceship has velocity v. The effect would be that the ship has moved after on tick of pseudotime according its v. The new fact is the new position |
| >(F, S, S\*) | Translate facts which are result of effects into new structure S\*| Look at the ship example above. Because S is a logical structure it may be or not that the new ship positions change something in the logical structure. If the new position induces a collision, then this will be a structural thing. If one ship free in space moves a little bit it will be still a free ship in space.|
| O(X) | Evaluate complexity related to amount of storage or time of X) | O(S) may count the predicates stored in S |

These functions are the consequence of my basic approach to see everything as a combination of structure and effects induced by this structure. One basic example for this is a static charge which induces an electric field. The whole electrodynamics is shaped by structure of charges and currents. Behaviour and pyhsical properties of molecules are determined also by their structure. Having said this, functions related to structure are not inside the graphics element, which is intended to show the effects from the structure. Later I will explain this in more detail. But the allocation of functions would be:

+ Graphics -> +(S, F),  >(F, S, S\*)
+ Communication -> replicate +, >, !, ? functions
+ Logic -> !(S, S\*), ?(S, A)
+ Persistence -> make S persistent

So far the theory and what was my start. I will tell you here about my journey for selecting technologis for put the elements above into reality. But first some other consideration.


### The basic choice ###

The selection process for technologies in an commercial project is built on factors like cost and implementation time, sometimes also on knowlegde required from the allocated team. This is necessary and inevitable. And it seems natural given you want to build many similar products like games or cars to aim to have a production system. To be faced with complicated technology decisions every project start again and again would be a time and cost factor, too. Once decided, it is so helpful if your selected technology stack would carry you through all your projects a long time. 

The alternative is what is expressed best for me with the term "crafting". Every piece of creation is shaped from the way of using the tools, the composition of basic elements using and the basic knowledge about these elements and their creation potential. Every product is the result of a common coincidence of doing, designing and imaginagtion. 

But these charactarizatiion is a little bit weak. To be more precise, I want ot fetch this words and look at them more deeply in order to get a better description of the topic:

+ time
+ knowledge
+ factors

Assume we want to draw a picture. Let's say the tools for this are the canvas, colors, pencils and brushes. Now I can create a wonderful picture. Using my experience as a drawer, who knows about the effect of colors, perspective, who can observe and see, I paint on the empty canvas until my painting is finished. And finished means: I'm satisfied as crafter and artist.

*Time* would be high, *Knowledge* required would be high, and there are a lot of *Factors* to control.

Now we want to draw many pictures of this kind. One simple way may be to make a sketch with pencil first and copy this one for every picture on the new canvas before drawing. In this way,  some factors of composition and shape are eleminated. Annotating our sketch template with the colors required at every area of the sketch will eleminate even more factors. I suppose that the required time is decreased now. Using this "technology", our judgment may now this: 

*Time* is mid, *Knowlede* is mid, *Factors* are mid. 


Here the pictures have still some kind of orginality: the coloring and the production of the colors carry some uncertainy or some uncontrollability which give room for variation. 

The pictures are great success. Everyone wants to buy one, so what will we do? We concentrate the steps of sketching and coloring in one step: printing. And in addition, we use standardised colors, meaning the production of the colors follows a exact described algorithm. So your canvas will just be printed. As a consequence, every picture looks nearly equal and is created in a just a moment. Meaning: 

*Time* is low, *Knowledge* is low, *Factors* are low. 

Everything is clear, yes? Unfortunately, things are not that easy. I'm pretty sure (but I can not go into details here, it requires a deep philosophical investigation) that time, knowlegde and factors in sum are not decreasing. They are just spreaded over differnt people and domains. To build a printing machine is far from trivial, using such technological beasts not even less. And it is not important if factors, time and knowledge rooted in the mechanics, the software algorithms or something else of the production machine - like the printer.

The example above let make me another observation. In the first case, nothing but the tools limit the design of the picture. Then the variation of shape is given up, then that of the colors vanished. For me that means two things: 

+ The lower the free factor set, the lower the variation. Free factor set means the factors controllable by the creator or user of a production machine or tool set.
+ The lower the free factor set, the idea of what the product could be is narrowed or predetermined. 

Giving up the shape by using a pre-defined sketch means the idea of a picture is fixed by this sketch. Many production systems show this: a printer can only print printable colors and sizes it is built for. A game engine is composed of geometric objects moving in space and carring a texture. To extent the limits of your production system it may be necessary to put in a lot of time and knowlege. In a game engine you can create effects not intended as first citizen in the engine, but you have to know details about the engine, shaders, filters etc.

Now, I can preciceise  my criteria for my selection of technology:

+ *time* is the "**time-**" learning and using the tools or the production system and the "**time+**" to create the product
+ *knowledge* is the "**knowledge+**"" I want to learn (or have learned already) and  **knowledge-**"" I don't want to learn but need it
+ *factors* are the "**factors+**" of design, the freedom of variation, where  the "**factors-**"  I can't  control because they are set or fixed by tools or the production system.

This simple raster will help to explain my decision later. But now to my personal journey through technology.


### What is now ###


I started my journey at the requirements related to AR/VR devices. Visualization was the first topic. Game engines, so my idea, are available and can serve AR/VR, but visualization is not the best fit for them, so at at viz first. To be more precise, 3D graphs (or let's call it better networks) is the thing which attracts me all the time. Networks are exciting, you can do a lot of things with it. But their usefulness depends on what you get displayed and what you could recognize from this. As the AR/VR products become known, my imagination got heat and I saw myself rotating big networks flying in my room, scaling them and selecting nodes with my bare fingers. 

Now, networks are not the things provided from start by the well-known customer products. According to price and availability, I checked out [Oculus Quest](https://www.oculus.com/quest-2), [NReal](https://www.nreal.ai/) and [Lynx](https://lynx-r.com/) for how to create software for them. Software which is not a game in the first place. It turned out that all these devices runs with [Android](https://www.android.com/). I never had done anything with Android, so the obvious step was to read a little bit about. Ok, it is some kind of Linux, and it means to do Java, I've learned. DotNet and Java, the two big opponents for big scale and plattform independed coding. Well, I don't like C\#, and I don't like Java. For a short time, the [Hololens](https://www.microsoft.com/de-de/hololens) came into my mind. I've had the opportunity to try it out, and it had impressed my. Drawn by this positive memories, I looked at [MonoGame](https://www.monogame.net/) which promised to be a ideal combination between Graphics Library and Game Engine. I've done some sample projects, trying own code, and everything felt nice and lightweight... but I had no device for, Hololens is far to expensive. Bad thing.

With a deep breath and opening my mind for the different I headed back to Java. As required I installed the [Android Studio](https://developer.android.com/studio). In this situation of accepting my fate I remembered [Kotlin](https://kotlinlang.org/), a modern language full compatible with the Java world and even a good language to do Android. Yay. So I installed [Intellij IDEA](https://www.jetbrains.com/help/idea/library.html) too.  This was a straightforward thing. And now, the exciting moment was there, as it comes all the time when trying out a new technology: how can I get the "hello world" running on my Ouest? I've played with Kotlin, I've added a Java graphic library, all was fine. Ok, but the goal is Oculus. After hours of reading the documentation on how to use Android I learned there is an Oculus SDK, and a [OpenXR](https://www.khronos.org/openxr/) SDK. The latter sounded wounderful, it promised to write AR/VR code once, because, what a great luck, OpenXR is from the [Khronos Group](https://www.khronos.org/), the same instution which introduced the OpenGL standard. Such bright future in mind I tried examples, I updated, tried other examples and got nothing to run. Time heals everything, I thought, kept JAva/Kotlin as not toooo bad in mind and headed to another aspect for my projects: logic.

I'm a logic programming guy, I love Prolog and its silbling,[miniKanren](http://minikanren.org/). Talking and thinking about logic programming touches Domain Specific Languages (DSL) and the dualism of code and data almost naturally. Following down my roots as a philosopher, logic programming means creating structures. So it was clear to me, as a condition of my way of thinking and as a objective of research, logic programming has to be in my projects. With [SWI Prolog](https://www.swi-prolog.org/) I have a very nice package for following this interest available for years. I was very happy with it. Do you know the feeling if you think you have your solution on hand and then - in the last step - a small aspect of the overall thing let implode your success and the good mood with it? Well, SWI has a little downside, which I got aware of when coming back to the big question I have had always and every time: how to deploy my application, how to get an small executable? For my projects this is an important topic, because both I wanted to share. Under Windows 10 at this time, SWI Prolog could create an executable, but it was not simple. You had to handle with dlls, and I hate that and so I had to think about other ways. Oh dear.  

This attidued I gained during my work with [Pharo Smallalk](https://pharo.org/), where you can take an Pharo.exe and and image file anywhere on your file system, without installation, without complicated requirements or wired pre-installations, and it just works. Wounderful. Consequently I scanned different implementations of miniKanren, because miniKanren can embbed logic programming in every standard programming language. Sounded like a hope. But as time goes on I learned that many implementations are not complete, do hard compromises because of the language used for implementation and more. The orignial miniKanren, a wonderful small but powerful thing, was implemented in Scheme. When trying out Kotlin - which was a natural consequence beacuse of my AR/VR tests - I found a microKanren implementation in Kotlin looking very promising. So yay, I could do Android code with Kotlin and logic and the solution of the OpenXR problem my come in future. I got back an easy feeling.

At this time, I thought about doing Computer Graphics (CG). To be honest, I like the simple way, I like if things are easy. Structural easy. And I want to understand whats going on. Curious as it is my nature, I tried out the big Game Engines, [Unity](https://unity.com/), [Stride](https://stride3d.net/) during my .Net journey together with MonoGame, and I took also a short look to [Godot](https://godotengine.org/). THe wonderful and bright thing which empowerd my hope for universal solutions is that they can be deployed for all important plattforms, even Oculus and Lynx. Maybe a game engine solve my render problem for AR/VR devices? The installation was easy, and I found very good tutorials for learning. And more tutorials, and more, video tutorials, many hours long in sum. After some first tutorials I've got their mechanics, theis principle of thinking. They are production tools in the best sense. Was that what I really want? I was dissolved in the mechanisms and thinking of that engines. Graphics is a scene graph, graphics has nodes and scripts etc... With some melancholy I remembered the wounderful books of [Jim Blinn](https://www.jimblinn.com/publications/), *"A trip down the graphics pipeline"*, where I learned to think about a problem and optimze just the right things. Graphics there was an well-understood algorithm, not an product of an heavy framework do magic things for the user. At this point I decided: no. No game engine, maybe as fall back, if the AR/VR render problem remains, but not from the beginning. 

So, which is also a some mood of mine, I've done the straight opposite: I've started to learn [Vulcan](https://www.vulkan.org/). But not by using C++. I don't like C++, I had to use it in some jobs. My personal impression gained during this time said and still says it is complex even for simple things. C is wounderful, clear, easy and full of potential. Looking in more detail about graphics, even AR/VR and games it turned out that C and C++ are still the base of the world, the dirt needed that everthing can growing. So really, am I really required to do C? What are about the logic programming and the fine things in computer science? Should I really be doomed to go down to the basics and hanging around with compilers, linkers, librariy dll things?  And then I learned about [Racket](https://racket-lang.org), a modern Scheme. 

The wounderful thing at Racket is it great ability to connect to C. It has a very clever FFI packages which seems to enable the programmer to create a binding to a C header really easily. Oh happiness!. And the best: it is Scheme, meaning there is the best miniKanren implementation available! Things come together for fit.  Next step therefore was clear, learning Vulkan with Racket. God damn, but to use Vulkan it was needed to use [GLFW3](https://www.glfw.org/), a plattform independent C/C++ library for managing windows and canvases for OpenGL and Vulkan. After getting some small panic, I got the Racket binding for GLFW3 running, and thanks to the universe, my train is rolling, I can proceed. And even more, Godot has an C API which could be connected to Racket, oh yes! With some view back, that going to the basics was no bad fate. I'll came back to this, but at this time I felt unconfortable. To gain some balance I also played with [Processing](https://processing.org/) which I knew for many years. It provides a very good abstraction level allowing to express graphics and sound simply, but with a lot of freedom of design. And because during my journy the Java ecosystem got in my mind as an really considerable option, Processing as an Java application had fit in the picture, it can connect Java libs and even can create a single executable. The high level and the low level at the same time, well, it was interesting. 

Still where questions left, the way of communication and persistence was unsolved yet. Related to the persistence, it was clear to me that logic and non-sql data bases fit best. Well, it is an assumption, but induced by experience with relational dbs and graph dbs. For my job I have used the triple store of SWI Prolog, and it worked very well. Of course there may be other models and systems which matches the thinking and modeling of logic programming. But I was used to non-sql and graph dbs. Therefore I started an survey of triple stores in different programming environments. Based on my journy up to this point I was glad to learn that Java has one from the Apache project, the [Jena](https://jena.apache.org/) project. This should work  with Kotlin in theory, so still the  Android/Java/Kotlin chain would hold. What happiness! But bad, for Racket I could not found an useful package connecting to targeted data sources. The bad feeling was healed a little bit by the fact that there are embeddable non-sql stores with C headers, for example unqlite. Uff, up and down, up and down.

Once upon a time...I got in contact with the [Croquet](http://www.opencobalt.net/) project (please refer to the current incarnation [Croquet.io](https://croquet.io/)). It was about serverless distributed computing, by replicating operations on every node. Instead of broadcasting data, which is common today, they broadcast operations (messages) including the time information when the operations have to be performed. This was my personal root that I'm still interested today in blockchain and its P2P approach. So I've read a little bit of the [Ethereum](https://ethereum.org/en/) documentation and in consequnece dreamed about to introduce a P2P like network replicating logical queries. But there was another ingredient, rooted in my history. It was [XMPP](https://xmpp.org/), or Jabber, as it was called in earlier days. All these things let grow my dream of building a network of small nodes talking over such a simple protocol like XMPP. And if I say "talking" I mean communication in the best sense, not just exchange of some data. Chatting computing nodes, as in many SciFi movies.....My first contact with such package oriented communication was the ASTERIX protocol still used in the Air Traffic Control domain. Taking this spirit with me I've read and searched and read. After some time, I got to know that not much XMPP implementations are available - but one for Java is there, hehe... ! Racket and logic programming seems to fit if I would have to implement my own XMPP. This protocol is not hard, it is easy to understand, so go on! Lightweight server components are available, top! I climbed on another hill of happyness during my way.


This was a personal report where many details are missing for sure. If I could transport a little bit my ups and downs between hope and desperate questioning all is fine.


### What may be ###

From this journey, I learned a lot about myself and what I want. The latter is connected with my very nature, evolved over many years of programming jobs, engineerin jobs and the experiences lived through. And this is the most important point:

> + Things are easy. Everything in the universe is easy in its nature and roots. And therefore, I want to create things build on easy, understandable things, basic rules.
> + I want to express ideas and the way of thinking in the way my applications are implemented. If I'm free of commercial constraints, and as a hobbist I am, neither time nor effort is important. The expression is important.
> + It is not bad to learn basics. It needs courage and patiente to not give up at the very first problem. All goodnesses I've had during education and which were in danger to be lost in the job, where cut and paste and a quick result is everything.


Our world of computing is constraint from multiplicity - many things are  implemented many times- and variability - every implementation lacks some important points. Therefore production systems have their value if commercial or time constraints for creating a product hold. But I'm not a friend of magic. I'm afraid of production systems driven by AI and reduce the designing and inspired human as an observer who forgot the basics.

Time to wrap up,  time to provide a conclusion of what I experienced and the application of the terms and taxonomy provided at the beginning. I'll try this in form of the following table (t=time, f=factors, k=knowledge:

| Element | Function | Technology  | t+ | t- | k+ | k-|  f+ | f-| 
|---------|----------|------------|-----|----|----|---|----|----|
| Graphics | +(S, F),  >(F, S, S\*) | Godot / Racket | mid | mid | mid |  mid | mid | mid|
| | | Racket and Vulkan or OpenGL | high |  high | high | high | high | low|
| | | Processing and Java  |  mid | low | mid | low | high |low|
| Communication | +, >, !, ?| XMPP / Java | low | low | low | mid | low | mid|
| | | XMPP / Racket | high | low |high | mid | high |low|
| Logic | !(S, S\*), ?(S, A) | miniKanren / Java (Kotlin) | mid |mid | mid |mid | mid | mid|
| | | miniKanren / Racket | low | low | high | mid | high | low |
| Persistence | persistencs(S) | Java Tripple store | low | mid | low | mid | low | low |
| | | Embeddable NoSql / Racket | high | mid | high | mid | mid | mid |


It should be pointed out that this table is only some guide. Putting all together my allocation for my projects is this - until new decisions are required or unsolvable problems occur: 

+ Street CAD: Processing and the Java Kotlin chain -> This will be more product oriented.
+ Perry MMO: Vulkan / Racket or Godot / Racket for the PC and OpenXR / Godot / Java for the AR/VR device -> This project is aimed to learn basics.

That's it. Every decision is not eternal, but the journey was worth it every minute.