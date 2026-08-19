# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetRadarDatasetsResponse* = object
    result: JsonNode
    success: bool
  PostRadarDatasetsDownloadRequest = object
    dataset_id: int64
  PostRadarDatasetsDownloadResponse* = object
    result: JsonNode
  RadarDatasetDatasetTypeOption* = enum
    datasetTypeRANKINGBUCKET = "RANKING_BUCKET"
    datasetTypeREPORT = "REPORT"

  RadarDatasetFormatOption* = enum
    formatJSON = "JSON"
    formatCSV = "CSV"


proc getRadarDatasets*(client: CloudflareClient, limit: int64 = 5,
                       offset: int64 = default(int64),
                       datasetType: string = "RANKING_BUCKET",
                       date: string = default(string),
                       format: set[RadarDatasetFormatOption] = {}): Future[GetRadarDatasetsResponse] {.async.} =
  ## Retrieves a list of datasets.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  for v in datasetType: q["datasetType"] = $v
  q["date"] = $date
  for v in format: q["format"] = $v
  let res = await client.httpGET("/radar/datasets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetRadarDatasetsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postRadarDatasetsDownload*(client: CloudflareClient,
                                format: set[RadarDatasetFormatOption] = {},
                                body: PostRadarDatasetsDownloadRequest): Future[PostRadarDatasetsDownloadResponse] {.async.} =
  ## Retrieves an URL to download a single dataset.

  var q = initOrderedTable[string, string]()
  for v in format: q["format"] = $v
  let res = await client.httpPOST("/radar/datasets/download", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostRadarDatasetsDownloadResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getRadarDatasetsAlias*(client: CloudflareClient, alias: string): Future[AsyncResponse] {.async.} =
  ## Retrieves the CSV content of a given dataset by alias or ID. When getting the
  ## content by alias the latest dataset is returned, optionally filtered by the
  ## latest available at a given date.

  let res = await client.httpGET(fmt"/radar/datasets/{alias}")
  return res
