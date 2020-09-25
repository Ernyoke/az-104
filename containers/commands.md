# Commands

## Create az container

```
az container create \
  --resource-group learn-deploy-aci-rg \
  --name mycontainer \
  --image microsoft/aci-helloworld \
  --ports 80 \
  --dns-name-label $DNS_NAME_LABEL \
  --location eastus
```

## Show container

```
az container show \
  --resource-group learn-deploy-aci-rg \
  --name mycontainer \
  --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
  --out table
```

## Show container logs

```
az container logs \
  --resource-group learn-deploy-aci-rg \
  --name mycontainer-restart-demo
```

## Deploy with environment variables

```
az container create \
  --resource-group learn-deploy-aci-rg \
  --name aci-demo \
  --image microsoft/azure-vote-front:cosmosdb \
  --ip-address Public \
  --location eastus \
  --environment-variables \
    COSMOS_DB_ENDPOINT=$COSMOS_DB_ENDPOINT \
    COSMOS_DB_MASTERKEY=$COSMOS_DB_MASTERKEY
```

```
az container create \
  --resource-group learn-deploy-aci-rg \
  --name aci-demo-secure \
  --image microsoft/azure-vote-front:cosmosdb \
  --ip-address Public \
  --location eastus \
  --secure-environment-variables \
    COSMOS_DB_ENDPOINT=$COSMOS_DB_ENDPOINT \
    COSMOS_DB_MASTERKEY=$COSMOS_DB_MASTERKEY
```

```
az container create \
  --resource-group learn-deploy-aci-rg \
  --name aci-demo-files \
  --image microsoft/aci-hellofiles \
  --location eastus \
  --ports 80 \
  --ip-address Public \
  --azure-file-volume-account-name $STORAGE_ACCOUNT_NAME \
  --azure-file-volume-account-key $STORAGE_KEY \
  --azure-file-volume-share-name aci-share-demo \
  --azure-file-volume-mount-path /aci/logs/
```

## Query environment variables

```
az container show \
  --resource-group learn-deploy-aci-rg \
  --name aci-demo \
  --query containers[0].environmentVariables
```

## Get container events

```
az container attach \
  --resource-group learn-deploy-aci-rg \
  --name mycontainer
```

## Execute commands

```
az container exec \
  --resource-group learn-deploy-aci-rg \
  --name mycontainer \
  --exec-command /bin/sh
```

## Get metrics

```
az monitor metrics list \
  --resource $CONTAINER_ID \
  --metric CPUUsage \
  --output table
```