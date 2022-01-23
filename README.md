# Prometheus-demo

This is a demo made to show sample prometheus metrics in a standard GO app.

## Features
- prometheus sample metrics (skeleton_app_sample_metric, skeleton_app_sample_histogram, skeleton_app_sample_devices)
- cortex integration for long term data storage
- Grafana dashboards
- alerting for error rates greater than 50%
- (todo)kubernetes integration

## Run

`docker compose up -d`

## Test
- generate some trafic into the sample app: `docker run prometheus-demo_app`
- check metrics at : `http://localhost:9090/graph` selecting the `skeleton_app_` prefixed metrics from the dropdown and click on Execute
- grafana dashboards are here: `http://localhost:3000` -> for now, use admin/foobar for username/password. 
Grafana is automatically configured with provisioning/datasource.yml
