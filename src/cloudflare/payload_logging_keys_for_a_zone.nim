# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdFirewallPayloadLoggingKey*(client: CloudflareClient,
                                              zoneId: types.FirewallIdentifier): Future[types.FirewallPayloadLoggingKeyResponseSingle] {.async.} =
  ## Fetches the public key that payload logging uses to encrypt matched payloads for
  ## the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/firewall/payload_logging/key")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallPayloadLoggingKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFirewallPayloadLoggingKey*(client: CloudflareClient,
                                              zoneId: types.FirewallIdentifier,
                                              body: types.FirewallPayloadLoggingKey): Future[types.FirewallPayloadLoggingKeyResponseSingle] {.async.} =
  ## Creates or replaces the public key that payload logging uses to encrypt matched
  ## payloads for the zone. The zone key takes precedence over the account key.
  ## Requires a plan that includes payload logging (Enterprise); otherwise it returns
  ## 403.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/firewall/payload_logging/key", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallPayloadLoggingKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdFirewallPayloadLoggingKey*(client: CloudflareClient,
                                                 zoneId: types.FirewallIdentifier): Future[types.FirewallPayloadLoggingKeyResponseSingle] {.async.} =
  ## Deletes the payload logging public key of the zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/firewall/payload_logging/key")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallPayloadLoggingKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
