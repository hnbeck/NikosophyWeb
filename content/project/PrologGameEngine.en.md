+++
date = "2019-05-03T15:00:37+02:00"
external_link = ""
highlight = true
image_preview = "MSCSchiff.jpg"
math = false
summary = "Basic system for games powered with Prolog"
tags = ["Basics"]
title = "ECPlayEngine"
src = ""

[header]
  caption = "(c) Hans N. Beck)"
  image = "MSCSchiff.jpg"

+++

Prolog is a programming language which supports the notation of game rules very well. This project has the goal to develop a base system for card games in Prolog. The game designer should have the possibility to define the playfield as well as cards including their attributes and texts. 

{{< figure src="/img/gamesequence.png" class="myimg" title="Spielsequenz" >}}

Common property of all card games is to be played in turns. Every turn is diveded in phases. In every phase may be actions of both players, or every turn is played by one player only. This is a matter of the game designer.  

There are two kind of rules: 

	1.  Rules modelling the game world. After every phase or turn the new state of the game world shall be calculated by this rules. This includes also the operation with game points or other assessments.

	2.  Rules prescribing the player actions. What a player can do is defined by these rules. Of course they depend on the game state.


The development system is [SWI-Prolog](http://www.swi-prolog.org). The Prolog program should operate as a server application which will be connected by clients. The Prolog system shall communicate the game state as a ASCII stream. The transformation of this stream to a visual representation shall be matter of the client. 

This is a little bit a reminiscence to the old and great X11 ideas of remote computer displays and of course all the WWW things out today. But as a difference to this, the ASCII stream should be more on a abstract level. It should not describing geometric things like rectangles and coordinates or descriptive attributes like `<body>` or `<p>`. It should describe objects. To design this ASCII based language is an interesting subtask for itself.