# 😺 Pet Battle is on Prod
> 
## 👨‍🍳 Exercise Intro
In this exercise, we will set up our working environment. We will automate the installation of toolings we need, as well as the deployment of PetBattle. And while doing this, we will utilize GitOps approach.

## 🔮 Learning Outcomes
* Understand the benefits gained from GitOps approach
* Drive tool installations through GitOps
* Deploy applications to an environment through automation

## 🔨 Tools used in this exercise
* <span style="color:blue;">[Helm](https://helm.sh/)</span> - Helps us to define, install, and upgrade Kubernetes application.
* <span style="color:blue;">[ArgoCD](https://argoproj.github.io/argo-cd/)</span> - A controller which continuously monitors application and compare the current state against the desired
* <span style="color:blue;">[SealedSecrets](https://github.com/bitnami-labs/sealed-secrets)</span> - Helps us to encrypt the secrets to store safely, even to a public repository.
* <span style="color:blue;">[Jenkins](https://jenkins.io/)</span> - Open Source Build automation server. Highly customisable with plugins.
* <span style="color:blue;">[Nexus](https://www.sonatype.com/nexus-repository-sonatype)</span> - Repository manager for storing lots of application types. Can also host `npm` and `Docker` registries.