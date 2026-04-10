# Cloud-File-Storage-Bash

An automated, CLI-driven cloud storage management system built with **Bash** and **Azure CLI**. This project demonstrates **Infrastructure as Code (IaC)** principles and **CI/CD** automation by bridging local development with Azure Cloud services.

---

## 🚀 Features
* **Automated Provisioning:** One-touch setup of Azure Resource Groups and Storage Accounts via script.
* **Custom CLI Manager:** A functional Bash interface to upload, download, list, and delete cloud blobs.
* **Persistent Logging:** A built-in audit trail that records every operation with precise timestamps.
* **CI/CD Integration:** Infrastructure deployment triggered automatically via GitHub Actions on every push.

---

## 🛠️ Technical Stack
* **Cloud:** Microsoft Azure (Blob Storage)
* **Scripting:** Bash (Shell)
* **Automation:** GitHub Actions
* **Environment:** Linux / WSL (Ubuntu)

---

## 📂 Project Structure
.
├── .github/workflows/
│   └── deploy.yml          # CI/CD Pipeline configuration
├── setup_storage.sh        # Infrastructure provisioning script
├── manage_files.sh         # File management CLI script
├── storage_activity.log    # Local audit trail (auto-generated)
└── README.md               # Project documentation

---

## 🔧 Script Breakdown

### 1. setup_storage.sh
This script handles the core cloud architecture.
* **Context:** Uses `az account set` to ensure the correct subscription is targeted.
* **Automation:** Provisions the Resource Group, Storage Account, and Container.
* **Configuration:** Enforces public access levels and TLS requirements automatically.

### 2. manage_files.sh
The primary tool for interacting with the cloud. Supported commands:
* ./manage_files.sh upload <filename>
* ./manage_files.sh list
* ./manage_files.sh download <filename>
* ./manage_files.sh delete <filename>

---

## 📝 Logging & Auditing
Accountability is a core feature of this project. The manage_files.sh script includes a custom log_action function that appends every transaction to storage_activity.log.

**Example Entry:**
2026-03-09 14:31:39 - UPLOADED: hello.txt

---

## ⚠️ Challenges & Troubleshooting

### Permission Denied
If scripts fail to run initially, flip the executable bit:
chmod +x setup_storage.sh manage_files.sh

### Resource Provider Registration
Ensure the Azure Storage service is enabled for your subscription:
az provider register --namespace Microsoft.Storage

---

## 👤 Author
**Tomisin Olusesi**
*Cloud Engineering & DevOps*
