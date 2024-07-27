## quickchart
Simular to TrueNAS SCALE's "Launch Docker Image", quickchart is a simple deployment workflow for any single application container using docker images (https://hub.docker.com/).  It uses Kubernetes terminology similar to a Manifests file, however where it differs is its uses of different network workflows than TrueNAS SCALE's "Launch Docker Image".  The network workflows using ClusterIP with ExternalIP configuration, allows for management of IP addresses and Ports outside of orchestration.  This can result in using different IP addresses and Ports with different containers, which isn't avalible with NodePort configuration.  Furthermore, a single IP address can be used on more than one container, as long as port numbers don't conflict.

> **Note:** Please be aware, some concepts used within this chart could break various Kubernetes [best practices](https://kubernetes.io/docs/concepts/configuration/overview/), but they can fit requirements for various workloads.  Its recommended that you understand best practices for your requirements.  Please read Kubernetes documentation such as, [Volume hostPath](https://kubernetes.io/docs/concepts/storage/volumes/#hostpath) and [hostNetwork](https://kubernetes.io/docs/concepts/configuration/overview/#services).


### TrueNAS SCALE Networking Tips
- By default Kubernetes limits container/pod communication with the host including Virtual Machines within TrueNAS SCALE.  If this is needed a common workaround is to use a bridge interface with host IP addresses joined to the physical network interface.  Virtual Machines will also need to use this bridge.
- To expose more IP addresses to use with ClusterIP with ExternalIP, simply add extra Aliases to the network interface.
- Using port 80 and 443, or any port used by TrueNAS SCALE, requires that you remove that IP address from existing TrueNAS SCALE services.  As TrueNAS SCALE by default uses all IP addresses for GUI, remove those IP addresses from the 'GUI' 'Settings' within 'System Settings' to free up ports 80 and 443.
 
### Known Issues
- Use a docker image.  If a docker image is not used such as github repository (ghcr.io), TrueNAS SCALE may repeatedly ask to update the application. Currently it's recommended to use docker images.