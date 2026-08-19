# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdStreamWebhook*(client: CloudflareClient,
                                        accountId: types.StreamAccountIdentifier): Future[types.StreamWebhookResponseSingle] {.async.} =
  ## Retrieves a list of webhooks.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/webhook")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamWebhookResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdStreamWebhook*(client: CloudflareClient,
                                        accountId: types.StreamAccountIdentifier,
                                        body: types.StreamWebhookRequest): Future[types.StreamWebhookResponseSingle] {.async.} =
  ## Creates a webhook notification.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/stream/webhook", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamWebhookResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamWebhook*(client: CloudflareClient,
                                           accountId: types.StreamAccountIdentifier): Future[types.StreamDeletedResponse] {.async.} =
  ## Deletes a webhook.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/webhook")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)
