# language: de

# Beispiel anbei (gherkin.zip).

# Voraussätzungen:

 1. Json-Verzeichnis in das QF-Test jython Verzeichnis legen.
 2. Cucumber-Verzeichnis in das Plugin verzeichnis von QF-Test legen. 
 3. QF-Test neustarten

# Wie funktioniert es:

 Prozedur executeGherkinScript parst die Datei featureFile und procedureDefinitionFile. 
 Im feature fill ist der Gherkin Test geschrieben, also so was wie:

## Feature: Good old Hello World

  Some feature description
  That is multi line
  to see what is happening

  Scenario: Someone starts their day
    Given a person
    When that person wakes up
    Then that person says "Hello, World!

# procedureDefinitionFile

<pre>
actions.eingabe     angenommen,und	    ^ich habe die Zahl (\d+) im Taschenrechner eingegeben$              zahl:1
actions.druck       angenommen,und	    ^ich habe die Taste "([^\"]+)" gedrückt$	                        taste:1
actions.druck	    wenn	            ^ich auf die Taste "([^\"]+)" drücke$	                            taste:1
actions.ueberpruef	dann,und	        ^sollte als Resultat (\d+,\d+) am Bildschirm ausgegeben werden$     resultat:1
</pre>

(wenn man ein englisches Feature-File hat darf man auch in der keyword spalte die entsprechenden englischen Keywords eintragen.)


Für die entsprechenden Anweisungen wird dann mithilfe der procedureDefinitionFile, z.B. sehe oben, die entsprechenden Prozeduren rausgesucht 
die ausgeführt werden sollen. Et volià. Das Ganze ist mehr oder weniger analog zu cucumber, wo man in einer von cucumber unterstützten Sprache (siehe <https://docs.cucumber.io/installation/>), 
eine Funktion annotiert sodass diese dann bei einem bestimmten regulären Ausdruck aufgerufen wird.

## Die procedureDefinitionFile ist tab-separiert. 
- Erste Spalte Namen der Prozedur die aufgerufen werden soll, 
- zweite Spalte (case-insensitive), komma-separierte Liste der Keywords, 
- dritte Spalte der reguläre Ausdruck und 
- vierte Spalte welche Gruppe in dem regulären Ausdruck zu welchem Prozedurparameter gematcht werden soll. 

## Beispiele:
- a:1,b:2,c:4 heißt, dass die erste Gruppe des Regex dem Parameter a zugeordnet werden soll, die zweite Gruppe dem Parameter b und die vierte Gruppe dem Parameter c. 
Wenn anstatt dem ":" ein "=" Zeichen verwendet wird, so wird die Prozedur immer mit diesem Parameter aufgerufen. 
- x=Hallo,y=Welt ruft die Prozedur immer mit den Parametern x=Hallo und y=Welt auf.

Kann man sicher noch ausbauen, vor allem im erstellten Report / den zusätzlichen Language features die cucumber auf Gherkin aufgebaut hat, aber dieses kleiner 100 Zeilenskript erschlägt sicherlich 80% der Usecases.