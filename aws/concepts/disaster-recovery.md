# AWS Disaster Recovery Plans

Disaster recovery has different objectives than Availability - it focuses on replication of the entire workload so it's ready to be employed in case of a disaster.

DR Failover strategies should be regularly tested, and RTO/RPO measured, to ensure they are ready for disaster scenario. Antipattern - falsly assuming your DR strategies work, because they have worked in the past. Always verify. Best is to automate DR failover.

## Recovery Objectives

### RTO (Recovery Time Objective)
Acceptable SERVICE DOWN time window. Max time from service interruption to service recovery.

### RPO (Recovery Point Objective)
Acceptable data loss between last recovery point and the interruption of the service.

## Recovery Strategies

### Backup&Restore
*(RPO in hours, RTO in 24h or less)*
Backup all the data using point-in-time backups into the DR region. Restore when neccessary to recover from disaster.

### Pilot light
*(RPO in minutes, RTO in hours)*
Continously replicate data and core infrastructure from one region to another. Load application servers and configuration, but keep it off - use only for testing or during DR failover.

### Warm Standby
*(RPO in seconds, RTO in minutes)*
Maintain a scaled-down, but fully functional version of the workload always running in the DR region. Business-critical systems are fully duplicated and always on. During DR failover, quickly scale up the Standby to handle production traffic. Fully-scaled standby is called Hot Standby.

### Multi Region (Multi-site) active-active
*(RPO near zero, RTO potentially zero)*
Workload is deployed to, and actively serving traffic from, multiple AWS Regions. Requires cross-region data synchronisation. Data replication is useful, but it won't protect against data corruption, unless the solution includes point-in-time recovery.  