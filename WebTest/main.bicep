param appName string = 'mbidzinsk-app-insight'

param host1PingURL string = 'https://host-01-westeu-webapp.azurewebsites.net/'

param host2PingURL string = 'https://host-02-northeu-webapp.azurewebsites.net/'

param tmPingURL string = 'http://mbidzins-tm-01.trafficmanager.net'

param fdPingURL string = ' https://fd-endpoint-fsgvabawgfcya7ev.z01.azurefd.net/'

param pingText string = ''

param location string = resourceGroup().location

var pingTestName1 = 'PingTest-host01'
var pingTestName2 = 'PingTest-host02'
var pingTestName3 = 'PingTest-tm'
var pingTestName4 = 'PingTest-fd'

var host1_id = resourceId(resourceGroup().name, 'microsoft.web/sites', 'host-01-westeu-webapp')
var host2_id = resourceId(resourceGroup().name, 'microsoft.web/sites', 'host-02-northeu-webapp')
var tm_id = resourceId(resourceGroup().name, 'Microsoft.Network/trafficManagerProfiles', 'mbidzins-tm-01')
var fd_id = resourceId(resourceGroup().name, 'Microsoft.Cdn/profiles', 'mbidzins-site-fd')
var appInsights_id = resourceId(resourceGroup().name, 'Microsoft.Insights/components', appName)

resource appName_resource 'Microsoft.Insights/components@2020-02-02' = {
  name: appName
  location: location
  tags: {
    'hidden-link:${host1_id}': 'Resource'
    'hidden-link:${host2_id}': 'Resource'
    'hidden-link:${tm_id}': 'Resource'
    'hidden-link:${fd_id}': 'Resource'
  }
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

resource pingTest 'Microsoft.Insights/webtests@2015-05-01' = {
  name: pingTestName1
  location: location
  tags: {
    'hidden-link:${appInsights_id}': 'Resource'
  }
  properties: {
    Name: pingTestName1
    Description: 'Host 1 ping test'
    Enabled: true
    Frequency: 300
    Timeout: 60
    Kind: 'ping'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-il-ch1-azr'
      }
    ]
    Configuration: {
      WebTest: '<WebTest   Name="${pingTestName1}"   Enabled="True"         CssProjectStructure=""    CssIteration=""  Timeout="60"  WorkItemIds=""         xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010"         Description=""  CredentialUserName=""  CredentialPassword=""         PreAuthenticate="True"  Proxy="default"  StopOnError="False"         RecordedResultFile=""  ResultsLocale="">  <Items>  <Request Method="GET"    Version="1.1"  Url="${host1PingURL}" ThinkTime="0"  Timeout="300" ParseDependentRequests="True"         FollowRedirects="True" RecordResult="True" Cache="False"         ResponseTimeGoal="0"  Encoding="utf-8"  ExpectedHttpStatusCode="200"         ExpectedResponseUrl="" ReportingName="" IgnoreHttpStatusCode="False" />        </Items>  <ValidationRules> <ValidationRule  Classname="Microsoft.VisualStudio.TestTools.WebTesting.Rules.ValidationRuleFindText, Microsoft.VisualStudio.QualityTools.WebTestFramework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" DisplayName="Find Text"         Description="Verifies the existence of the specified text in the response."         Level="High"  ExecutionOrder="BeforeDependents">  <RuleParameters>        <RuleParameter Name="FindText" Value="${pingText}" />  <RuleParameter Name="IgnoreCase" Value="False" />  <RuleParameter Name="UseRegularExpression" Value="False" />  <RuleParameter Name="PassIfTextFound" Value="True" />  </RuleParameters> </ValidationRule>  </ValidationRules>  </WebTest>'
    }
    SyntheticMonitorId: pingTestName1
  }
  dependsOn: [
    appName_resource
  ]
}

resource pingTest2 'Microsoft.Insights/webtests@2015-05-01' = {
  name: pingTestName2
  location: location
  tags: {
    'hidden-link:${appInsights_id}': 'Resource'
  }
  properties: {
    Name: pingTestName2
    Description: 'Host 2 ping test'
    Enabled: true
    Frequency: 300
    Timeout: 60
    Kind: 'ping'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-il-ch1-azr'
      }
    ]
    Configuration: {
      WebTest: '<WebTest   Name="${pingTestName2}"   Enabled="True"         CssProjectStructure=""    CssIteration=""  Timeout="60"  WorkItemIds=""         xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010"         Description=""  CredentialUserName=""  CredentialPassword=""         PreAuthenticate="True"  Proxy="default"  StopOnError="False"         RecordedResultFile=""  ResultsLocale="">  <Items>  <Request Method="GET"    Version="1.1"  Url="${host2PingURL}" ThinkTime="0"  Timeout="300" ParseDependentRequests="True"         FollowRedirects="True" RecordResult="True" Cache="False"         ResponseTimeGoal="0"  Encoding="utf-8"  ExpectedHttpStatusCode="200"         ExpectedResponseUrl="" ReportingName="" IgnoreHttpStatusCode="False" />        </Items>  <ValidationRules> <ValidationRule  Classname="Microsoft.VisualStudio.TestTools.WebTesting.Rules.ValidationRuleFindText, Microsoft.VisualStudio.QualityTools.WebTestFramework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" DisplayName="Find Text"         Description="Verifies the existence of the specified text in the response."         Level="High"  ExecutionOrder="BeforeDependents">  <RuleParameters>        <RuleParameter Name="FindText" Value="${pingText}" />  <RuleParameter Name="IgnoreCase" Value="False" />  <RuleParameter Name="UseRegularExpression" Value="False" />  <RuleParameter Name="PassIfTextFound" Value="True" />  </RuleParameters> </ValidationRule>  </ValidationRules>  </WebTest>'
    }
    SyntheticMonitorId: pingTestName2
  }
  dependsOn: [
    appName_resource
  ]
}

