param accName string = 'AutomationAccount'
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

resource automationRunbook1 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
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

resource automationRunbook2 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
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

resource automationRunbook3 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
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

resource automationRunbook4 'Microsoft.Automation/automationAccounts/runbooks@2019-06-01' = {
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

resource schedule1 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
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

resource schedule2 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
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

resource schedule3 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
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

resource schedule4 'Microsoft.Automation/automationAccounts/schedules@2020-01-13-preview' = {
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
resource jobSchedule1 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  parent: accName_resource
  name: PowerShellRunbook1
  properties: {
    runbook: {
      name: PowerShellRunbook1
    }
    schedule: {
      name: PowerShellRunbook1
    }
  }
}

resource jobSchedule2 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  parent: accName_resource
  name: PowerShellRunbook4
  properties: {
    runbook: {
      name: PowerShellRunbook2
    }
    schedule: {
      name: PowerShellRunbook2
    }
  }
}
resource jobSchedule3 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  parent: accName_resource
  name: PowerShellRunbook3
  properties: {
    runbook: {
      name: PowerShellRunbook3
    }
    schedule: {
      name: PowerShellRunbook3
    }
  }
}
resource jobSchedule4 'Microsoft.Automation/automationAccounts/jobSchedules@2020-01-13-preview' = {
  parent: accName_resource
  name: PowerShellRunbook4
  properties: {
    runbook: {
      name: PowerShellRunbook4
    }
    schedule: {
      name: PowerShellRunbook4
    }
  }
}
