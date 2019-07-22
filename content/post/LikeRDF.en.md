+++
date = "2019-07-22T18:00:00+01:00"
publishdate ="2019-07-21"
highlight = true
math = false
tags = ["Basics"]
title = "Why I like RDF"

[header]
  caption = "(c) Hans N. Beck"
  image = "obstteller.jpg"

+++

Persistence is important. Storing and managing data is the big thing shaping our world and induce so many things in computer science. If a computer takes the task to handle data it means that it has to handle a *lot* of data. And of course the computer is required to provide means to get the data back. But the mankind is clever. Get data back is not enough. Today the computer shall provide us new insights. Who want to read boring data if getting information or even knowledge is possible? Charts, statisical hypothesis about what will happen next and even knowlege are the matter of interest. 
 
The expectation is now clarified and requires

+  counting data
+  associate data
+  categorize data
+  filter data
+  predict data.

All that is in the background of that simple term "persistence". A lot of theory and structures were invented to manage these tasks. Relational databases, object databases, graph databases and more can be found today in the market as well as in the open souce world. Many books are available explaining this topic in detail, for example (thanks to Anne Ogborn for the hint!)

+  Jeffrey D. Ullman [Principles of Database & Knowledge-Base Systems](https://www.amazon.com/dp/0716781581/ref=cm_sw_r_tw_dp_U_x_0einDbE4CNB3D)
+  Stefano Ceri, G. Gottlob, L. Tanca [Logic Programming and Databases (Surveys in Computer Science)](https://www.amazon.com/dp/0387517286/ref=cm_sw_r_tw_dp_U_x_wjinDb0788341)

Now, I'm looking for a persistence component for my project [ECLogicPlay](en/project/prologgameengine/) The ECLogicPlay will be implemented in [SWI-Prolog](http://www.swi-prolog.org) which raises two questions: 

1.  Database type: which kind of database suits to my application
2.  Prolog congruency: which kind of database fits to Prolog


### Considering database types

Assume we have a relational database (the widely used type today) and a table "childs" containing data about childs and their parents. 

| name | lastname | father | mother |
|------|-----|--------|-----|
| Sahra | Keller | Mike  | Annie     |
| John | Keller | Mike | Annie    |
| Robert | Cameron | Mitchell  | Doris     |
| Nelly | Cameron | Mitchell | Doris   |

If we want to know which childs has Mike the SQL data base query language may look like this: 

    SELECT name FROM childs WHERE father="Mike"

Children go to school, and that school may have a table for its own listing all classes. 

| class | name |  lastname | teacher | 
|-------|------|--------|----|
| 1	| John | Keller | Walter |
| 1 | Matthew | Neuman| Doris |
| 2 | Cindy | Johnson | Clint |
| 2 | Rebecca | Whittaker  | Sandra |

There might be a reason that the teacher what to contact the parents of one of John. All data are available. The problem is we have two soures or two tables, respectively. The one lists childs, the other classes. We have to associate both sources. This could be done like

	SELECT childs.father, childs.lastname, class.lastname FROM class JOIN childs on childs.lastname = class.lastname WHERE childs.name="John"

Here the name is the key to identify which data are associated: the name in the one table has to be the same in the other table to identify the correct row of both tables. Roughly speaken, in a relational database you have data given in a collection of rows. Each row is a sequence of columns. Operating with this data means stripping of columns or insert columns in order to get the row you want. The mechanisms of a relational database provides (via SQL) the cabability to perform such column operations. All you need are data given as a collection of items with common strucure and the posibility to define an unique key.


Unfortunately, the world is bad. Data can look like the example in figure "Graph DBs":

{{< figure src="/src/graphdbex.png" title="Graph DBs" >}}

As you can see, not every node has the same relations. To implement this knowledge in tables you would have to introduce many tables with a few data. The knowledge here is not a list of items with fixed relations. The whole thing seems more like a collection of knowledge as it may be at certain time. If we know something new about Sahra or the dog, it is easy to expand the database by introducing new nodes or relations. 

It is easy to see that this graph could also be modeled in Prolog. Every pair of nodes could be expressed as 'provide(john, feed)' or 'like(john, dog)' and so on. But you might imagine that the access may take more time because it requires traversing a graph. To overcome this graph DB can use schemas, a describtion of node types and their possible relations.

{{< figure src="/src/rdf.png" class="myimg" title="RDF" >}}

Here comes RDF onto the scene. RDF express its data in triples which are of type subject, predicate and object. This is an elementary scheme matching the way we are defining categories and knowledge. 



### considering Prolog concurency

Prolog should have a good relationship to each other, Prolog is about knowledge and query of knowledge, too. Looking at the basics of Prolog, we have klike

    daddy(mike, sahra).
    daddy(mike, john).

 expressing that mike is the father of Sahra and John. So it is possible to do the query

    ?daddy(A, john).

 resulting in 

   A = mike.

 Or in SQl, the database query language (assumung there is a table family with columns daddy and child)


### selection

At this point, it is obvious that a decision how to do persistence is influenced by

*  is the knowledge in the data fluent 
*  are there many data of same structure
*  is fast access of many data an issue
*  what knowledge shall the data express
*  how do you process the data, query or counting or visulization or...