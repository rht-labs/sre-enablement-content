
### Verify the Installation
Let's see if everything is running smoothly. Open up the application in the browser to verify it's up and running. Here's a handy one-liner to get the address of the application:

```bash
oc get route/pet-battle -n ${TEAM_NAME}-prod --template='{{.spec.host}}'
```
You should see a UI like this:
![pet-battle-ui](images/pet-battle-ui.png)

...

No luck? Just a blank page? Let's check the status of the pods:
```bash
oc get pods -n ${TEAM_NAME}-prod
```
<img src="2-pet-battle-on-prod/images/list-pods.png" width="750">

Anything in the events? Logs?
```bash
oc get events -n ${TEAM_NAME}-prod
```

[TODO] add some guidance for troubleshooting.


