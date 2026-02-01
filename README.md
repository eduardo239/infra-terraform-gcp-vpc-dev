# GCP VPC

This project provides infrastructure as code (IaC) for deploying a Google Cloud Platform (GCP) Virtual Private Cloud (VPC) network and associated resources using Terraform.

## Configuration

- **project_id** (obrigatório): defina via `terraform.tfvars` (copie de `terraform/terraform.tfvars.example`) ou `TF_VAR_project_id`. Não é versionado por segurança.
- `region` (default: us-central1)
- `zone` (default: us-central1-a)
- `vpc_name` (default: tf-vpc-network)
- `vm_assign_public_ip` (default: false): IP público da VM desabilitado por padrão; use `true` apenas se necessário.
- `services` to enable (compute, storage, resource manager)
- Subnet configurations (name, CIDR ranges)

## Security Scanning

### Checkov scan

Run security scans on your Terraform code using Checkov:

```bash
checkov -d .
```
