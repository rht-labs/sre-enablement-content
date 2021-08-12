### Installing PetBattle
Now let's install PetBattle in our production cluster. The development team did a good job to create `Helm charts` for  PetBattle components.

[TODO] a bit about helm
[TODO] add some outputs to each command.

```bash
helm repo add petbattle https://petbattle.github.io/helm-charts
```

```bash
helm upgrade --install pet-battle-api petbattle/pet-battle-api --version=1.1.0 \ 
   --namespace ${TEAM_NAME}-prod --create-namespace
```
```bash
helm upgrade --install pet-battle petbattle/pet-battle --version=1.0.6 \ 
   -f values.yaml --namespace ${TEAM_NAME}-prod
```

```bash
helm upgrade --install pet-battle-infra petbattle/pet-battle-infra --version=1.0.31 \
   --set install_cert_util=true --namespace ${TEAM_NAME}-prod
```
