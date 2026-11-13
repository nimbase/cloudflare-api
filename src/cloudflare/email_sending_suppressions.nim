# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdEmailSendingSuppressionsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
      ## Pagination metadata.
    success: bool
  PostAccountsAccountIdEmailSendingSuppressionsRequest = object
    email: string
    expires_at: Option[string]
    note: Option[string]
    scope: Option[JsonNode]
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
    scope: Option[JsonNode]
  PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  EmailSendingSuppressionReasonOption* = enum
    reasonManual = "manual"
    reasonComplaint = "complaint"
    reasonHardBounce = "hard_bounce"
    reasonSoftBounce = "soft_bounce"
    reasonPolicy = "policy"

  EmailSendingSuppressionScopeTypeOption* = enum
    scopeTypeAccount = "account"
    scopeTypeSendingDomain = "sending_domain"


proc getAccountsAccountIdEmailSendingSuppressions*(client: CloudflareClient,
                                                   accountId: string,
                                                   perPage: int64 = 100,
                                                   cursor: string = default(string),
                                                   email: string = default(string),
                                                   search: string = default(string),
                                                   reason: EmailSendingSuppressionReasonOption = reasonManual,
                                                   scopeType: EmailSendingSuppressionScopeTypeOption = scopeTypeAccount,
                                                   scopeValue: string = default(string)): Future[GetAccountsAccountIdEmailSendingSuppressionsResponse] {.async.} =
  ## Lists every active Email Sending suppression owned by the account:
  ## sending-domain suppressions and account-wide suppressions (including legacy rows
  ## with internal zone memberships). Each scope is listed newest first. The order
  ## between sending-domain and account-wide suppressions is not fixed; use
  ## `scope_type` to list one scope.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  q["email"] = $email
  q["search"] = $search
  q["reason"] = $reason
  q["scope_type"] = $scopeType
  q["scope_value"] = $scopeValue
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
  ## Creates a suppression for every sending domain of the account (default) or for
  ## one sending domain (`scope.type = sending_domain`). Creating an existing active
  ## suppression returns its identifier. If a legacy zone-linked account row already
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
  ## Imports up to 1,000 Email Sending suppressions in one request. Each item applies
  ## to every sending domain of the account (default) or to one sending domain.

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
  ## memberships. Scope cannot be changed.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/email/sending/suppressions/{suppressionId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdEmailSendingSuppressionsSuppressionIdResponse)
  else:
    raise newException(CloudflareClientError, body)
