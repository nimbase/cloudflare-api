# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse* = object
    items: JsonNode
    `type`: string
  GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse* = object
    items: JsonNode
    `type`: string

proc getAccountsAccountIdCloudforceOneEventsIndicatorTypes*(client: CloudflareClient,
                                                            accountId: string,
                                                            datasetIds: seq[string] = @[]): Future[GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse] {.async.} =
  ## Lists the indicator types used in the datasets given by `datasetIds`, which
  ## accepts dataset UUIDs or one scope value used alone. Without `datasetIds`, every
  ## dataset you can read is included, analytics datasets too.

  var q = initOrderedTable[string, string]()
  for v in datasetIds: q["datasetIds"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/indicator-types", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsIndicatorTypes*(client: CloudflareClient,
                                                            accountId: string): Future[GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse] {.async.} =
  ## Legacy. Use `threat-intel indicators types list` (`GET /events/indicator-types`)
  ## instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/indicatorTypes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse)
  else:
    raise newException(CloudflareClientError, body)
