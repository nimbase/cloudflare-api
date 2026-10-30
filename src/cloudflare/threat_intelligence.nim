# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneV2SearchRequest = object
    entity_types: Option[seq[string]]
    include_analytics_datasets: Option[bool]
    limit: Option[int64]
    query: string
  PostAccountsAccountIdCloudforceOneV2SearchResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool

proc postAccountsAccountIdCloudforceOneV2Search*(client: CloudflareClient,
                                                 accountId: string,
                                                 body: PostAccountsAccountIdCloudforceOneV2SearchRequest): Future[PostAccountsAccountIdCloudforceOneV2SearchResponse] {.async.} =
  ## Searches the articles, actors, tags, events, and indicators you can read and
  ## returns one list of typed results, most relevant first. Use `entity_types` to
  ## limit the types searched.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/search", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2SearchResponse)
  else:
    raise newException(CloudflareClientError, body)