resource pingTest3 'Microsoft.Insights/webtests@2015-05-01' = {
  name: pingTestName3
  location: location
  tags: {
    'hidden-link:${appInsights_id}': 'Resource'
  }
  properties: {
    Name: pingTestName3
    Description: 'Traffic Manager Ping test'
    Enabled: true
    Frequency: 300
    Timeout: 60
    Kind: 'ping'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-il-ch1-azr'
      }
    ]
    Configuration: {
      WebTest: '<WebTest   Name="${pingTestName3}"   Enabled="True"         CssProjectStructure=""    CssIteration=""  Timeout="60"  WorkItemIds=""         xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010"         Description=""  CredentialUserName=""  CredentialPassword=""         PreAuthenticate="True"  Proxy="default"  StopOnError="False"         RecordedResultFile=""  ResultsLocale="">  <Items>  <Request Method="GET"    Version="1.1"  Url="${tmPingURL}" ThinkTime="0"  Timeout="300" ParseDependentRequests="True"         FollowRedirects="True" RecordResult="True" Cache="False"         ResponseTimeGoal="0"  Encoding="utf-8"  ExpectedHttpStatusCode="200"         ExpectedResponseUrl="" ReportingName="" IgnoreHttpStatusCode="False" />        </Items>  <ValidationRules> <ValidationRule  Classname="Microsoft.VisualStudio.TestTools.WebTesting.Rules.ValidationRuleFindText, Microsoft.VisualStudio.QualityTools.WebTestFramework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" DisplayName="Find Text"         Description="Verifies the existence of the specified text in the response."         Level="High"  ExecutionOrder="BeforeDependents">  <RuleParameters>        <RuleParameter Name="FindText" Value="${pingText}" />  <RuleParameter Name="IgnoreCase" Value="False" />  <RuleParameter Name="UseRegularExpression" Value="False" />  <RuleParameter Name="PassIfTextFound" Value="True" />  </RuleParameters> </ValidationRule>  </ValidationRules>  </WebTest>'
    }
    SyntheticMonitorId: pingTestName3
  }
  dependsOn: [
    appName_resource
  ]
}

resource pingTest4 'Microsoft.Insights/webtests@2015-05-01' = {
  name: pingTestName4
  location: location
  tags: {
    'hidden-link:${appInsights_id}': 'Resource'
  }
  properties: {
    Name: pingTestName4
    Description: 'Front Door ping test'
    Enabled: true
    Frequency: 300
    Timeout: 60
    Kind: 'ping'
    RetryEnabled: true
    Locations: [
      {
        Id: 'us-il-ch1-azr'
      }
    ]
    Configuration: {
      WebTest: '<WebTest   Name="${pingTestName4}"   Enabled="True"         CssProjectStructure=""    CssIteration=""  Timeout="60"  WorkItemIds=""         xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010"         Description=""  CredentialUserName=""  CredentialPassword=""         PreAuthenticate="True"  Proxy="default"  StopOnError="False"         RecordedResultFile=""  ResultsLocale="">  <Items>  <Request Method="GET"    Version="1.1"  Url="${fdPingURL}" ThinkTime="0"  Timeout="300" ParseDependentRequests="True"         FollowRedirects="True" RecordResult="True" Cache="False"         ResponseTimeGoal="0"  Encoding="utf-8"  ExpectedHttpStatusCode="200"         ExpectedResponseUrl="" ReportingName="" IgnoreHttpStatusCode="False" />        </Items>  <ValidationRules> <ValidationRule  Classname="Microsoft.VisualStudio.TestTools.WebTesting.Rules.ValidationRuleFindText, Microsoft.VisualStudio.QualityTools.WebTestFramework, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" DisplayName="Find Text"         Description="Verifies the existence of the specified text in the response."         Level="High"  ExecutionOrder="BeforeDependents">  <RuleParameters>        <RuleParameter Name="FindText" Value="${pingText}" />  <RuleParameter Name="IgnoreCase" Value="False" />  <RuleParameter Name="UseRegularExpression" Value="False" />  <RuleParameter Name="PassIfTextFound" Value="True" />  </RuleParameters> </ValidationRule>  </ValidationRules>  </WebTest>'
    }
    SyntheticMonitorId: pingTestName4
  }
  dependsOn: [
    appName_resource
  ]
}
