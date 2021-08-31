### Define Users
Let's start by defining the users of the Platform. Here is one example. Meet: Elaine Trakand
### User Journey


### Map System Components


### Define SLIs for the Components

#### Time-based measurement

#### Event-based measurement


### Determine Data Points



### Create a Baseline


#### Create a Dashboard (Optional)


#### Alerts on SLOs

```bash
cat << EOF >> /projects/observability/chart/templates/prometheusrules.yaml
  - name: kubernetes-api-rules
    rules:
    - expr: |
        sum by(job, verb, code, instance) (rate(apiserver_request_count[5m]))
     record: kubernetes:job_verb_code_instance:apiserver_requests:rate5m
    - expr: |
        kubernetes:job_verb_code_instance:apiserver_requests:rate5m
        / ignoring(verb, code) group_left()
        sum by(job, instance) (
            kubernetes:job_verb_code_instance:apiserver_requests:rate5m )
      record: kubernetes:job_verb_code_instance:apiserver_requests:ratio_rate5m
    - alert: KubeAPIErrorRatioHigh
      annotations:
        message: 'KubeAPIErrorRatio higher than 1%'
      expr: |
        sum by(instance) (
          kubernetes:job_verb_code_instance:apiserver_requests:ratio_rate5m
            {code=~"5..",verb=~"GET|POST|DELETE|PATCH"} ) > 0.01
      for: 5m
      labels:
        severity: {{ .Values.prometheusrules.severity | default "warning" }}
EOF
```


#### Observe and Iterate