### For facilitator: incidents

- New version of mongodb causes cats collections to drop
Current mongodb of PetBattle is deprecated: https://catalog.redhat.com/software/containers/rhscl/mongodb-36-rhel7/5aa62427ac3db95f19608637



- Node goes down and Unable to pull image
* a node goes down
* PB spins up in another (potentially new) node
* unable to pull images
* but Quay is live and accessible through network
* company applied a security policy and not add quay.io to `allowedRegistries` in `image.config.openshift.io/cluster`
> https://docs.openshift.com/container-platform/4.6/openshift_images/image-configuration.html

