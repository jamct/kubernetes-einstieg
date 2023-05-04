# WordPress-Helm

In diesem Ordner finden Sie ein mit Helm verpacktes WordPress-Setup, bestehend aus Datenbank und WordPress. Zum Einsatz kommen einige der im Artikel beschriebenen Helm-Funktionen. Um die Erklärungen einfach zu halten, arbeitet dieses Chart in einem einzigen Namespace (anders als in Teil 4 der Kubernetes-Reihe, in dem vor allem das Konzept von Namespaces erklärt werden sollte).

Die Besonderheit: Dieses Chart vergibt einmalige Namen für alle Objekte und referenziert sie untereinander. Es ist also kein Problem, mehrere Instanzen in einem Cluster zu installieren. Probieren Sie das einfach mal aus – überschreiben müssen Sie nur den externen Port, wenn Sie keine IngressRoute verwenden.

# Voraussetzungen

Dieses Chart setzt Traefik voraus, wenn Sie mit IngressRoute arbeiten wollen. Das können Sie per Hand installieren oder eine Helm-Funktion einsetzen, die im Artikel nicht zur Sprache kam: Abhängigkeiten. In der Datei Chart.yaml finden Sie einen Schnipsel, der auskommentiert ist. Entfernen Sie die Kommentarzeichen und laden Sie die Abhängigkeit vor der Installation:

```
helm dependency update
```

## Installieren und updaten

Zum Installieren ins übergeordnete Verzeichnis (erste Ebene des Repos) navigieren. Dann installieren mit:

```
helm upgrade wp ./helm-wordpress --install
```

Tipp: `upgrade` mit `--install` ersetzt den Unterbefehl `install`. Installieren und Updaten gelingen dann mit demselben Aufruf.

#### Zweite Instanz gefällig?

Sie brauchen eine zweite Instanz? Das geht schnell:

```
helm upgrade wp2 ./helm-wordpress --install --set ingress.alternativePort=30002