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
                                 zoneId: types.BillSubsApiIdentifier): Future[types.BillSubsApiZoneSubscriptionResponseSingle] {.async.} =
  ## Lists zone subscription details.

  let res = await client.httpGET(fmt"/zones/{zoneId}/subscription")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSubscription*(client: CloudflareClient,
                                  zoneId: types.BillSubsApiIdentifier,
                                  body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiZoneSubscriptionResponseSingle] {.async.} =
  ## Create a zone subscription, either plan or add-ons.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/subscription", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSubscription*(client: CloudflareClient,
                                 zoneId: types.BillSubsApiIdentifier,
                                 body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiZoneSubscriptionResponseSingle] {.async.} =
  ## Updates zone subscriptions, either plan or add-ons.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/subscription", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSubscription*(client: CloudflareClient,
                                    zoneId: types.BillSubsApiIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a zone's subscription.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/subscription")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdSubscriptions*(client: CloudflareClient,
                                   zoneId: types.BillSubsApiIdentifier,
                                   body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiZoneSubscriptionResponseSingle] {.async.} =
  ## Create a zone subscription, either plan or add-ons. Retained for audit-log
  ## coverage. Use the singular `/zones/{zone_id}/subscription` path instead.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdSubscriptions*(client: CloudflareClient,
                                  zoneId: types.BillSubsApiIdentifier,
                                  body: types.BillSubsApiSubscriptionV2): Future[types.BillSubsApiZoneSubscriptionResponseSingle] {.async.} =
  ## Updates zone subscriptions, either plan or add-ons. Retained for audit-log
  ## coverage. Use the singular `/zones/{zone_id}/subscription` path instead.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/subscriptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiZoneSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdSubscriptions*(client: CloudflareClient,
                                     zoneId: types.BillSubsApiIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a zone's subscription. Retained for audit-log coverage. Use the singular
  ## `/zones/{zone_id}/subscription` path instead.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/subscriptions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
