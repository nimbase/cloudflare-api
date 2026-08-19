# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdAccessApps*(client: CloudflareClient,
                               zoneId: types.AccessIdentifier): Future[types.AccessResponseCollection22] {.async.} =
  ## List all Access Applications in a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/apps")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection22)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessApps*(client: CloudflareClient,
                                zoneId: types.AccessIdentifier,
                                body: types.AccessApps): Future[JsonNode] {.async.} =
  ## Adds a new application to Access.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/apps", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessAppsAppId*(client: CloudflareClient,
                                    appId: types.AccessAppId,
                                    zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse21] {.async.} =
  ## Fetches information about an Access application.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse21)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessAppsAppId*(client: CloudflareClient,
                                    appId: types.AccessAppId,
                                    zoneId: types.AccessIdentifier,
                                    body: types.AccessApps): Future[JsonNode] {.async.} =
  ## Updates an Access application.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/apps/{appId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAccessAppsAppId*(client: CloudflareClient,
                                       appId: types.AccessAppId,
                                       zoneId: types.AccessIdentifier): Future[types.AccessIdResponse] {.async.} =
  ## Deletes an application from Access.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/access/apps/{appId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessAppsAppIdRevokeTokens*(client: CloudflareClient,
                                                 appId: types.AccessAppId,
                                                 zoneId: types.AccessIdentifier): Future[types.AccessEmptyResponse2] {.async.} =
  ## Revokes all tokens issued for an application.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/apps/{appId}/revoke_tokens")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessEmptyResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessAppsAppIdSettings*(client: CloudflareClient,
                                            appId: types.AccessAppId,
                                            zoneId: types.AccessIdentifier,
                                            body: types.AccessAppSettingsRequest): Future[JsonNode] {.async.} =
  ## Updates application settings.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/apps/{appId}/settings", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdAccessAppsAppIdSettings*(client: CloudflareClient,
                                              appId: types.AccessAppId,
                                              zoneId: types.AccessIdentifier,
                                              body: types.AccessAppSettingsRequest): Future[JsonNode] {.async.} =
  ## Updates application settings.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/access/apps/{appId}/settings", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessAppsAppIdUserPolicyChecks*(client: CloudflareClient,
                                                    appId: types.AccessAppId,
                                                    zoneId: types.AccessIdentifier): Future[types.AccessPolicyCheckResponse2] {.async.} =
  ## Tests if a specific user has permission to access an application.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/apps/{appId}/user_policy_checks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessPolicyCheckResponse2)
  else:
    raise newException(CloudflareClientError, body)
