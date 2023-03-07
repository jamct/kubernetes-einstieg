# Redundanter Speicher mit Longhorn

In diesem Dokumente finden Sie Befehle und YAML, um Longhorn einzurichten.

### Longhorn installieren

```
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace --version 1.4.0
```

### Longhorn-UI weiterleiten per PortForward

```
kubectl --namespace longhorn-system port-forward service/longhorn-frontend 3080:80
```

### Longhorn-UI veröffentlichen

Passwort-Hash erzeugen:

```
htpasswd -nb admin secretPw | openssl base64
```

Eine Basic-Auth-Middleware:

```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: longhorn-auth
  namespace: longhorn-system
spec:
  basicAuth:
    secret: longhorn-ui-credentials
```

Das Secret:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: longhorn-ui-credentials
  namespace: longhorn-system
data:
  users: |
    <Passwort-Hash hier einsetzen>
```

Eine IngressRoute:

```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: longhorn-ingress
  namespace: longhorn-system
spec:
  entryPoints:
   - none
  routes:
   - match: Host(`www.example.it`) && PathPrefix(`/longhorn`)
     kind: Rule
     services:
      - name: longhorn-frontend
        port: 80
     middlewares:
      - name: longhorn-auth
        namespace: longhorn-system
      - name: longhorn-strip
        namespace: longhorn-system
```

Eine Middleware, die /longhorn entfernt:

```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: longhorn-strip
  namespace: longhorn-system
spec:
  stripPrefix:
    prefixes:
      - /longhorn
```

### Ein PVC mit Longhorn im Einsatz

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-nginx
spec:
  accessModes:
   - ReadWriteOnce
  storageClassName: longhorn-single
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Pod
metadata:
  name: nginx-example
  namespace: default
spec:
  containers:
   - name: nginx
     image: nginx:alpine
     imagePullPolicy: IfNotPresent
     ports:
      - containerPort: 80
     volumeMounts:
      - name: nginx-vol
        mountPath: /usr/share/nginx
  volumes:
   - name: nginx-vol
     persistentVolumeClaim:
       claimName: pvc-nginx
```

### Eine eigene StorageClass

```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: longhorn-single
provisioner: driver.longhorn.io
allowVolumeExpansion: true
reclaimPolicy: Delete
volumeBindingMode: Immediate
parameters:
  numberOfReplicas: "1"
  staleReplicaTimeout: "2880"
  fromBackup: ""
  fsType: "ext4"
```
