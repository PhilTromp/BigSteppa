## BigStepper
Schrittzähler-App von Philipp Trompetter & Oleg Stasiuk
Die Schrittzähler-App ist eine Anwendung, die Benutzern dabei hilft, ihre täglichen Schritte zu verfolgen und Aktivitätsziele zu erreichen.


## Hauptseite

Die Hauptseite der App bietet eine Übersicht über die Schrittzähler-Anzeige, die verschiedene Metriken anzeigt:

- **Schrittzähler**: Zeigt die aktuellen Schritte an.
- **Kcal**: Anzeige der verbrannten Kalorien.
- **Strecke**: Angezeigte zurückgelegte Strecke.
- **Zeit**: Umrechnung der Schritte in Zeit. (Dekorativ)

Zusätzlich wird der wöchentliche Durchschnitt der Schritte angezeigt (Dekorativ), um eine Perspektive auf die wöchentliche Aktivität zu bieten.

Oben rechts auf der Hauptseite befindet sich ein Button zur Benutzerprofilseite, und oben links ein Logout-Button.

## Achievement

Die Seite bietet Informationen über erreichte und noch ausstehende Errungenschaften (Achievements). Aktivierte Errungenschaften werden farblich hervorgehoben, während nicht erreichte Errungenschaften inaktiv erscheinen.

## Verlauf

Die Verlaufseite zeigt detaillierte Statistiken zu den Schritten, Kalorienverbrauch, Strecke und Zeit auf, die an verschiedenen Tagen aufgezeichnet wurden. Diese Seite ist derzeit rein dekorativ und funktioniert nicht.

## Anmerkung: 
Auf der Datei tracking_element "1Page/elements/tracking_element.dart" befinden sich zwei verschiedene TrackingElement-Widgets. Der erste, der nicht auskommentiert ist, ist der Originale mit der funkitonierenden Api. Der Zweite, der auskommentiert ist und darunter liegt, ist eine kopierte Version mit einer Mockmethode. Die Mockmethode ist dafür da, dass man die _steps / Schrittzählerfunktion nachsimulieren kann. Sie zählt die Variable _steps durchgehend hoch. Dies ist vorallem nützlich, wenn man die App in einem Simulator starten will. 

Während des gesamten Moduls haben wir kontinuierlich die App auf einem iPhone 15 Pro Max Simulator ausgeführt.
Später haben wir die App auch auf einem physischen Gerät, einem iPhone 12, ausgeführt. 



## Anmerkung zum Video und anderen Probleme: 
Im Screencast sind bereits nach der Registrierung eines Nutzers zahlreiche Schritte erkennbar. iOS greift über den Pedometer direkt auf die Gesamtanzahl der Schritte des Tages zu, die das iPhone 12 bereits erfasst hat. Er sendet einem nicht die "steps" die gegangen werden während deine App läuft, sondern die Gesamtzahl der "steps" die von Apple getrackt werden an dem Tag. Das was vom pedometer direkt zurück gegeben wurde war „steps count: 10203 at Date 30.12.2023"

Im Meilenstein 2 konnten wir zeigen, dass die App sofort live die Schritte ab dem Zeitpunkt der App-Nutzung erfasst und anzeigt. An dem Code zur Schrittmessung haben wir seitdem keine Änderungen vorgenommen. Trotzdem greift die App nach dem dritten Meilenstein auf die Schrittdaten zu, die das iPhone bereits vor der Nutzung der App erfasst hat, und zeigt diese an. Darum ist es im Video möglicherweise nicht klar erkennbar, ob sich nun die Schritte verändern. Dennoch haben wir im zweiten Meilenstein erfolgreich die Funktionalität demonstriert.

Zusätzlich gab es häufige Probleme mit Xcode, die sich auch auf das "Real Device" auswirkten.

