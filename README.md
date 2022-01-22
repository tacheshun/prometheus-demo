# Prometheus-demo

This is a demo made to show sample prometheus metrics in a standard GO app.

## Features
- prometheus sample metrics (skeleton_app_sample_metric, skeleton_app_sample_histogram, skeleton_app_sample_devices)
- (todo)Ifrastructure metrics using node exporters for components that cannot have a `/metrics` http endpoint. Example Docker, PostgreSQL servers, MySQL servers, etc.
- (todo)alerting for error rates greater than 50%
- (todo)Grafana and kubernetes integration

## Run
`docker compose up -d`

## Test
- generate some trafic into the sample app: `docker run prometheus-demo_app`
- check metrics at : `http://localhost:9090/graph` selecting the `skeleton_app_` prefixed metrics from the dropdown and click on Execute