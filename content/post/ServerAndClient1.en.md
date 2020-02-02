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

 What about the objects? Assume we have space ships in a game as well as asteroids. It seems natural to implement ships and asteroids as object. What would be the equivalent in PROLOG? Knowledge is encoded and stored in predicates. Facts about the ships and asterodis are given as predicates. A message send to an object in the OpenCroquet world I'll interpret as a query on predicates with pseudo time. This would require that the rules for transforming the related structures also have to be stored in connection to this predicates. [Logtalk](https://logtalk.org) has a much more envolved view on this point, maybe I'll switch to it for later work.


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

*Question 1:*

?(S, A) is implemented on the server. S contains the complete game. In consequence - because the complete set of S is on the server - !(S, S\*) is also part of the server mechanics. O(S), O\(R\) is big for big games. 

S has to be implemented in PROLOG way as predicates, facts and rules. There are many ways to make data in PROLOG persistent. The developer can choose between many kinds of databases. With the *asserta* predicate any term could be add to the - persistent - knowledge database. The structure describes the game world and all game objects. 

*Question 2:*

?, S have to be send to the server. O(?) and O(A) << O(S) and O\(R\). The pengine library of SWI Prolog sends queries as strings, so ?, A has to be stringified. The answer A is send back as JSON objects, which matches perfect for the JavaScript environment. Big worlds and many effects require a big A, so the traffic will increase with the structural complexity of the game.

*Question 3:* 

 The client has to implement +(S, F).  O(+) depends on the rules an mechanisms describing the effect. S is received by the server. Related to the function >(F, S, S\*) there are 2 possibilites: if >() is executed on the client, the client has to need rules how F transforms to elements of S. That may require edditional communication and storage on client side. For a lightwight client it would be better to set >() on the server. In this case the server has to now also something about F, it cannot described in terms of S alone. The best option may depend on the game structure and the complexity of >()


### Structure on the client

*Question 1:* 

The server only holds R and performs !(S, S\*). In general O\(R\)<<O(S), the story requirements will be low.

*Question 2:*

Because the rules are on the server, to perform !(S, S\*) would require to send all necessary elements of S to the server. In general this could be much in worst case all the full set S. The Server performs !() and sends S\* back, which could also be a lot. So in general O(S), O(A) with respect to communication would be big.

*Question 3:* 

?(S, A), +(S, F) and >(F, S, S\*) are done on the client. The advantage would be that the encoding of S and F could be as the client in its JavaScript world bay need. The downside is, that O(?)+O(+)+O(>) >> O(!). So the in fact, the server is nearly useless, all load is on client and network.


### Replication


*Question 1:* 

Two variants are possible:

1. The SWI Prolog server is a node as all other. According to the understanding of replication here, ?(S, A) and !(S, S\*) are implemented on every node. Every node has its replicated R, S and A and can encode and process S and A in the best way suited to the environmen: SWI Prolog, Tau-Prolog or JavaScript (or type systems). In general, every node needs also the effect functions +(S, F) and >(F, S, S\*). A server needs no effects and GUI, so this functions may not be necessary.

2. The SWI Prolog server is a rules server. It provide the rule pattern !() without application of rules,  !(S, S\*) hast to be executed on the client.  But I have to admit that I have no idea what this would looks like, what are the tasks of such a gateway. Therefore I'll take version 1. as initial approach. 

*Question 2:* 

Because every node has R, S and A, only the querys have to be transmitted. In opposite to the protocol the Pengine library of SWI Prolog uses replication would allow to transmit only references to the pseudotime and the predicates ("objects"). Including A and a subset of S would not be required resulting in a very fast and light communication. 

*Question 3:* 

As a full node, the "client" implements ?(S, A), !(S, S\*), +(S, F) and >(F, S, S\*). In principle, coding could be in JavaScript or Tau-Prolog. The nature of replication allows to keep the encoding of the package including S, R, F JavaScript friendly. 
In this setting it may be reasonable to use the Croquet.studio SDK (which is JS) to implement the replication. 


### Summary

Replication and PROLOG looks interesting. There are many questions left, but for I it looks attractive for designing multi user games which utilitize PROLOG as a rule engine. Some code experiments will follow, and I will report about the results.


 