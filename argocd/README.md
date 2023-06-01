# Kubernetes-Cluster mit Argo CD automatisieren

In diesem Dokument finden Sie alle Befehle aus dem Artikel GitOps-Krake zum Kopieren

## Argo CD installieren

```
helm repo add argo https://argoproj.github.io/argo-helm
helm install my-argo argo/argo-cd -n argocd
```

### Temporäre Portweiterleitung

```
kubectl port-forward service/my-argo-argocd-server -n argocd 8080:443
```

### Startkennwort auslesen

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```