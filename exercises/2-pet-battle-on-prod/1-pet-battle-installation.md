### Installing PetBattle
Now let's install PetBattle in our production cluster. The development team did a good job to create `Helm charts` for  PetBattle components.

[TODO] a bit about helm

[TODO] make the outputs NICER

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
helm upgrade --install pet-battle-infra \
   --set install_cert_util=true --namespace ${TEAM_NAME}-prod petbattle/pet-battle-infra --version=1.0.31
```
<img src="2-pet-battle-on-prod/images/helm-install-infra.png" width="750">

```bash
oc get pod -w -n ${TEAM_NAME}-prod
```
<img src="2-pet-battle-on-prod/images/watch-pods.png" width="750">
