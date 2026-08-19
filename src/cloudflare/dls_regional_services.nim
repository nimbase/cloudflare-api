# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdAddressingRegionalHostnamesRequest = object
    hostname: types.DlsHostname
    region_key: types.DlsRegionKey
    routing: Option[types.DlsRouting]
  PatchZonesZoneIdAddressingRegionalHostnamesHostnameRequest = object
    region_key: types.DlsRegionKey

proc getAccountsAccountIdAddressingRegionalHostnamesRegions*(client: CloudflareClient,
                                                             accountId: types.DlsIdentifier): Future[JsonNode] {.async.} =
  ## List all Regional Services regions available for use by this account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/regional_hostnames/regions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAddressingRegionalHostnames*(client: CloudflareClient,
                                                zoneId: types.DlsIdentifier): Future[JsonNode] {.async.} =
  ## List all Regional Hostnames within a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/addressing/regional_hostnames")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAddressingRegionalHostnames*(client: CloudflareClient,
                                                 zoneId: types.DlsIdentifier,
                                                 body: PostZonesZoneIdAddressingRegionalHostnamesRequest): Future[JsonNode] {.async.} =
  ## Create a new Regional Hostname entry. Cloudflare will only use data centers that
  ## are physically located within the chosen region to decrypt and service HTTPS
  ## traffic. Learn more about [RegionalServices](https://developers.cloudflare.com/
  ## data-localization/regional-services/get-started/).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/addressing/regional_hostnames", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAddressingRegionalHostnamesHostname*(client: CloudflareClient,
                                                        zoneId: types.DlsIdentifier,
                                                        hostname: types.DlsHostname): Future[JsonNode] {.async.} =
  ## Fetch the configuration for a specific Regional Hostname, within a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/addressing/regional_hostnames/{hostname}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAddressingRegionalHostnamesHostname*(client: CloudflareClient,
                                                           zoneId: types.DlsIdentifier,
                                                           hostname: types.DlsHostname): Future[JsonNode] {.async.} =
  ## Delete the region configuration for a specific Regional Hostname.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/addressing/regional_hostnames/{hostname}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdAddressingRegionalHostnamesHostname*(client: CloudflareClient,
                                                          zoneId: types.DlsIdentifier,
                                                          hostname: types.DlsHostname,
                                                          body: PatchZonesZoneIdAddressingRegionalHostnamesHostnameRequest): Future[JsonNode] {.async.} =
  ## Update the configuration for a specific Regional Hostname. Only the region_key
  ## of a hostname is mutable.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/addressing/regional_hostnames/{hostname}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
