## SLOs
Now that we have SLIs, we can set objectives based on that. SLOs are usually based on past performance or business needs. You need to take service growth into consideration also. If you don't have any prior data, performance testing can help choosing realistic SLOs as well.

After SLIs, SLOs are the math part of the stack. You can set multiple SLOs for a certain SLI as well. Make sure that your SLO specifies both a target and a measurement window. And remember, 100% of an SLI is never a target.

## SLO Documentation - an example
It is important that SLOs are documentated and iterate over time. Here is an example documentation:
```yaml
User Journey: Uploading Cat Photos 
SLI Type: Latency 
SLI Specification: Proportion of dashboard (home page) requests that were served in < 200ms
SLI Implementations:  
  - measured from the UI metrics.  
  - measured by probers that execute javascript in a browser.  
SLO:
99% of home page requests in the past 28 days served in < 200ms.
```
*credit: https://cre.page.link/art-of-slos-handbook*