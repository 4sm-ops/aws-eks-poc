# Provision an EKS Cluster

## Deployment overview

- EKS Deployment in 3 availability zones

```
  azs  = slice(data.aws_availability_zones.available.names, 0, 3)

```

- Basic security groups

```
resource "aws_security_group" "node_group_one" {
  name_prefix = "node_group_one"
  vpc_id      = module.vpc.vpc_id

}

```

- Adjusted log management

```
variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

```

## Security controls to be addressed

- Network Security. Restrict access to pods from specific network

The mechanisms to implement these security measures on EKS are varied but often include the following items:
Traffic control:
a. Network Policies
b. Security Groups

ToDo: 
a. Network Policies
Implement Calico (open source policy engine). In addition to implementing the full set of Kubernetes network policy features, Calico supports extended network polices with a richer set of features, including support for layer 7 rules, e.g. HTTP, when integrated with Istio.

b. Adjust Security Groups
EKS uses AWS VPC Security Groups (SGs) to control the traffic between the Kubernetes control plane and the cluster's worker nodes. Security groups are also used to control the traffic between worker nodes, and other VPC resources, and external IP addresses. 


- Detective Controls. Enable logging

On EKS, the audit logs are sent to Amazon Cloudwatch Logs. 
ToDo: 
a. Adjust the audit policy for EKS

- Data Encryption and Secrets Management

Kubernetes secrets are used to store sensitive information, such as user certificates, passwords, or API keys. They are persisted in etcd as base64 encoded strings.

ToDo:
a. Use AWS KMS for envelope encryption of Kubernetes secrets
b. Audit the use of Kubernetes Secrets
c. Use separate namespaces as a way to isolate secrets from different applications
d. Use an external secrets provider¶





