# Return of the Monitoring
> PetBattle already have some basic monitoring based on platform and application metrics. (and you probably have these details through your PRR.) But now that the PetBattle is on production, what else would you monitor?  

Observability is ability to measure the status of your Application based only on what Application and supporting infrastructure presents. It's also used as an umbrella term for various telemetry sources that combined together answer (or at least should answer) the ultimate question: "What my Application is doing and how well is it doing the thing, whatever that is?"

Depending on the place, telemetry can be provided by monitoring, logging and tracing utilities, with boundaries between all three becoming more and more blurred.   

[TODO] Introduce ServiceMonitor
## 👨‍🍳 Exercise Intro
In this exercise, we will introduce Service Levels; how to identify and implement them. We will look for SLI/SLO/Error Budgets in details and again, utilize some automation to set up tracking and alerting what we have discovered for what is important for our beloved endusers!

## 🔮 Learning Outcomes
* Identify user & user journeys & system boundaries to decide most important SLIs
* Set SLOs based on the given SLI and document them
* Set Error Budgets and define Multiwindow, Multi-Burn-Rate alerts
* Understand SLAs and define alerts for it also

## 🔨 Tools used in this exercise
* Miro Board - for identify user & user journeys
* <span style="color:blue;">[Jsonnet](https://github.com/google/jsonnet)</span> - The data templating language
* <span style="color:blue;">[Prometheus](https://prometheus.io/)</span> - Stores our metrics and used for alerting
* <span style="color:blue;">[Grafana](https://grafana.com/)</span> - Used to visualize our metrics
