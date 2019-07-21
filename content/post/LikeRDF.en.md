+++
date = "2019-07-22"
highlight = true
math = false
tags = ["Basics"]
title = "Why I like RDF"

[header]
  caption = "(c) Hans N. Beck"
  image = "obstteller.jpg"

+++

Persistence is important. Storing and managing data is the big thing shaping our world and induce so many things in computer science. If a computer takes the task to handle data it means that it has to handle a lot of data. And of course the computer is required to provide means to get the data back. But the human is clever. In history, in the early days of computing, to get the data back was enough. Today the computer shall provide us new insights. Who wants read boring data if one could get information or even knowledge? Charts, statisical hypothesis about what will happen next and even knowlege are the matter of interest.
 
We see: storing and accessing data is important, but also processing them like

+ counting
+ associate them
+ categorize them
+ filter them

is behind of that simple term "persistence". A lot of theory and structures were invented to manage these tasks. Relational databases, object databases, graph databases and more can be found today in the market as well as in the open souce world. Many books are available explaining this topic in detail, for example (thanks to Annie Ogborne for the hint!)

+ Jeffrey D. Ullman [Principles of Database & Knowledge-Base Systems](https://www.amazon.com/dp/0716781581/ref=cm_sw_r_tw_dp_U_x_0einDbE4CNB3D)
+ Stefano Ceri, G. Gottlob, L. Tanca [Logic Programming and Databases (Surveys in Computer Science)](https://www.amazon.com/dp/0387517286/ref=cm_sw_r_tw_dp_U_x_wjinDb0788341)

Now, for my project [ECLogicPlay](en/project/prologgameengine/) I need a persistence component. Because the ECLogicPlay will be implemented in [SWI-Prolog](http://www.swi-prolog.org) which leads to the question how to connect Prolog with a database. Both should have a good relationship to each other, Prolog is about knowledge and query of knowledge. This is given in its predicates and forumlas, like

    daddy(mike, sahra).
    daddy(mike, john).

 expressing that mike is the father of Sahra and John. So it is possible to do the query

    ?daddy(A, john).

 resulting in 

   A = mike.

 Or in SQl, the database query language (assumung there is a table family with columns daddy and child)

   SELECT daddy FROM family WHERE child='john'

Both techniques associate data by relations. The thinking is in tables.  Now assume, your data are heavily connected. For example 

{{< figure src="/src/graphdbex.png" title="Graph DBs" >}}

As you can see, not every node has the same relations. To implement this knowledge in tables you would have to introduce many tables with a few data. The knowledge here is not a list of items with fixex relations, it seems more a collection of knowledge as it is to a certain time. If we know something new about Sahra or the dog, it is easily to expand the database by introducing new nodes or relations. 

It is easy to see that this graph could also be modeled in Prolog. Every pair of nodes could be expressed as `provide(john, feed)` or `like(john, dog)` and so on. But you might imagine that the access may take more time because it requires traversing a graph. To overcome this graph DB can use schemas, a describtion of node types and their possible relations.

{{< figure src="/src/rdf.png" title="RDF" >}}

Here comes RDF onto the scene. RDF expresses its data in triples which are of type subject, predicate and object. This is an elementary scheme matching the way we are defining categories and knowledge. 

At this point, it is obvious that a decision how to do persistence is influenced by

*  is the knowledge in the data fluent 
*  are there many data of same structure
*  is fast access of many data an issue
*  what knowledge shall the data express
*  how do you process the data, query or counting or visulization or...


