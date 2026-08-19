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
  ## Lists indicator types across multiple datasets

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
  ## This Method is deprecated. Please use /events/dataset/:dataset_id/indicatorTypes
  ## instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/indicatorTypes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsIndicatorTypesResponse)
  else:
    raise newException(CloudflareClientError, body)
