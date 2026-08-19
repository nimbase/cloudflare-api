# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  PostAccountsAccountIdDlpCustomPromptTopicsRequest = object
    description: Option[string]
    enabled: bool
    name: string
    profile_id: Option[string]
    topic: string
  PutAccountsAccountIdDlpCustomPromptTopicsEntryIdRequest = object
    description: Option[string]
    enabled: bool
    name: string
    topic: string

proc getAccountsAccountIdDlpCustomPromptTopics*(client: CloudflareClient,
                                                accountId: string): Future[JsonNode] {.async.} =
  ## Lists all DLP custom prompt topic entries in an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/custom_prompt_topics")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpCustomPromptTopics*(client: CloudflareClient,
                                                 accountId: string,
                                                 body: PostAccountsAccountIdDlpCustomPromptTopicsRequest): Future[JsonNode] {.async.} =
  ## Creates a DLP custom prompt topic entry.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/custom_prompt_topics", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpCustomPromptTopicsEntryId*(client: CloudflareClient,
                                                       accountId: string,
                                                       entryId: string): Future[JsonNode] {.async.} =
  ## Fetches a DLP custom prompt topic entry by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/custom_prompt_topics/{entryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpCustomPromptTopicsEntryId*(client: CloudflareClient,
                                                       accountId: string,
                                                       entryId: string,
                                                       body: PutAccountsAccountIdDlpCustomPromptTopicsEntryIdRequest): Future[JsonNode] {.async.} =
  ## Updates a DLP custom prompt topic entry.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/custom_prompt_topics/{entryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpCustomPromptTopicsEntryId*(client: CloudflareClient,
                                                          accountId: string,
                                                          entryId: string): Future[JsonNode] {.async.} =
  ## Deletes a DLP custom prompt topic entry.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/custom_prompt_topics/{entryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
