## Service Level Indicators
Service Level Indicators, or SLIs, is about having meaningful measurements of your service in terms of your user's perspective. They are closely tied to what the users of the service care about, such as availability, latency, or response time.

Below are the generic measurements that are used for SLIs. 

[RED](https://grafana.com/files/grafanacon_eu_2018/Tom_Wilkie_GrafanaCon_EU_2018.pdf): Rate, Errors, Duration - introduced by [@tom_wilkie](https://twitter.com/tom_wilkie)

[USE](http://www.brendangregg.com/usemethod.html): Utilization, Saturation, and Errors - introduced by [@brendangregg](https://twitter.com/brendangregg)

As this needs to be defined from enduser's point of view, let's run some user based practices to identify what does `good` mean for our users and what components are important.

- [Pet Battle SLIs](4-return-of-the-monitoring/1a-pet-battle.md)
- [Platform SLIs](4-return-of-the-monitoring/1b-platform.md)

<!----
Goodhart's Law
Moore's Law

ability to align stakeholder vs the speed of improvement for metrics collection and computation 
--->