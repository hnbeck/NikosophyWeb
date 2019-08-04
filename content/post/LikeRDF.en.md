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

All that is in the background of that simple term "persistence" and I#ll refer to this as "Persistence task". A lot of theory and structures were invented to manage these tasks. Relational databases, object databases, graph databases and more can be found today in the market as well as in the open souce world. Many books are available explaining this topic in detail, for example (thanks to Anne Ogborn for the hint!)

+  Jeffrey D. Ullman [Principles of Database & Knowledge-Base Systems](https://www.amazon.com/dp/0716781581/ref=cm_sw_r_tw_dp_U_x_0einDbE4CNB3D)
+  Stefano Ceri, G. Gottlob, L. Tanca [Logic Programming and Databases (Surveys in Computer Science)](https://www.amazon.com/dp/0387517286/ref=cm_sw_r_tw_dp_U_x_wjinDb0788341)

Now, I'm looking for a persistence component for my project [ECLogicPlay](en/project/prologgameengine/). I've not read the books mentioned above yet. My perspective for this post is more a phenomenical one. So let the game begin.

The ECLogicPlay will be implemented in [SWI-Prolog](http://www.swi-prolog.org) which raises two questions: 

1.  Data modeling: How to think and model data
2.  Prolog congruency: does this thinking match the Prolog way of modeling


### Ways of thinking data

Assume we have data given in a table "childs" describing childs and their parents. 

| name | lastname | father | mother |
|------|-----|--------|-----|
| Cindy | Johnson | Ulrich  | Sandra     |
| John | Keller | Mike | Annie    |
| John | Cameron | Mitchell  | Doris     |


If we want to know which childs has Mike a query language may look like this: 

    SELECT name FROM childs WHERE father="Mike"

This is easy to understand. Now, children go to school, and that school may have a table for its own listing all classes. 


| class | name | lastname | teacher |
|------|-----|--------|-----|
| 1	| John | Keller | Walter |
| 1 | Matthew | Neuman| Doris |
| 2 | Cindy | Johnson | Clint |
| 2 | Rebecca | Cameron  | Sandra |


There might be a reason that the teacher want to contact the parents of John. All data are available. The problem is we have two soures or two tables, respectively. The one lists childs, the other classes. We have to associate both sources. What would you do if the tables would be listings on paper? Probably you may look in the table "class" for the last name of "John", which is "Keller",  and retrieve in the row of the table "childs" containing "John" and "Keller" the name of the father. In a data base query language this may look like

	SELECT childs.father FROM class JOIN childs on childs.lastname = class.lastname WHERE childs.name="John"

Both rows - one of table childs and one of table class - are sticked together logically. Which row to take in every table is decided by the "key" lastname combined with name.

We observe: to operate with tabled data means thinking in a lot of rows build from a sequence columns. Or in other words, every data item (the row) has to have the same attributes (the columns). A key is needed to make every row unique. Where no natural uniqueness is given, an artifical value has to be introduced. 

I invite you to understand a row as an object (which is an individual!) annotated by attributes. In this picture we have object sets, each table is such a set. Every object of a set is unique with a common structure. Computer people would say they have the same type. 

Let's do the check with the *persistence task*: 

+ counting data as easy as counting objects of a set with a required attribute value.
+ associate data would require to blend objects. Some attribute of one object contain an identifier of another object. At this place the other object would be "projected" into the other object. What we get is a hierarchy of objects. Nothing bad so far, every object oriented programming does such things. But this hierachy of objects can be complex, must be filtered.
+ catagorizing data requires to have an overview of the data and compare them. The simples case is we look to all objects we have in the different sets and compare them. But this objects are some pre-decision of categories. Ok, so we look at the objects trees by associating them by their IDs. Because the tree is shaped by the IDs, this is also a pre-judgement. To find new categories, it would require to resolve all IDs and objects and define another strucure. Seems possible, but not very easy
+ filtering data means to filter attributes of objects. Filtering objects, some attribute of objects is no hard task. 
+ predicting data in the sense of filling gaps is the same as filling missing objects. This seams reasonable, if you have a set ob objects you might identify a pattern how they all look like. Predicting attributes of the objects might be much harder, I would assume that further attributes can not be infered from already known one. It might require a model of the object itself, some kind of preknowledge or judgment about the objects of a set to do this.

There is an alternative way of thinking data. Again we have objects in our mind, but instead of big blocks of data wie look at them as small units. If we relate this units with other units,  data can look like the example in figure "Graph DBs":

{{< figure src="/src/graphdbex.png" title="Graph DBs" >}}

As you can see, this data have no common shape. This data landscape doesn't let think you about tables and equal structured rows. The whole thing seems more like a collection of knowledge as it may be at some point in time. If we know something new about Sarah or the dog for example it will be easy to expand the database by introducing new nodes or relations. As you may expect, graph databases were introduced to handle such data: they are connected graphs.  

Retrieving data and gaining information becomes a walk throw the graph. Starting from something known - item named "Mike" - we walking down the "father" link and learn that Mike is the father of John. Taking another path out from "Mike" we get the data that Mike is also father of Sahra. Keeping this in mind we can check the *persistence task*

+ counting is a little bit harder here: it is about to examine all paths starting from a node. Graph search can be a heavy thing.
+ associating data is very easy: links can be drawn from every item to very item. The graph structure grows as knowledge grows
+ categorizing data is easy as well. If we express categories or judgments by relations, any way of category is possible. And it is changable, because rearranging links should be the brilliant capability of graph data bases
+ filtering has a pro site and a down site. Forbid some paths - which means some relations - is an easy task. But filtering more complex data described by subgraphs may be hard. This is because an information may be represented by different shaped subgraphs. It is a matter of data organisation if filtering is hard or not so hard.
+ predicting is a difficult topic here. Predicting in the context of counting may be hard. Predicting in a connected graph could be also done as structure pattern matching: some structures may be very simmilar to other structures. If one add some links ore nodes to get the similar structures this is the prediction.  

{{< figure src="/src/rdf.png" class="myimg" title="RDF" >}}

If you think that's a little bit wild: there are graph data bases which have a schema. A schema is like a building pattern of the graph. Here comes RDF on the scene: RDF express its data in triples of type subject, predicate and object. This is an elementary scheme matching the way we are defining categories and knowledge. 


### Considering Prolog congruency

Prolog is about knowledge and query of knowledge, too. Looking at the basics of Prolog, we have things like

    father(mike, john, keller).
    father(ulrich, cindy, johnson).
    class(1, john).
    teacher(walter, john).

 expressing some knowledge from the tables above. So it is possible to do the query

    ?father(A, john).

 resulting in 

   A = mike.

And what's about the teachers question? Oh, here we need a rule expression what we have done with the paper lists above:

	parent(Class, Name, Parent) :- class(Class, Name, LastName), father(Parent, Name, LastName).

Now the teacher could ask

	?parent(1, john, Parent).

gives

	Parent = mike.
 
The notation looks different, but the impression is Prolog fits to the thinking of tables.

It is easy to see that this graph could also be modeled in Prolog. Every pair of nodes could be expressed as 'provide(john, feed)' or 'like(john, dog)' or buy(mike, cat) and so on. You want to know all kids are in the familiy of mike? Easy:

	?father(mike, Child).

gives

	Child = john.
	Child = sarah.
	false.

Another question: which animals are in the familiy? To answer this, we need  rules:

		animals(Father, Animal) :- buy(Father, Animals);
								 kids(Father, Allkids),
								 kidAnimals(AllKids, Animals, Animals2).

	 	kidAnimals([], Result, Result).
	 	kidAnimals(AllKids, Animals, Animals3) :- [kid | OtherKids] = AllKids,
	 											  like(Kid, Animal).
	 											  append(Animals, [Animal], Animals2), 
	 											  kidAnimals(OtherKids, Animal2, Animals3).

In words: take all animals the father bought and in addition all animals very kid of this father likes. Nothing special so far for a Prologer. But it is not that easy looking asking for something as in the table data case. The graph - which means the relations and nodes modelling the data - have great impact on the effort to get data back. 

I observed that in such data graphs more thoughts or more assumptions related to the solution are included than in tables. Or in other words graph data are less of nature pure collecting data. They are more part of the solution than tables. In addtion, the graph reflects not objects, knowledge is  here distributed in small little elements like relations, nodes. There nothing well structured like the collection of objects a table is build of. 

The solution is to give more structure to the building of data graphs. Here I come back to RDF mentioned above. RDF helps to think again in a common way about objects and their attributes. The subject - predicate - object triple models an attribute (the subject) and statement about (the predicate and the object). But in advantage of the tables, my objects here can be expanded and related together easily. My knowledge and structure can grow and adapt. 

### The Selection

At this point, it is obvious that a decision how to do persistence is influenced by

*  is the knowledge in the data fluent 
*  are there many data of same structure
*  is fast access of many data an issue
*  what knowledge shall the data express
*  how do you process the data, query or counting or visulization or...