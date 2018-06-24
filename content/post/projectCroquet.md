+++
date = "2017-09-05T00:01:51+02:00"
highlight = true
math = false
tags = ["Projekte"]
title = "Pharo Smalltalk to the net"

[header]
  caption = "(c) Hans Beck"
  image = "spaceCity.jpg"

+++

The world today is dominated by the internet and the clouds. More and more things are stored in the cloud, and it is common to have access to the own images, mails and posts from  every device.

Then another technology raised and begin to shape the way how we use computers and how we see data. Augmented Reality and Virtual Reality provide a 3D immersive experience.  Objects flowing around the user or being located right in front or somewhere in space. Data objects getting a shape or even a body. If many users are looking at these objects through their VR headsets in parallel, they should see the same objects. This is the collaborative work envisioned by the companies providing such AR or VR headsets.

Some years ago, there was a great idea of how to keep synchronized these data objects for many users. The basic approach was to replicate computation, not data. Think about this scene: you look at a cube in your browser. It may be a thing from a CAD system for example. You want to get it bigger, so you set the command to stretch it in all dimensions. Replication than means not to store the now bigger cube on the server. In replication systems, the calculation operation of stretching is distributed into the net. Every client has its own cube. Your friend looks also at this cube. His client receives the stretching operation triggered from you and applies it to his cube. As a result your friend sees exactly the same cube as you. Blockchains operates like somewhat similar. Here, any transaction (our stretching operation here) is added to a secured block and to any other of the many copies of this block.

![Replication](/img/replication.png)

The theoretic foundation was introduced by David P. Reed in the 70ties. This ideas resulted in the OpenCroquet system written in Squeak Smalltalk, which later becomes the [OpenCobalt](http://www.opencobalt.net/) system. It takes only a little step to imagine that this OpenCroquet system would be the ideal basic software technology to implement an distributed AR/VR system with the flexibility and power of Smalltalk. In addition, this would push Smalltalk into the net!

So here is my plan:

**First goal**: try to get the basic replication mechnism working over at least to different images

+ setup the last version of OpenCobalt into a Git repository of Pharo Smalltalk
+ adapt OpenCobalt to [Pharo Smalltalk](http://pharo.org/)
+ adapt the Pharo Compiler for OpenCobalt (which may be necessary)

**Second goal**: make it ready for VR

+ strip of all graphics code from the original code. OpenCroquet has a lot of graphics in it
+ connect Pharo (and OpenCroquet) with the [Unity3D](https://unity3d.com/) engine. This is necessary because many AR/VR systems are working with unity. This is especially true for the Microsoft *Windows Mixed Reality* strategy, which is one of my main destination platforms.

Far **third goal**:

+ add blockchain mechanisms to the replication and storage. It would be an ultimative goal to have a secure and privacy based solution for this new AR/VR world. You may see it as same kind of oprating system for the virtual variant of the real world.

At this moment in time, I can not say if this will works. I don't know if I I'm capable of doing this, and if the OpenCroquet code is understandable and operable enough. It also may be required to implement the theory of David P. Reed ("TeaTime system") new from scratch. Anyway, I'll try it.

I hope also to get support by the Pharo community, but I know from my past that this community was very helpful and interested all the time, so I feel good :) Please contact me (data are available [here](/#contact)) if you want to discuss things. At the moment, I'm busy with a game development, but I hope to start the work not later than end of this year.

Note to myself: I'm very excited to be back at Smalltalk .....
