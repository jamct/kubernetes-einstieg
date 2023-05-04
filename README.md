# Auf dem Lernpfad zum Kubernetes-Kenner

Hier finden Sie alle Beispiele zum mehrteiligen Einstieg in den Container-Orchestrator Kubernetes. Die zugehörigen Artikel erscheinen seit Ende 2022 gedruckt in c’t und bei Heise+. Hier finden Sie alle Artikel:

|Artikel|Inhalt|Link zu ct.de|Link zu Heise+|
|---|---|---|---|
|Teil 1: Containerkompetenzoffensive|Grundlagen: Cluster-Einrichtung, Kubectl, Zugangsdaten|[c’t 22/2022, S. 164](https://www.heise.de/select/ct/2022/22/2220016192019307305)|[Artikel vom 14.10.22](https://www.heise.de/ratgeber/Kubernetes-lernen-und-verstehen-Teil-1-Cluster-aus-drei-Linux-Servern-bauen-7308546.html)|
|Teil 2: Dickschiffkapitän|Pods, Container, RollingUpdate|[c’t 23/2022, S. 158](https://www.heise.de/select/ct/2022/23/2226222223049288708)|[Artikel vom 3.11.22](https://www.heise.de/ratgeber/Kubernetes-lernen-und-verstehen-Teil-2-Wie-Sie-Cluster-mit-Containern-fuellen-7325943.html)|
|Teil 3: Containervernetzer|Vernetzung und Helm: Service und Ingress|[c’t 25/2022, S. 162](https://www.heise.de/select/ct/2022/25/2227819463169465666)|[Artikel vom 29.11.22](https://www.heise.de/ratgeber/Kubernetes-lernen-und-verstehen-Teil-3-Container-vernetzen-7351581.html)|
|Teil 4: Containerladeoffizier|Persistenter Speicher: Volumes, ConfigMaps und Secrets|[c’t 26/2022, S. 130](https://www.heise.de/select/ct/2022/26/2230718252768410612)|[Artikel vom 8.12.22](https://www.heise.de/hintergrund/Kubernetes-lernen-und-verstehen-Teil-4-Daten-speichern-7367376.html)|
|Teil 5: Container-Sicherheitsbegehung|Sicherheit: TLS, NetworkPolicies, Berechtigungen|[c’t 03/2023, S. 154](https://www.heise.de/select/ct/2023/3/2232021023011260054)|[Artikel vom 6.1.2023](https://www.heise.de/ratgeber/Kubernetes-lernen-und-verstehen-Teil-5-Sicherheitskonzepte-einsetzen-7445949.html)|
|Helm-Einführung|YAML verpacken mit Helm|[c’t 11/2023, S. 164]()|[Artikel vom 4.5.2023]()|

## Beispiele in diesem Repository

* Teil 1: [Beispiel einer Konfigurationsdatei](./part-1/kubeconfig)
* Teil 1: [first-pod.yml: Der erste Dienst im Cluster (Nginx)](./part-1/first-pod.yml)
* Teil 2: [first-deployment.yml: Das erste Deployment (wieder Nginx)](./part-2/first-deployment.yml)
* Teil 3: [wordpress.yml: Eine Wordpress-Instanz](./part-3/wordpress.yml)
* Teil 4: [Eine umfangreichere Wordpress-Instanz mit persistentem Speicherplatz](./part-4/README.md)
* Teil 5: [netpol.yml: NetworkPolicyies und Berechtigungskonzepte](./part-5/README.md)
* Helm: [Ein Beispiel-Helm-Chart mit WordPress](./helm-wordpress/README.md)