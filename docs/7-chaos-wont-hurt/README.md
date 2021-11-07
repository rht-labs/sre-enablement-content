# A Little Chaos Won't Hurt

> Chaos engineering is the process of testing a distributed computing system to ensure that it can withstand unexpected disruptions. The goal of chaos engineering is to identify weakness in a system through controlled experiments that introduce random and unpredictable behavior.

# Background

Performing any sort of testing reliably requires the use of solid tooling support for you platform - in our case, OpenShift/Kubernetes. In this exercise we try out one of the [CNCF incubating projects](https://chaos-mesh.org) - **Chaos Mesh**. It is an open source cloud-native Chaos Engineering platform built for Kubernetes.

Chaos Mesh offers various types of fault simulation and offers  ability to orchestrate fault scenarios. We can simulate various abnormalities that might occur in reality during the development, testing, and production environments and find potential problems in the system.

Chaos Mesh provides a convenient Web UI interface which helps us learn the basic concepts and monitor the status of our Chaos experiments.

## 👨‍🍳 Exercise Intro

In this exercise, we will deploy a shared Chaos Mesh control plane into our cluster. Then we will split into our team groups and design, run and observe a couple of common chaos testing scenarios using our Pet Battle suite of apps. Finally we will discuss our findings with a view to mitigating weaknesses in our design.

## 🔮 Learning Outcomes

- Learn how to create chaos engineering experiments.
- Monitor and observe the effects of our experiments on our applications.
- Have conversations about how to mitigate weaknesses in our design based on the findings.

## 🔨 Tools used in this exercise
- [Chaos Mesh](https://chaos-mesh.org/)
- Miro Board
