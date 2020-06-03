---
title: Logic Anime
summary: An Animationstool in PROLOG
tags:
- Prolog
date: "2017-08-14T19:28:37+02:00"

# Optional external URL for project (replaces project detail page).
external_link: ""

image:		
  caption: Photo by Hans BEck
  focal_point: Smart

links:
- icon: twitter
  icon_pack: fab
  name: Follow
  url: "https://twitter.com/EnrichedGamesHB"
url_code: ""
url_pdf: ""
url_slides: ""
url_video: ""

---

### Ziel und Motivation

Prolog hat eine deklarative Natur. Man beschreibt damit Strukturen. Aber wie verbindet man dies mit Bewegung und animierter Grafik? Aus dieser Frage ist dieses Projekt geboren. Hier soll ein Weg gefunden werden, mittels Prolog eine Animation zu beschreiben, ähnlich einem Drehbuch oder Story Board im Film. 
Weniger geht es darum, ein weiteres tolles Animationstool zu bauen, davon gibt es genügend. 

Der anivisierte Workflow wäre der folgende: Schreibe eine Szene in Worten, die Szene wird zu einem Rendertool geschickt, zu einem Film gemacht und in PowerPoint eingefügt. Die Idee kam mir, als ich eine PowerPoint erstellen wollte, die einen Sachverhalt erklärt. Schön wäre es, so mein Gedanke, ganz schnell eine kleine Animation bauen zu können, wie sie tausende Werbefilme uns entgegenwerfen.

Hier stecken noch einige theoretische BonBons, die in einem Blog Post näher betrachtet werden.


### Grundsätzliche Entscheidungen

Natürlich geht es um Prolog. Der Teil, der das Skript entgegen nimmt, ist also Prolog. Das Rendering übernimmt im ersten Schritt Processing. Das habe ich schon benutzt, und es erscheint mir recht einfach im Verhältnis zu [Unity](https://unity3d.com/de/unity) oder [Unreal](https://www.unrealengine.com/en-US/). 

Das Diagramm "Use Cases" veranschaulicht, was damit gemacht werden soll:
{{< figure src="/src/UseCaseECLogAnime.png" title="Use Cases" >}}

Einige wenige Elemente bestreiten die Verarbeitunggskette:
{{< figure src="/src/ElementsECLogAnime.png" title="Elements" >}}


### Besondere Fragestellungen

Die zentrale Frage ist, wie man Processing die Szene beschreibt, was gerendert werden soll. Es könnte ein Processing Programm sein, es könnte aber auch eine Variante eines Scene Graph sein, der von Processing interpretiert wird. Generell bin ich ein Freund von Programmen, die Programme schreiben. Man denke da an diverse fortgeschrittene Beispiele der LISP und Prolog Welt. Würde man das tun, müsste man die deklarative Beschreibung von Prolog umsetzen in eine objektbezogene Welt des Processing rendering.

In der Alternative würde ein Scene Graph direkt das deklarative des Prolog abbilden, dann müsste Processing die Umsetzungsarbeit deklarativ - dynamisch leisten. Was besser ist wird wohl nur durch ausprobieren geklärt werden können.


### Projektrealisierung

Der Sourcecode wird [hier](https://github.com/hnbeck/ECLogicAnime.git) in GitHub verfügbar sein. Anforderungen und Userstories bzw. weitere Informationen werden im Unterordner "RQ" gesammelt. Implementiert wird in [SWI-Prolog](http://www.swi-prolog.org) und  [Processing](https://processing.org/) realisiert. Processing kann derzeit nur QuickTime Filme renderen, daher ist evtl. noch ein Tools für die Umsetzung in mp4 oder ander Formate nötig.

Alles läuft zunächst auf einem Desktop Computer und tauscht die Informationen ASCII basiert aus:

{{< figure src="/src/DeployECLogAnime.png" title="Use Cases" >}}


### Entwicklungsschritte:

1.  Schritt: Animationen mit festen Shapes und nur Translation, Start, Stop und Kollisionserkennung
2.  Schritt: how knows what is possible :)