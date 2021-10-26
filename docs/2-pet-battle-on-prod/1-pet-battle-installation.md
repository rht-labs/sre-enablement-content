### Installing PetBattle
**TODO** a bit about helm and PetBattle components

**TODO** make the outputs less black and white :(
  
Now let's install PetBattle into the cluster. The development team did a good job to create `Helm charts` for  PetBattle components. This will give us a good understanding of the application and its components.

```bash
helm repo add petbattle https://petbattle.github.io/helm-charts
```
<img src="2-pet-battle-on-prod/images/helm-repo-add.png" width="750">

```bash
helm upgrade --install pet-battle-api \
  --create-namespace --namespace ${TEAM_NAME}-prod \
  petbattle/pet-battle-api --version=1.1.0
```
<img src="2-pet-battle-on-prod/images/helm-install-api.png" width="750">

Adjust the pet-battle values for your environment:
```bash
wget https://raw.githubusercontent.com/petbattle/pet-battle/master/chart/values.yaml /tmp/values.yaml
```
```bash
cat << EOF >> /tmp/values.yaml
        config_map: '{
        "catsUrl": "https://pet-battle-api-${TEAM_NAME}-prod.${CLUSTER_DOMAIN}",
        "tournamentsUrl": "https://pet-battle-tournament-${TEAM_NAME}-prod.${CLUSTER_DOMAIN}",
        "matomoUrl": "https://matomo-${TEAM_NAME}-ci-cd.${CLUSTER_DOMAIN}/",
        "keycloak": {
            "url": "https://keycloak-${TEAM_NAME}-prod.${CLUSTER_DOMAIN}/auth/",
            "realm": "pbrealm",
            "clientId": "pbclient",
            "redirectUri": "http://localhost:4200/tournament",
            "enableLogging": true
        }
        }'
EOF
```
```bash
helm upgrade --install pet-battle \
   -f /tmp/values.yaml \
  --namespace ${TEAM_NAME}-prod petbattle/pet-battle --version=1.0.6
```
<img src="2-pet-battle-on-prod/images/helm-install-ui.png" width="750">

```bash
helm upgrade --install pet-battle-tournament \
  --set pet-battle-infra.install_cert_util=true \
  --timeout=10m \
  --namespace ${TEAM_NAME}-prod petbattle/pet-battle-tournament --version=1.0.40 \
```
<img src="2-pet-battle-on-prod/images/helm-install-infra.png" width="750">

```bash
oc get pod -w -n ${TEAM_NAME}-prod
```
<img src="2-pet-battle-on-prod/images/watch-pods.png" width="750">
