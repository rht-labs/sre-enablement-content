
### Verify the Installation
You just did the first installation on production cluster (manually!). Let's see if everything is running smoothly. Open up the application in the browser to verify it's up and running. Here's a handy one-liner to get the address of the application:

```bash
oc get route/pet-battle -n ${TEAM_NAME}-prod --template='{{.spec.host}}'
```

No luck? Just a blank page? Let's check the status of the pods:
```bash
oc get pods -n ${TEAM_NAME}-prod
```
<img src="2-pet-battle-on-prod/images/list-pods.png" width="750">

Anything in the events?
```bash
oc get events -n ${TEAM_NAME}-prod
```

[TODO] add some guidance for troubleshooting.


The development team has hardcoded some variable for pet-battle UI and unfortunately documentation doesn't explicitly state that you need to change some values if you are moving PetBattle to another environment. We need to adjust the vars to suit our production environment. 
Let's get the values:
```bash
wget https://raw.githubusercontent.com/rht-labs/pet-battle/main/chart/values.yaml
```

Open the file in your IDE and update the following vars based on your information:

<pre>
app_name: pet-battle
replicas: 1
...
...
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
helm upgrade --install pet-battle-api \
  --create-namespace --namespace ${TEAM_NAME}-prod \
  petbattle/pet-battle-api --version=1.1.0
```

Congratulations 🥳🥳 You just addressed your first problem! (and also added something in your backlog - sorry! But this shouldn't stay as hardcoded, right? 🙃)

Now that PetBattle is working fine, let's move to something more exciting practices!
![pet-battle-ui](images/pet-battle-ui.png)