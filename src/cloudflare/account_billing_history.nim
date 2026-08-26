# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBillingHistory*(client: CloudflareClient,
                                         accountId: types.BillSubsApiIdentifier,
                                         page: int64 = 1, perPage: int64 = 20,
                                         status: string = default(string)): Future[types.BillSubsApiAccountBillingHistoryCollection] {.async.} =
  ## Gets the billing history for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["status"] = $status
  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiAccountBillingHistoryCollection)
  else:
    raise newException(CloudflareClientError, body)
