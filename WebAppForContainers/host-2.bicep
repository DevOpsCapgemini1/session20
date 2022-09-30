@description('Base name of the resource such as web app name and app service plan ')
@minLength(2)
param webAppName string = 'host-02-northeu'

@description('The SKU of App Service Plan ')
param sku string = 'S1'

@description('The Runtime stack of current web app')
param linuxFxVersion string = 'DOCKER|nginx:latest'

@description('Location for all resources.')
param location string = 'northeurope'

var webAppPortalName_var = '${webAppName}-webapp'
var appServicePlanName_var = 'AppServicePlan-${webAppName}'

resource appServicePlanName 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName_var
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webAppPortalName 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppPortalName_var
  location: location
  kind: 'app,linux,container'
  properties: {

    httpsOnly: false
    serverFarmId: appServicePlanName.id
    siteConfig: {

      linuxFxVersion: linuxFxVersion
    }
  }
}
