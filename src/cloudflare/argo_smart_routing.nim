# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdArgoCountZonesEnabled*(client: CloudflareClient,
                                                accountId: types.ArgoConfigIdentifier): Future[types.ArgoConfigCountZonesResponse] {.async.} =
  ## Returns the number of zones that have Argo Smart Routing enabled for the
  ## specified account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/argo/count_zones_enabled")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArgoConfigCountZonesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserArgoCountZonesEnabled*(client: CloudflareClient): Future[types.ArgoConfigCountZonesResponse] {.async.} =
  ## Returns the number of zones that have Argo Smart Routing enabled for the
  ## authenticated user.

  let res = await client.httpGET("/user/argo/count_zones_enabled")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ArgoConfigCountZonesResponse)
  else:
    raise newException(CloudflareClientError, body)

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
