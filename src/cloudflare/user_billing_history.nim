# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types

type
  UserBillingHistoryOrderOption* = enum
    orderType = "type"
    orderOccurredAt = "occurred_at"
    orderAction = "action"


proc getUserBillingHistory*(client: CloudflareClient,
                            page: float64 = default(float64),
                            perPage: float64 = default(float64),
                            order: set[UserBillingHistoryOrderOption] = {},
                            occurredAt: types.BillSubsApiOccurredAt = default(types.BillSubsApiOccurredAt),
                            `type`: string = default(string),
                            action: string = default(string)): Future[types.BillSubsApiBillingHistoryCollection] {.async.} =
  ## Accesses your billing history object.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  q["occurred_at"] = $occurredAt
  q["type"] = $`type`
  q["action"] = $action
  let res = await client.httpGET("/user/billing/history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBillingHistoryCollection)
  else:
    raise newException(CloudflareClientError, body)
