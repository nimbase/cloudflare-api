# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PatchZonesZoneIdDnssecRequest = object
    dnssec_multi_signer: Option[types.DnssecDnssecMultiSigner]
    dnssec_presigned: Option[types.DnssecDnssecPresigned]
    dnssec_use_nsec3: Option[types.DnssecDnssecUseNsec3]
    status: Option[string]

proc getZonesZoneIdDnssec*(client: CloudflareClient,
                           zoneId: types.DnssecIdentifier): Future[types.DnssecDnssecResponseSingle] {.async.} =
  ## Details about DNSSEC status and configuration.

  let res = await client.httpGET(fmt"/zones/{zoneId}/dnssec")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnssecDnssecResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdDnssec*(client: CloudflareClient,
                              zoneId: types.DnssecIdentifier): Future[types.DnssecDeleteDnssecResponseSingle] {.async.} =
  ## Delete DNSSEC.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/dnssec")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnssecDeleteDnssecResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdDnssec*(client: CloudflareClient,
                             zoneId: types.DnssecIdentifier,
                             body: PatchZonesZoneIdDnssecRequest): Future[types.DnssecDnssecResponseSingle] {.async.} =
  ## Enable or disable DNSSEC.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/dnssec", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnssecDnssecResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdDnssecZsk*(client: CloudflareClient,
                              zoneId: types.DnssecIdentifier): Future[types.DnssecDnssecZskResponseCollection] {.async.} =
  ## List the Zone Signing Keys (ZSKs) that DNSSEC uses for the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/dnssec/zsk")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnssecDnssecZskResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
