# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneEventsGraphResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool

proc getAccountsAccountIdCloudforceOneEventsGraph*(client: CloudflareClient,
                                                   accountId: string,
                                                   seeds: seq[string] = @[],
                                                   direction: string = default(string),
                                                   hydration: string = default(string),
                                                   limit: float64 = default(float64),
                                                   maxNodes: float64 = default(float64),
                                                   relationshipTypes: seq[string] = @[],
                                                   datasetIds: seq[string] = @[],
                                                   cursor: string = default(string),
                                                   expand: seq[string] = @[]): Future[GetAccountsAccountIdCloudforceOneEventsGraphResponse] {.async.} =
  ## Expands the single-level relationship neighborhood of one or more seed nodes
  ## (event, indicator, or tag) from R2 Data Catalog. Seeds use compact id format
  ## (type:uuid), e.g. "event:550e8400-...". Multi-seed requests merge and
  ## deduplicate results server-side. Hydrates neighbor entities with summary data
  ## from Durable Objects. Supports filtering by relationship type and dataset scope.

  var q = initOrderedTable[string, string]()
  for v in seeds: q["seeds"] = $v
  q["direction"] = $direction
  q["hydration"] = $hydration
  q["limit"] = $limit
  q["max_nodes"] = $maxNodes
  for v in relationshipTypes: q["relationshipTypes"] = $v
  for v in datasetIds: q["datasetIds"] = $v
  q["cursor"] = $cursor
  for v in expand: q["expand"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/graph", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsGraphResponse)
  else:
    raise newException(CloudflareClientError, body)
