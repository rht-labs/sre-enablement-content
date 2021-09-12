### Define Users
Let's define a persona for Pet Battle. Here is one example. Meet: Nynaeve Almeara

<img src="4-return-of-the-monitoring/images/user-1.jpg" width="750">

### User Journey

Let's map a user journey based on the Nynaeve's interaction with the service. It helps us to understand her motivation and emotions while she is using the product. Ideally, user journeys help to investigate every side of the solution, and provide key pointers on how to design and improve a product or MVP. But in our case, it will help us to define what is good from the user point of view and map out the most important components for the given journey to become successful. These are essential to decide the most important SLIs. Having too many SLIs can cause distraction or unneccesary noise. When we have the best SLIs, we can identify the best place to collect data/metrics for the components and create a dashboard to display that to reflect our service quality.

Let's start creating a very simple user journey and how the user feels during this journey.

<img src="4-return-of-the-monitoring/images/user-journey-1.jpg" width="900">

### Map System Boundaries
A system boundary is the point at which one or more components expose capabilities to external customers. If you think about PetBattle as a system, it represents the capability for users to play Cat vs Cat. PetBattle has multiple internal components: a database to store the photos, Keycloak to authenticate people, a serverless function to make sure the photos are family friendly, and more. Some of these internal components don't represent system boundaries because we're not exposing them to the customer. For starter, we can simplify PetBattle into two boundaries: one is UI/API tier and the other is storage tier.

<img src="4-return-of-the-monitoring/images/pet-battle-system-boundaries.png" width="900">

When we map the boundaries with the journey, we focus on the important measurements we need to implement.

<img src="4-return-of-the-monitoring/images/pb-system-boundaries.jpg" width="900">

### Define SLIs for the Components
Now that we know what availability means for each component from user perspective at a high level, we can define SLIs based on that.

For UI/API tier:
- Request to open dashboard complete successfully (an event-based measurement)
- Proportion of dashboard (home page) requests that were served in < 200ms (a time-based measurement)

### Determine Data Points
The next step is to define where is the best place to gather data for each SLI. Make sure to look for the point closest to the end user, so that the metrics would be representative of their experience. 

For the moment, API provides default spring boot metrics under `/metrics` endpoint. (Better to have something now than to wait months to instrument.)

- Implementation for request to complete successfully: We can use `http_server_requests_seconds_count` metrics to display the success rate of requests. 

Here is an example:
```bash
http_server_requests_seconds_sum{method="GET",outcome="SUCCESS",status="200",uri="/cats/topcats",} 7.855780484
```
It is preferable to perform an exact match on the outcome tag (outcome="SERVER_ERROR"), instead of status code (like status !~"2..") Because by selecting “not 2xx”, you would be grouping server errors, like the common HTTP 500 Internal Server Error, with errors caused by the user, like HTTP 400 Bad Request or HTTP 403 Forbidden. A high rate of HTTP 400s may indicate that you recently released code that contained an accidental backward incompatibility in an API, or it could indicate that the user doesn't have the right payload. Alerts on client error ratio might be nice for intrusion detection, but the threshold would be much higher than server error ratio.<sup>[1](https://www.oreilly.com/library/view/sre-with-java/9781492073918/ch04.html)</sup>

```bash
http_server_requests_seconds_count{outcome="CLIENT_ERROR"}
http_server_requests_seconds_count{outcome="SERVER_ERROR"}
```

It is also important to use probes external to the application (like router, external service, etc) 


Note: If you need to measure one of your SLIs from inside your app, make sure that one of the other SLIs are measure from outside to be able to capture metrics when your app is not available.

### Create a Dashboard (Optional)

### Observe and Iterate
Observe your SLIs over a period of time (for example 1 or 2 weeks), track the correlation with user happiness, and iterate over them to get a better understanding of your service’s performance.

