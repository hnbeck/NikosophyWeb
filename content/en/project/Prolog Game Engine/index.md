---
title: Prolog Game Engine
summary: How a Prolog Game Engine may look like
tags:
- Prolog
- Gaming
date: "2019-07-13T15:00:37+02:00"

# Optional external URL for project (replaces project detail page).
external_link: ""

image:		
  caption: Photo by Hans Beck
  focal_point: Smart

links:
- icon: twitter
  icon_pack: fab
  name: Follow
  url: 
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

---

### Goal and motivation

The project aims to build a framework for computer games in Prolog. This language is not a typical one for implementing games. Although, as language of logic programming it can describe rules very well. And rules are the building blocks of games. In addition, the following things comming out of the Prolog world are very helpful building games:

*  Some algorithms of classical AI like decision trees, knowledge modelling
*  Probabilitic programming
*  Qualitative Simulation
*  Logical description of structures
*  Modelling of causality using logical statements

So it seems valuable to try out this things for gaming. If a working prototype can be done then this technology may be the base for bigger projects. But in the first step, trying out things by building a small adventure game.

Despite beeing a experiment it shall be a playful game. It should not be seen as a competitor to good Indie games or commercial games, of course.


### Initial decisions

The ECLogicPlay is intended for building adventure games or role playing games. This reason is that telling stories is an important and ground theme of games I deal with. Graphics is not the first part as this project want to build a prototype. The resulting game shall have this properties:

*  Multiplayer, but not in the first version
*  Adventure game in the SF domain
*  There shall be roles with different level of action: games and telling gamer (authors)
*  Browsergame, which means Prolog runs on a server, the interaction with the player is done via Javascript in the browser
*  Persitence is implemented using RDF and Prolog
*  In the first version the game may be a text adventure

The meaning of the actors or roles can be seen in diagram "Use Cases"

{{< figure src="/src/UseCaseECLogPlay.png" title="Use Cases" >}}

{{< figure src="/src/ElementsECLogicPlay.png" class="myimg" title="Elements" >}}

The architecture (see diagram "Elements") will contain a block controling the roles acting in the game. There is a simulation computing the development of the world. Thats done by applying rules to the current state of the world, which results in the next state. The Block Script includes the computation of the overall story line, which is influenced by the autors. To save game state, character data and other things is task of the Persistence.

The approach has some special properties:

1.  The autors prescribe the story of the game world. They do this by defining behaviour rules of  important roles and events for a interval of time in the future of the game. This is called the script. Important roles can be leaders, commanders or other persons with big effect.
2.  The autors are games as all others, they play the game and can log in or log off like all others.


### Realization

The source code will be [here](https://github.com/hnbeck/ECToBeTerraner.git) in GitHub available. Requirements and Userstories and other informations will be stored in the GitHub project [ECToBeTerranerRQ](https://github.com/hnbeck/ECToBeTerranerRQ). Implementation will be done  in [SWI-Prolog](http://www.swi-prolog.org), the JavaScript part may be coded in [P5.js](https://p5js.org/). But there is no final decision yet. I personally have experience with the "mother project" [Processing](http://www.processing.org), of P5.js. Therefore beginning with this may a good start.

With the mapping

*  UI =  JavaScript
*  all other elements =  Prolog

the following deployment diagram can be drawn. SWI Prolog has a built-in predicates for creating a web server. In this way Prolog can implement HTTP directly. 

{{< figure src="/src/DeployECLogPlay.png" title="Use Cases" >}}


### Roadmap:

1.  Step: Only one player, which plays a given story, no persistence, no user management, only text
2.  Step: < 10 Players playing in a common game universe, so user management included
3.  Step: Grafiks and persistence
