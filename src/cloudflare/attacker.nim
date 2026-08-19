# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneEventsAttackersResponse* = object
    items: JsonNode
    `type`: string

proc getAccountsAccountIdCloudforceOneEventsAttackers*(client: CloudflareClient,
                                                       accountId: string,
                                                       datasetIds: seq[string] = @[]): Future[GetAccountsAccountIdCloudforceOneEventsAttackersResponse] {.async.} =
  ## Lists known threat attackers tracked in Cloudforce One threat intelligence.

  var q = initOrderedTable[string, string]()
  for v in datasetIds: q["datasetIds"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/attackers", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsAttackersResponse)
  else:
    raise newException(CloudflareClientError, body)
