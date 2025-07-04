# Resources

A set of resources supported by the chart

## external-secrets.io/v1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| clusterexternalsecrets   | ClusterExternalSecret | - |
| clustersecretstores   | ClusterSecretStore | - |
| externalsecrets   | ExternalSecret | - |
| secretstores   | SecretStore | - |


## external-secrets.io/v1alpha1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| clusterpushsecrets   | PushSecret | - |
| pushsecrets   | PushSecret | - |


## generators.external-secrets.io/v1alpha1

| Values file key | Kind | Preprocessor |
| --------------- | ---- | ------------ |
| acraccesstokens   | ACRAccessToken | - |
| clustergenerators   | ClusterGenerator | - |
| ecrauthorizationtokens   | ECRAuthorizationToken | - |
| fakes   | Fake | - |
| gcraccesstokens   | GCRAccessToken | - |
| githubaccesstokens   | GithubAccessToken | - |
| grafanas   | Grafana | - |
| mfas   | MFA | - |
| passwords   | Password | - |
| quayaccesstokens   | QuayAccessToken | - |
| stssessiontokens   | STSSessionToken | - |
| uuids   | UUID | - |
| vaultdynamicsecrets   | VaultDynamicSecret | - |
| webhooks   | Webhook | - |