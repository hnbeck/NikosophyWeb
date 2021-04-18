+++
tags = ["Software"]
highlight = true
math = false
date = "2021-04-17T21:19:52+01:00"
title = "Stein auf Stein"

[header]
  caption = "(c) Hans N. Beck"
  image = "Alge2.jpg"

+++

Gebannt starrte ich auf den Monochrom - Bildschirm meines Atari ST. Die letzte Zeile Assemblercode war gerade eingetippt, nur eine Betätigung der "Enter" Taste trennte mich noch von dem, wofür ich die letzten Tage Bücher gelesen, ausprobiert und Freunde gefragt habe. Jetzt sollte es endlich klappen,  ein 3D Modell eines geometrischen Körpers mit Flächen und Belechtung auf eben diesem kleinen Bildschirm war das Ziel. Ich kann mich immer noch an dieses Gefühl erinnern, als meine Bemühungen schliesslich von Erfolg gekrönt waren und sich der Körper auf dem Bildschirm und mir erschien wie ein Siegerpokal. Auch heute noch, wenn ich meine Projekte in der modernen Landschaft der Frameworks und Programmiersprachen verfolge, durch den Garten der OpenSource Blüten wandele, immer auf der Suche nach der einen hilfreichen Zutat für mein Rezept, kommt dieses Gefühl des Erfolges vor. Und doch ist es nicht dasselbe wie damals, denn programmieren bedeutet heute, Rezepten zu folgen und - um in dem Bild zu bleiben, Backmischungen (Frameworks) und Fertigprodukte (Bibliotehken oder Komponenten) zu verwenden. 

Im folgenden Text möchte ich ein bisschen erforschen, warum mich die Softwareentwicklung nach Rezept nicht so zufrieden macht wie mein Erlebnis seinerzeit mit dem Atari ST und seinem schlichten Monitor. 

In den 80iger Jahren war die Informationslage noch eine ganz andere. Bücher und Zeitschriften oder gar Computervereine waren Hauptquellen des Wissens, und was man nicht in Erfahrung bringen konnte, wurde halt ausprobiert, Idee für Idee und Anweisung für Anweisung. Aber wer aus der heutigen Welt der Softwareschichten heraus denken mag, die sei die berühmte Nadel im Heuhaufen, ein chancenloses Gerate, dem sei in Erinnerung gerufen, dass man damals den Prozessor kannte, seine Befehlssätze und seine Verbindung zu den anderen Bausteinen des Computers. Register in der CPU zu manipulieren, Buffer zu beschreiben oder Speicherzellen Bit für Bit zu füllen war keine Geheimwissenschaft, sondern ein durchschaubares Werkzeug des damaligen Computings. Programmieren bedeutete also, seine Wahl der Instruktionen mit Blick auf die Hardware zu treffen, von der man sich erklären konnte, was wohl die gewählte Instruktion für Hardwareabläufe initiieren würde. Sicher, nicht immer war gleich zu Beginn die Verschaltung oder die Register von Spezialchips offen gelegt, die verwendeten CPUs wie 68000 oder Z80 waren jedoch in ihrem Aufbau vertraut und vorstellbar. 

Ich denke, diese Art zu programmieren hatte etwas Direktes. Die Kette von Ursache und Wirkung war für den engagierten Hobbisten nachvollziehbar und dadurch auch in einem gestalterischen Sinne beeinflussbar. Blickt man auf die heutige IT Welt, so türmen sich Softwareschichten über Softwareschichten, ein Framework stapelt sich über das andere, und der Entwickler hat kaum noch eine Chance - oder nicht die Zeit, den Aufruf einer Funktion im Geiste bis zu der Hardwareebene nachzuverfolgen. Wir denken heute in APIs, die andere APIs verdecken. Aus der Perspektive des kommerziellen Softwarebaus sei das nur logisch, so sagt man,  denn dieses API hier böte doch eine leicht zu beherrschende Abbildung des Kundenproblems, und so, lieber Programmierer, wenn Du diesem API folgest, würde deine Problemlösung ein Leichtes sein. Und da es vielerlei Probleme gibt, gibt es auch viele APIs, so wie es in oben erwähnten Garten vielerlei Blümchen gibt, die jede doch für sich spezellien Kunden (=Insekten) die bestmöglichen Begingungen bieten wollen. Niemand könne noch ein Interesse daran haben, wissen zu wollen, was auf der Betriebssystemebene vor sich geht oder gar, welche Konsequenzen das eigene Programm für CPU, Speicher oder Bus habe, denn defür haben ein Heer von Experten verdient gemacht, das alles sicherlich seine Richtigkeit habe.

An dieser Stelle bin ich geneigt, meinen Blick auf andere Branchen der Technologie zu richten und zu fragen, ob ich denn ein Analogon zu diesen API Schichten entdecken könnte. Natürlich muss die Suche nach einem Analogon mit Bedacht und mit dem Fokus auf das Wesentliche ausgeführt werden. Nun bin ich kein Maschinenbauexperte, aber ich glaube zu Wissen, dass das Wesentliche des Maschinenbaus heute in Komponenten liegt, deren hierarchische Anordnung die letztlich intendierte Maschine ergeben. Motor, Getriebe, Energieversorgung wären wohl solche Subsysteme, die ihrerseits wieder in Komponenten aufteilbar sind. 



