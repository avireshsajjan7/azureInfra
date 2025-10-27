
@description('Name of the Key Vault to create')
param keyVaultName string
@description('Location for the Key Vault')
param location string = resourceGroup().location

resource keyVault 'Microsoft.KeyVault/vaults@2024-11-01'={
  location: location
  name: keyVaultName

  properties:{
    sku: {
      name: 'premium'
      family: 'A'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
    enabledForDeployment: true    
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true      
    enableRbacAuthorization: true
    publicNetworkAccess: 'Enabled'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
      virtualNetworkRules: []
    }
    softDeleteRetentionInDays: 90
    enablePurgeProtection: true
    enableSoftDelete: true       
  }
}
