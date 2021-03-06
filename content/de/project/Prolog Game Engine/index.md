---
title: Prolog Game Engine
summary: Wie eine Game Engine in PROLOG aussehen könnte.
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

### Ziel und Motivation

Ziel des Projektes ist die Erstellung eines Grundsystems für Computerspiele in Prolog. Diese Sprache ist nicht die typische Implementierungssprache für Spiele, aber als Sprache der logischen Programmierung lassen sich Regeln gut abbilden. Und Regeln sind nunmal das zentrale Element von Spielen. Daneben sind folgende Elemente der Prolog Welt ideal für Spiele: 

*  Diverse Algorithmen aus der klassischen KI wie Entscheidungsbäume,Wissensmodellierung
*  Probabilistische Programmierung 
*  Qualitative Simulation
*  Logische Beschreibung von Strukturen
*  Modellierung von Kausalitäten auf Basis logischer Aussagen

Es reizt also, diese Dinge im Spielekontext auszuprobieren. Wenn ein funktionerende Prototyp aufgebaut werden kann, ist diese Technologie vielleicht als Basis für größere Projekte vorstellbar. Zunächst gilt: ausprobieren anhand eines kleinen Abenteuerspiels.

Als Experiment soll es zwar ein spielbares Spiel werden, aber nicht mit fortgeschrittenen Indie-Spielen oder gar kommerziellen Titel konkurrieren. 


### Grundsätzliche Entscheidungen

Die ECLogicPlay ist gedacht für Abenteuerspiele oder Rollenspiele, da das Geschichten erzählen für mich ein wesentlicher Punkt von Spielen ist. Die Grafik steht am Anfang nicht im Vordergrund, denn es geht zunächst um einen Technikprototyp. Das Spiel soll folgende Eigenschaften haben: 


*  Multiplayerfähig, wenn auch nicht in der ersten Version
*  Abenteuerspiel im SF Kontext
*  Es soll Rollen geben mit unterschiedlicher Handlungsbreite: Spieler und erzählende Spieler (Autoren)
*  Browserspiel, d.h. Prolog läuft auf dem Server, die Interaktion mit dem Spieler erfolgt über JavaScript im Browser
* Persistenz wird über Prolog in RDF gelöst.
* In der ersten Version wird das Spiel evtl. als Textadventure gestaltet

Die Bedeutung der Akteure ergibt sich aus dem Diagramm "Anwendungsfälle".
{{< figure src="/src/UseCaseECLogPlay.png" title="Use Cases" >}}

{{< figure src="/src/ElementsECLogicPlay.png" class="myimg" title="Elements" >}}

Die Architektur (vgl. Diagramm "Elements") wird also einen Funktionsblock haben der Rollen beschreibt, die im Spiel die Handlung bestreiten. Eine Simulation kümmert sich um die Weltentwicklung. Das macht diese, indem unter Anwendung bestimmter Regeln aus einem Zustand der Spielewelt der nächste Zustand bestimmt wird. Im Block "Script" steckt die Realisierung des Handlungsbogens, der von den Autoren bestimmt wird. Über die Persistenz werden Spielstände und Charakterstände und ggf. andere Dinge wie User Daten gespeichert.

Der Ansatz hat dabei zwei Besonderheiten: 

1.  Die Autoren geben über die Skripte den Handlungsbogen der Spielwelt vor. Sie tun das, indem sie Ereignisse oder Verhaltensregeln für spezielle Rollen über einen Spielzeitraum in der Zukunft des Spiels festlegen, das sogennante Skript. Spezielle Rollen sind Führer, Völker oder andere Rollen mit grossem Wirkradius.
2.  Die Autoren sind aber dennoch normale Spieler, nehmen also am Spielgeschehen Teil wie alle anderen.


### Projektrealisierung

Der Sourcecode wird [hier](https://github.com/hnbeck/ECToBeTerraner.git) in GitHub verfügbar sein. Anforderungen und Userstories bzw. weitere Informationen werden im GitHub Projekt [ECToBeTerranerRQ](https://github.com/hnbeck/ECToBeTerranerRQ). Implementiert wird in [SWI-Prolog](http://www.swi-prolog.org), der JavaScript Teil wird evtl. über [P5.js](https://p5js.org/) realisiert. Aber das ist noch nicht entschieden. Mit der Sprache [Processing](http://www.processing.org), dem "Mutterprojekt" von P5.js, habe ich schon Erfahrungen gesammelt. Daher liegt es nahe, damit zu beginnen.

Mit der Zuordnung 

*  UI =  JavaScript
*  alle anderen Elemente =  Prolog

ergibt sich folgendes Verteilungsdiagramm. SWI Prolog hat auch einen Webserver, so dass Prolog die HTTP Schnittstelle direkt implementieren kann.

{{< figure src="/src/DeployECLogPlay.png" title="Use Cases" >}}


### Entwicklungsschritte:

1.  Schritt: Nur ein Spieler, der eine vorgegebene Geschichte mit Alternativen spielt, keine Persistenz, kein User Management, Textadventure
2.  Schritt: < 10 Player spielen in einem gemeinsamen Universum, d.h. inkl. User Management
3.  Schritt: Weiterentwicklung der Grafik und Persistenz

