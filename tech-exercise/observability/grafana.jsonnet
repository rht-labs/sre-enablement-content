local slo = import 'slo-libsonnet/slo-libsonnet/slo.libsonnet';
local grafana = import 'grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;
local row = grafana.row;
local prometheus = grafana.prometheus;

{
  local appname = 'pet-battle-api',
  // Defining reponse code SLO's
  local errors = slo.errors({
    metric: 'http_server_requests_seconds_count',  // Name of HTTP request counter metric, partitioned by code
    selectors: 'namespace="petbattle",job="pet-battle-api"',  // Selectors for specific application
    errorSelectors: ['status=~"5.."'],
    warning: 5,  // 5% of total requests
    critical: 10,  // 10% of total requests
    errorcodes: [400, 404, 500],  // List of codes that are considered against the error budget
  }),

  // Defining latency SLO's
  local latency = slo.latency({
    metric: 'http_server_requests_seconds_sum',  // Metric name prefix for bucket
    selectors: 'namespace="petbattle",job="pet-battle-api"',  // Selectors for specific application
    quantile: 0.99,  // Rules will be generated for 99th Percentile
    warning: 0.500,  // 500ms
    critical: 1.0,  // 1s
  }),

 // Creating a new dashboard

  "apiVersion": "integreatly.org/v1alpha1",
  "kind": "GrafanaDashboard",
  "metadata": {
    "name": "pb-slo-dashboard",
    "namespace": "petbattle",
    "generation": 1,
    "labels": {
      "monitoring-key": "grafana"
    },
    "annotations": {
      "argocd.argoproj.io/compare-options": "IgnoreExtraneous",
      "argocd.argoproj.io/sync-options": "SkipDryRunOnMissingResource=true"
    }
  },
  "spec": {
    "customFolderName": "slo-petbattle",
    "name": "pb-slo-dashboard.json",
    "json":
    dashboard.new(
    '%s' % appname,
    time_from='now-1h',
  ).addTemplate(
    {
      current: {
        text: 'Prometheus',
        value: 'Prometheus',
      },
      hide: 0,
      label: null,
      name: 'datasource',
      options: [],
      query: 'prometheus',
      refresh: 1,
      regex: '',
      type: 'datasource',
    },
  )
  .addRow(
    row.new()
    .addPanel(latency.grafana.gauge)
    .addPanel(latency.grafana.graph)
  ),
  },
}