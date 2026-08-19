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
  ## Lists all token validation configurations for this zone

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
  ## Create a new Token Validation configuration

  let res = await client.httpPOST("/zones/{zone_id}/token_validation/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdTokenValidationConfigConfigId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Get a single Token Configuration

  let res = await client.httpGET("/zones/{zone_id}/token_validation/config/{config_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdTokenValidationConfigConfigId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Delete Token Configuration

  let res = await client.httpDELETE("/zones/{zone_id}/token_validation/config/{config_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdTokenValidationConfigConfigId*(client: CloudflareClient,
                                                    body: PatchZonesZoneIdTokenValidationConfigConfigIdRequest): Future[JsonNode] {.async.} =
  ## Edit fields of an existing Token Configuration

  let res = await client.httpPATCH("/zones/{zone_id}/token_validation/config/{config_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdTokenValidationConfigConfigIdCredentials*(client: CloudflareClient,
                                                             body: types.ApiShieldCredentialsRequest): Future[JsonNode] {.async.} =
  ## Update Token Configuration credentials with full replacement semantics. Key
  ## identities (`{alg,kid}`) must be unique within the request. Symmetric keys
  ## (`kty: "oct"`) require `k`; `k: null` is invalid.

  let res = await client.httpPUT("/zones/{zone_id}/token_validation/config/{config_id}/credentials", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdTokenValidationConfigConfigIdCredentials*(client: CloudflareClient,
                                                               body: types.ApiShieldCredentialsPatchRequest): Future[JsonNode] {.async.} =
  ## Edit Token Configuration credentials. The provided `keys` array defines the full
  ## resulting key set (stored keys omitted from payload are removed). For each
  ## provided key identity (`{alg,kid}`), payload fields overwrite the stored key
  ## before validation and omitted fields inherit from the stored key. Key identities
  ## must be unique within the request. Existing symmetric keys (`kty: "oct"`)
  ## preserve stored key material when `k` is omitted; send `k` to rotate. `k: null`
  ## is invalid.

  let res = await client.httpPATCH("/zones/{zone_id}/token_validation/config/{config_id}/credentials", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
