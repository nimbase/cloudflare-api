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
  ## Lists all target industries for a specific dataset

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
  ## Retrieves the catalog of industry classifications used in Cloudforce One threat
  ## intelligence.

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
  ## Lists all target industries from industry map catalog

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/targetIndustries/catalog")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneEventsTargetIndustriesCatalogResponse)
  else:
    raise newException(CloudflareClientError, body)
