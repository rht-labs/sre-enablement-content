# SRE Enablement Introduction

![jenkins-crio-ocp-star-wars-kubes](./images/jenkins-crio-ocp-star-wars-kubes.png)
[image-ref](https://www.cloudbees.com/blog/get-ripped-jenkins-docker-industrial-strength-continuous-delivery)

## Learner Outcomes

* Provide an immersive experience for students through practical application of DevOps culture using modern software development practices.

* Allow students to experience the cultural shift they need to make in order to begin a successful DevOps journey.

## Learner Pre-requisites

There are only minimal technical requirements required for this enablement. As most exercises are conducted through hosted-tooling like CodeReady Workspaces and Miro, the only thing you need access to is a browser! The preferred browser can be found below, but _should_ work as expected in most modern browsers.

The following table lists the software requirements for running the lab exercises:

 | Software | Version | Check |
 | -------- | ------- | ----- |
  | Google Chrome Web Browser | (>=70) | click [here](chrome://version/) if Google Chrome is your default browser else copy the link `chrome://version/` in your Chome |
 
### Linux

1. Install Chromium version 70 or higher.

```bash
dnf install chromium
```
### macOS

1. Install Google Chrome version 70 or higher by downloading it from https://google.com/chrome

### Microsoft Windows

1. Install Google Chrome version 70 or higher by downloading it from https://google.com/chrome

## Cluster Information

Most technical exercises will be completed by interacting with CodeReady Workspaces and an OpenShift cluster (or other various technical resources). You will receive the information you need to connect via an onboarding email sent to you by your instructors. It should contain the following:

 - <**CLUSTER_URL**> -- OpenShift Webconsole/API Server URL
 - <**APPS_URL**> -- Wildcard subdomain for the exposed applications deployed in the Cluster
 - <**CODEREADY_WORKSPACES_URL**> -- URL to access in order to launch your workspace.
 - <**USERNAME**> -- Username used in order to access various resources
 - <**PASSWORD**> -- Password used in order to access various resources 


## Tech 101

  While discussing going through various SRE practices and exercises, we will be making use of various technologies. Below are some useful links that may
  be useful to make you more comfortable while walking through the exercises. You are not expected to come into this course as an expert in any of these 
  areas and you are not expected to leave this way either. These are just helpful to give you some reference with the tooling that will be used and may give
  you an area of interest to explore after this enablement.

 - Git tutorial covering the basics - https://try.github.io/
 - Handy guide for those new to containers - https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/

## Accessing your IDE

Once you are ready to begin, you can access your IDE at the <**CODEREADY_WORKSPACES_URL**> that you were provided. This will bring you to a login page where you can provide the credentials you were given in order to access CodeReady Workspaces. Once logged in you can hit the following URL in order to launch your workspace: <**DEVFILE_URL**>. Once you hit this URL you'll see a workspace begin to spin up. Once it completes, you'll have a workspace available with the following tools:

 - SOME
 - LIST
 - OF
 - TOOLS