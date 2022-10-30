# Soleous Developed FluidCharts Application Catalog for TrueNAS SCALE
A collection of custom TrueNAS SCALE Apps developed for generic deployment of applications using docker repositories.

## quickchart
TrueNAS SCALE uses Lightweight Kubernetes container orchestration (K3s) and docker as its runtime for containers.
 
The motivation of this chart comes from existing infrastructure that was using docker and docker-compose, that needed migration to TrueNAS SCALE.  These applications are not clustered aware and are mostly stateful, single container applications.  They have no requirements for load balanced, high availability, scalability, etc.  It is desired to use and manage multiple different IP addresses and ports externally from orchestration.
 
The majority of charts such as TrueNAS SCALE's "Launch Docker Image", use Kubernetes Services with NodePorts, which although work, wasn't seen as ideal for the above requirements.  During a deep dive into Kubernetes Manifests were created that had a different networking concept using ClusterIP with ExternalIPs, that worked for single or multiple different IPs managed externally within TrueNAS SCALE with different ports that are below 9000.  This chart was born from that deep dive.
 
The chart concept was to take the above simple manifest and develop charts to use this networking concept.  In addition there was a desire to use a similar language to Kubernetes that can be understood like a kubernetes manifest file.  Compromises were made to simplify the charts and reduce duplicate questions.
 
Please be aware, some concepts used do break various best practices, but as it fits requirements for the workloads being deployed.  Its recommended that you understand best practices for your requirements, as NodePort may be a better fit.