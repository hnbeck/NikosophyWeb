+++
date = "2020-01-16T18:00:00+01:00"
publishdate ="2020-01-19"
highlight = true
math = false
tags = ["Programming"]
title = "Server - Client - Replication"

[header]
  caption = "(c) Hans N. Beck"
  image = "flipper.png"

+++

### Motivation

Designing web applications leads always to the question where the data should be located. Because of common practice we have some paradigms in place narrowing our view what can be. We had ages of thin clients where the server owns all data in most applications. Then there was a time when developers put more data on the client. In addition, the speed of network connections and JavaScript influenced the common idea of how a web application has to look like. 

Beside this mainstream there was the idea to build up a computer network with nearly symmetric nodes. The OpenCroquet project for example was build around this idea. See [OpenCobalt](http://www.opencobalt.net/) as one of the successors or please refer to the actual project [Croquet.studio](https://croquet.studio//). 

For my PROLOG based games I think about the variants to store the main game data. I liked always the OpenCroquet idea of replicated computing. But it is important to use existing libraries and frameworks in order to limit the amount of work. The power of PROLOG to handle data as code puts an additional light to the scene. Here I wrote down some thoughts about this topic. Before I'll start the comparison of options I want to look at replication, what it is and what it could be in the PROLOG world.


### What Replication is

Lets look at the basic idea of replication as described in the [PHD thesis of David P. Reed](http://publications.csail.mit.edu/lcs/pubs/pdf/MIT-LCS-TR-205.pdf) of 1978. This basic idea is as follows. A system is understand as a collection of objects receiving messages. Any object is defined by its history of received and executed messages since creation. If a message want to access an selected object of a selected version it has to name the object and a time.  These messages can be received from every where in the network.  

Now the big thing of this approach is to ensure that this history is well defined for all objects. Replicated objectes in this approach are that of same type and history. If objects of same type are created at different nodes in the network then these objects can be kept in sync by only ensure the same history of every object. In consequence, not data has to be send over the network but messages with their reference to a object of a selected time. For more details of an impelementation - the OpenCroquet system - please refer to [this presentation from David Reed](https://dl.acm.org/doi/10.1145/1094855.1094861)


### What this means for PROLOG

For the discussion please refer to the architecture below which all my PROLOG games will base on. 

{{< figure src="/src/PrologGamesBasic.png" class="myimg" title="Base architecture" >}}

The PROLOG part implements the game rules. My thinking is about structures and effects. Structure can be levels, obstacles, game objects and are coded as predicates. When I say "structure", I refer to the logic structure of the (model) world which can defined in predicates of mathematical logic. 

Rules describe the transformation of structure: how objects move on or what happens if 2 objects will be combined - for a collision for example. Every structure element is source of effects as light, a field, a push or what ever. The effect part is what graphics and interactivity are realized in. JavaScript or libraries based on JavaScript encode this dynamic aspects of the world. 

Back to the replication which is described in objects and messages. PROLOG has no objects and messages. It is built around facts, rules and queries. So how to map objects and messages and pseudo time to this? One thing is that different versions of the knowlegde base of PROLOG could be related to the history of queries applied. In the procedural view of PROLOG an application of a rule is like a method to the PROLOG system. Introducing a pseudo time as reference to a query history may be possible. But it is not the only thing that the query has to happen in a certain sequence. The facts which are the parameter of the queries should be of a selected version or time point. So maybe every predicate gets an new argument: the pseudo time reference.

 What about the objects? Assume we have space ships in a game as well as asteroids. It seems natural to implement ships and asteroids as object. What would be the equivalent in PROLOG? Knowledge is encoded and stored in predicates. Facts about the ships and asterodis are given as predicates. A message send to an object in the OpenCroquet world I'll interpret as a query on predicates with pseudo time. [Logtalk](https://logtalk.org) has a much more envolved view on this point, maybe I'll switch to it for later work.


### And now - the comparison

My approach to find a judgement about the different Client-Server-Replication options is to examine the questions below. In order to state the questions precise let as define this basic operations needed in the PROLOG setting:

with 
S 	== Structure

S\* == Structure of a next pseudo time

A 	== Substructure and answer to a query

t 	== Real time

R  	== Rules

F 	== facts

n 	== Amount or number of


Then we have this abstract functions:

| Command              | Description              | Example |
| ---------------------|--------------------------|--------|
| ?(S, A) | Query about the structure, returning A | Are there spaceships on the playfield? A would then describte all the ships with this predicate |
| !(S, S\*) | Applying all applicable rules R on S, resulting in S\*| This would be on tick of the pseudo time clock. The rule of on every place can only be one ship" requires collision if in the structure 2 ships will be on the same place |
| +(S, F) | Calculate all effects out from structure S, resulting in new facts F | A spaceship has velocity v. The effect would be that the ship has moved after on tick of pseudotime according its v. The new fact is the new position |
| >(F, S, S\*) | Translate facts which are result of effects into new structure S\*| Look at the ship example above. Because S is a logical structure, it may be or not that the new ship positions change something at the logical structure. If the new position induces a collision, then this will be a structural thing. If one ship free in space moves a little bit it will be still a free ship in space.|
| O(X, t, n) or just O(X)| Evaluate complexity related to amount of storage or time of X) | O(S, n) may count the predicates stored in S |


Keeping the interpretation of objects and messages and the operations described above in mind, I'll look at:

1. Data load (the amount of data) on a node. 
2. Communication load between nodes
3. Implementation effort of the effect (graphics, UI) on a node

For the PROLOG world and the operations above these questions translate to

1. Storage and processing load of the structure and the rules
2. Communication load between nodes 
3. Processing load for effects and interpretation of structure or the result of effect


### Structure on the server

Question 1:

?(S, A) is implemented on the server. S contains the complete game. In consequence - because the complete set of S is on the server - !(S, S\*) is also part of the server mechanics. O(S, t, n), O(R, t, n) is big for big games. 

S has to be implemented in PROLOG way as predicates, facts and rules. There are many ways to make data in PROLOG persistent. The developer can choose between many kinds of databases. With the *asserta* predicate any term could be add to the - persistent - knowledge database. The structure describes the game world and all game objects. 

Question 2: 

?, S have to be send to the server. O(?) and O(A) << O(S) and O(R). The pengine library of SWI Prolog sends queries as strings, so ?, A has to be stringified. The answer A is send back as JSON objects, which matches perfect for the JavaScript environment. Big worlds and many effects require a big A, so the traffic will increase with the structural complexity of the game.

Question 3: 

 The client has to implement +(S, F).  (O+) depends on the rules an mechanisms describing the effect. S is received by the server. Related to the function >(F, S, S\*) there are 2 possibilites: if >() is executed on the client, the client has to need rules how F transforms to elements of S. That may require edditional communication and storage on client side. For a lightwight client it would be better to set >() on the server. In this case the server has to now also something about F, it cannot described in terms of S alone. The best option may depend on the game structure and the complexity of >()


### Structure on the client

Question 1: 

In this case the server only holds the game rules. In general rule data are much less than game data. In addition, rules can be stored efficiently in PROLOG.

What the server needs to apply the rules is a situation. The interactive effect on the client site triggers some situation between game objects. This could be a collision, or a distance between to objects drops under a limit. The user could trigger a control function. What ever happens on the effect side, the resulting new structure or at least the facts needed for the rules has to be coded in a way such that PROLOG could apply the rules. This translation could be done by Prolog, but could also done in the client. Anyway, the server has a limited load, only the gaming rules.

Question 2:

The result of thw rule application has to find the way back to the client. That means part of the structure has changed, that part which the logic is all about. As PROLOG query results these are abstract. This reduces the amount of communication.

Question 3: 

Because the client has all structure on his side, it can store all data in a format which is convenient for graphics. But than the facts for query about rules have to be translated, which needs additional effort. 


### Replication


Question 1: 

Every node stores this part of structure it needs. The data can be coded in a graphics friendly way. If a rule application is needed, the facts for the rules don't travel to the server, the rule travels to the node. In the sense of replication the rules are distributed to every node 

Question 2: 

Because only rules travels over the line, the amount of data is small. Rules are much light weight in comparision to structure data. 

Question 3: 

Effect implementation is only as far as it is needed for the node and their current access to the world.





 