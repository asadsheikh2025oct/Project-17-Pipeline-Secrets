# Azure Infrastructure CI/CD with Bicep & Key Vault

This repository demonstrates a secure, automated CI/CD pipeline for deploying Azure resources using **Bicep** and managing secrets via **Azure Key Vault**. The project emphasizes the "Shift Left" security approach by performing linting and pre-deployment validation before any resources are modified.

## 🚀 Features

* **Infrastructure as Code (IaC):** Uses Bicep to define a globally unique Azure Key Vault.
* **Automated Validation:** Includes a Bicep linting stage and an Azure `what-if` analysis to preview changes before deployment.
* **Security-First Secret Management:** Secrets are never stored in the repository. They are retrieved at runtime using the `AzureKeyVault@2` task.
* **Multi-Stage Pipeline:** Implements logical separation between `Validate`, `Deploy`, and `Post-Deployment` checks.
* **Environment Gates:** Utilizes Azure DevOps Environments (`Production-Environment`) to enforce approval gates.

## 🏗️ Project Structure

* `main.bicep`: The core infrastructure file defining the Key Vault and RBAC permissions.
* `azure-pipelines.yml`: The YAML definition for the multi-stage CI/CD pipeline.
* `README.md`: Project documentation.

## 🛠️ Pipeline Stages

### 1. Validate

Performs two critical checks:

* **Bicep Linting:** Checks for syntax errors and best practice violations.
* **What-If Analysis:** Compares the local Bicep file against the live Azure environment to show what will be created, updated, or deleted.

### 2. Deploy

Uses a **Deployment Job** to provision the Key Vault.

* **Checkout:** Explicitly checks out the source code to access the `.bicep` template.
* **Incremental Deployment:** Ensures that existing resources are not accidentally deleted.

### 3. Fetch Secret (Verification)

A post-deployment check that verifies the Service Connection has the necessary **Key Vault Secrets User** role to retrieve secrets without exposing them in the logs.

## 🚦 Prerequisites

1. **Azure Subscription:** An active subscription with a Service Principal.
2. **Service Connection:** An Azure Resource Manager service connection in Azure DevOps named `new-sc-project-17`.
3. **Variable Group:** A variable group or pipeline variables containing:
* `resourceGroup`: The target Azure Resource Group name.
* `location`: The Azure region (e.g., `eastus`).
* `subscriptionId`: Your Azure Subscription ID.
* `kvName`: The desired name for your Key Vault.



## 🔒 Security Notes

* **RBAC:** This project uses Azure Role-Based Access Control. Ensure your Service Principal is assigned the `Key Vault Secrets User` role to the Key Vault data plane.
* **Secret Masking:** The pipeline utilizes Azure DevOps' native masking. Any attempt to `echo` a secret will result in `***` in the logs.

---

### Would you like me to add a "Getting Started" section with the specific Azure CLI commands to initialize this project for the first time?