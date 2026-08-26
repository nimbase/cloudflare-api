# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdTokenValidationConfigRequest = object
    credentials: types.ApiShieldCredentialsRequest
    description: types.ApiShieldDescription
    title: types.ApiShieldTitle
    token_sources: types.ApiShieldTokenSources
    token_type: types.ApiShieldTokenType
  PatchZonesZoneIdTokenValidationConfigConfigIdRequest = object
    description: Option[types.ApiShieldDescription]
    title: Option[types.ApiShieldTitle]
    token_sources: Option[types.ApiShieldTokenSources]

proc getZonesZoneIdTokenValidationConfig*(client: CloudflareClient,
                                          page: int64 = 1, perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Lists the JWT validation configurations defined for the zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/zones/{zone_id}/token_validation/config", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdTokenValidationConfig*(client: CloudflareClient,
                                           body: PostZonesZoneIdTokenValidationConfigRequest): Future[JsonNode] {.async.} =
  ## Creates a JWT validation configuration for the zone.

  let res = await client.httpPOST("/zones/{zone_id}/token_validation/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdTokenValidationConfigConfigId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns a JWT validation configuration by ID.

  let res = await client.httpGET("/zones/{zone_id}/token_validation/config/{config_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdTokenValidationConfigConfigId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Deletes a JWT validation configuration from the zone.

  let res = await client.httpDELETE("/zones/{zone_id}/token_validation/config/{config_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdTokenValidationConfigConfigId*(client: CloudflareClient,
                                                    body: PatchZonesZoneIdTokenValidationConfigConfigIdRequest): Future[JsonNode] {.async.} =
  ## Updates only the supplied fields on a JWT validation configuration.

  let res = await client.httpPATCH("/zones/{zone_id}/token_validation/config/{config_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdTokenValidationConfigConfigIdCredentials*(client: CloudflareClient,
                                                             body: types.ApiShieldCredentialsRequest): Future[JsonNode] {.async.} =
  ## Replaces the configuration's complete key set. Symmetric keys must include their
  ## key material.

  let res = await client.httpPUT("/zones/{zone_id}/token_validation/config/{config_id}/credentials", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdTokenValidationConfigConfigIdCredentials*(client: CloudflareClient,
                                                               body: types.ApiShieldCredentialsPatchRequest): Future[JsonNode] {.async.} =
  ## Updates the configuration's complete key set while allowing omitted fields on
  ## existing keys to retain stored values. Omitted key identities are removed.

  let res = await client.httpPATCH("/zones/{zone_id}/token_validation/config/{config_id}/credentials", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
