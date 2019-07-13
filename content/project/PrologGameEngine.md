+++
date = "2018-06-18T19:28:37+02:00"
external_link = ""
highlight = true
image_preview = "MSCSchiff.jpg"
math = false
summary = "Grundsystem (Engine) für Spiele in Prolog"
tags = ["Basics"]
title = "ECLogicPlay"
src = ""

[header]
  caption = "(c) Hans N. Beck)"
  image = "MSCSchiff.jpg"

+++

## Ziel und Motivation

Ziel des Projektes ist die Erstellung eines Grundsystems für Computerspiele in Prolog. Als Sprache der logischen Programmierung lassen sich Regeln gut abbilden. Daneben sind folgende Elemente der Prolog Welt ideal für Spiele: 

*  Diverse Algorithmen aus der klassischen KI wie Entscheidungsbäume
*  Probabilistische Programmierung verfügbar
*  Quantitative Simulation
*  Logische Beschreibung von Strukturen

Es reizt also, diese Dinge im Spielekontext auszuprobieren. Wenn die technische Basis überzeugt, kann diese vielleicht eine Basis für größere Projekte sein. Zunächst gilt: ausprobieren anhand eine kleinen Abenteuerspiels.

Und als Experiment soll es zwar ein spielbares Spiel werden, aber nicht mit fortgeschrittenen Indie-Spielen oder gar kommerziellen Titel konkurrien. Es darf Spaß machen, ja, aber als

## Grundsätzliche Entscheidungen

Die ECLogicPlay ist gedacht für Abenteuerspiele oder Rollenspiele, da das Geschichten erzählen für mich ein weseentlicher Punkt von Spielen ist. Die Grafik steht zunächst nicht im Vordergrund, denn es geht zunächst um eine Technikdemo. Das Spiel soll folgende Eigenschaften haben: 

{{< figure src="/src/ElementsECLogicPlay.png" class="myimg" title="Elements" >}}

*  Multiplayerfähig, wenn auch nicht in der ersten Version
*  Abenteuerspiel im SF Kontext
*  Es soll Rollen geben mit unterschiedlicher Handlungsbreite: Spieler und durch die geschichte führende Figuren. Letztere werden durch Skripte oder spezielle Spieler, sogenannte "Autoren" gesteuert
*  Browserspiel, d.h. Prolog x läuft auf dem Server, die Interaktion mit dem Spieler erfolgt über JavaScript im Browser
* Persistenz wird über Prolog in RDF gelöst.
* In der ersten Version könne das Spiel auch nur Textgrafik haben


## Projektrealisierung

Der Sourcecode ist [hier](https://github.com/hnbeck/ECToBeTerraner.git) in GitHub verfügbar. Anforderungen und Userstories bzw. weitere Informationen werden im GitHub Projekt [ECToBeTerranerRQ](https://github.com/hnbeck/ECToBeTerranerRQ). Implementiert wird in [SWI-Prolog](http://www.swi-prolog.org), der JavaScript Teil wird evtl. über [P5.js](https://p5js.org/) realisiert. Aber das ist noch nicht entschieden. Mit [Prozessing](http://www.processing.org) ist Erfahrung vorhanden, daher liegt es nahe, damit zu beginnen.

### Entwicklungsschritte:

1.  Schritt: Nur ein Spieler, der eine vorgegebene Geschichte mit Alternativen spielt, keine Persistenz, kein User Management
2.  Schirtt: <10 Player spielen in einem gemeinsamen Universum, d.h. inkl. User Management
3.  Schritt: Weiterentwicklung der Grafik und Persistenz

