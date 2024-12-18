# Flutter ReMaSp

https://vito0912.github.io/flutter_remasp

ReMaSp (Registermaschienensimulationsprogramm) in Flutter geschrieben. Verfügbar für Windows, Android und Web.\
Deutsche Version unten.
---
ReMaSp (Register Machine Simulation Program) is written in Flutter and is available for Windows, Android, and the Web.

> Active development!

### What is ReMaSp?
ReMaSp is a simulation program for register machines. It is a straightforward tool designed to simulate the execution of register machines.\
It is based on the design of "https://github.com/groehner/Remasp" by Norman Sutatyo and Gerhard Röhner.\
The license information can be found in the original/LICENSE file.

The program uses instructions based on the "Hessisches Landesabitur," which can be viewed at https://arbeitsplattform.bildung.hessen.de/fach/informatik/registermaschine.html.

#### Motivation
I enjoy experimenting with programs. The Java version uses "just" integers, which means you can't even calculate the factorial of 21. :(\
This version uses BigInts, which are only limited by your system's memory (or my less-than-perfect coding :).\
While "infinite" registers are also possible, I decided that int.MaxValue is enough for now. ;)

You can use this tool without needing to install anything, offering a similar design with "more" features than the original version.\

The primary motivation for this project was to implement it as a web app in https://vito0912.github.io/flutter_web_os.

#### Features
- BigInts
- Dynamic register creation - No hardcoded limit on the number of registers
- Dark mode (Who doesn't love dark mode?) - Designed in the Windows style
- Web availability - Everything you can do on Windows and Android is also available on the web
- Loading and saving files
- Tab support for switching between multiple registers
- [Not yet implemented] Comment highlighting
- [Not yet implemented] Multiple tabs - Easily switch between workspaces to write different programs for various school tasks


# German Version

### ReMaSp (Registermaschienensimulationsprogramm)

ReMaSp ist ein in Flutter geschriebenes Simulationsprogramm für Registermaschinen. Es ist für Windows, Android und als Webanwendung verfügbar.

---

### Was ist ReMaSp?
ReMaSp ist ein einfach zu bedienendes Werkzeug zur Simulation von Registermaschinen. Das Programm ermöglicht es, die Funktionsweise und Ausführung einer Registermaschine zu simulieren. Es basiert auf dem Design von [https://github.com/groehner/Remasp](https://github.com/groehner/Remasp) von Norman Sutatyo und Gerhard Röhner.  
Informationen zur Lizenz sind in der Datei `original/LICENSE` der ursprünglichen Version zu finden.

ReMaSp verwendet Befehle, die auf dem "Hessischen Landesabitur" basieren. Weitere Informationen dazu gibt es unter:  
[Registermaschine im Landesabitur Informatik Hessen](https://arbeitsplattform.bildung.hessen.de/fach/informatik/registermaschine.html).

---

### Motivation
Ich experimentiere gerne mit Programmen! Die Java-Version des Originals verwendet "nur" Integer-Werte, was bedeutet, dass man nicht einmal die Fakultät von 21 berechnen kann. :(  
Diese Version von ReMaSp nutzt **BigInts**, deren Größe lediglich durch den Speicher des Systems (und mein nicht ganz perfektes Codes :)) begrenzt ist.

Während theoretisch "unendlich viele" Register möglich wären, habe ich mich darauf beschränkt, `int.MaxValue` als Obergrenze zu setzen – das sollte reichen.

Das Programm ist zudem als Web-App implementiert, sodass es keine Installation erfordert. Es bietet ein ähnliches Design wie die Originalversion, allerdings mit zusätzlichen Funktionen.\

Meine Hauptmotivation war es, das Programm in [Flutter Web OS](https://vito0912.github.io/flutter_web_os) zu integrieren.

---

### Funktionen
- **BigInts**: Berechnungen, die größere Zahlen als Integer zulassen
- **Dynamische Register-Erstellung**: Keine festgelegte Begrenzung der Anzahl der Register
- **Dark Mode**: Für Liebhaber des dunklen Designs – im Windows-Stil gestaltet
- **Web-Verfügbarkeit**: Was auf Windows und Android möglich ist, funktioniert auch im Browser
- **Datei-Import und -Speicherung**
- **Unterstützung für Tabbing**: Zwischen mehreren Registern mit einem Tab wechseln (Key)

#### Noch nicht implementierte Funktionen:
- Kommentarsyntax-Hervorhebung
- Mehrfachtabs: Einfacher Wechsel zwischen verschiedenen Arbeitsbereichen für komplexere Schulaufgaben



---

This software is licensed under the BSD-3 License.