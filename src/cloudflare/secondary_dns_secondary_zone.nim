# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postZonesZoneIdSecondaryDnsForceAxfr*(client: CloudflareClient,
                                           zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsForceResponse] {.async.} =
  ## Sends AXFR zone transfer request to primary nameserver(s).

  let res = await client.httpPOST(fmt"/zones/{zoneId}/secondary_dns/force_axfr")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsForceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSecondaryDnsIncoming*(client: CloudflareClient,
                                         zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsSingleResponseIncoming] {.async.} =
  ## Get secondary zone configuration for incoming zone transfers.

  let res = await client.httpGET(fmt"/zones/{zoneId}/secondary_dns/incoming")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponseIncoming)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSecondaryDnsIncoming*(client: CloudflareClient,
                                          zoneId: types.SecondaryDnsIdentifier,
                                          body: types.SecondaryDnsDnsSecondarySecondaryZone): Future[types.SecondaryDnsSingleResponseIncoming] {.async.} =
  ## Create secondary zone configuration for incoming zone transfers.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/secondary_dns/incoming", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponseIncoming)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSecondaryDnsIncoming*(client: CloudflareClient,
                                         zoneId: types.SecondaryDnsIdentifier,
                                         body: types.SecondaryDnsDnsSecondarySecondaryZone): Future[types.SecondaryDnsSingleResponseIncoming] {.async.} =
  ## Update secondary zone configuration for incoming zone transfers.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/secondary_dns/incoming", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponseIncoming)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSecondaryDnsIncoming*(client: CloudflareClient,
                                            zoneId: types.SecondaryDnsIdentifier): Future[types.SecondaryDnsIdResponse] {.async.} =
  ## Delete secondary zone configuration for incoming zone transfers.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/secondary_dns/incoming")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsIdResponse)
  else:
    raise newException(CloudflareClientError, body)
