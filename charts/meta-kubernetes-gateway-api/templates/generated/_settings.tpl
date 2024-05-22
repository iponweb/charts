{{- /* Resources definition */}}
{{- define "metachart.settings" }}
backendlbpolicies:
  apiVersion: gateway.networking.k8s.io/v1alpha2
  kindCamelCase: BackendLBPolicy
  preprocess: false
gatewayclasses:
  apiVersion: gateway.networking.k8s.io/v1
  kindCamelCase: GatewayClass
  preprocess: false
gateways:
  apiVersion: gateway.networking.k8s.io/v1
  kindCamelCase: Gateway
  preprocess: false
grpcroutes:
  apiVersion: gateway.networking.k8s.io/v1
  kindCamelCase: GRPCRoute
  preprocess: false
httproutes:
  apiVersion: gateway.networking.k8s.io/v1
  kindCamelCase: HTTPRoute
  preprocess: false
referencegrants:
  apiVersion: gateway.networking.k8s.io/v1alpha2
  kindCamelCase: ReferenceGrant
  preprocess: false
tcproutes:
  apiVersion: gateway.networking.k8s.io/v1alpha2
  kindCamelCase: TCPRoute
  preprocess: false
tlsroutes:
  apiVersion: gateway.networking.k8s.io/v1alpha2
  kindCamelCase: TLSRoute
  preprocess: false
udproutes:
  apiVersion: gateway.networking.k8s.io/v1alpha2
  kindCamelCase: UDPRoute
  preprocess: false
{{- end }}