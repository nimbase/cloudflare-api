# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdIntelDomain*(client: CloudflareClient,
                                      accountId: types.IntelIdentifier,
                                      domain: string = default(string),
                                      skipDns: bool = default(bool),
                                      skipRanking: bool = false): Future[types.IntelSingleResponse] {.async.} =
  ## Gets security details and statistics about a domain.

  var q = initOrderedTable[string, string]()
  q["domain"] = $domain
  q["skip_dns"] = $skipDns
  q["skip_ranking"] = $skipRanking
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/domain", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelDomainBulk*(client: CloudflareClient,
                                          accountId: types.IntelIdentifier,
                                          domain: seq[string] = @[],
                                          includeRanking: bool = false,
                                          skipRanking: bool = default(bool)): Future[types.IntelCollectionResponse] {.async.} =
  ## Returns security details and statistics about multiple domains in a
  ## single request.
  ##
  ## **Behavior change — domain ranking is becoming opt-in.** This endpoint
  ## previously included domain ranking data in every response and accepted
  ## a `skip_ranking=true` query parameter to opt out. That parameter is
  ## being deprecated and ranking will no longer be returned by default.
  ## Callers that want ranking data must pass `include_ranking=true`. The
  ## `skip_ranking` parameter will be silently ignored once the change ships.

  var q = initOrderedTable[string, string]()
  for v in domain: q["domain"] = $v
  q["include_ranking"] = $includeRanking
  q["skip_ranking"] = $skipRanking
  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/domain/bulk", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)
