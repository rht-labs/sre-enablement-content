![thumbnail](../images/discovery.png)
# Product Readiness Review FG
PRR in general:
- emphasize PRR in SRE is not for smacking developers/architects for their possibly unlogical decision, it's to let SRE understand those decisions, possibly working out solutions that are acceptable by all parties.
- emphasize PRR is a great opportunity to learn for all present if moderated correctly (external moderator with tech experience may help)


PRR itself:
- do it as early as possible - design changes are easier and cheaper when there's no actual application yet.
- do it more than once - and always review the deltas between PRRs, addressing one design/implementation problem could have opened something else
- It's ok not to know answers for questions asked at PRR at the first shot - but not knowing the answers second time is a solid red-flag
- one correct question asked and answered on PRR can mean participants just saved themselves 8 hours of downtime.
- "Woken up in the middle of the night" incident exercise - look at current/proposed monitoring and logging solutions, check if they're simple but still  provide level of detail needed to analyze situtation.
