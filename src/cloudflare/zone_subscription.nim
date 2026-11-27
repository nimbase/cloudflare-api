# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdSubscription*(client: CloudflareClient,
                                 zoneId: types.BillSubsIdentifier): Future[types.BillSubsZoneSubscriptionResponseSingle] {.async.} =
  ## Lists zone subscription details. Zones on the Free plan normally have no zone
  ## subscription, so this returns 404 with error code 1207.

  let res = await client.httpGET(fmt"/zones/{zoneId}/subscription")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSubscription*(client: CloudflareClient,
                                  zoneId: types.BillSubsIdentifier,
                                  body: types.BillSubsSubscriptionV2): Future[types.BillSubsZoneSubscriptionResponseSingle] {.async.} =
  ## Create a zone subscription, either plan or add-ons. Requesting the `free` rate
  ## plan does not create a subscription.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/subscription", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSubscription*(client: CloudflareClient,
                                 zoneId: types.BillSubsIdentifier,
                                 body: types.BillSubsSubscriptionV2): Future[types.BillSubsZoneSubscriptionResponseSingle] {.async.} =
  ## Updates zone subscriptions, either plan or add-ons. Updating to the `free` rate
  ## plan downgrades the zone to the Free plan, after which the zone has no zone
  ## subscription.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/subscription", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSubscription*(client: CloudflareClient,
                                    zoneId: types.BillSubsIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a zone's subscription.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/subscription")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSubscriptions*(client: CloudflareClient,
                                   zoneId: types.BillSubsIdentifier,
                                   body: types.BillSubsSubscriptionV2): Future[types.BillSubsZoneSubscriptionResponseSingle] {.async.} =
  ## Create a zone subscription, either plan or add-ons. Retained for audit-log
  ## coverage. Use the singular `/zones/{zone_id}/subscription` path instead.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSubscriptions*(client: CloudflareClient,
                                  zoneId: types.BillSubsIdentifier,
                                  body: types.BillSubsSubscriptionV2): Future[types.BillSubsZoneSubscriptionResponseSingle] {.async.} =
  ## Updates zone subscriptions, either plan or add-ons. Retained for audit-log
  ## coverage. Use the singular `/zones/{zone_id}/subscription` path instead.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSubscriptions*(client: CloudflareClient,
                                     zoneId: types.BillSubsIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a zone's subscription. Retained for audit-log coverage. Use the singular
  ## `/zones/{zone_id}/subscription` path instead.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/subscriptions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
