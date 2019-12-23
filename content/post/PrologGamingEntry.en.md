+++
date = "2019-12-16T18:00:00+01:00"
publishdate ="2019-12-16"
highlight = true
math = false
tags = ["Programming"]
title = "Gaming with Prolog - the beginning"

[header]
  caption = "(c) Hans N. Beck"
  image = "CityLight.jpg"

+++

### A game as an experiment

This post is about an very simple Black Jack game. I wrote this game not to provide another Black Jack game. Instead, I wanted to examine possibilities to do gaming with PROLOG. In the following, I describe some thoughts leading to the result. 

### Logic and gaming

PROLOG is a language which allows to describe the structure of a problem in terms of logic. This seems like a natural fit for describing rules.  Logic says something like "if A is true, then B is true". Rules tell what follows if a situation is given. "If a player has more points than 21..." (the situation) "...he loses the game" (the consequence). 

Having computer games in mind, there is animation, colorful graphics, characters and many other things moving on screen. Games full of processes and action. This is not the kind of things which let one think about logic. Logic seems to have a static nature. So the question is how to combine logic, action and processes. 

### Logic and Processing 

Experienced PROLOG programmers know, that this programming language allows to describe structures. Trees and lists are common used structures used in logic programming. In general, mathematics (where logic programming is rooted) is about structures and maps of structures. On the other side, the world is dynamic and full of processes. Where is the fine line between structures and processes? It is not easy to investigate this question in a philosophical sound way. But I have an idea, which guides me to create the game this post is about. Look at electrostatics: a setup of charges - the structure - defines an electrical field. This field is the cause of a force on an other charge comming into the field. The force causes acceleration, which is the effect inducing movement. 

In consequence, my approach to combining logic and processes is to define structures which set up causes for effects. This effects will be coded as rules. Like the phyiscal laws ("rules") about electrostatic forces I search for rules inducing a change of state over time. The simpliefied formula is: setup structures, and setup rules which - when applied - evolve the structure. If you now think about cellular automata, yes, this is also my thought.

### Basic architecture

The game is created as a HTTP game. The implementation of the rules of Black Jack is done in [SWI-Prolog](http://www.swi-prolog.org). This is a very good implementation of PROLOG. The big set of packages also contain HTTP stuff. To write a simple HTTP server is easy, SWI Prolog is therefore the server component. 

Clients in the web world today are JavaScript products. But there are many libraries and programming languages in the JavaScript domain available to do GUI, functional or even Smalltalk and - PROLOG. My client has to parts. One part is [Tau-Prolog](http://tau-prolog.org/), a very nice implementation of ISO Prolog in Javascript. This part controls the gameplay. Graphcis and sound is done in [p5.js](https://p5js.org/), an Web variabt of the great [Processing](http://www.processing.org) creative language.

This figure illustrates the architecture

{{< figure src="/src/ArchitectureBlackJack.png" class="myimg" title="Architecture" >}}

Pengine is a package of SWI Prolog. It allows to start and query a remote SWI Prolog instance. The instance is sandboxed. So a BlackJack game follows a simple sequence: 

+ Javascript querys SWI Prolog over Pengine to setup the game
+ SWI Prolog returns the player states to Tau-Prolog which adds them to its knowledge base
+ Depending of what the player does - draw a card or sand - Tau-Prolog sends over Pengine a new query to SWI Prolog with the current player state.

### Disclaimer

This BlackJack Game has not the purpose to win anything. It is a simple implementation of Black Jack and does not contain the full rule set. Its just for fun and try out things of programming. 

### How to play


 