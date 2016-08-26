Civil Service Digital Identity Products
---------------------------------------

Config for Kubernetes cluster and manifests for a selection of identity- and signon-related products and services.

# Requirements

## Blackbox

Secrets including SSL certs are encrypted using [Blackbox](https://github.com/StackExchange/blackbox). Once BlackBox has been installed and your public key has been added, run `blackbox_decrypt_all_files` before working with the cluster.

## kube-aws

Used to provision the Kubernetes-on-CoreOS cluster. [Download](https://coreos.com/kubernetes/docs/latest/kubernetes-on-aws.html) and install. You will need AWS credentials in place.

## Kubectl

Used to interact with and deploy to the Kubernetes cluster. [Download](http://kubernetes.io/docs/getting-started-guides/docker/#download-kubectl) and install.

12:05]  
Andy Driver thanks for documenting your k8s stuff

[12:05]  
Kerin Cosford Not sure if sarcastic

[12:06]  
Andy Driver readme says to install some things, then nothing

[12:06]  
Kerin Cosford :grimacing:

[12:07]  
Thought I'd added a bit more than that

[12:07]  
Andy Driver unfortunately, deploying dex to paas is not so easy

[12:08]  
because it's a bunch of apps, and cloud foundry expects one app

[12:08]  
so i thought i'd pick up your k8s stuff to deploy to aws

[12:08]  
Kerin Cosford Overall, once you've installed all the gubbins, you can do
`kubectl apply -f /path/to/k8s/resource/files`

[12:08]  
And then magic should happen

[12:09]  
Andy Driver what is the path to the k8s resource files?

[12:09]  
Kerin Cosford Oh, I separated everything out into namespaces, so you need to add
a `--namespace=dex` flag

[12:09]  
Andy Driver assuming ~/csd-id/ is where i cloned to

[12:10]  
Kerin Cosford In that repo there's a `products` directory, with subdirs for Dex,
foregerock etc, so it's the path to that

[12:10]  
Andy Driver ok

[12:11]  
Kerin Cosford You can either give a path to a whole product directory, or a
single YAML file

[12:11]  
Andy Driver i'm keep getting `The connection to the server localhost:8080 was
refused - did you specify the right host or port?`

[12:11]  
Kerin Cosford Right, you need to point kubectl at the cluster, it defaults to
localhost

[12:12]  
Andy Driver with kube-aws init?

[12:12]  
Kerin Cosford Is there a kubeconfig file in the repo?

[12:12]  
Andy Driver yes

[12:12]  
Kerin Cosford In doing this from memory :confused:

[12:12]  
Andy Driver there's also a cluster.yaml

[12:12]  
which should be the output from kube-aws init, if i understand this

[12:12]  
Kerin Cosford I think you just need to set a KUBECONFIG env var to point at that

[12:13]  
Yeah, but you shouldn't need to mess with any of the kube-AWS cluster stuff

[12:13]  
Andy Driver yep, that did it

[12:13]  
a bunch of things are "configured" now

[12:13]  
Kerin Cosford Id say first step is list the namespaces

[12:14]  
Andy Driver dex, signonotron2, forgerock and suemybrother

[12:14]  
Kerin Cosford Sounds right

[12:14]  
Andy Driver and 6 persistent volumes

[12:14]  
Kerin Cosford You can either pass a namespace flag for each call, or set the
namespace with an env var

[12:15]  
Yeah, I created EBS volumes for each DB

[12:15]  
if you do `kubectl get deployments` you'll see each deployed service

[12:16]  
Where 'service' is a web app or DB instance or similar - a thing with a host
name and port

[12:17]  
Andy Driver yep, dex-overlord, -postres and -worker

[12:17]  
Kerin Cosford And if you do `kubectl get services` you'll see what those hosts
and ports are, and if they're publicly exposed

[12:18]  
`kubectl describe service dex-worker` will show you the load balancer hostname

[12:19]  
I added R53 DNS aliases for each exposed service just so they've git a friendly
name - that's done in the AWS console outside of Kubernetes

[12:20]  
Andy Driver ok, i've found the dex register page

[12:21]  
cheers

[12:21]  
Kerin Cosford Basically with Kubernetes you've got a bunch of nouns -
deployments, services, pods, nodes, etc - and you can `kubectl get NOUN` to list
them, and `kubectl describe NOUN NAME` for more info

[12:21]  
It's actually pretty simple
