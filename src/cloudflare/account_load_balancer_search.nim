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
  AccountLoadBalancerSearchReferencesOption* = enum
    references = ""
    references = "*"
    referencesReferral = "referral"
    referencesReferrer = "referrer"


proc getAccountsAccountIdLoadBalancersSearch*(client: CloudflareClient,
                                              accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                              query: string = "",
                                              references: string = "",
                                              page: float64 = default(float64),
                                              perPage: float64 = default(float64)): Future[JsonNode] {.async.} =
  ## Search for Load Balancing resources.

  var q = initOrderedTable[string, string]()
  q["query"] = $query
  for v in references: q["references"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
