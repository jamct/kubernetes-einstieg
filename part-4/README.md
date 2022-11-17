# Eine komplieziertere WordPress-Instanz

Diese WordPress-Instanz ersetzt 1:1 die Version aus Teil 3. Wenn die schon im Cluster läuft, können Sie diese einfach hinterherschieben – die neue Version ersetzt die alte und WordPress läuft weiter hinter Traefik.
Die Verbesserungen in diesem Teil: Konfigurationen sind in einer ConfigMap gespeichert, Geheimnisse in Secrets.

# Installieren

Einfach alle Dateien nacheinander per `kubectl -f <Dateiname> apply` in den Cluster schieben.