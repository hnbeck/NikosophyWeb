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
+  the [Perry Rhodan MMO]({{< ref "/projects/Perry Rhodan MMO" >}}), a game with P2P concept for PC and AR/VR devices

Both projects require the same basic elements of architecture: 

![Basic elements](/src/BasicElements.png)

These elements seems to be obvious:  graphics, logic, persistence. Maybe the communicator could surprise, not for the MMO, but for the other thing. In order to elaborate their value for the resulting application, its role in aggregating functionality together with the other elements for building the behaviour of the application, I'll use the following functions introduced in [this post]({{< ref "ServerAndClient1.en.md" >}}):

| Command              | Description              | Example |
| ---------------------|--------------------------|--------|
| ?(S, A) | Query about the structure, returning A | Are there spaceships on the playfield? A would then contain all the ships with this predicate |
| !(S, S\*) | Applying all applicable rules R on S, resulting in S\*| This would be one tick of the pseudo time clock. For example take the rule that on every place only ship can be. If in the structure S 2 ships will be on the same place that must be a collision |
| +(S, F) | Calculate all effects out from structure S, resulting in new facts F | A spaceship has velocity v. The effect would be that the ship has moved after on tick of pseudotime according its v. The new fact is the new position |
| >(F, S, S\*) | Translate facts which are result of effects into new structure S\*| Look at the ship example above. Because S is a logical structure it may be or not that the new ship positions change something in the logical structure. If the new position induces a collision, then this will be a structural thing. If one ship free in space moves a little bit it will be still a free ship in space.|
| O(X) | Evaluate complexity related to amount of storage or time of X) | O(S) may count the predicates stored in S |

## What is now ##





## What may be ##
