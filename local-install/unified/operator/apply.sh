helm dep up && \
helm template --namespace miggo-space -f values.yaml --include-crds miggo-operator . | \
	kubectl apply -n miggo-space -f -
