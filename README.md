# Übungsblätter Grundlagen der Elektrotechnik – Teil 1: Gleichspannung

12 Übungsblätter (je ca. 60 Minuten) für Studierende im 1. Semester Elektrotechnik,
basierend auf dem Skript `GET_Teil1_Gleichspannung_Schenke_Klein.pdf`.
Zu jedem Blatt gibt es ein **Aufgabenblatt** und eine **geführte Lösung**
(Schritte, Leitfragen, typische Fehler).

| Blatt | Thema | Skript |
|------:|-------|--------|
| 1 | Ladung, Strom, Spannung, Leistung und Wirkungsgrad | 1.1–1.5 |
| 2 | Drahtwiderstand und Temperaturabhängigkeit | 1.6–1.7 |
| 3 | Kirchhoffsche Sätze | 2.1 |
| 4 | Widerstandsnetzwerke (Reihe, Parallel, Stern-Dreieck) | 2.2 |
| 5 | Spannungsteiler und Stromteiler | 2.3–2.4 |
| 6 | Messung von Strom, Spannung und Widerständen | 2.5–2.6 |
| 7 | Wheatstonebrücke | 2.7, 2.13.4 |
| 8 | Quellen, Quellenumwandlung und Arbeitspunkt | 2.8–2.9 |
| 9 | Überlagerungssatz | 2.10 |
| 10 | Ersatzquellen, Leistungsanpassung und fiese Fallen | 2.11–2.13 |
| 11 | Knotenpotentialverfahren | 2.14 |
| 12 | Transiente Vorgänge an Kondensator und Spule | 3 |

## Aufbau

```
vorlage/get-uebung.sty   gemeinsames Layout und Umgebungen
blattNN/blattNN.tex      EINE Quelldatei pro Blatt (Aufgaben + Lösungen)
build/                   erzeugte PDFs: blattNN_aufgaben.pdf, blattNN_loesung.pdf
Makefile
```

Aufgabenblatt und Lösung werden aus derselben Datei erzeugt; dadurch passen Aufgabentext
und Lösung immer zusammen. Inhalte in `\begin{loesung} … \end{loesung}` erscheinen nur im
Lösungsblatt.

## Übersetzen

```
make            # alle Blätter
make blatt05    # nur Blatt 5
make clean      # Hilfsdateien löschen
```

Benötigt: TeX Live mit `circuitikz`, `pgfplots`, `tcolorbox`, `siunitx`, `comment`, `eurosym`.

## Konventionen für neue Aufgaben

- `\begin{aufgabe}{Titel}{Minuten}` – die Minuten eines Blattes sollen sich auf 55–60 addieren.
- In der Lösung: `\schritt{…}`, `\leitfrage{…}`, `\ergebnis{…}` (im Mathemodus), `\typfehler{…}`.
- Zählpfeile wie im Skript: Spannungspfeil von + nach −. In circuitikz zeigt `v=` von
  Anfangs- zum Endpunkt des Pfades, `v<=` umgekehrt.
- Alle Zahlenwerte vor dem Eintragen nachrechnen (z. B. mit Python).
