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

Since a few years the term **"Metaverse"** popped up. One reason may be that AR and VR devices entered the market and gained some remarkable share for enterprises as well as for customers. There is another term which got more and more called in industry: the **"Digital Twin"**. Although the reference to Neal Stephensons novel "Snow Crash" is called frequently for pointing to the basic idea, it is far from beeing clear today what Metaverse and Digital Twin really is or should be. 

Looking at different vendors or companies displays different approaches. In sum, an observer may get the impression that Metaverse means "something with AR or VR" and Digital Twin has be to read as "better simulation than today". Because I also think about these terms, my intention for this post is to develop some criteria for deciding if something given may be called a Metaverse or a Digital Twin - or just a fancy simulation.

### What we have today and may wish today
  


#### Simulation and co-simulation

Simulation of complex systems today is state of the art. Languages like [Modelica](https://modelica.org/) allows to describe simulation as code. Every object (or class in a programmers sense) has interfaces and its own mathematical code - differential equations - inside. The advantage is that in this way objects can be written simulating components from hydraulics, mechanics, thermodynamics and more, whatever math allows. Such simulating components or objects can be organized in libraries. Modern commercial tools allows to link all these objects together in order to simulate multidomain complex systems. 

It sounds good, and it is. To motivate that there is still space for wishes, I'll take my current work into view. Since 2 years I'm working at the public founded project [Validation and verification methods for autonomous driving in urban space](https://vvm-projekt.de). Here we are doing research and development of methods to gain evidence that an autonomous car is safe by design and in operation. This has many implications which I don't want to cover here, please refer to the given website. For the discussion in this post it is important that simulation of traffic scenarios is one aspect big of this work. 

Traffic simulations which I'm interested in would require simulation of multiple agents - the traffic participants - the static environment like traffic lights, buildings, streets and their conditions, but also the dynamic environment like view conditions or weather. 

Now, consider to add traffic participants in the simulation. In systems like Modelica this would require a change of code and recompilation. Luckily, there is already a solution to this, it is called [**FMU/FMI**](https://fmi-standard.org/) standard. Using this technology makes it possible to bind precompiled objects together. Adding or removing an agent could be done by just instantiating (loading) more objects. But there is more: in addition, the precompiled objects (the "FMU") could be implemented in principle by any solver, realize their own models (a car is different than a civilian) and with any language, as long as they implements the interface (the "FMI"). So traffic participants as simulating objects would be really "independent" from the traffic scenario simulation itself. This points me a to the first desireable property of a Metaverse:

>It should be possible to put simulating objects into the main simulation independent of their implementation, internal model or programming language, as long as they matches defined interfaces or contracts.


#### Hierachical organisation

A car as building block of a traffic simulation is built by many components. Beside the mechanical parts like tires, brakes and motor, the sensors are very relevant for autonomous driving. Although the autonomous car has to perform tasks comparable to human drivers their sensor setup is completely different in performance and principle of operation than the humans one. So it would be an big advantage if sensor components could be simulated appropriately in its physics and in its operation together with other sensors inside the car. 

So my wish is to be able to put simulating sensors into a virtual car together with other simulating sensors (of differnet measmurement methods). Could this be implemented with FMI/FMU? In its intention, FMI/FMU is created to fit simulating objects together by serving the interfaces and variables. Hierarchy may be drawn by this, but it would be require to define and arrange all interfaces. For example, a gear contains many gear wheels inside. You could define for every wheel or part an interface with torque and rotation speed. In consequence, all interfaces "inside" the gear and in the car have to be prescribed to fit together. In other words, the complete simulation has to be designed in agreement of *all* variables, interfaces and model assumptions. An inappropriate simplification in the choice of interfaces and variables would be transported and inherited through all interfaces and would be a defect of the simulation of the full car.

Here an new wish pops up to me. Would'nt it be nice if every simulating object just has to fullfil a set of basic contracts valid for everything? Then you could set up simulating objects independent of where this object will be placed in the simulation, beside something or inside something. Therefore: 

>It should be possible to put simulating objects into groups structured in any kind only by matching basic interfaces (contracts) valid for all components and the simulation itself.

 

#### Persistency and continuity

Simulation today is characterized by performing the steps set up a lot data files like CAD and configuration, run it and to do some analysis about the results. This is unconfortable because variation is a requirement of many simulation, especially in traffic scenario simulations.  Different traffic participants, changing starting positions or initial velocities, are all matter of variation by keeping the static environment, the geometry, signs and buildings constant. Changing something in the traffic conditions by just add or remove or replace traffic participants and start again seems to me promising to save time and get more insight. Adapting simulating objects - for example by adapting their models or parameter values - could be immediatly checked.

If a simulation system could implement this idea perfectly, it would give the engineer or scientist a tool like an interpreter for a programmer.  Write an object with its behaviour defining code, add it to the system and its behaviour is available just in time. Smalltalk programmers now exactly what I mean.... in consequence, here is my next criteria:

>The main simulation, the simulating objects contained and all basic contracts should run continiusly, like an interpreter runtime in Smalltalk or other interpreters,  and store every state and simulating objects persistently, like the Smalltalk system. 


#### Immersion and reliable location

In many simulations, as well as in traffic simulations, it would have value to be not only an observer. Instead of looking onto a 3D animation or looking through a AR/VR devices, beeing part of the simulation would offer new options.  Imagine a traffic simulation with a crossing and a crosswalk. Beeing part of the simulation would allow you to go over the crosswalk in a way only a human do and test the behaviour of the autonomous car. 

Beeing part of the simulation means the autonomous car can see you, you could wave at it. But: as a member of the simulation, you have to obey the world rules. You shall not fly, or shine in an impossble way. To be precise, observe a simulation from different locations is possible today, but to interact with all elements in the simulation is something which I personally understand as the important difference from Metaverse to simulation. 

But there is something to require from location. If the Metaverse is persistent and continiusly in space and time as stated above, the location of any object should be reliable and referencable. This means, if an simulated object is set at a given position, this position shall be referencable (like coordinates) and the object should be findable by going to this reference (as long the object don't move) during the full lifetime of the Metaverse.

>Humans should be part of the simulation like any other simulating object, interacting with them and the simulating environment, by obeing the basic contracts. Any location should be reliable and referencable.
  


## Criteria of Metaverse and Digital Twin

In result of my observations explained above, I want to state these defining properties of "Metaverse" in the sense of axioms. 


| Axiom       | Defining text              | Explanation |
| ---------|----------------------------|-------------|
| I   | The Metaverse is a digital space implementing a Mechanic. The Mechanic is given by a set of rules mapping a configuration of structure to a new configuration of structure. | In fact this means that the Metaverse is equipped with some basic laws like gravity or perservation of energy is in our universe. These laws constitute the way how things in the Metaverse can have effect to each other and the environment |
| II | The Metaverse implements the properties of space and time. In these properties and with its structure it is peristent (constantly, but not necessarily smoothly flowing) and scalable.  | This means the developement of a Metaverse is going into one direction. Things which are placed keep ther place until some rules change this. Scalable means, space and time need not to be in every part of the Metaverse the same and need not to be a 1:1 map of real space and time. |
| III | In the Metaverse, elements can be placed, interacting immediatly together and with the environment (the Metaverse itself) according the Metaverse Mechanics. The location of any place shall be reliable and referenceable | Suddenly when an object comes to "life", its presence triggers also the interaction with all other simulating objects and enviroment. It is important that every object has a location, which can be referenced and keeps always constant as long as the object not moves. The reference (like coordinates or other descriptions) is thy way any object can be found. |
| IV | The elements of the Metaverse are called Digital Surrogates (DiS). The implementation of DiS is irrelevant as long as the DiS implements its behaviour according the Metaverse Mechanic | In industry there is often mentiond the term digital twin. But a good friend pointed out that the elements of the Metaverse don't be necessarly be a 1:1 map of the properties of the real object it represents. |
| V | A human can be a Digital Surrogate like every other DiS. It has to obey the Metaverse Mechanics. The number of Personal Digital Surrogates are (up to a technical limit) unlimited. | Of course it is all about that humans can dive into the Metaverse, using VR or AR. But, and this seems me to be important for a Metaverse, no PDiS  is somthing like good, it is a element like each other. This is because I call it not Avatar.|


## Some wrap up notes

This axioms are mainly introduced for my own work, to help me to differ between fancy simulation technology and a (possible) Metaverse. The most important part seems to be that humans are DiS by themself, the Metaverse Mechanic and reliable location.

I think, there is no strictly need that space is Euclidean and time is a time as we as humans feel it. In fact, my current work at VVM goes in direction of topolocical spaces and a logical time (which still has monoton direction). In the opposite, I tried to find criteria which would allow to try out different "universal" concepts, to build own "universers" with their very own set of basic laws (or rules). I think this could be a new step of modeling - and some games out their trying to do such already.

Personally I assume, that the set of axioms above can be narrowed. For example, I could imagine that the axioms around space, time and location could be defined more abstracted, comming closer to what I would call the very nature of a "universe".

Any comment via E-Mail (please refer [contact](/#contact)) would be appreciated, because I just started my journey and there is many to discuss, I'm sure :)