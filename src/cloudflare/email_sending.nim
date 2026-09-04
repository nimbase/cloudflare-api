# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdEmailSendingSendResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.EmailSendingEmailSendResponse
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdEmailSendingSendRawResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.EmailSendingEmailSendResponse
    result_info: JsonNode
    success: bool

proc getAccountsAccountIdEmailSendingLimits*(client: CloudflareClient,
                                             accountId: types.EmailIdentifier): Future[types.EmailSendingLimitsResponseSingle] {.async.} =
  ## Returns the current daily sending quota for the account and, when a quota is
  ## resolved, the account's current usage against it. Quota is null when not yet
  ## available; usage is null when there is no resolved quota or usage is temporarily
  ## unavailable.

  let res = await client.httpGET(fmt"/accounts/{accountId}/email/sending/limits")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingLimitsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSendingMessagesMessageId*(client: CloudflareClient,
                                                        accountId: string,
                                                        messageId: string): Future[AsyncResponse] {.async.} =
  ## Returns the raw RFC 5322 MIME message for the given account and message id.

  let res = await client.httpGET(fmt"/accounts/{accountId}/email/sending/messages/{messageId}")
  return res

proc getAccountsAccountIdEmailSendingReputation*(client: CloudflareClient,
                                                 accountId: types.EmailIdentifier): Future[types.EmailSendingReputationResponseSingle] {.async.} =
  ## Returns the authoritative Email Sending reputation state and active evaluation
  ## policy. Accounts without an evaluation are Healthy with null evaluation
  ## timestamps.

  let res = await client.httpGET(fmt"/accounts/{accountId}/email/sending/reputation")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingReputationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSendingSend*(client: CloudflareClient,
                                            accountId: string,
                                            body: types.EmailSendingEmailBuilder): Future[PostAccountsAccountIdEmailSendingSendResponse] {.async.} =
  ## Send an email for the specified account using the structured builder. Provide
  ## the sender, recipients, subject, and at least one of text or html; attachments
  ## are optional.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/sending/send", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdEmailSendingSendResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSendingSendRaw*(client: CloudflareClient,
                                               accountId: string,
                                               body: types.EmailSendingSendRawRequest): Future[PostAccountsAccountIdEmailSendingSendRawResponse] {.async.} =
  ## Send a raw RFC 5322 (MIME) email for the specified account. Provide the full
  ## MIME message plus the SMTP envelope (from and recipients).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/sending/send_raw", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdEmailSendingSendRawResponse)
  else:
    raise newException(CloudflareClientError, body)
