+++
date = "2021-12-21T00:01:51+02:00"
highlight = true
math = false
tags = ["Basics"]
title = "What is the Metaverse?"

[header]
  caption = "(c) Hans N. Beck"
  image = "bridge.jpg"

+++

### Buzzwords everywhere

Since a few years the term **"Metaverse"** popped up. One reason may be that AR and VR device entered the market and gained some remarkable share for enterprises as well as for customer. Then there was another term which got more and more common in industry: the **"digital twin"**. Although the reference to Neal Stephensons novel "Snow Crash" is called frequently for indicating the basic idea, it is far from beeing clear what Metaverse and digital twin really is or should be. 

Looking at different vendors results in differnet approaches. In sum, an observer may get the impression that Metaverse means "something with AR or VR" and Digital Twin has be to read as "better simulation than today". Because I also think about these terms, my intention for this post is to develop some criteria for deciding if something given is a Metaverse or a Digital Twin - or just a fancy simulation.

### What we have today and may wish today

#### Simulation and co-simulation

Simulation of complex systems today is state of the art. Languages like [Modelica](https://modelica.org/) allows to describe simulation as code. Every object (or class in a programmers sense) has interfaces and its own mathematical code - differential equations inside. The advantage is that in this way objects can be written simulating things like hydraulics, mechanics, thermodynamics and more, organized in libraries. Moderen commercial tools allows link all these objects together in order to simulate multidomain complex systems. 

It sounds good, and it is. To motivate that there is space for wishes, I'll take my current work into view. Since 2 years I'm working at the public founded project [Validation and verification methods for autonomous driving in urban space](https://vvm-projekt.de). Here we are doing research and development of methods to gain evidence that a autonomous car is safe. This has many implications which I don't want to cover here, please refer to the website. For the discussion here it is important that simulation of traffic scenarios is one aspect of this work. 

Traffic simulations which I'm interested in would require simulation of multiple agents - the traffic participants - the static environment like traffic lights, buildings, streets and their conditions, but also the dynamic environment like view conditions or weather. 

Now, consider to add traffic participants in the simulation. In systems like Modelica this would require a change of code and recompilation. Luckily, there is already a solution to this, it is called [**FMU/FMI**](https://fmi-standard.org/) standard. By this technology it is possible to bind precompiled objects together. Adding or removing an agent could be done by just instantiating (loading) more objects. But there is more: in addition, the precompiled objects (the "FMU") could be implemented in principle by any solver, realize their own models (a car is different than a civilian) and with any language, as long as they implements the interface (the "FMI"). So traffic participants as simulation objects would be really "independent" from the traffic scenario simulation itself. And this would indicate me a desireable property of a Metaverse:

>It should be possible to put simulation objects into the main simulation independet of their implementation, internal model or programming language, as long as it matches defined interfaces.


#### Hierachical organisation

A car is built by many components. As pointed out above, the interesting part would be that the components set up a bigger component do this by following the basic rules of the Metaverse. 

### Persistency and continuity

Simulation tody is characteeized by the steps setting up data files like CAD and configuration, run it and do analysis about thr result. Waht is missing is to run an environment simulation permamently, add components are take them away and observe the effekts. In donsequence the simulated objects should be self-contained, with all data necessary.

### Reliable location

Personally, working in the public founded project  my context is traffic situations. My interest is to put a autonomous car into a digital represented traffic scenario and observe its behaviour and the interaction with other traffic participants. From accident reasearch and known psychologic effects it would be possible to implement behavioal models for them (which is competitive, though). But the problem is to but them all intro a location and time based scene and let them run. It would be nice to have the structure of the scene fixed and to go into the scene with colleges. Reliable location would mean, I can tell a colleqgue to go to a special position in the scene and look what happens. This would be different quality than to look in a 3D visualisation from different angles. 



## Criteria of Metavers and Digital Twin

In result of my observations explained above, I want to state these defining properties of "Metaverse" in the sense of axioms. I intend to use this for further considerations and implementations of my own projects:



| ID       | Defining text              | Explanation |
| ---------|----------------------------|-------------|
| I   | The Metaverse is a digital space implementing a mechanic. The mechanic is given by a set of rules mapping a configuration of structure to a new configuration of structure. | In fact this means that the Metavers is equipped with some basic laws like gravity or perservation of energy is for our universe. These laws constitute the way how things in the metaverse can have effect to each other and the environment |
| II | The Metaverse implements the properties of location and time. In these properties it is peristent (constantly, but not necessarily smoothly flowing) and scaleable | This means the developement of a Metavers is going in one direction. Things which are placed keep ther place until some rules change this. Scalable means, space and time need not to be in every part of the Metaverse the same and need not to be a 1:1 map of real space and time |
| III | In the Metaverse, elements can be placed, which interact together and with the environment (the Metaverse itslef) accoring the mechanic of the Metaverse |
| IV | The elements of the Metaverse are called Digital Surrogates. The implementation of DS is irrelevant as long as the DS implements its behaviour according the Metavers mechanic | In industry there is often mentiond the term digital twin. But a good friend pointed out that the elements of the Metaverse don't be necessarly be a 1:1 map of the properties of the real object it represents |
| V | The human can be a Digital Surrogate like every other DS. It ahs to obey the Metavers Mecahnics. The number oh Personal Digital Surrogates are unlimited | Of course it is all about that humans can dive into the Metaverse, using VR or AR. But, and this seems me to be important for a Metaverse, no PDS  is somthing like good, it is a element like each other. This is because I call it not Avatar.|



