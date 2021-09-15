## Observability

### Metrics
> sort of already covered :)

### Logging & Tracing

#### Logging
API and tournamenet service log level is set to INFO and logs are already being collected by the existing ElasticSearch. But there is no logs for UI. Let's fix this (ideally, raise a PR to app repo)

#### Sentry
Adding Sentry SDK to your application to track errors and exceptions. 

#### Tracing (service mesh?)
Trace a request across a distributed set of application components running in different containers on different nodes of a cluster is an important capability. 

Tracing is provided as a part of OpenShift Service Mesh component. Service Mesh is already deployed in the cluster but Pet Battle is not a part of the mesh. We can enable ServiceMesh by adding `servicemesh: true` flag in our application config. Open up `tech-exercise/pet-battle/prod/values.yaml` file and add this value:

```yaml
  # Pet Battle Apps
  pet-battle-api:
    name: pet-battle-api
    enabled: true
    source: ]http://nexus:8081/repository/helm-charts
    chart_name: pet-battle-api
    source_ref: 1.1.0]
    values:
      image_name: pet-battle-api
      image_version: latest ]
      servicemesh: true #ADD THIS

  pet-battle:
    name: pet-battle
    enabled: true
    source: ]http://nexus:8081/repository/helm-charts 
    chart_name: pet-battle
    source_ref: 1.0.6]
    values:
      image_version: latest]
      servicemesh: true #ADD THIS

  pet-battle-tournament:
    name: pet-battle-tournament
    enabled: true
    source: http://nexus:8081/repository/helm-charts
    chart_name: pet-battle-tournament
    source_ref: 1.1.0
    values:
      image_name: pet-battle-tournament
      image_version: latest
      servicemesh: true #ADD THIS
```

Push your changes:
```bash
# git add, commit, push your changes..
cd /projects/tech-exercise
git add .
git commit -m  "🪝 ADD - service mesh enabled 🪝" 
git push 
```

OpenShift Service Mesh installs Jaeger to provide tracing capabilities but  to support tracing, applications must include a client library that sends instrumented request metadata to a Jaeger collector, which in turn processes it and stores the data.

New version of the images have this capability.


### Resilience and Fault Tolerance
Circuit Breaker pattern.