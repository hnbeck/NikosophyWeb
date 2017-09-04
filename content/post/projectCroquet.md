+++
date = "2017-09-05T00:01:51+02:00"
highlight = true
math = false
tags = ["Projekte"]
title = "Pharo Smalltalk to the net"

[header]
  caption = ""
  image = ""

+++
The world today is dominated by the internet and the clouds. More and more things are stored in the cloud, and it is common to have access to the own images, mails and posts from  every device.

Then another technology raised and begin to shape the way how we use computers and how we see data. Augmented Reality and Virtual Reality provide a 3D immersive experience.  Objects flowing around the user or are located right in front or somewhere in space. Data objects getting a shape or even a body. If many users are looking at these objects through their VR headsets in parallel, they should see the same objects. This is the collaborative work visioned by the companies providing such AR or VR headsets.

Some years ago, there was a great idea of how to keep synchronized these data objects for many users. the basic approach was to replicate computation, not data. If one user changes for example the length of a brick in data space, the calculations needed for stretching the brick were replicated. This means at every client, this stretching calculations were performed if the user looks at this brick. The theoretic foundation was introduced by David Reed in the 70ties.
This ideas resulted in the OpenCroquet system written in Squeak Smalltalk, which later becomes the [OpenCobalt](http://www.opencobalt.net/) system.

Now, would'nt it be nice to have such replicated objects for the AR VR world ? If a user manipulates an data object in his virtual world, wouldnt it be nice that every friend looking at this object too see the changes immediatly? The blockchain world also uses replicated computation. Here, an transaction is part of a closed block and on every copy of that block everywhere in the net.
