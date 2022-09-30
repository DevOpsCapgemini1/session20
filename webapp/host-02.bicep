param webAppName string = 'host-02-northeu'

param sku string = 'S1'

param linuxFxVersion string = 'DOCKER|mbidzinsk/website-session20:latest'

param location string = 'northeurope'

param numberOfWorkers int = 1

param dockerRegistryUrl string = 'https://index.docker.io'

var webAppPortalName_var = '${webAppName}-webapp'

var appServicePlanName_var = 'AppServicePlan-${webAppName}'

resource appServicePlanName 'Microsoft.Web/serverfarms@2018-11-01' = {
  name: appServicePlanName_var
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
    numberOfWorkers: numberOfWorkers
    reserved: true
  }
}

resource webAppPortalName 'Microsoft.Web/sites@2018-11-01' = {
  name: webAppPortalName_var
  location: location
  properties: {
    httpsOnly: false
    serverFarmId: appServicePlanName.id
    siteConfig: {
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: dockerRegistryUrl
        }
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }

      ]
      alwaysOn: true
      linuxFxVersion: linuxFxVersion
    }
  }
}
