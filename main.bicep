targetScope = 'subscription'
//parameters
param location string
param projectName string



module resourceGroup 'resourceGroup.bicep' = {
  name: '${projectName}resourceGroupModuleDeploy'

  params: {
    projectName: projectName
    location: location
  }

}
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: '${projectName}rg'
}

module storageAccount 'storageAccount.bicep' = {
  name: '${projectName}storageAccountModuleDeploy'
  scope: rg
  params: {
    projectName: projectName
    location: location
  
  }
  
}

module webApp 'webApp.bicep' = {
  name: '${projectName}webAppModuleDeploy'
  scope: rg
  params: {
    projectName: projectName
    location: location
  }
}

