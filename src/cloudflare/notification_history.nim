# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAlertingV3History*(client: CloudflareClient,
                                            accountId: types.AaaAccountId,
                                            perPage: types.AaaPerPage = default(types.AaaPerPage),
                                            before: types.AaaBefore = default(types.AaaBefore),
                                            page: float64 = default(float64),
                                            since: string = default(string)): Future[types.AaaHistoryComponentsSchemasResponseCollection] {.async.} =
  ## Gets a list of history records for notifications sent to an account. The records
  ## are displayed for last `x` number of days based on the zone plan (free = 30, pro
  ## = 30, biz = 30, ent = 90).

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["before"] = $before
  q["page"] = $page
  q["since"] = $since
  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaHistoryComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
