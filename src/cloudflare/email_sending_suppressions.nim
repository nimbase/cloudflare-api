# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdEmailSendingSuppressionResponse* = object
    page: int64
    per_page: int64
    result: seq[JsonNode]
    total: int64
  PostAccountsAccountIdEmailSendingSuppressionRequest = object
    email: string
    expires_at: Option[string]
  PostAccountsAccountIdEmailSendingSuppressionResponse* = object
    result: JsonNode
  GetAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse* = object
    result: JsonNode
  DeleteAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse* = object
    success: bool
  GetAccountsAccountIdEmailSendingSuppressionsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdEmailSendingSuppressionsRequest = object
    email: string
    expires_at: Option[string]
    note: Option[string]
  PostAccountsAccountIdEmailSendingSuppressionsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PostAccountsAccountIdEmailSendingSuppressionsBulkRequest = object
    items: seq[JsonNode]
  PostAccountsAccountIdEmailSendingSuppressionsBulkResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdRequest = object
    expires_at: Option[string]
    note: Option[string]
  PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetZonesZoneIdEmailSendingSuppressionResponse* = object
    page: int64
    per_page: int64
    result: seq[JsonNode]
    total: int64
  PostZonesZoneIdEmailSendingSuppressionRequest = object
    email: string
    expires_at: Option[string]
  PostZonesZoneIdEmailSendingSuppressionResponse* = object
    result: JsonNode
  GetZonesZoneIdEmailSendingSuppressionSuppressionIdResponse* = object
    result: JsonNode
  DeleteZonesZoneIdEmailSendingSuppressionSuppressionIdResponse* = object
    success: bool
  EmailSendingSuppressionOrderOption* = enum
    orderEmail = "email"
    orderExpiresAt = "expires_at"
    orderCreatedAt = "created_at"

  EmailSendingSuppressionDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  EmailSendingSuppressionReasonOption* = enum
    reasonManual = "manual"
    reasonComplaint = "complaint"
    reasonHardBounce = "hard_bounce"
    reasonSoftBounce = "soft_bounce"
    reasonPolicy = "policy"


proc getAccountsAccountIdEmailSendingSuppression*(client: CloudflareClient,
                                                  accountId: string,
                                                  page: int64 = 1,
                                                  perPage: int64 = 100,
                                                  order: EmailSendingSuppressionOrderOption = orderCreatedAt,
                                                  direction: EmailSendingSuppressionDirectionOption = directionDesc): Future[GetAccountsAccountIdEmailSendingSuppressionResponse] {.async.} =
  ## Lists email suppressions for the specified account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/email/sending/suppression", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdEmailSendingSuppressionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSendingSuppression*(client: CloudflareClient,
                                                   accountId: string,
                                                   body: PostAccountsAccountIdEmailSendingSuppressionRequest): Future[PostAccountsAccountIdEmailSendingSuppressionResponse] {.async.} =
  ## Creates a new email suppression for the specified account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/sending/suppression", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdEmailSendingSuppressionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSendingSuppressionSuppressionId*(client: CloudflareClient,
                                                               accountId: string,
                                                               suppressionId: string): Future[GetAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse] {.async.} =
  ## Retrieves a single email suppression for the specified account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/email/sending/suppression/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSendingSuppressionSuppressionId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  suppressionId: string): Future[DeleteAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse] {.async.} =
  ## Deletes an email suppression for the specified account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/email/sending/suppression/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdEmailSendingSuppressionSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSendingSuppressions*(client: CloudflareClient,
                                                   accountId: string,
                                                   perPage: int64 = 100,
                                                   cursor: string = default(string),
                                                   email: string = default(string),
                                                   search: string = default(string),
                                                   reason: EmailSendingSuppressionReasonOption): Future[GetAccountsAccountIdEmailSendingSuppressionsResponse] {.async.} =
  ## Lists every active Email Sending suppression owned by the account, including
  ## legacy rows with internal zone memberships.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  q["email"] = $email
  q["search"] = $search
  q["reason"] = $reason
  let res = await client.httpGET(fmt"/accounts/{accountId}/email/sending/suppressions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdEmailSendingSuppressionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSendingSuppressions*(client: CloudflareClient,
                                                    accountId: string,
                                                    body: PostAccountsAccountIdEmailSendingSuppressionsRequest): Future[PostAccountsAccountIdEmailSendingSuppressionsResponse] {.async.} =
  ## Creates an account-wide suppression. If a mutable legacy zone-linked row already
  ## exists, it is promoted without changing its identifier.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/sending/suppressions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdEmailSendingSuppressionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSendingSuppressionsBulk*(client: CloudflareClient,
                                                        accountId: string,
                                                        body: PostAccountsAccountIdEmailSendingSuppressionsBulkRequest): Future[PostAccountsAccountIdEmailSendingSuppressionsBulkResponse] {.async.} =
  ## Imports up to 1,000 account-level Email Sending suppressions in one request.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/sending/suppressions/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdEmailSendingSuppressionsBulkResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSendingSuppressionsSuppressionId*(client: CloudflareClient,
                                                                accountId: string,
                                                                suppressionId: string): Future[GetAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse] {.async.} =
  ## Gets an Email Sending suppression owned by the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/email/sending/suppressions/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSendingSuppressionsSuppressionId*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   suppressionId: string): Future[DeleteAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse] {.async.} =
  ## Deletes the suppression, its note, and every legacy internal zone membership,
  ## allowing future delivery attempts to the address.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/email/sending/suppressions/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSendingSuppressionsSuppressionId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  suppressionId: string,
                                                                  body: PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdRequest): Future[PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse] {.async.} =
  ## Updates expiry or advisory note fields without changing legacy internal zone
  ## memberships.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/email/sending/suppressions/{suppressionId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailSendingSuppression*(client: CloudflareClient,
                                            zoneId: string, page: int64 = 1,
                                            perPage: int64 = 100,
                                            order: EmailSendingSuppressionOrderOption = orderCreatedAt,
                                            direction: EmailSendingSuppressionDirectionOption = directionDesc): Future[GetZonesZoneIdEmailSendingSuppressionResponse] {.async.} =
  ## Lists email suppressions for the specified zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/zones/{zoneId}/email/sending/suppression", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetZonesZoneIdEmailSendingSuppressionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailSendingSuppression*(client: CloudflareClient,
                                             zoneId: string,
                                             body: PostZonesZoneIdEmailSendingSuppressionRequest): Future[PostZonesZoneIdEmailSendingSuppressionResponse] {.async.} =
  ## Creates a new email suppression for the specified zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/sending/suppression", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostZonesZoneIdEmailSendingSuppressionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailSendingSuppressionSuppressionId*(client: CloudflareClient,
                                                         zoneId: string,
                                                         suppressionId: string): Future[GetZonesZoneIdEmailSendingSuppressionSuppressionIdResponse] {.async.} =
  ## Retrieves a single email suppression for the specified zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/sending/suppression/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetZonesZoneIdEmailSendingSuppressionSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdEmailSendingSuppressionSuppressionId*(client: CloudflareClient,
                                                            zoneId: string,
                                                            suppressionId: string): Future[DeleteZonesZoneIdEmailSendingSuppressionSuppressionIdResponse] {.async.} =
  ## Deletes an email suppression for the specified zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/email/sending/suppression/{suppressionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteZonesZoneIdEmailSendingSuppressionSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)
