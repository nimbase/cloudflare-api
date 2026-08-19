# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdArgoSmartRouting*(client: CloudflareClient,
                                     zoneId: types.ArgoConfigIdentifier): Future[types.ArgoConfigApiResponseSingle] {.async.} =
  ## Retrieves the value of Argo Smart Routing enablement setting.

  let res = await client.httpGET(fmt"/zones/{zoneId}/argo/smart_routing")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArgoConfigApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdArgoSmartRouting*(client: CloudflareClient,
                                       zoneId: types.ArgoConfigIdentifier,
                                       body: types.ArgoConfigPatch): Future[types.ArgoConfigApiResponseSingle] {.async.} =
  ## Configures the value of the Argo Smart Routing enablement setting.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/argo/smart_routing", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArgoConfigApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
