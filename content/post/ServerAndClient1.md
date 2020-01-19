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

Designing web applications leads always to the question where the data should be located. Because of common practice we have some paradigms in place narrowing our view what can be. We had ages of thin clients where the server owns all data in most applications. Then there was a time when developers put more data on the client. In addition, the speed of network connections and JavaScript influenced the common idea of how a web application loogs like. 

Beside this mainstream there was the idea to build up a computer web with nearly symmetric nodes. The OpenCroquet project for example was build around this idea. See [OpenCobalt](http://www.opencobalt.net/) as one of the successors or please refer to the actual project [Croquet.studio](https://croquet.studio//). 

For my PROLOG based games I think about the possibilities to store the main game data. I liked always the OpenCroquet idea of replicated computing. But it is important to use existing libraries and frameworks in order to limit the amount of work. The power of PROLOG to handle data as code puts an additional interesting light to the scene. Here I wrote down some thoughts about this topic.

### Basic assumptions and the basic question.

For the discussion please refer to the architecture below which all my PROLOG games will base on. 

{{< figure src="/src/PrologGamesBasic.png" class="myimg" title="Base architecture" >}}

The PROLOG part implements the Game Rules. In my approach, rules describe structure and the transformation of structure. The effect part, graphics and interactivity are realized in the client via JavaScript or libraries based on JavaScript. 

The question is now where the structure itself is stored. It could be stored by PROLOG, but it could also be stored on the client or even some mixture. So lets look which option would have which consequences.


### Structure on the server



### Structure on the client



### Replication



### Basic architecture

The game is created as a HTTP game. The implementation of the rules of Black Jack is done in [SWI-Prolog](http://www.swi-prolog.org). This is a very good implementation of PROLOG. The big set of packages also contain HTTP stuff. To write a simple HTTP server is easy, SWI-Prolog is therefore the server component. 



My client has to parts. One part is [Tau-Prolog](http://tau-prolog.org/), a very nice implementation of ISO Prolog in Javascript. This controls the gameplay. Graphics and sound is done in [p5.js](https://p5js.org/), an Web variant of the great [Processing](http://www.processing.org) creative language.

The figure here illustrates the architecture

{{< figure src="/src/ArchitectureBlackJack.png" class="myimg" title="Architecture" >}}





 