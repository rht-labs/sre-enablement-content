## SLIs
Service Level Indicators, or SLIs, is about having meaningful measurements of your service in terms of your user's perspective. They are closely tied to what the users of the service care about, such as availability, latency, or response time.

<!---replace this with OPL practices
Let's start by defining that the users of the service care about then. Who should be join this session to define PetBattle's user base? 

Personas:
* people who want to add their cats to the competition 
* people who want to vote for cats
* people who just like to view some cats photo

List some important user journeys for these personas:
- Easily upload cat photos
- ...

Select one of them and define a happy path for this journey.

What is "good" from the user point of view for this journey?
- website is up and responding fast
- photos uploaded super quick
- can view the uploaded photo
....

Maps out the components for this journey:
- Upload function is working 
- DB has enough space and responds fast
...

Now we have enough information to define most important SLIs. Remember, having too many SLIs can be distracting and prevent focusing on what is important. 

SLIs:
- Requests that the UI responds to within 5 seconds.
...

Identify the best place to collect data/metrics and create a dashboard to display that to reflect their service quality.

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