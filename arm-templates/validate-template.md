# Validate ARM template
```
az deployment group validate \
  --resource-group $RESOURCEGROUP \
  --template-uri "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/101-vm-simple-linux/azuredeploy.json" \
  --parameters adminUsername=$USERNAME \
  --parameters authenticationType=password \
  --parameters adminPasswordOrKey=$PASSWORD \
  --parameters dnsLabelPrefix=$DNS_LABEL_PREFIX
```
