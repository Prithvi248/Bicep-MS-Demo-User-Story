targetScope = 'resourceGroup'
//storage account
param location string
param projectName string


resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: '${projectName}storage'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
 
}
