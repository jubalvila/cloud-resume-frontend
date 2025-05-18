@description('Name of the storage account (must be globally unique, 3-24 lowercase letters and numbers).')
param storageAccountName string = 'jubalvilasa'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: true
    supportsHttpsTrafficOnly: true
  }
}

// Use 'parent' property instead of string concatenation for child resource name
resource staticWebsite 'Microsoft.Storage/storageAccounts/staticWebsite@2023-01-01' = {
  name: 'default'
  parent: storageAccount
  properties: {
    indexDocument: 'index.html'
    error404Document: '404.html'
  }
}
