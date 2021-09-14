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

In my case, this idea is two-fold:

+  a CAD like application which let create and read [USD](https://graphics.pixar.com/usd/docs/index.html) and OpenDrive files for traffic scenario modelling
+  the [Perry Rhodan MMO]({{< ref "/en/project/perry-rhodan-mmo/" >}}), a game with P2P concept for PC and AR/VR devices

Both projects require the same basic elements of architecture: 

![Basic elements](/src/BasicElements.png)

These elements seems to be obvious:  graphics, logic, persistence. Maybe the communicator could be a surprise, not for the MMO, but for the other thing. In order to elaborate the value of these elements for the resulting application, its role in aggregating functionality together with the other elements for building the behaviour of the application, I'll use the following functions introduced in [this post]({{< ref "ServerAndClient1.en.md" >}}):

| Command              | Description              | Example |
| ---------------------|--------------------------|--------|
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

+ *time* is the time learning and using the tools or the production system and the time to create the product
+ *knowledge* is the knowlege I want to learn and I don't want the learn but need it
+ *factors* are the factors of design, the freedom of variation and the factors I have to control and I could not control of the tools or production system.



## What is now ##






## What may be ##
