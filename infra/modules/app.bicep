param appName string
param branch string

var location = resourceGroup().location
var repoUrl = 'https://github.com/oscarbyrne/WireService'


resource hostingPlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: '${appName}-hostingPlan'
  location: location
  sku: {
    name: 'F1'
    capacity: 0
  }
}

resource site 'Microsoft.Web/sites@2023-01-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: hostingPlan.id
    httpsOnly: true
    reserved: false
    siteConfig: {
      metadata: [
        {
          name: 'CURRENT_STACK'
          value: 'dotnetcore'
        }
      ]
    }
  }
}

resource sourceControl 'Microsoft.Web/sites/sourcecontrols@2023-01-01' = {
  parent: site
  name: 'web'
  properties: {
    repoUrl: repoUrl
    branch: branch
    isManualIntegration: true
  }
}