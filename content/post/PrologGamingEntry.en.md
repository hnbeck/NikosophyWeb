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

This post is about a very simple Black Jack game. I wrote this game not to provide another Black Jack game. Instead, I wanted to examine the possibilities to do gaming with PROLOG. In the following I describe some thoughts leading to the result. 

### Logic and gaming

PROLOG is a language which allows to describe the structure of a problem in terms of logic. This seems like a natural fit for describing rules.  Logic says something like "if A is true, then B is true". Rules tell what follows if a situation is given. "If a player has more points than 21..." (the situation) "...he loses the game" (the consequence). 

Having computer games in mind, there is the look at animation, colorful graphics, characters and many other things moving on screen. Games are full of processes and action. This is not the kind of things which let one associate logic immediatly. Logic seems to have a static nature. So the question is how to combine logic, action and processes (or effects). 

### Logic and Processes

Experienced PROLOG programmers know that this programming language allows to describe structures. Trees and lists are common used structures used in logic programming. In general, mathematics (where logic programming is rooted) is about structures and maps of structures. On the other side, the world is dynamic and full of processes and effects. Where is the fine line between structures and effects? It is not easy to investigate this question in a philosophical sound way. But I have an idea, which guides me to create the game this post is about. 

The idea is: look at electrostatics: a setup of charges - the structure - defines an electrical field. This field is the cause of a force on an other charge comming into the field. The force causes acceleration, which is the effect inducing movement. 

In consequence, my approach to combining logic and processes is to define structures which set up causes for effects. This effects will be coded as rules. Like the phyiscal laws ("rules") about electrostatic forces I search for rules inducing a change of state over time. The simpliefied formula is: setup structures, and setup rules which - when applied - evolve the structure. If you now think about cellular automata, yes, this is also my idea, too.

### Basic architecture

The game is created as a HTTP game. The implementation of the rules of Black Jack is done in [SWI-Prolog](http://www.swi-prolog.org). This is a very good implementation of PROLOG. The big set of packages also contain HTTP stuff. To write a simple HTTP server is easy, SWI-Prolog is therefore the server component. 

Clients in the web world today are JavaScript products. But there are many libraries and programming languages in the JavaScript domain available to do GUI, functional or even Smalltalk programming and - PROLOG. 

My client has to parts. One part is [Tau-Prolog](http://tau-prolog.org/), a very nice implementation of ISO Prolog in Javascript. This controls the gameplay. Graphics and sound is done in [p5.js](https://p5js.org/), an Web variant of the great [Processing](http://www.processing.org) creative language.

The figure here illustrates the architecture

{{< figure src="/src/ArchitectureBlackJack.png" class="myimg" title="Architecture" >}}

Pengine is a package of SWI-Prolog. It allows to start and query on a remote SWI Prolog instance. This instance is sandboxed. So a Black Jack game follows a simple sequence: 

+ Javascript querys SWI Prolog over Pengine to setup the game
+ SWI Prolog returns the player states to Tau-Prolog which adds them to its knowledge base
+ Depending of what the player does - draw a card or stand - Tau-Prolog sends new query to SWI Prolog over Pengine with the current player state.

### Basic data structures

PROLOG has a knowledge base built from all persistent predicates. The server component stores the card data, the stack and the single cards, the client PROLOG  holds the player with its cards played out. The nice thing on PROLOG is, the game rules need no extra data structure. They are directly coded in PROLOG terms and predicates. 

#### Cards

The cards are a relation (a predicate) of this information

	card(Color, Name, Card Points, Orientation).
Example:
	card(kreuz, ass, 11, up).

The card colors are German names Kreuz, Herz, Karo, Schippe.

#### Player

The player has a number and a sequence of cards, which he as drawn an played out in this sequence:

	player(Number, Card List)

Example:
	player(1, [card(kreuz,ass,11,up), card(karo, 8, 8, up )])

In the source code the list is named *"Field"*, because it represents the playing field of the player.

### Protocols

Playing the game consists of a simple sequence of communication, which happens by every player action. This action can be: 

+ start the game by refreshing the side (or enter the side the first time)
+ draw a card or
+ stand

The basic sequence is as follows: 

{{< figure src="/src/BasicSequence.png" title="Protocol" >}}

Some explanations: 

+ *Query as a string*: the Pengine function which performs a query on the remote Prolog. It requires this query as a String.

+ *Pengine Result* is a JSON object. It has the basic pattern {functor: FUNCTORNAME, arg: [A LIST]}

+ *call(TakeResult(Result))* means that the predicate *TakeResult(Result)* will be queried on Tau-Prolog. *Result* is the predicates coded as JSON Object, it will be added to the knowlegde base of Tau-Prolog. By this way, the actual state of every player is part of the knowledge base and therefore persistent (for the session).

+ *gameContinue* is a predicate of Tau-Prolog which decides how the game has to proceed. For example, if SWI-Prolog tells via *Result* someone has won the game it has to end and the winner has to be displayed.

+ *call(visCostume)* does trigger the graphics. The basic technique is to give every element of the logical structure (which is relevant for GUI) a costume. This costurme is part of the JavaScript level and decides about the look and feel of visual representation. This is a first approach of decoupling logical structure of effects and processes.

### Disclaimer

This BlackJack Game has not the purpose to win anything. It is a simple implementation of Black Jack and does not contain the full rule set. Its purpose is just fun and to try out things of programming. 

### How to play

Just follow THIS LINK. You will see the green table for the cards and the card stack. Your initial setup of cards will be drawn as well as that for the dealer. Just follow the instructions. For a new game reload the page. Enjoy and don#t expect anything. 

 