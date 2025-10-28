

resource resourceAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2025-05-01' = {
  name: '${keyVaultName}/${keyVaultActionPolicyAction}'
  properties: {
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: objectId
        permissions: {
          keys: keysPermissions
          secrets: secretsPermissions
          certificates: certificatesPermissions
          storage: storagePermissions
        }
      }
    ]
  }
}
