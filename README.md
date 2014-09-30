# RubyKara Erweiterung aus Kiel

[RubyKara] ist eine Programmierumgebung zum Erlernen der
Programmiersprache [Ruby] mit dem Marienkäfer Kara.

[RubyKara]: http://www.swisseduc.ch/informatik/karatojava/rubykara/
[Ruby]: https://www.ruby-lang.org/de/

Diese Erweiterung ermöglicht es Kara's Befehle sowohl innerhalb als
auch außerhalb selbst definierter Routinen auf drei Weisen aufzurufen:

  * mit vorangestelltem `kara`, also zum Beispiel `kara.move`
  * mit vorangestelltem `@kara`, also zum Beispiel `@kara.move`
  * ohne explizites Kara-Objekt, also zum Beispiel `move`

Darüber hinaus stehen Befehle zur Verfügung, mit denen Kara vor und
neben sich sehen kann.

Insbesondere hat Kara die folgende Funktionalität:

  * Befehle: `move`, `turn_left`, `turn_right`, `put_leaf`, `take_leaf`
  * Sensoren: `here`, `front`, `left`, `right`
  * Ergebnisse der Sensoren: `leaf`, `mushroom`, `tree`, `nothing`

Die Funktionen aus der Originalversion stehen ebenfalls in diversen
Schreibweisen zur Verfügung.

Die Datei [`rubykara-kiel.jar`] kann mit `java -jar rubykara-kiel.jar`
gestartet werden.

[`rubykara-kiel.jar`]: https://github.com/sebfisch/rubykara-kiel/blob/master/rubykara-kiel.jar?raw=true

© Sebastian Fischer, [CC BY 4.0]

[CC BY 4.0]: http://creativecommons.org/licenses/by/4.0/
