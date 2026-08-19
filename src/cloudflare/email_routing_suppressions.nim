# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdEmailRoutingSuppressionResponse* = object
    page: int64
    per_page: int64
    result: seq[JsonNode]
    total: int64
  PostAccountsAccountIdEmailRoutingSuppressionRequest = object
    email: string
    expires_at: Option[string]
  PostAccountsAccountIdEmailRoutingSuppressionResponse* = object
    result: JsonNode
  GetAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse* = object
    result: JsonNode
  DeleteAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse* = object
    success: bool
  GetZonesZoneIdEmailRoutingSuppressionResponse* = object
    page: int64
    per_page: int64
    result: seq[JsonNode]
    total: int64
  PostZonesZoneIdEmailRoutingSuppressionRequest = object
    email: string
    expires_at: Option[string]
  PostZonesZoneIdEmailRoutingSuppressionResponse* = object
    result: JsonNode
  GetZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse* = object
    result: JsonNode
  DeleteZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse* = object
    success: bool
  EmailRoutingSuppressionOrderOption* = enum
    orderEmail = "email"
    orderExpiresAt = "expires_at"
    orderCreatedAt = "created_at"

  EmailRoutingSuppressionDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdEmailRoutingSuppression*(client: CloudflareClient,
                                                  accountId: string,
                                                  page: int64 = 1,
                                                  perPage: int64 = 100,
                                                  order: string = "created_at",
                                                  direction: string = "desc"): Future[GetAccountsAccountIdEmailRoutingSuppressionResponse] {.async.} =
  ## Lists email suppressions for the specified account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/email/routing/suppression", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdEmailRoutingSuppressionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailRoutingSuppression*(client: CloudflareClient,
                                                   accountId: string,
                                                   body: PostAccountsAccountIdEmailRoutingSuppressionRequest): Future[PostAccountsAccountIdEmailRoutingSuppressionResponse] {.async.} =
  ## Creates a new email suppression for the specified account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/routing/suppression", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdEmailRoutingSuppressionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailRoutingSuppressionSuppressionId*(client: CloudflareClient,
                                                               accountId: string,
                                                               suppressionId: string): Future[GetAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse] {.async.} =
  ## Retrieves a single email suppression for the specified account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/email/routing/suppression/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailRoutingSuppressionSuppressionId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  suppressionId: string): Future[DeleteAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse] {.async.} =
  ## Deletes an email suppression for the specified account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/email/routing/suppression/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdEmailRoutingSuppressionSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailRoutingSuppression*(client: CloudflareClient,
                                            zoneId: string, page: int64 = 1,
                                            perPage: int64 = 100,
                                            order: string = "created_at",
                                            direction: string = "desc"): Future[GetZonesZoneIdEmailRoutingSuppressionResponse] {.async.} =
  ## Lists email suppressions for the specified zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/email/routing/suppression", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetZonesZoneIdEmailRoutingSuppressionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailRoutingSuppression*(client: CloudflareClient,
                                             zoneId: string,
                                             body: PostZonesZoneIdEmailRoutingSuppressionRequest): Future[PostZonesZoneIdEmailRoutingSuppressionResponse] {.async.} =
  ## Creates a new email suppression for the specified zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/routing/suppression", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostZonesZoneIdEmailRoutingSuppressionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailRoutingSuppressionSuppressionId*(client: CloudflareClient,
                                                         zoneId: string,
                                                         suppressionId: string): Future[GetZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse] {.async.} =
  ## Retrieves a single email suppression for the specified zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/routing/suppression/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdEmailRoutingSuppressionSuppressionId*(client: CloudflareClient,
                                                            zoneId: string,
                                                            suppressionId: string): Future[DeleteZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse] {.async.} =
  ## Deletes an email suppression for the specified zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/email/routing/suppression/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteZonesZoneIdEmailRoutingSuppressionSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)
