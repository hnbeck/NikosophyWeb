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
| Cindy | Johnson | Ulrich  | Sandra     |
| John | Keller | Mike | Annie    |
| Robert | Cameron | Mitchell  | Doris     |


If we want to know which childs has Mike the SQL data base query language may look like this: 

    SELECT name FROM childs WHERE father="Mike"

Children go to school, and that school may have a table for its own listing all classes. 

| class | name |  lastname | teacher | 
|-------|------|--------|----|
| 1	| John | Keller | Walter |
| 1 | Matthew | Neuman| Doris |
| 2 | Cindy | Johnson | Clint |
| 2 | Rebecca | Cameron  | Sandra |

There might be a reason that the teacher what to contact the parents of one of John. All data are available. The problem is we have two soures or two tables, respectively. The one lists childs, the other classes. We have to associate both sources. This could be done like

	SELECT childs.father FROM class JOIN childs on childs.lastname = class.lastname WHERE childs.name="John"

Both rows - one of table childs and one of table class - are sticked together. Which row to take is decided by the "key" lastname. In general the lastname may not unique in the table, so a value has to be be introduced which grants unique identifcation of every row. 

So thinking data in the world of relational databases means thinking in a lot of rows build from a sequence columns. Or in other words, every data item (the objects?, the row) has the same attributes (the colums). A key is needed to make every row unique.

Unfortunately, the world is bad. Data can look like the example in figure "Graph DBs":

{{< figure src="/src/graphdbex.png" title="Graph DBs" >}}

As you can see, this data have no common shape. You may interpret relations as attributes, but then all items looks individual. This data landscape doesnt let think about tables and equal structured rows. The whole thing seems more like a collection of knowledge as it may be at some point in time. If we know something new about Sarah or the dog, it will be easy to expand the database by introducing new nodes or relations. As you may expect, graph databases were introduced to handle such data.

{{< figure src="/src/rdf.png" class="myimg" title="RDF" >}}

If you think that a little bit wild: there are graph data bases which have a schema. A schema is like a building pattern of the graph. Here comes RDF on the scene: RDF express its data in triples of type subject, predicate and object. This is an elementary scheme matching the way we are defining categories and knowledge. 

Conclusion: which data type fits to the application is the question about how the data looks like the application has to deal with. 


### considering Prolog congruency


It is easy to see that this graph could also be modeled in Prolog. Every pair of nodes could be expressed as 'provide(john, feed)' or 'like(john, dog)' and so on.

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