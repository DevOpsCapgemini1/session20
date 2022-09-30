param relativeName string = 'mbidzins-tm-01'

param trafficManagerName string = 'mbidzins-tm-01'

param webAppNames array = [ {
    name: 'host-01-westeu-webapp'
  }
  {
    name: 'host-02-northeu-webapp'
  } ]

resource trafficManagerProfile 'Microsoft.Network/trafficManagerProfiles@2018-08-01' = {
  name: trafficManagerName
  location: 'global'
  properties: {
    trafficRoutingMethod: 'Performance'
    maxReturn: 0
    dnsConfig: {
      relativeName: relativeName
      ttl: 60
    }
    monitorConfig: {
      protocol: 'HTTP'
      port: 80
      path: '/'
    }
    endpoints: [for webApp in webAppNames: {
      name: webApp.name
      type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
      properties: {
        targetResourceId: resourceId(resourceGroup().name, 'microsoft.web/sites', webApp.name)
        endpointStatus: 'Enabled'
      }
    }]

  }
}
