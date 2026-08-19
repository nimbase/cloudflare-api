# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdDlpEntriesIntegration*(client: CloudflareClient,
                                                 accountId: string,
                                                 body: types.DlpNewPredefinedEntry): Future[JsonNode] {.async.} =
  ## Integration entries can't be created, this will update an existing integration
  ## entry.
  ## This is needed for our generated terraform API.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/entries/integration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpEntriesIntegrationEntryId*(client: CloudflareClient,
                                                       accountId: string,
                                                       entryId: string,
                                                       body: types.DlpPredefinedEntryUpdate): Future[JsonNode] {.async.} =
  ## Updates a DLP entry.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/entries/integration/{entryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpEntriesIntegrationEntryId*(client: CloudflareClient,
                                                          accountId: string,
                                                          entryId: string): Future[JsonNode] {.async.} =
  ## This is a no-op as integration entires can't be deleted but is needed for our
  ## generated terraform API.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/entries/integration/{entryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
