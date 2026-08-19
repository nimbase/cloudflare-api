# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient

type
  GetAccountsAccountIdWorkersObservabilityUsageResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool

proc getAccountsAccountIdWorkersObservabilityUsage*(client: CloudflareClient,
                                                    `from`: string, to: string): Future[GetAccountsAccountIdWorkersObservabilityUsageResponse] {.async.} =
  ## Event counts broken down by dataset and service, bucketed by day, for up to 90
  ## days. The top-level events field is the sum of all breakdown counts.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  let res = await client.httpGET("/accounts/{account_id}/workers/observability/usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityUsageResponse)
  else:
    raise newException(CloudflareClientError, body)
