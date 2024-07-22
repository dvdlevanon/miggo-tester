helm dep up && \
./template.sh | \
	kubectl apply -n miggo-space -f -
