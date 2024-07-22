helm template --namespace miggo-space -f values.yaml --include-crds miggo-operator . | \
	kubectl delete -n miggo-space -f -
