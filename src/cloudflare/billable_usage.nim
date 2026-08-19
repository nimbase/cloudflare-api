# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBillableUsage*(client: CloudflareClient,
                                        accountId: types.BillableUsageApiIdentifier,
                                        `from`: string = default(string),
                                        to: string = default(string)): Future[types.BillableUsageApiUsageResponse] {.async.} =
  ## Returns billable usage data for the account.
  ## When no query parameters are provided, returns usage for the current
  ## billing period.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  let res = await client.httpGET(fmt"/accounts/{accountId}/billable-usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillableUsageApiUsageResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillableUsageInfo*(client: CloudflareClient,
                                            accountId: types.BillableUsageApiIdentifier): Future[types.BillableUsageApiUsageInfoResponse] {.async.} =
  ## Returns high-level usage information for the account, including coverage,
  ## and subscription metadata.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billable-usage/info")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillableUsageApiUsageInfoResponse)
  else:
    raise newException(CloudflareClientError, body)
