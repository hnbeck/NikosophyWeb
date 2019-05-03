+++
date = "2018-06-18T19:28:37+02:00"
external_link = ""
highlight = true
image_preview = "introCardEngine.png"
math = false
summary = "Grundsystem (Engine) für Kartenspiele in Prolog"
tags = ["Basics"]
title = "ECCardLogic"
src = ""

[header]
  caption = "(c) Hans N. Beck)"
  image = "steelroof.jpg"

+++
Prolog ist eine Sprache, in der sich Spielregeln sehr gut abbilden lassen. Dieses Projekt hat zum Ziel, ein Grundsystem für Kartenspiele in Prolog zu entwickeln. Die Spielflächse sollte beliebtig sein können. Karten mögen mit jeder Art von Attributen und Typen versehen sein. 

Jeden Kartenspielen sei die Eigenschaft gemein, in Runden gespielt zu werden. Jede Runde hat dabei wiederum Phasen.  {{< figure src="/img/gamesequence.png" title="Spielsequenz" attr="float:right" >}}

Ob in jeder Phase beide Spieler Aktionen spielen, oder ein Spieler eine ganze Runde absolviert, bevor der andere Spieler seine Aktionen durchführen darf, soll der Spieledesigner entscheiden können. 

Reglen haben zwei Teile: 

	1.  Regeln, die die Entwicklung der Spielewelt modellieren. Nach jeder Phase oder Runde sollrn diese Regeln aus dem Zustand der Spielewelt einen neuen Zustand ermitteln, inklusive Punkteauswertungen oder ähnliches

	2.  Regeln, die die Aktionen der Spieler regeln.  Diese Regeln zeigen also an, was ein Spieler in der Spielewelt tun darf. 


Das Entwicklungssystem soll [SWI-Prolog](http://www.swi-prolog.org) sein. Es macht Sinn, dass dieses Prolog Programm als Server Programm zum Einsatz kommt, welches von dem Client kontaktiert wird. Das Prolog System sollte den Zustand der Welt als ASCII Zeichenfolge dem Client übermitteln. Oder anders gesagt, die Visualisierung bleibt eigenständig.

