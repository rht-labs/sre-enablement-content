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

```bash
helm upgrade --install pet-battle \
  --namespace ${TEAM_NAME}-prod petbattle/pet-battle --version=1.0.6
```
<img src="2-pet-battle-on-prod/images/helm-install-ui.png" width="750">

```bash
helm upgrade --install pet-battle-tournament \
  --timeout=15m \
  --set pet-battle-infra.install_cert_util=true \
  --namespace ${TEAM_NAME}-prod petbattle/pet-battle-tournament --version=1.0.40
```
<img src="2-pet-battle-on-prod/images/helm-install-infra.png" width="750">

```bash
oc get pod -w -n ${TEAM_NAME}-prod
```
<img src="2-pet-battle-on-prod/images/watch-pods.png" width="750">
