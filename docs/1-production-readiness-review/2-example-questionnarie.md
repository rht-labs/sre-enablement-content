## Example Onboarding Questionnaire
> A cool example questionnaire that could give you an idea what to check / what to know before onboarding an app!

### 1. Application Owners
* Manager(s)
* Team Lead(s)
* JIRA Board
* Contact Information (ie Team mailing list, slack channel)


### 2. Application Description
Please provide a brief description of the application. We strongly encourage to add a diagram to this section, and link to other more comprehensive architecture design documents.

### 3. Application Status
Preview, Alpha, Beta, GA

### 4. Application Success Criteria
Please provide information about the business goals of the service.

### 5. Service Level Agreement (SLA)
Does your application have a SLA it needs to meet? Are SLA well understood and easily transformable into metrics?

### 6. Upstream Repositories
List your source code repositories.

### 7. Technology Stack
Describe your technology stack or links to documents that have the details. This should include the main library dependencies and installation channels.

### 8. Container Images
List the containers required to run your application, and the source of these containers (Dockerfile `FROM`).

### 9. Routes
List public and private routes of this application and explain what API are they exposing and what/who will consume them.

### 10. Database
Which database, if any, does the application use?

### Database Migration
- How do you plan to run database migrations for schema changes, etc.?
- How does your application handle schema upgrades/rollbacks?
- Do you make schema changes with forward/backward compatibility?

### Database Performance
- Have you run any tests to ensure your database queries are performant?
- Have you validated that your SQL queries make use of the indexes and have you added appropriate secondary indexes?
- Have you validated your database can scale over the current requirements?

### Database Security
- Application must be able to connect to the database over SSL connection.

### Database Sensitive Information
- Does the database contain any information that can be used to identify a customer?
- Object Storage (AWS S3)
- Does your application use AWS S3 object storage to store data?
- Does the S3 bucket have any object lifecycle policy on it?
- What is the retention period for objects stored in the bucket?
- Can we take advantage of different storage classes to reduce cost?
- Does the data in the S3 contain any information that can be used to identify a customer?

### 11. Local Storage (Persistent Volumes)
- Does your application use persistent volumes to store data?
- If yes, how & where do you backup this data?

### 12. Business Continuity Plan
Backup policies and recovery plan if data is lost or degraded. Actual test of BCP is more than welcome.

### 13. Capacity
- Required capacity in terms of memory and cpu per pod, and the number of pods. Is this expected to change over time?
- Required amount of storage (DB, S3, local, etc). Is this expected to change over time?
- Simplified requirements for capacity exists (ex. for each 100K TPS Application needs additional replica of component ABC)

### 14. Internal Dependencies
List internal services your application depends on. List SLA for those services. What's the course of action and impact if they fail?

### 15. External Dependencies
List external services your application depends on. List SLA for those services. What's the course of action and impact if they fail?

### 16. Application Requirements in OpenShift
List of OpenShift features this application relies on, and whether it has some deployment constraints like special affinity/anti-affinity rules or namespace co-location with other services.

### 17. Service Level Indicators
- List all SLIs for your application.

### 18. Service Level Objectives
- List all SLOs for your application. Are they understood the same way by all actors and stakeholders?

### 19. Logging, Metrics, Monitoring, & Alerting
**Logging**
- Application logging level is set to INFO or above. DEBUG should not be enabled in production.
- ...but if you must enable DEBUG in production, can you do that fast?
- Retain logs for a period of 14-30 days.
- Retaining logs forever can create a liability if they have secret or confidential data due to a bug in code.
**Metrics**
- Service Level Indicators (SLI) - applications must export metrics for all SLIs. If applicable, processing flow entry-points and exit-points  should expose metrics for all SLIs as well.
**Alertmanager Rules**
- Service Level Objectives (SLO): Create rules to alert when a SLO is breached.

### 20. Testing
**Load/Overload/Stability/Reliability/Robustness/Observability Testing**
- What kind of load testing has been done on the application?

### 21. Communication
All dev teams must take following actions:
- Subscribe to the sre-notifications@example.com mailing list.
- Join #sre slack channel.

### 22. Rollouts
- How the application is going to be rolled out?
- Is application is/should be capable of zero-downtime deployments?
