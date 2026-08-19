# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSecondaryDnsOutgoing*(client: CloudflareClient,
                                         zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsSingleResponseOutgoing] {.async.} =
  ## Get primary zone configuration for outgoing zone transfers.

  let res = await client.httpGET(fmt"/zones/{zoneId}/secondary_dns/outgoing")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponseOutgoing)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSecondaryDnsOutgoing*(client: CloudflareClient,
                                          zoneId: types.SecondaryDnsIdentifier,
                                          body: types.SecondaryDnsSingleRequestOutgoing): Future[types.SecondaryDnsSingleResponseOutgoing] {.async.} =
  ## Create primary zone configuration for outgoing zone transfers.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/secondary_dns/outgoing", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponseOutgoing)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSecondaryDnsOutgoing*(client: CloudflareClient,
                                         zoneId: types.SecondaryDnsIdentifier,
                                         body: types.SecondaryDnsSingleRequestOutgoing): Future[types.SecondaryDnsSingleResponseOutgoing] {.async.} =
  ## Update primary zone configuration for outgoing zone transfers.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/secondary_dns/outgoing", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponseOutgoing)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSecondaryDnsOutgoing*(client: CloudflareClient,
                                            zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsIdResponse] {.async.} =
  ## Delete primary zone configuration for outgoing zone transfers.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/secondary_dns/outgoing")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSecondaryDnsOutgoingDisable*(client: CloudflareClient,
                                                 zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsDisableTransferResponse] {.async.} =
  ## Disable outgoing zone transfers for primary zone and clears IXFR backlog of
  ## primary zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/secondary_dns/outgoing/disable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsDisableTransferResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSecondaryDnsOutgoingEnable*(client: CloudflareClient,
                                                zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsEnableTransferResponse] {.async.} =
  ## Enable outgoing zone transfers for primary zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/secondary_dns/outgoing/enable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsEnableTransferResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSecondaryDnsOutgoingForceNotify*(client: CloudflareClient,
                                                     zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsForceResponse2] {.async.} =
  ## Notifies the secondary nameserver(s) and clears IXFR backlog of primary zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/secondary_dns/outgoing/force_notify")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsForceResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecondaryDnsOutgoingStatus*(client: CloudflareClient,
                                               zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsEnableTransferResponse] {.async.} =
  ## Get primary zone transfer status.

  let res = await client.httpGET(fmt"/zones/{zoneId}/secondary_dns/outgoing/status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsEnableTransferResponse)
  else:
    raise newException(CloudflareClientError, body)
