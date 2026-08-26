# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  SpectrumApplicationDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  SpectrumApplicationOrderOption* = enum
    orderProtocol = "protocol"
    orderAppId = "app_id"
    orderCreatedOn = "created_on"
    orderModifiedOn = "modified_on"
    orderDns = "dns"


proc getZonesZoneIdSpectrumApps*(client: CloudflareClient,
                                 zoneId: types.SpectrumConfigZoneIdentifier,
                                 page: float64 = default(float64),
                                 perPage: float64 = default(float64),
                                 direction: SpectrumApplicationDirectionOption = directionAsc,
                                 order: SpectrumApplicationOrderOption = orderDns): Future[types.SpectrumConfigAppConfigCollection] {.async.} =
  ## Retrieves a list of currently existing Spectrum applications inside a zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["direction"] = $direction
  q["order"] = $order
  let res = await client.httpGET(fmt"/zones/{zoneId}/spectrum/apps", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumConfigAppConfigCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSpectrumApps*(client: CloudflareClient,
                                  zoneId: types.SpectrumConfigZoneIdentifier,
                                  body: types.SpectrumConfigUpdateAppConfig): Future[types.SpectrumConfigAppConfigSingle] {.async.} =
  ## Creates a new Spectrum application from a configuration using a name for the
  ## origin.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/spectrum/apps", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumConfigAppConfigSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpectrumAppsAppId*(client: CloudflareClient,
                                      appId: types.SpectrumConfigAppIdentifier,
                                      zoneId: types.SpectrumConfigZoneIdentifier): Future[types.SpectrumConfigAppConfigSingle] {.async.} =
  ## Gets the application configuration of a specific application inside a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/spectrum/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumConfigAppConfigSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSpectrumAppsAppId*(client: CloudflareClient,
                                      appId: types.SpectrumConfigAppIdentifier,
                                      zoneId: types.SpectrumConfigZoneIdentifier,
                                      body: types.SpectrumConfigUpdateAppConfig): Future[types.SpectrumConfigAppConfigSingle] {.async.} =
  ## Updates a previously existing application's configuration that uses a name for
  ## the origin.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/spectrum/apps/{appId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumConfigAppConfigSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSpectrumAppsAppId*(client: CloudflareClient,
                                         appId: types.SpectrumConfigAppIdentifier,
                                         zoneId: types.SpectrumConfigZoneIdentifier): Future[types.SpectrumConfigApiResponseSingleId] {.async.} =
  ## Deletes a previously existing application.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/spectrum/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumConfigApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSpectrumProtocols*(client: CloudflareClient,
                                      zoneId: types.SpectrumConfigZoneIdentifier): Future[types.SpectrumConfigProtocolCollection] {.async.} =
  ## Retrieves a list of Spectrum application protocols available for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/spectrum/protocols")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SpectrumConfigProtocolCollection)
  else:
    raise newException(CloudflareClientError, body)
