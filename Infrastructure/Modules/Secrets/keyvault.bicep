param location string = resourceGroup().location
param vaultName string

resource keyVault 'Microsoft.KeyVault/vaults@2024-04-01-preview' = {
    name: vaultName
    location: location
    properties: {
        sku: {
            name: 'standard'
            family: 'A'
        }
        enableRbacAuthorization: true
        tenantId: subscription().tenantId
    }
}

output name string = keyVault.name
output id string = keyVault.id