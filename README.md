# Cloud-Based File Storage System (Bash & Azure)

A simple, automated cloud-based file storage system built using Bash scripting and the Azure CLI. This tool allows users to manage files in Azure Blob Storage with a command-line interface, complete with automated logging.

## Features
- **Cloud Provisioning:** Automates the creation of Resource Groups, Storage Accounts, and Containers.
- **File Management:** Supports `upload`, `download`, `list`, and `delete` operations.
- **Logging:** All storage activities are tracked in a `storage_activity.log` file.
- **CI/CD:** Automated deployment via GitHub Actions.

## Prerequisites
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed.
- An active Azure Subscription.

## How to Use
1. **Setup:**
   Run the provisioning script to create your infrastructure:
   ```bash
   ./setup_storage.sh