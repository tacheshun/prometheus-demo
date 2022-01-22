# We use Helm to deploy Prometheus and Grafana in our local k8s cluster
# We also deploy the Go example app
install:
	@helm install --name prometheus --set-file extraScrapeConfigs=prometheus/extraScrapeConfigs.yaml stable/prometheus
	@helm install --name grafana stable/grafana
	@helm install --name app app

# Prometheus host http://localhost:9090
forward-prometheus:
	@kubectl port-forward svc/prometheus-server 9090:80

# Grafana host http://localhost:8080
# To get the credentials for the user `admin` use `make grafana-get-password`
forward-grafana:
	@kubectl port-forward svc/grafana 8080:80

# Go example app host http://localhost:8081
forward-app:
	@kubectl port-forward svc/app 8081:8081

# The password for `admin` is randomly generated and saved as secret
grafana-get-password:
	@kubectl get secret grafana -o jsonpath="{.data.admin-password}" | base64 --decode; echo

# Stop services
stop:
	@helm delete --purge prometheus
	@helm delete --purge grafana
	@helm delete --purge app