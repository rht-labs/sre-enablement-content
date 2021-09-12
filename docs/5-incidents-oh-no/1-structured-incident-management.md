## Pet Battle is getting alerts
Through out this section, you will recieve several alerts (usually one by one). Before starting, define some example priority levels for your application (ie critical, major, minor...)

Before we start, let's take a look at possible roles during an incident. 
- Primary on-call
- Incident Lead (IL)
- Communications Lead (CL)
- Operations Lead (OL)
- Scribe

*The OL and CL report to the IC, no matter the normal reporting line.*
### Example Incident Response Process
0. On-call SRE gets the alert.
1. Establish an Incident Lead (or Incident Commander).
2. Inform 


<!-----
registry issue:
- registry and the node that app is running on is killed?

NTP not set - it'll come up in the long term

entitled builds fail?

slowness issue:
- another app deployed automatically on the cluster and it is dominating the resources. OpenShift UI can show some metrics for the platfrom.

keycloak bug:
- when operator auto updates itself - it gets broken 12.0.3 -> 13.0.1 because of client scopes get reseted.

CICD not working:
- Jenkins plugin latest version is broken

platform bug/problem/incident
- internal dns error?

security incident example:
- load bunch of dogs photo
----->