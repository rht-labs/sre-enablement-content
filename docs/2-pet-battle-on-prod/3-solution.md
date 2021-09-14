## Solution

The development team has hardcoded some variable for pet-battle frontend and unfortunately documentation doesn't explicitly state that you need to change some values if you are moving PetBattle to another environment. We need to adjust the variables to suit our production environment. 
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

After you complete the updates, we need to redeploy frontend to override the values:
```bash
helm upgrade --install pet-battle \
  --namespace ${TEAM_NAME}-prod petbattle/pet-battle \
  -f /tmp/values.yaml --version=1.0.6
```

Congratulations 🥳🥳 You just addressed your first problem! (and also added something in your backlog - sorry! But this shouldn't stay as hardcoded, right? 🙃) This is a good example where SRE team can act like as enablers and help application team to create better templates for the application (either via PR or working together side-by-side)

<p class="tip">
⛷️ <b>Facilitator Note</b> ⛷️ - Based on this experience, what else would you add to your backlog? Think about the things that might have helped you during your troubleshooting.
</p>

Now that PetBattle is working fine, let's move to something more exciting practices!
![pet-battle-ui](images/pet-battle-ui.png)