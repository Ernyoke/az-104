#!/bin/bash

az vmss extension set \
    --publisher Microsoft.Azure.Extensions \
    --version 2.0 \
    --name CustomScript \
    --resource-group myResourceGroup \
    --vmss-name yourScaleSet \
    --settings @yourConfigV1.json
