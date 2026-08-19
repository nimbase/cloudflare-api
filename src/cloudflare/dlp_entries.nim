# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpEntries*(client: CloudflareClient, accountId: string): Future[JsonNode] {.async.} =
  ## Lists all DLP entries in an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/entries")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpEntries*(client: CloudflareClient,
                                      accountId: string, body: types.DlpNewEntry): Future[JsonNode] {.async.} =
  ## Creates a DLP custom entry.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/entries", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpEntriesCustomEntryId*(client: CloudflareClient,
                                                  accountId: string,
                                                  entryId: string,
                                                  body: types.DlpCustomEntryUpdate): Future[JsonNode] {.async.} =
  ## Updates a DLP custom entry.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/entries/custom/{entryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpEntriesPredefinedEntryId*(client: CloudflareClient,
                                                      accountId: string,
                                                      entryId: string,
                                                      body: types.DlpPredefinedEntryUpdate): Future[JsonNode] {.async.} =
  ## Updates a DLP entry.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/entries/predefined/{entryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpEntriesEntryId*(client: CloudflareClient,
                                            accountId: string, entryId: string): Future[JsonNode] {.async.} =
  ## Fetches a DLP entry by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/entries/{entryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpEntriesEntryId*(client: CloudflareClient,
                                            accountId: string, entryId: string,
                                            body: types.DlpEntryUpdate): Future[JsonNode] {.async.} =
  ## Updates a DLP entry.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/entries/{entryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpEntriesEntryId*(client: CloudflareClient,
                                               accountId: string,
                                               entryId: string): Future[JsonNode] {.async.} =
  ## Deletes a DLP custom entry.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/entries/{entryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
