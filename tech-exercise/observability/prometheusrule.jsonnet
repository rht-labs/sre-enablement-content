local slo = import 'slo-libsonnet/slo-libsonnet/slo.libsonnet';

{
  apiVersion: 'monitoring.coreos.com/v1',
  kind: 'PrometheusRule',
  metadata: {
    name: 'pet-battle-api-slos-prod',
    namespace: 'petbattle',
    labels: {
      prometheus: 'petbattle',
      role: 'alert-rules',
    },
  },
  spec: {
    groups: [
      {
        name: 'pet-battle-api.slos-prod.rules',
        local errorburnrate = slo.errorburn({
        alertName: 'ErrorBudgetBurn',
        // This metric probably doesn't make a lot of sense.
        // However, it is availabe on every Prometheus by default.
        metric: 'http_server_requests_seconds_count',
        selectors: ['namespace="petbattle"', 'job="pet-battle-api"'],
        errorSelectors: ['status=~"5.."'],
        target: 0.99,  // 99%
        }),
        rules:
          errorburnrate.recordingrules +
          errorburnrate.alerts,
      },
    ],
  },
}
