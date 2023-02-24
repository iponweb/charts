# Resources

A set of resources supported by the chart

## external-secrets.io/v1alpha1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| pushsecrets   | PushSecret | - |


## external-secrets.io/v1beta1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| clusterexternalsecrets   | ExternalSecret | - |
| clustersecretstores   | ExternalSecret | - |
| externalsecrets   | ExternalSecret | - |
| secretstores   | ExternalSecret | - |


## generators.external-secrets.io/v1beta1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| acraccesstokens   | ACRAccessToken | - |
| ecrauthorizationtokens   | ECRAuthorizationToken | - |
| fakes   | Fake | - |
| gcraccesstoken   | GCRAccessToken | - |
| passwords   | Password | - |