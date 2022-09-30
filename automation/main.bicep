@description('Name of the automation account')
param accName string = 'AutomationAccount'

@description('Location for automation account')
param location string = resourceGroup().location
param PowerShellRunbook1 string = 'host-1-turn-on'
param PowerShellRunbook2 string = 'host-1-turn-off'
param PowerShellRunbook3 string = 'host-2-turn-on'
param PowerShellRunbook4 string = 'host-2-turn-off'

resource accName_resource 'Microsoft.Automation/automationAccounts@2021-06-22' = {
  name: accName
  location: location
  tags: {
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    sku: {
      name: 'Basic'
    }
    publicNetworkAccess: true
  }
  dependsOn: []
}

resource accName_PowerShellRunbook1 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  parent: accName_resource
  name: PowerShellRunbook1
  location: location
  tags: {
  }
  properties: {
    runbookType: 'PowerShell'
    logProgress: false
    logVerbose: false
    logActivityTrace: 0
  }
}

resource accName_PowerShellRunbook2 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  parent: accName_resource
  name: PowerShellRunbook2
  location: location
  tags: {
  }
  properties: {
    runbookType: 'PowerShell'
    logProgress: false
    logVerbose: false
    logActivityTrace: 0
  }
}

resource accName_PowerShellRunbook3 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  parent: accName_resource
  name: PowerShellRunbook3
  location: location
  tags: {
  }
  properties: {
    runbookType: 'PowerShell'
    logProgress: false
    logVerbose: false
    logActivityTrace: 0
  }
}

resource accName_PowerShellRunbook4 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
  parent: accName_resource
  name: PowerShellRunbook4
  location: location
  tags: {
  }
  properties: {
    runbookType: 'PowerShell'
    logProgress: false
    logVerbose: false
    logActivityTrace: 0
  }
}

resource Microsoft_Automation_automationAccounts_schedules_accName_PowerShellRunbook1 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  parent: accName_resource
  name: PowerShellRunbook1
  properties: {
    expiryTime: '9999-12-31T23:59:59.9999999+00:00'
    frequency: 'Hour'
    interval: 1
    startTime: '2022-10-01T13:00:00+02:00'
    timeZone: 'Europe/Warsaw'
  }
}

resource Microsoft_Automation_automationAccounts_schedules_accName_PowerShellRunbook2 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  parent: accName_resource
  name: PowerShellRunbook2
  properties: {
    expiryTime: '9999-12-31T23:59:59.9999999+00:00'
    frequency: 'Hour'
    interval: 1
    startTime: '2022-10-01T13:30:00+02:00'
    timeZone: 'Europe/Warsaw'
  }
}

resource Microsoft_Automation_automationAccounts_schedules_accName_PowerShellRunbook3 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  parent: accName_resource
  name: PowerShellRunbook3
  properties: {
    expiryTime: '9999-12-31T23:59:59.9999999+00:00'
    frequency: 'Hour'
    interval: 1
    startTime: '2022-10-01T13:15:00+02:00'
    timeZone: 'Europe/Warsaw'
  }
}

resource Microsoft_Automation_automationAccounts_schedules_accName_PowerShellRunbook4 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
  parent: accName_resource
  name: PowerShellRunbook4
  properties: {
    expiryTime: '9999-12-31T23:59:59.9999999+00:00'
    frequency: 'Hour'
    interval: 1
    startTime: '2022-10-01T13:45:00+02:00'
    timeZone: 'Europe/Warsaw'
  }
}
