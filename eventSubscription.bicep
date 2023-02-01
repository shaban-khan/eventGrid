@description('Azure function trigger resource id')
param subscriptionEndpointResourceId string = '/subscriptions/9b2cf6ca-d292-48a4-8bff-68d71a593ca7/resourceGroups/skhan-learn-funcApp-RG/providers/Microsoft.Web/sites/skhanfuncapp03/functions/skEventGridTrigger03'

param location string = resourceGroup().location
module eventSubscription 'eventSubscriptions/deploy.bicep' = {
  name: 'Depmoyment-EventSubscription01'
  params: {
    location: location
    destination: {
      endpointType: 'AzureFunction'
      properties: {
        resourceId: subscriptionEndpointResourceId
      }
    }
    eventGridTopicName: 'skegdomain01'
    name: 'testubscription001'
  }
}
