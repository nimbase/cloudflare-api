# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdLogsExplorerDatasets*(client: CloudflareClient,
                                               accountId: string,
                                               includeZones: bool = default(bool)): Future[types.LexDatasetSummaryListResponse] {.async.} =
  ## Returns all Log Explorer datasets configured for the account.
  ##
  ## Pass `include_zones=true` to also include zone-level datasets that
  ## belong to this account. List responses omit the `fields` property;
  ## use the single-dataset endpoint to retrieve field configuration.

  var q = initOrderedTable[string, string]()
  q["include_zones"] = $includeZones
  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/explorer/datasets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexDatasetSummaryListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogsExplorerDatasets*(client: CloudflareClient,
                                                accountId: string,
                                                body: types.LexCreateDatasetRequest): Future[types.LexDatasetDetailResponse] {.async.} =
  ## Create a new Log Explorer dataset for the account.
  ##
  ## List available account datasets to see the dataset types and fields you
  ## can use.
  ##
  ## The `fields` property is optional. If not specified, all available fields
  ## will be enabled.
  ##
  ## For dataset field definitions, see:
  ## https://developers.cloudflare.com/logs/logpush/logpush-job/datasets/

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logs/explorer/datasets", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.LexDatasetDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogsExplorerDatasetsAvailable*(client: CloudflareClient,
                                                        accountId: string): Future[types.LexAvailableDestinationListResponse] {.async.} =
  ## Returns all dataset types that this account can create. Each entry
  ## includes the dataset schema and timestamp field.
  ##
  ## The schema shows all possible fields for a dataset. However, not all
  ## fields may be available for your account. When creating or updating a
  ## dataset, only fields available to your account can be enabled. If you
  ## request a field that is not available, you will receive an error.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/explorer/datasets/available")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexAvailableDestinationListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogsExplorerDatasetsDatasetId*(client: CloudflareClient,
                                                        accountId: string,
                                                        datasetId: string): Future[types.LexDatasetDetailResponse] {.async.} =
  ## Retrieve a single Log Explorer dataset by ID for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/explorer/datasets/{datasetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexDatasetDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdLogsExplorerDatasetsDatasetId*(client: CloudflareClient,
                                                        accountId: string,
                                                        datasetId: string,
                                                        body: types.LexUpdateDatasetRequest): Future[types.LexDatasetDetailResponse] {.async.} =
  ## Updates the enabled state and/or field configuration of an account dataset.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/logs/explorer/datasets/{datasetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexDatasetDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdLogsExplorerDatasetsDatasetId*(client: CloudflareClient,
                                                           accountId: string,
                                                           datasetId: string): Future[types.LexDatasetDetailResponse] {.async.} =
  ## Deletes a Log Explorer dataset for the account. Dataset deletion must not
  ## be protected.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/logs/explorer/datasets/{datasetId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.LexDatasetDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogsExplorerDatasets*(client: CloudflareClient,
                                         zoneId: string): Future[types.LexDatasetSummaryListResponse] {.async.} =
  ## Returns all Log Explorer datasets configured for the zone.
  ##
  ## List responses omit the `fields` property; use the single-dataset
  ## endpoint to retrieve field configuration.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logs/explorer/datasets")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexDatasetSummaryListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogsExplorerDatasets*(client: CloudflareClient,
                                          zoneId: string,
                                          body: types.LexCreateDatasetRequest): Future[types.LexDatasetDetailResponse] {.async.} =
  ## Create a new Log Explorer dataset for the zone.
  ##
  ## List available zone datasets to see the dataset types and fields you
  ## can use.
  ##
  ## The `fields` property is optional. If not specified, all available fields
  ## will be enabled.
  ##
  ## For dataset field definitions, see:
  ## https://developers.cloudflare.com/logs/logpush/logpush-job/datasets/

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logs/explorer/datasets", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.LexDatasetDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogsExplorerDatasetsAvailable*(client: CloudflareClient,
                                                  zoneId: string): Future[types.LexAvailableDestinationListResponse] {.async.} =
  ## Returns all dataset types that this zone can create. Each entry includes
  ## the dataset schema and timestamp field.
  ##
  ## The schema shows all possible fields for a dataset. However, not all
  ## fields may be available for your account. When creating or updating a
  ## dataset, only fields available to your account can be enabled. If you
  ## request a field that is not available, you will receive an error.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logs/explorer/datasets/available")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexAvailableDestinationListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogsExplorerDatasetsDatasetId*(client: CloudflareClient,
                                                  zoneId: string,
                                                  datasetId: string): Future[types.LexDatasetDetailResponse] {.async.} =
  ## Retrieve a single Log Explorer dataset by ID for the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logs/explorer/datasets/{datasetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexDatasetDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdLogsExplorerDatasetsDatasetId*(client: CloudflareClient,
                                                  zoneId: string,
                                                  datasetId: string,
                                                  body: types.LexUpdateDatasetRequest): Future[types.LexDatasetDetailResponse] {.async.} =
  ## Updates the enabled state and/or field configuration of a zone dataset.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/logs/explorer/datasets/{datasetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LexDatasetDetailResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdLogsExplorerDatasetsDatasetId*(client: CloudflareClient,
                                                     zoneId: string,
                                                     datasetId: string): Future[types.LexDatasetDetailResponse] {.async.} =
  ## Deletes a Log Explorer dataset for the zone. Dataset deletion must not
  ## be protected.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/logs/explorer/datasets/{datasetId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.LexDatasetDetailResponse)
  else:
    raise newException(CloudflareClientError, body)
