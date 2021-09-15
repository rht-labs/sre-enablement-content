## SLAs
Exciting times for PetBattle! As the interest for the PetBattle is growing fast, a network channel & cat food branding want to create a game based on PetBattle!

### Introduce Tournament Service
Tournament service is used to create your own tournament. The channel wants to run tournaments and give away cat food for advertisement purposes. 

Since this channel is going to take a service from the company, an agreement is necessary. We have a baseline for PetBattle and we can make an informed decision based on our SLOs so far.

But before - the tournament service introduces new components to the ecosystem. Additional SLIs need to be defined so that we can track whether we are meeting with our SLAs. 

Let's install tournament service. In your IDE, open up the `pet-battle/prod/values.yaml` file and copy the following:

```yaml
  pet-battle-tournament:
    name: pet-battle-tournament
    enabled: true
    source: https://petbattle.github.io/helm-charts  # http://nexus:8081/repository/helm-charts
    chart_name: pet-battle-tournament
    source_ref: 1.1.0 # helm chart version
    values:
      image_name: pet-battle-tournament
      image_version: latest # container image version
```

```bash
# git add, commit, push your changes..
cd /projects/tech-exercise
git add .
git commit -m  "🐩 ADD - pet battle tournament service 🐩" 
git push 
```

Tournament service needs infinispan for caching. It deploys Infinispan Operator and a relevant custom resource to tell it to create and manage a replicated cache as a dependency. Application team has a dependend helm chart for it.  