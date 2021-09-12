## Automation
_something something about automation and CICD_
### Install CICD toolings
Manually installating the application via helm charts is useful for learning and maybe setting up a one-time debugging environment. But as everyone would agree, it is not realistic to do this manually. So let's set up automated CICD infrastructure for PetBattle. (How to build automated pipelines is covered in TL500: https://rht-labs.com/tech-exercise/#/ )

### Install toolings
1. ArgoCD installation as GitOps tool:

```bash
helm repo add redhat-cop https://redhat-cop.github.io/helm-charts
```

```bash
cat << EOF > /projects/tech-exercise/argocd-values.yaml
namespace: ${TEAM_NAME}-ci-cd
argocd_cr:
  namespaceRoleBinding:
    enabled: true
  applicationInstanceLabelKey: rht-labs.com/${TEAM_NAME}
  repositoryCredentials: |
    - url: https://gitlab-ce.${CLUSTER_DOMAIN}
      type: git
      passwordSecret:
        key: password
        name: git-auth
      usernameSecret:
        key: username
        name: git-auth
EOF
```

```bash
helm upgrade --install argocd \
  --namespace ${TEAM_NAME}-ci-cd \
  -f /projects/tech-exercise/argocd-values.yaml \
  redhat-cop/argocd-operator
```

### Install PetBattle through GitOps
If you look at `tech-exercises/ubiquitous-journey/values-tooling.yaml` file, the tools that we need in order to deploy PetBattle into production is listed there. 
- Enable app of apps
- Overwrite the config value that caused a problem in the previous section :)

### Pipelines
- Verify pipelines are working by pushing a change

### Defining Toil
For this process, have you identify any toil? What would you automate further and why? 