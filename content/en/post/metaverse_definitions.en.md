+++
date = "2021-12-21T00:01:51+02:00"
highlight = true
math = false
tags = ["Basics"]
title = "What may be a Metaverse?"

[header]
  caption = "(c) Hans N. Beck"
  image = "bridge.jpg"

+++

### Buzzwords everywhere

Since a few years the term **"Metaverse"** popped up. One reason may be that AR and VR device entered the market and gained some remarkable share for enterprises as well as for customers. There is another term which got more and more common in industry: the **"Digital Twin"**. Although the reference to Neal Stephensons novel "Snow Crash" is called frequently for pointing to the basic idea, it is far from beeing clear today what Metaverse and Digital Twin really is or should be. 

Looking at different vendors shows different approaches. In sum, an observer may get the impression that Metaverse means "something with AR or VR" and Digital Twin has be to read as "better simulation than today". Because I also think about these terms, my intention for this post is to develop some criteria for deciding if something given may be called a Metaverse or a Digital Twin - or just a fancy simulation.

### What we have today and may wish today


#### Simulation and co-simulation

Simulation of complex systems today is state of the art. Languages like [Modelica](https://modelica.org/) allows to describe simulation as code. Every object (or class in a programmers sense) has interfaces and its own mathematical code - differential equations inside. The advantage is that in this way objects can be written simulating components from hydraulics, mechanics, thermodynamics and more, whatever math allows. Such simulating components or objects can be organized in libraries. Moderen commercial tools allows to link all these objects together in order to simulate multidomain complex systems. 

It sounds good, and it is. To motivate that there is space for wishes, I'll take my current work into view. Since 2 years I'm working at the public founded project [Validation and verification methods for autonomous driving in urban space](https://vvm-projekt.de). Here we are doing research and development of methods to gain evidence that an autonomous car is safe by design and in operation. This has many implications which I don't want to cover here, please refer to the given website. For the discussion here it is important that simulation of traffic scenarios is one aspect of this work. 

Traffic simulations which I'm interested in would require simulation of multiple agents - the traffic participants - the static environment like traffic lights, buildings, streets and their conditions, but also the dynamic environment like view conditions or weather. 

Now, consider to add traffic participants in the simulation. In systems like Modelica this would require a change of code and recompilation. Luckily, there is already a solution to this, it is called [**FMU/FMI**](https://fmi-standard.org/) standard. By this technology it is possible to bind precompiled objects together. Adding or removing an agent could be done by just instantiating (loading) more objects. But there is more: in addition, the precompiled objects (the "FMU") could be implemented in principle by any solver, realize their own models (a car is different than a civilian) and with any language, as long as they implements the interface (the "FMI"). So traffic participants as simulation objects would be really "independent" from the traffic scenario simulation itself. This points me a to the first desireable property of a Metaverse:

>It should be possible to put simulating objects into the main simulation independent of their implementation, internal model or programming language, as long as they matches defined interfaces.


#### Hierachical organisation

A car as building block of a traffic simulation is built by many components. Beside the mechanical parts like tires, brakes and motor, the sensors are very relevant for autonomous driving. Although the autonomous car has to perform tasks comparable to human drivers their sensor setup is completely different in performance and principle of operation then humans. So it would be an big advantage if sensor components could be simulated appropriately in its physics and it its operation together with other sensors inside the car. 

So the wish is to be able to put simulating sensors into a virtual car together with other simulating sensors (of differnet measmurement methods). Could this be implemented with FMI/FMU? In its intention, FMI/FMU is created to fit simulated objects together by serving the interfaces and variables. Hierarchy may be drawn by this, but it would be require to define and arrange all interfaces. For example, a gear contains many gear wheels inside. Further, you could define for every part a interface with torque and rotation speed. In consequence, all interfaces have to be prescribed, fit together. In other words, the complete simulation has to be designed in agreement of all variables, interfaces and model assumpetions. An inappropriate simplification through the choice of interfaces and variables would be transported through all interfaces.

Here an new wish pops up to me. Would'nt it be nice if every simulating object just fullfils a set of basic agreements valid for everything? Then you could set up simulating object independet by where this object may be placed in the simulation, beside something or inside something, by just matching the basic agreements Therefore: 

>It should be possible to put simulating objects into hierachical groups only matching basic interfaces valid for all componenets and the simulation itself in the simulation.

 

#### Persistency and continuity

Simulation today is characterized by performing the steps set up a lot data files like CAD and configuration, run it and to do some analysis about the results. This is unconfortable because variation is a requirement of many simulation, especially in traffic scenario simulations.  Different traffic participants, maybe changing starting positions or initial velocities, by keeping the static environment, the geometry, signs and buildings constant are matter of variation. Changing something in the traffic conditions by just add or remove or replace traffic participants and start again seems to me promising to save time and get more insight. Adapting simulating objects - for example by adapting their models - could be immediatly checked.


If a simulation system could implement this idea perfectly, it give the engineer or scientist a tool like an interpreter for a programmer.  Write an object with its behaviour defining code, add it to the system and its behaviour is available in time. Just call it. Smalltalk programmers would be now exactly what I mean.... in consequence, here is my next point:

> The main simulation and their basic contracts should be able to run continiusly, like an interpreter runtime in Smalltalk or other interpreters,  and store every state and simulating object persistently, like the Smalltalk system. 


#### Reliable location

Personally, working in the public founded project  my context is traffic situations. My interest is to put a autonomous car into a digital represented traffic scenario and observe its behaviour and the interaction with other traffic participants. From accident reasearch and known psychologic effects it would be possible to implement behavioal models for them (which is competitive, though). But the problem is to but them all intro a location and time based scene and let them run. It would be nice to have the structure of the scene fixed and to go into the scene with colleges. Reliable location would mean, I can tell a colleqgue to go to a special position in the scene and look what happens. This would be different quality than to look in a 3D visualisation from different angles. 



## Criteria of Metaverse and Digital Twin

In result of my observations explained above, I want to state these defining properties of "Metaverse" in the sense of axioms. I intend to use this for further considerations and implementations of my own projects:



| ID       | Defining text              | Explanation |
| ---------|----------------------------|-------------|
| I   | The Metaverse is a digital space implementing a Mechanic. The Mechanic is given by a set of rules mapping a configuration of structure to a new configuration of structure. | In fact this means that the Metaverse is equipped with some basic laws like gravity or perservation of energy is in our universe. These laws constitute the way how things in the Metaverse can have effect to each other and the environment |
| II | The Metaverse implements the properties of space and time. In these properties and with its structure it is peristent (constantly, but not necessarily smoothly flowing) and scaleable. | This means the developement of a Metaverse is going into one direction. Things which are placed keep ther place until some rules change this. Scalable means, space and time need not to be in every part of the Metaverse the same and need not to be a 1:1 map of real space and time. |
| III | In the Metaverse, elements can be placed, interacting immediatly together and with the environment (the Metaverse itself) according the Metaverse Mechanics. |
| IV | The elements of the Metaverse are called Digital Surrogates (DiS). The implementation of DiS is irrelevant as long as the DiS implements its behaviour according the Metaverse Mechanic | In industry there is often mentiond the term digital twin. But a good friend pointed out that the elements of the Metaverse don't be necessarly be a 1:1 map of the properties of the real object it represents. |
| V | A human can be a Digital Surrogate like every other DiS. It has to obey the Metaverse Mechanics. The number of Personal Digital Surrogates are (up to a technical limit) unlimited. | Of course it is all about that humans can dive into the Metaverse, using VR or AR. But, and this seems me to be important for a Metaverse, no PDiS  is somthing like good, it is a element like each other. This is because I call it not Avatar.|


## Some wrap up notes

This criteria are mainly introduced for my own work, to help me to differ between fancy simulation technology and a Metaverse. The most important part seems to be that humans are DiS by themself, and the Metaverse Mechanic.

I think, there is no strictly need that space is Euclidean and time is a time as we as humans feel it. In fact, my current work at VVM goes in direction of topolocical spaces and a logical time (but it has still monotony direction). In the opposite, I tried to find criteria which would allow to try out different "universal" concepts, to build own "universers" with their very own set of basic laws (or rules). I think this could be a new step of modeling - and some games out their trying to do such already.

Any comment via E-Mail (plese refer to contact) would be appreciated, because I just started my journey and there is many to discuss, I'm sure :)