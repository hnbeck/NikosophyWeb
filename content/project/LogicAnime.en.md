+++
date = "2017-08-14T19:28:37+02:00"
external_link = ""
highlight = true
image_preview = "meer.jpg"
math = false
summary = "Tool for animations in Prolog"
tags = ["Basics"]
title = "ECLogicAnime"
src = ""

[header]
  caption = "(c) Hans N. Beck"
  image = "meer.jpg"

+++
### Goal and motivation

Prolog has a declarative nature. You use it for describing structures. But how can this be combined with action and animated graphics? Starting from this question I startet this project. It is intended to find a way how to describe animations with Prolog like a story board describe a movie.
Far less important would be the goal to write another animation tool. There are plenty of goods ones. 

The workflow should be like this: write a scene as a text, send this text to the render tool. This renders the animation and builds from this a movie, which the user now can integrate into its Powerpoint presentation.

The idea popped in my mind when I created a Powerpoint presentation which should explain something. It would be nice - so my thought - if I clould quickly create a small animation like these which every commercial today throws onto our eyes.

There are some interesting theoretics goodies, which I want to look at in a special blog post.


### Initial decisions

Of course Prolog is the main thing. The component taking the script is therefore Prolog. In the first step Rendering will be the task of Processing. This I have already used and it seems to be more easyliy than [Unity](https://unity3d.com/de/unity) or [Unreal](https://www.unrealengine.com/en-US/). 

The diagram "Use Cases" visualize what the User will do:
{{< figure src="/src/UseCaseECLogAnime.png" title="Use Cases" >}}

The processing chain will require only a few elements:
{{< figure src="/src/ElementsECLogAnime.png" title="Elements" >}}


### Big questions

The main question is how a scene describtion could look like such that Processing can handle and render it. This could be a Processing programm or it could be a variant of a scene graph interpreted by Processing. In general I like the meta program approach. Programs which generate programs. Think about advanced examples from LISP and Prolog applications, it is not special. Following this way would require Prolog to tanslate the  declarative description to the object oriented world of Processing rendering code.

As alternative, using a scene graph would be fit perfectly to the declarative nature of Prolog. In this case Processing has to perform the necessary translation declarative to dynamic and objects. Which way would be better can only be evaluated by trying it out.


### Realization

Der Sourcecode will be [here](https://github.com/hnbeck/ECLogicAnime.git) in GitHub available. Requirements and user stories as well as more informationen werden will be collected in the  "RQ" directory. Implementation will be done in [SWI-Prolog](http://www.swi-prolog.org) and  [Processing](https://processing.org/). Processing can only produce Quicktime movies which may require to take an additional tool for producing mp4 or other formats. 

Everything runs first on a desktop and exchange information in ASCII format:

{{< figure src="/src/DeployECLogAnime.png" title="Use Cases" >}}


### Roadmap: 

1.  Step: Animationen with fixed shapes, translation and collision detection
2.  Step: how knows what is possible :)