# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTargetIndustriesResponse* = object
    items: JsonNode
    `type`: string
  GetAccountsAccountIdCloudforceOneEventsTargetIndustriesResponse* = object
    items: JsonNode
    `type`: string
  GetAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalogResponse* = object
    items: JsonNode
    `type`: string

proc getAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTargetIndustries*(client: CloudflareClient,
                                                                              accountId: string,
                                                                              datasetId: string): Future[GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTargetIndustriesResponse] {.async.} =
  ## Legacy. Use `threat-intel events target-industries list` (`GET
  ## /events/targetIndustries`) instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/dataset/{datasetId}/targetIndustries")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsDatasetDatasetIdTargetIndustriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsTargetIndustries*(client: CloudflareClient,
                                                              accountId: string,
                                                              datasetIds: seq[string] = @[]): Future[GetAccountsAccountIdCloudforceOneEventsTargetIndustriesResponse] {.async.} =
  ## Lists the target industries referenced by events in the datasets given by
  ## `datasetIds`, or in the default dataset when `datasetIds` is omitted. To list
  ## every target industry, use `threat-intel events target-industries catalog list`.

  var q = initOrderedTable[string, string]()
  for v in datasetIds: q["datasetIds"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/targetIndustries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTargetIndustriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalog*(client: CloudflareClient,
                                                                     accountId: string): Future[GetAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalogResponse] {.async.} =
  ## Lists every predefined target industry, whether or not an event uses it. To list
  ## only the industries used in specific datasets, use `threat-intel events
  ## target-industries list`.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/targetIndustries/catalog")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalogResponse)
  else:
    raise newException(CloudflareClientError, body)
