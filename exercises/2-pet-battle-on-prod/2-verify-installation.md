
### Verify the Installation
You just did the first installation on prod cluster (manually!) so lets see if everything is fine. Open the application up in the browser to verify it's up and running. Here's a handy one-liner to get the address of the application:

```bash
oc get route/pet-battle -n ${TEAM_NAME}-prod --template='{{.spec.host}}'
```

No luck? Let's check the status of the pods:
```bash
oc get pods -n ${TEAM_NAME}-prod
```

Anything in the events?
```bash
oc get events -n ${TEAM_NAME}-prod
```

[TODO] add some guidance for troubleshooting.


The development team has hardcoded some variable for pet-battle UI. We need to adjust them to suit our production environment.
```bash
wget https://raw.githubusercontent.com/rht-labs/pet-battle/main/chart/values.yaml
```

Open up the file in your IDE and update the following vars based on your information:

<pre>
app_name: pet-battle
replicas: 1
# build info not used atm
build:
  enabled: false
  build_tag: latest
  source_docker_file_path: Dockerfile
  # source_context_dir: "/"
  # source_ref: master
  # source_repo: https://github.com/springdo/pet-battle.git
# Docker deets
image_repository: quay.io
image_name: pet-battle
image_namespace: petbattle
# likely over written by the Argo definition
image_version: latest
a_b_deploy:
  weight: 100
  # svc_name:
fathom: false
# OCP route
route: true
# custom end point injected by config map. This is likely to changed
config_map: '{
  "catsUrl": "https://pet-battle-api-<strong>${TEAM_NAME}</strong>-prod.<strong>${CLUSTER_DOMAIN}</strong>",
  "keycloak": {
    "url": "https://keycloak-<strong>${TEAM_NAME}</strong>-prod.<strong>${CLUSTER_DOMAIN}</strong>/auth/",
    "realm": "pbrealm",
    "clientId": "pbclient",
    "redirectUri": "http://localhost:4200/tournament",
    "enableLogging": true
  }
}'
</pre>

After you complete the updates, we need to deploy UI component to override the values:
```bash
helm upgrade --install pet-battle-api petbattle/pet-battle-api --version=1.1.0 --namespace ${TEAM_NAME}-prod --create-namespace
```

Congrats, you just addressed your first problem! (and also added something in your backlog - sorry! But this shouldn't be hardcoded, right? :))

Now that PetBattle is installed fine, let's move to something more exciting practices!