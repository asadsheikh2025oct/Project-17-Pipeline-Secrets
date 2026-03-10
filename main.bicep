param location string = resourceGroup().location
@description('The name of key vault')
@minLength(3)
@maxLength(24)
param vaultName string = 'kv-${uniqueString(resourceGroup().id)}'

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: vaultName
  location: location
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enabledForTemplateDeployment: true
  }
}

@description('setting up kv to be deployed via CICD pipeline')
output vaultName string = kv.name
