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
 
The expectation and task is now clarified and requires

+  counting data
+  associate data
+  categorize data
+  filter data
+  predict data.

All that is in the background of that simple term "persistence" and I'll refer to this as *"Persistence task"*. A lot of theory and structures were invented to manage these tasks. Relational databases, object databases, graph databases and more can be found today in the market as well as in the open souce world. Many books are available explaining this topic in detail, for example (thanks to Anne Ogborn for the hint!)

+  Jeffrey D. Ullman [Principles of Database & Knowledge-Base Systems](https://www.amazon.com/dp/0716781581/ref=cm_sw_r_tw_dp_U_x_0einDbE4CNB3D)
+  Stefano Ceri, G. Gottlob, L. Tanca [Logic Programming and Databases (Surveys in Computer Science)](https://www.amazon.com/dp/0387517286/ref=cm_sw_r_tw_dp_U_x_wjinDb0788341)

Now, I'm looking for a persistence component for my project [ECLogicPlay]({{< ref "PrologGameEngine.en.md" >}}). I've not read the books mentioned above yet. My perspective for this post is more a phenomenical one. So let the game begin.

The ECLogicPlay will be implemented in [SWI-Prolog](http://www.swi-prolog.org) which raises two questions: 

1.  Data modeling: How to think and model data
2.  Prolog congruency: does this thinking match the Prolog way of modeling


### Ways of thinking data

Assume we have data given in a table *"childs"* describing childs and their parents. 

| name | lastname | father | mother |
|------|-----|--------|-----|
| Cindy | Johnson | Ulrich  | Sandra     |
| John | Keller | Mike | Annie    |
| John | Cameron | Mitchell  | Doris     |


If we want to know which childs has Mike a query language may look like this to get the answer: 

    SELECT name FROM childs WHERE father="Mike"

This is easy to understand. Now, children go to school, and that school may have a table for its own listing all classes. 


| class | name | lastname | teacher |
|------|-----|--------|-----|
| 1	| John | Keller | Walter |
| 1 | Matthew | Neuman| Doris |
| 2 | Cindy | Johnson | Clint |
| 2 | Rebecca | Cameron  | Sandra |


There might be a reason that the teacher want to contact the parents of John. All data are available. The problem is we have two soures or two tables, respectively. The one lists childs, the other classes. We have to associate both sources. What would you do if the tables would be listings on paper? Probably you may look in the table *"class"* for the last name of *"John"*, which is *"Keller"*,  and retrieve in the row of the table *"childs"* containing *"John"* and *"Keller"* the name of the father. In a data base query language this may look like

	SELECT childs.father FROM class JOIN childs on childs.lastname = class.lastname WHERE childs.name="John"

Both rows - one of table childs and one of table class - are sticked together logically. Which row to take in every table is decided by the "key" lastname combined with name.

We observe: to operate with tabled data means thinking in a lot of rows build from a sequence columns. Or in other words every data item (the row) has to have the same attributes (the columns). A key is needed to make every row unique. Where no natural uniqueness is given, an artifical value has to be introduced. 

Now I invite you to understand a row as an object (which is an individual!) annotated by attributes. In this picture we have sets ofvobject. Each table is such a set. Every object of a set is unique with a common structure. Computer people would say they have the same type. 

Let's do the check with the *persistence task*: 

+ counting data? We win, it is as easy as counting objects of a set (with a required attribute value).
+ associate data? Ok, that would require to blend objects. Some attribute of one object contain an identifier of another object. At this place the other object would be "projected" into the other object. So we have to handle a hierarchy of objects. Nothing bad so far, every object oriented programming does such things. But this hierachy of objects can be complex, must be filtered. And this identifier thing is a pre-judgement which limits categorization.
+ catagorizing data? If we want to identify categories we have to see what is given. We need an big picture of the data. And: we need a way to compare them. No problem you say, just take all objects we have in the different sets and compare them along the attributes. Yes, but this objects represent some pre-decision of categories. Ok, what's about the objects hierachies (given by associating objects via their IDs)? Because this hierachies are shaped by the IDs, this is also a pre-judgement. To find new categories, it would require to resolve all IDs and objects and define an different strucure. Seems possible, but not a fun thing - we would set up a nearly knew database.
+ filtering data? Filter attributes of objects of selected properties, and we're done. 
+ predicting data? If this meas filling gaps then this is the same as filling missing objects (of one set). This seams reasonable, doesn't it? Having a set of objects might help to identify a pattern how they all look like. Though, predicting what attributes the objects are missing could be harder. I would assume that further attributes can not be infered from already known one. It might require a model of the object itself, some kind of pre-knowledge or judgment about the objects.

Pre-judgement or apriori knowledge is a thing I want to notice here.

There is an alternative way of thinking data. Again we have objects in our mind. But instead of big blocks of data wie look at them as small units. If we relate this units with other units, data can look like the example in figure "Graph DBs":

{{< figure src="/src/graphdbex.png" title="Graph DBs" >}}

As you can see, this data have no common shape. Looking at this data landscape doesn't let us think about tables and equal structured rows. The whole thing seems more like a collection of knowledge as it may be at some point in time. There is a postive thing. If we know something new about Sarah or the dog for example it will be easy to expand the database by introducing new nodes or relations. As you may expect, graph databases were introduced to handle such data: they are connected graphs.  

Retrieving data and gaining information becomes a travel throw the graph. Starting from something known - item named *"Mike"* as example - we walking down the *"father"* link and learn that Mike is the father of John. Going back, taking another path out from *"Mike"* provides us the insight that Mike is also father of Sahra. Keeping this in mind we should check the *persistence task* again:

+ counting? Well, this is a little bit harder here. It is about to examine all paths starting from a node with the goal to visit some nodes of choicde. Oh yes, graph search can be a heavy thing....
+ associating data? Winner! An easy thing here: links can be drawn from every item or node to every other item. The graph structure can evlolve with our knowledge. And this growing knowledge can be everything, not just another object of an already shaped set.
+ categorizing data?  If we express categories or judgments by relations, any way of category is possible. And it is changable, because rearranging links should be the brilliant capability of graph data bases. Nodes in the graph are small units, please remember. The categorization is mapped in the graph structure, not in nodes.
+ filtering? Uhh, this has a good site and a down site. When we forbid paths - mark them as not traversable - some data are not reachable. They are filtered out. Unfortunately, this leads directly to the downside. Assume we want to filter out all data describing childs of Mike. Filtering out a subgraph would be the result. But if we still want to keep data about the animals? The subgraph is gone, we can not go to the animal nodes.... I don't want to go deeper here, but it is obvious that filtering requires complex thoughts and provisions in the data base mechanics.
+ predicting?  As long as predicting is based on counting - probability based on frequency of something - we have the same difficulty as for counting. Not a top discipline here. And here comes my big "BUT": my personal belief is that prediction could be done by structure inspection. I assume that information or knowlegde shows similar structures in such a graph data base. If we could make some subgraphs (structural) equal if introducing a node or a link, this would be the prediction. A predictions not based on numbers but structure is a big thing for me.

{{< figure src="/src/rdf.png" class="myimg" title="RDF" >}}

If you think that's a little bit wild: of course a graph could have some builing pattern, some kind of a schema. This schema may tell thich types of nodes are allowed or which relations can be applied ot such nodes. A schema is like therefore a building pattern of the graph. Yes, if we use a schema we introduce pre-knowledge. But we have full control how much and how deep this pre-knowledge influence our persistence model.

Here comes [RDF](https://www.w3.org/RDF/) on the scene: RDF express its data in triples of type subject, predicate and object. This is an elementary scheme matching the way we are defining categories and knowledge. For me, it is an acceptable amout of pre-knowledge, but provides a lot of structures supporting the weak points of graph databases: filtering, predicting, and counting without taking down categorization to much.


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

In words: take all animals the father bought and in addition all animals very kid of this father likes. Nothing special so far for a Prolog coder. But it is not that easy looking asking for something as in the table data case. The graph - which means the relations and nodes modelling the data - have great impact on the effort to get data back. You might got the idea already for yourself.

At this point, I want to flip the coin. Prolog as a logic programming language is the gold tool for operating on facts, inspection and operation on structures. Graph data bases need something to work on a structural level to unwrap the full power of them. Therefore, Prolog is the perfect match to graph data bases, the capabilites of Prolog and graph databases support each other. Prolog can handle big sets of equal structured data - but here we have other tools and languages.

{{< figure src="/img/yeah.png" title="The selection" >}}


### The Selection

At this point, it may obvious that a decision how to do persistence is influenced by

*  is the knowledge in the data fluent -> associate and categorize data is a big thing, reshaping the data is probable
*  are there many data of same structure -> modeling objects and attributes (=tables) is straightforward
*  is fast access of many similar data an issue -> object sets can help here
*  what knowledge shall the data express ->
*  how do you process the data, query or counting or visulization or...

What is given to me? [ECLogicPlay]({{< ref "PrologGameEngine.en.md" >}}) is based on rules - rules are the fuel of games. Rules are more knowledge than data set based. I don't want explain this in detail. You can get the idea if you reminding that rules apply on many differnt aspects of the game world. In this world there are subjects (players), objects (like ressources, assets...) which have to controled by this rules. And all these things are changing. The state of the playing characters and objects changes all the time. Knowledge and world changes. 

Last but not least: my game engine is intended to support adventure games. You may guess it, adventures are the game type which needs a lot of modeled knowledge. To use a graph data model is a logical consequence. Above we have seen that a general graph database have some weakness. The solution is - as mentioned above - to give more structure to the building of data graphs. I select RDF for this and because of this. RDF helps to think again in a common way about objects and their attributes (see figure "RDF" above). The subject - predicate - object triple models an attribute (the subject) and statement about (the predicate and the object). But in advantage of the tables my objects here are small units,  can be expanded and related together easily. My knowledge and structure can grow and adapt in a way which has some basic structure. I expect that this property of RDF will also support knowledge and structure procssing via Prolog in a good way.

I expect a good support for my adventure logic by RDF based persistence. I hope I could give you as reader an idea about my thoughts and conclusions, even if I could not expand all things in the required detail. And I'm very happy about the support of RDF in [SWI-Prolog](http://www.swi-prolog.org), thanks to the autors and contributers of this top software. 