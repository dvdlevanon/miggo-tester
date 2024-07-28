# kubectl patch opentelemetrycollector miggo-operator -n miggo-space --type=merge --patch-file collector-config.yaml
kubectl -n miggo-space apply -f collector-config.yaml
