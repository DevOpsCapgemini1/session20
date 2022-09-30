resource mbidzins_site_fd 'Microsoft.Cdn/Profiles@2021-06-01' = {
  name: 'mbidzins-site-fd'
  location: 'Global'
  properties: {
    originResponseTimeoutSeconds: 60
  }
  tags: {
  }
  sku: {
    name: 'Standard_AzureFrontDoor'
  }
}

resource mbidzins_site_fd_fd_endpoint 'Microsoft.Cdn/Profiles/AfdEndpoints@2021-06-01' = {
  parent: mbidzins_site_fd
  name: 'fd-endpoint'
  location: 'Global'
  properties: {
    enabledState: 'Enabled'
  }
}

resource mbidzins_site_fd_origin_group_01 'Microsoft.Cdn/Profiles/OriginGroups@2021-06-01' = {
  parent: mbidzins_site_fd
  name: 'origin-group-01'
  properties: {
    loadBalancingSettings: {
      sampleSize: 4
      successfulSamplesRequired: 3
      additionalLatencyInMilliseconds: 50
    }
    healthProbeSettings: {
      probePath: '/'
      probeRequestType: 'HEAD'
      probeProtocol: 'Http'
      probeIntervalInSeconds: 100
    }
    sessionAffinityState: 'Disabled'

  }
}

resource mbidzins_site_fd_origin_group_01_origin_01 'Microsoft.Cdn/Profiles/OriginGroups/Origins@2021-06-01' = {
  parent: mbidzins_site_fd_origin_group_01
  name: 'origin-01'
  properties: {
    hostName: 'host-01-westeu-webapp.azurewebsites.net'
    httpPort: 80
    httpsPort: 443
    originHostHeader: 'host-01-westeu-webapp.azurewebsites.net'
    priority: 1
    weight: 1000
    enforceCertificateNameCheck: true
    enabledState: 'Enabled'

  }
}

resource mbidzins_site_fd_origin_group_01_origin_02 'Microsoft.Cdn/Profiles/OriginGroups/Origins@2021-06-01' = {
  parent: mbidzins_site_fd_origin_group_01
  name: 'origin-02'
  properties: {
    hostName: 'host-02-northeu-webapp.azurewebsites.net'
    httpPort: 80
    httpsPort: 443
    originHostHeader: 'host-02-northeu-webapp.azurewebsites.net'
    priority: 1
    weight: 1000
    enforceCertificateNameCheck: true
    enabledState: 'Enabled'

  }
}

resource mbidzins_site_fd_origin_group_01_origin_03 'Microsoft.Cdn/Profiles/OriginGroups/Origins@2021-06-01' = {
  parent: mbidzins_site_fd_origin_group_01
  name: 'origin-03'
  properties: {
    hostName: 'dr-sr-webapp.azurewebsites.net'
    httpPort: 80
    httpsPort: 443
    originHostHeader: 'dr-sr-webapp.azurewebsites.net'
    priority: 5
    weight: 1000
    enforceCertificateNameCheck: true
    enabledState: 'Enabled'

  }
}

resource mbidzins_site_fd_fd_endpoint_route_01 'Microsoft.Cdn/Profiles/AfdEndpoints/Routes@2021-06-01' = {
  parent: mbidzins_site_fd_fd_endpoint
  name: 'route-01'
  properties: {
    customDomains: []
    originGroup: {
      id: mbidzins_site_fd_origin_group_01.id
    }

    ruleSets: []
    supportedProtocols: [
      'Https'
    ]
    patternsToMatch: [
      '/*'
    ]
    forwardingProtocol: 'HttpsOnly'
    linkToDefaultDomain: 'Enabled'
    httpsRedirect: 'Enabled'
    enabledState: 'Enabled'

  }
  dependsOn: [
    mbidzins_site_fd_origin_group_01_origin_01
    mbidzins_site_fd_origin_group_01_origin_02
    mbidzins_site_fd_origin_group_01_origin_03
  ]
}
