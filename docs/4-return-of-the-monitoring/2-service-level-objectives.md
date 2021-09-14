## SLOs
Now that we have SLIs, we can set objectives based on that. SLOs are usually based on past performance or business needs. You need to take service growth into consideration also. If you don't have any prior data, performance testing can help choosing realistic SLOs as well.

After SLIs, SLOs are the math part of the stack. You can set multiple SLOs for a certain SLI. Make sure that your SLO specifies both a target and a measurement window. And remember, 100% of an SLI is never a target.

## SLO Documentation - an example
It is important that SLOs are documentated and iterate over time. Here is an example documentation:

```yaml
User Journey: User Journey - 1 
SLI Type: Latency / Availability / Quality
SLI Specification: Definition of SLI
SLI Implementations:  
  - measured from metric X 
SLO:
  target of the SLI for a given measurment window
```
*credit: https://cre.page.link/art-of-slos-handbook*

- [Pet Battle SLOs](4-return-of-the-monitoring/2a-pet-battle.md)
- [Platform SLOs](4-return-of-the-monitoring/2b-platform.md)

Links we like:
- https://promtools.dev/alerts/errors 