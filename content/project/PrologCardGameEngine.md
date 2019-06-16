+++
date = "2018-06-18T19:28:37+02:00"
external_link = ""
highlight = true
image_preview = "introCardEngine.png"
math = false
summary = "Grundsystem (Engine) für Kartenspiele in Prolog"
tags = ["Basics"]
title = "ECCardEngine"
src = ""

[header]
  caption = "(c) Hans N. Beck)"
  image = "steelroof.jpg"

+++

Das muss  komplett geändert werden

s
Prolog ist eine Sprache, in der sich Spielregeln sehr gut abbilden lassen. Dieses Projekt hat zum Ziel, ein Grundsystem für Kartenspiele in Prolog zu entwickeln. Spielfläche und Karten sollen nach Belieben gewählt werden können. Attribute und Texte der Karten sollen frei gestaltbar sein.

{{< figure src="/img/gamesequence.png" class="myimg" title="Spielsequenz" >}}

Jeden Kartenspielen ist die Eigenschaft gemein, in Runden gespielt zu werden. Jede Runde hat dabei wiederum Phasen.  Ob in jeder Phase beide Spieler Aktionen spielen, oder ein Spieler eine ganze Runde absolviert, bevor der andere Spieler seine Aktionen durchführen darf, bleibt dem Spieldesigner überlassen. 

Reglen gibt es in zwei Arten: 

	1.  Regeln, die die Entwicklung der Spielewelt modellieren. Nach jeder Phase oder Runde sollen diese Regeln aus dem Zustand der Spielewelt einen neuen Zustand ermitteln, inklusive Punkteauswertungen oder ähnliches.

	2.  Regeln, die die Aktionen der Spieler definieren.  Diese Regeln zeigen also an, was ein Spieler in der Spielewelt tun darf. Dies ist natürlich abhängig von der Situation des Spiels.


Das Entwicklungssystem soll [SWI-Prolog](http://www.swi-prolog.org) sein. Es macht Sinn, dass dieses Prolog Programm als Server Programm zum Einsatz kommt, welches von dem Client kontaktiert wird. Das Prolog System sollte den Zustand der Welt dem Client als ASCII Zeichenfolge übermitteln. Die Umsetzung dieser Zeichenfolge in Grafik oder andere Darstellungen ist Aufgabe des jeweiligen Clients. 

Diese Technik ist eine Rückbesinnung auf die alten aber grossartigen Ideen der X11 und natürlich auch all der WWW Dinge in der Welt. Aber im Unterschied dazu soll die ASCII Zeichenfolge auf abstrakterem Level formuliert sein. Sie sollte nicht geometrische Dinge wie Rechtecke und Koordinaten beschreiben, auch nicht deskribtive Attribute wie `<body>` oder `<page>`. Sie sollte Objekte beschreiben. Eine entsprechende ASCII basierte Sprache zu beschreiben ist eine interessante Subaufgabe für sich.
