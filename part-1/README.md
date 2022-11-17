# Kommandozeilenbefehle

Die Kommandozeilenbefehle für diesen Artikel zum Kopieren (falls Sie das gedruckte Heft lesen und nicht abtippen möchten)

```
mkdir -p /etc/rancher/k3s/
```

K3S auf dem ersten Server starten:

```
curl -sfL https://get.k3s.io | sh -s - server --cluster-init
```

Das Token anzeigen:
```
cat /var/lib/rancher/k3s/server/token
```

K3S auf den anderen Maschinen einrichten:
```
curl -sfL https://get.k3s.io | K3S_TOKEN=<Token> sh -s - server --server https://<IP Server 1>:6443
```

```
kubectl -f first-pod.yml apply
```