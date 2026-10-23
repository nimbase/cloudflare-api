# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc postV1Verify*(client: CloudflareClient, body: types.DomainConnectPostData): Future[AsyncResponse] {.async.} =
  ## Validates a Domain Connect signed request using DNS TXT public keys.

  let res = await client.httpPOST("/v1/verify", body)
  return res

proc getV2DomainTemplatesProvidersProviderServicesService*(client: CloudflareClient,
                                                           provider: string,
                                                           service: string,
                                                           dump: string = default(string)): Future[JsonNode] {.async.} =
  ## Providers are the external parties that are configured to interact with
  ## Cloudflare.

  var q = initOrderedTable[string, string]()
  q["dump"] = $dump
  let res = await client.httpGET(fmt"/v2/domainTemplates/providers/{provider}/services/{service}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getV2ProvconfProviderServiceAccount*(client: CloudflareClient,
                                          provider: string, service: string,
                                          account: string): Future[types.DomainConnectNeededByStratus] {.async.} =
  ## Provides Stratus with extra information about domain connect provider(s).

  let res = await client.httpGET(fmt"/v2/provconf/{provider}/{service}/{account}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DomainConnectNeededByStratus)
  else:
    raise newException(CloudflareClientError, body)

proc getV2DomainSettings*(client: CloudflareClient, domain: string): Future[JsonNode] {.async.} =
  ## Checks whether a domain is in Quicksilver and returns its settings.

  let res = await client.httpGET(fmt"/v2/{domain}/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
