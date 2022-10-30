#### Introduction
TrueNAS SCALE uses Lightweight Kubernetes container orchestration (K3s) and docker as its runtime for containers.
 
The motivation of this chart comes from existing infrastructure that was using docker and docker-compose, that needed migration to TrueNAS SCALE.  These applications are not clustered aware and are mostly stateful, single container applications.  They have no requirements for load balanced, high availability, scalability, etc.  It is desired to use and manage multiple different IP addresses and ports externally from orchestration.
 
The majority of charts such as TrueNAS SCALE's "Launch Docker Image", use Kubernetes Services with NodePorts, which although work, wasn't seen as ideal for the above requirements.  During a deep dive into Kubernetes Manifests were created that had a different networking concept using ClusterIP with ExternalIPs, that worked for single or multiple different IPs managed externally within TrueNAS SCALE with different ports that are below 9000.  This chart was born from that deep dive.
 
The chart concept was to take the above simple manifest and develop charts to use this networking concept.  In addition there was a desire to use a similar language to Kubernetes that can be understood like a kubernetes manifest file.  Compromises were made to simplify the charts and reduce duplicate questions.
 
Please be aware, some concepts used do break various best practices, but as it fits requirements for the workloads being deployed.  Its recommended that you understand best practices for your requirements, as NodePort may be a better fit.
<br><br>
 
#### Deployment Instructions
 
1. Use a docker image.  If a docker image is not used such as github repository (ghcr.io), truenas may repeatedly ask to update the application. Currently its recommended to use docker images.
2. Answer the desired questions and add options for the container, such as environmental variables and storage.
 
#### Networking Instructions
Networking can currently be provided in 3 ways:
 
<b>Service with clusterIP</b>
<br>
 
1. (Optional) add an additional alias IP to an interface on TrueNAS SCALE.
2. Select 'Service: ClusterIP' within the service type under Networking.
3. Enter the ports for communication.  If the same IP is used with other containers, they cannot conflict.
4. If external access is needed for the application, enter or change the IP address of ExternalIP.  This option can be disabled if only cluster-internal communication is needed.
5. Save the Chart.
6. Access the application using the ExternalIPs and configured ports.
 
<b>Service with NodePort</b>
<br>
 
1. Select 'Service: NodePort' within the service type under Networking.
2. Enter the ports for communication.  Ports cannot conflict.
3. Save the Chart.
4. Access the application on any configured "Node IP" (these can be found or changed within Settings, Advanced Settings).
 
<b>No Service (Pod only networking) or hostNetwork</b>
<br>
 
1. Select 'No Service (Pod only networking)' within service type under Networking.
2. If hostNetwork is needed, enable it.  HostNetwork exposed the pod to the host namespace, which will allow communication to the host and its interfaces.  This is not normally recommended, but can be needed for specific workloads.

<br>
<br>
<br>