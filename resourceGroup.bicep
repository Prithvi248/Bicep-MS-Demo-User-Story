targetScope = 'subscription'
param location string
param projectName string

//resource group
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${projectName}rg'
  location: location

}

output resourceGroupId string = resourceGroup.id
