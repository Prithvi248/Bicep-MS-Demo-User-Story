param location string
param projectName string



//app service plan
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: '${projectName}appServicePlan'
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
    
  }

}


//web app
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: '${projectName}webApp'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }

}
