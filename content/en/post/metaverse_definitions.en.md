+++
date = "2021-12-21T00:01:51+02:00"
highlight = true
math = false
tags = ["Basics"]
title = "What is the Metaverse?"

[header]
  caption = "(c) Hans N. Beck"
  image = "spaceCity.jpg"

+++

## Everywhere the words

Since a few years the term "Metaverse" popped up. This may be because AR and VR device entered the marked, enterprise as well as customer gears. Then there was another term getting´more and more common in  industrie: teh "digital twin". Although the reference to Neil Stephensons novel "Snow crash" is done frequently for indicating the basic idea, it is far clear what Metaverse and digital twin really is or could be. 
Looking at different vendores results in differnet approaches. In sum, the reader may get the impression that Metaverse means "something with AR or VR" and Digital Twin has be to read as "better simulation than today". Because I also think about these terms, I will develop criteria for deciding if something given is a Metaverse or a Digital Twin.

## What we have today and may wish today

### Simulation and co-simulation

Simulation of complex systems is today state of the art. Skmularion languages like Modellica alows to describe simulation objects as libraries. Because every simpulation object has its own mathematic code inside libraries for many components are available, like hydraulic, mechanics and electronics. 
This is fine but the draeback is that a complex multi-part simulation has to be compiled together. The fmi fmu standard helps to get rid of ghis constriant. Now, the components can be implemented by differnet simulation systems or languages, as long as they match the fmi. in this way, a big simulation can be ochestrqted by fmi fmu componets. But still, all components have to agree to cariables and time. Also, hierachical arrangement is not so easy.

### Persistency

Simulation tody is characteeized by the steps setting up data files like CAD and configuration, run it and do analysis about thr result. Waht is missing is to run an environment simulation permamently, add components are take them away and observe the effekts. In donsequence the simulated objects should be self-contained, with all data necessary.

### Reliable location

Personally, working in the public founded project (Validation and verification methods for autonomous driving)[https://vvm-projekt.de] my context is traffic situations. My interest is to put a autonomous car into a digital represented traffic scenario and observe its behaviour and the interaction with other traffic participants. From accident reasearch and known psychologic effects it would be possible to implement behavioal models for them (which is competitive, though). But the problem is to but them all intro a location and time based scene and let them run. It would be nice to have the structure of the scene fixed and to go into the scene with colleges. Reliable location would mean, I can tell a colleqgue to go to a special position in the scene and look what happens. This would be different quality than to look in a 3D visualisation from different angles. 

### hierachical organisation

A car is built by many components. As pointed out above, the interesting part would be that the components set up a bigger component do this by following the basic rules of the Metaverse. 




## Criteria of Metavers and Digital Twin

| ID       | Defining text              | Explanation |
| ---------|----------------------------|-------------|
| I   | The Metaverse is a digital space implementing a mechanic. The mechanic is given by a set of rules mapping a configuration of structure to a new configuration of structure. | In fact this means that the Metavers is equipped with some basic laws like gravity or perservation of energy is for our universe. These laws constitute the way how things in the metaverse can have effect to each other and the environment |
| II | The Metavers implements the properties of location and time. In these properties it is peristent (constantly, but not necessarily smoothly flowing) and scaleable | This means the developement of a Metavers is going in one direction. Things which are placed keep ther place until some rules change this. Scalable means, space and time need not to be in every part of the Metaverse the same and need not to be a 1:1 map of real space and time |
| III | In the Metaverse, elements can be placed, which interact together and with the environment (the Metaverse itslef) accoring the mechanic of the Metaverse |
| IV | The elements of the Metaverse are called Digital Surrogates. The implementation of DS is irrelevant as long as the DS implements its behaviour according the Metavers mechanic | In industry there is often mentiond the term digital twin. But a good friend pointed out that the elements of the Metaverse don't be necessarly be a 1:1 map of the properties of the real object it represents |
| V | The human can be a Digital Surrogate like every other DS. It ahs to obey the Metavers Mecahnics. The number oh Personal Digital Surrogates are unlimited | Of course it is all about that humans can dive into the Metaverse, using VR or AR. But, and this seems me to be important for a Metavers, no PDS  is somthing like good, it is a element like each other. This is because I call it not Avatar.|



