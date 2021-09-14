## Error Budgets
Now that we have SLOs defined for services - next step in the loop is deciding what to do when we don't meet with them. 
We define SLOs as a way to make sure that our services are reliable enough for our endusers. When our measurements show if we are not reliabile enough - now what?

## Error Budget Policy
"_a space between their objective and reality to choose to do the most impactful work._"

We get alerts when Error Budget is being burned but it is not enough to know that. We also need to know what to do in the event of error budget violations. We can do this through `Error Budget Policy`

The alert definition of `99% of page requests in the past 28 days served are successfull` SLO gives notification on error budget burndown rate over a specific time interval. 

### Example Error Budget Policy
- Service overview
- Policy goals
- Policy non-goals
- SLO miss, outage, and escalation policies
- Any necessary background information