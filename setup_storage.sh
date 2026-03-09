#!/bin/bash

# Variables
SUBSCRIPTION_ID="062e53e6-3aa7-4730-b2cd-13fc54739364"
RESOURCE_GROUP="CloudStorageRG"
LOCATION="eastus"
STORAGE_ACCOUNT="mystorage$(date +%s)" 
CONTAINER_NAME="user-files"

# FORCE the subscription first
echo "Switching to subscription $SUBSCRIPTION_ID..."
az account set --subscription $SUBSCRIPTION_ID

echo "Creating Resource Group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Creating Storage Account..."
az storage account create \
    --name $STORAGE_ACCOUNT \
    --resource-group $RESOURCE_GROUP \
    --location $LOCATION \
    --sku Standard_LRS \
    --allow-blob-public-access true

echo "Creating Container..."
az storage container create \
    --name $CONTAINER_NAME \
    --account-name $STORAGE_ACCOUNT \
    --public-access blob \
    --auth-mode key