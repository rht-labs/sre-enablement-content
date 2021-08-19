## SLIs
Service Level Indicators, or SLIs, is about having meaningful measurements of your service in terms of your user's perspective. They are closely tied to what the users of the service care about, such as availability, latency, or response time.

#### Define Users
Let's start by defining the users of the service. Here is one example. Meet: Nynaeve Almeara

<img src="3-return-of-the-monitoring/images/user-1.jpg" width="750">

We will map a user journey based on the Nynaeve's interaction with the service. It helps us to understand her motivation and emotions while she is using the product. Ideally, user journeys help to investigate every side of the solution, and provide key pointers on how to design and improve a product or MVP. But in our case, it will help us to define what is good from the user point of view and map out the most important components for the given journey become successfull. These are essential to decide the most important SLIs. Having too many SLIs can cause distraction or unneccesary noise. When we have the best SLIs, we can identify the best place to collect data/metrics for the components and lastly, create a dashboard to display that to reflect our service quality.

[TODO] finish this 😅😅

<img src="3-return-of-the-monitoring/images/user-journey-map-1.jpg" width="900">

[TODO] discuss maybe instead of given this, create a persona and a journey map for the training and let people to discuss PetBattle from scratch 🤔🤔🤔

<!---replace this with OPL practices

### Now a bit hands on
[TODO] research for drill down dashboard in Grafana
Let's install Grafana and visualize the SLIs we just decided.

how can we apply these practices into our training? Like, what would be an SLI for a trainer for this particular enablement?
99% of topics we aim for the day is delivered?
how can we measure if we are meeting our SLO?
think about setting the environment - was there any toil? did we have any incident (for cluster etc) during an enablement? how did we react? did we run a analysis?
or DO500 examples?
what could be a good incident for an enablement? loosing all slideS? :D 
Beta Runs - good example for testing?
number of people, logistics etc - capacity planning
Don’t just teach the tech, teach the culture.--->

