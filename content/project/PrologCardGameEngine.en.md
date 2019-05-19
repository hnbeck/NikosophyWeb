+++
date = "2019-05-03T15:00:37+02:00"
external_link = ""
highlight = true
image_preview = "introCardEngine.png"
math = false
summary = "Ideen für ein Perry Rhodan MMO"
tags = ["Basics"]
title = "ECCardEngine"
src = ""

[header]
  caption = "(c) Hans N. Beck)"
  image = "steelroof.jpg"

+++

Prolog is a programming language which supports the notation of game rules very well. This project aims to develop a base system for card games in Prolog. The game designer should have the possibility to define playfield and cards including attributes and text of cards. 

{{< figure src="/img/gamesequence.png" class="myimg" title="Spielsequenz" >}}

Common property of all card games is to be played in turns. Every turn is diveded in phases. In every phase may be actions of both players, or every turn is played by one player only. This is a matter of the game designer.  

There are two kind of rules: 

	1.  Rules modelling the game world. After every phase or turn shall the new state of the game world calculated by this rules. This includes also the calculation of game points.

	2.  Rules prescribing the player actions. What a player can do is defined by these rules. Of course this depends on game state.


The development system is [SWI-Prolog](http://www.swi-prolog.org). The best way is to use the Prolog program as a server application which will be connected by the client. The Prolog system shall communicate the game state as a ASCII stream to the client. The transformation of this stream to a visual representation shall be matter of the client.