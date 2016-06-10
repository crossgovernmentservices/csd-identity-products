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