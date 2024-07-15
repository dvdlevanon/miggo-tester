helm template --namespace miggo-space -f values.yaml --include-crds miggo-collector . | \
	kubectl delete -n miggo-space -f -
