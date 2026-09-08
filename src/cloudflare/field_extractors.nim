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
  PutAccountsAccountIdFieldExtractorsExtractorRequest = object
    rules: seq[JsonNode]

proc getAccountsAccountIdFieldExtractorsExtractor*(client: CloudflareClient,
                                                   accountId: string,
                                                   extractor: string): Future[types.FieldExtractorsSuccessResponse] {.async.} =
  ## Retrieves the custom extraction rules configured for a given extractor type.

  let res = await client.httpGET(fmt"/accounts/{accountId}/field_extractors/{extractor}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FieldExtractorsSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdFieldExtractorsExtractor*(client: CloudflareClient,
                                                   accountId: string,
                                                   extractor: string,
                                                   body: PutAccountsAccountIdFieldExtractorsExtractorRequest): Future[types.FieldExtractorsSuccessResponse] {.async.} =
  ## Replaces all custom extraction rules for an extractor type. Omitted rules are
  ## deleted.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/field_extractors/{extractor}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FieldExtractorsSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdFieldExtractorsExtractor*(client: CloudflareClient,
                                                      accountId: string,
                                                      extractor: string): Future[types.FieldExtractorsDeleteResponse] {.async.} =
  ## Deletes all custom extraction rules for an extractor type.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/field_extractors/{extractor}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FieldExtractorsDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)
