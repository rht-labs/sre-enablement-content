### The basics
[TODO] - Intro to CRW, Helm, OCP - _maybe copy from DO500?_
### Installing PetBattle
Now let's install PetBattle in our production cluster. The development team did a good job to create `Helm templates` for  PetBattle components.

```bash
helm repo add petbattle https://petbattle.github.io/helm-charts
```

The development team has hardcoded some variable for their own environment. First, we need to update them. Lets get those variable:

```bash
wget https://raw.githubusercontent.com/petbattle/pet-battle/master/chart/values.yaml
```

Open up the values file in your IDE and change the following vars based on your information:

```yaml
app_name: pet-battle
replicas: 1
build:
  enabled: false
  build_tag: latest
  source_docker_file_path: Dockerfile
image_repository: quay.io
image_name: pet-battle
image_namespace: petbattle
image_version: latest
route: true
config_map: '{
  "catsUrl": "https://pet-battle-api-<YOUR_TEAM_NAME>-prod.<CLUSTER_DOMAIN>",
  "keycloak": {
    "url": "https://keycloak-<YOUR_TEAM_NAME>-prod.<CLUSTER_DOMAIN>/auth/",
    "realm": "pbrealm",
    "clientId": "pbclient",
    "redirectUri": "http://localhost:4200/tournament",
    "enableLogging": true
  }
}'
```
After you complete the updates, we can run installation commands. 

```bash
helm upgrade --install pet-battle-api petbattle/pet-battle-api --version=1.1.0 --namespace <YOUR_TEAM_NAME>-prod --create-namespace
```
```bash
helm upgrade --install pet-battle petbattle/pet-battle --version=1.0.6 -f values.yaml --namespace <YOUR_TEAM_NAME>-prod
```
```bash
helm upgrade --install pet-battle-infra petbattle/pet-battle-infra --version=1.0.31 \
  --set install_cert_util=true --namespace <YOUR_TEAM_NAME>-prod
```

### Verify the Installation
[TODO] First fire? 
