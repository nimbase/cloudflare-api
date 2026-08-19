# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdR2Metrics*(client: CloudflareClient,
                                    accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## Get Storage/Object Count Metrics across all buckets in your account. Note that
  ## Account-Level Metrics may not immediately reflect the latest data.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/metrics")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
