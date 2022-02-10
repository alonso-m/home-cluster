<div align="center">

<img src="https://camo.githubusercontent.com/5b298bf6b0596795602bd771c5bddbb963e83e0f/68747470733a2f2f692e696d6775722e636f6d2f7031527a586a512e706e67" align="center" width="144px" height="144px"/>

### My home Kubernetes clusters
_... managed with Flux, Renovate and GitHub Actions_

</div>

---

## 📖 Overview

This is a repository for the two Kubernetes clusters that I run at two different home locations. I try to adhere to Infrastructure as Code (IaC) and GitOps practices using the tools like [Ansible](https://www.ansible.com/), [Terraform](https://www.terraform.io/), [Kubernetes](https://kubernetes.io/), [Flux](https://github.com/fluxcd/flux2), [Renovate](https://github.com/renovatebot/renovate) and [GitHub Actions](https://github.com/features/actions).

---

## ⛵ Kubernetes

### Installation

My cluster is [k3s](https://k3s.io/) provisioned overtop bare-metal Ubuntu 20.04 using the [Ansible](https://www.ansible.com/) galaxy role [ansible-role-k3s](https://github.com/PyratLabs/ansible-role-k3s).

🔸 _[Click here](./ansible/https://github.com/alonso-m/home-cluster-provision) to see my Ansible playbooks and roles which are stored on a separate repository._

### Core Components

- [mozilla/sops](https://toolkit.fluxcd.io/guides/mozilla-sops/): Manages secrets for Kubernetes, Ansible and Terraform.
- [jetstack/cert-manager](https://cert-manager.io/docs/): Creates SSL certificates for services in my Kubernetes cluster.
- [kubernetes/ingress-traefik](https://github.com/traefik/traefik): Ingress controller to expose HTTP and SSH traffic to pods over DNS.

### GitOps

[Flux](https://github.com/fluxcd/flux2) watches my two clusters and applies those changes to my cluster automatically based on the YAML manifests.

[Renovate](https://github.com/renovatebot/renovate) watches my **entire** repository looking for dependency updates, when they are found a PR is automatically created. When PRs are merged [Flux](https://github.com/fluxcd/flux2) applies the changes to my cluster.

### Clusters

The Git repository contains the following two repositories which are sorted by namespaces under the folder [/clusters/](.clusters).

- **home**: Contains all the YAML manifests for the main home cluster. This cluster contains the majority of the services that I run.
- **pueblo**: Contains all the YAML manifests for the pueblo cluster which is used mainly for storing back ups.

### Persistent Volume Data Backup and Recovery

I use [Velero](https://github.com/vmware-tanzu/velero) to create daily snapshots of the cluster configuration. I export this snapshots to anoter disk at the cluster and to the pueblo cluster in a remote location using S3 storage.

---

## Thanks

Thanks to all the people who donate their time to the [Kubernetes @Home](https://github.com/k8s-at-home/) community. A lot of inspiration for my cluster came from the people that have shared their clusters over at [awesome-home-kubernetes](https://github.com/k8s-at-home/awesome-home-kubernetes).

---
