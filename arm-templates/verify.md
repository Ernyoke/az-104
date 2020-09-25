#Verify created resources

## Show deployment group

```
az deployment group show \
  --name MyDeployment \
  --resource-group $RESOURCEGROUP
```

## List VMs

```
az vm list \
  --resource-group $RESOURCEGROUP \
  --output table
```
