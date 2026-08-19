# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdUrlscannerV2HarScanIdResponse* = object
    log: JsonNode
  GetAccountsAccountIdUrlscannerV2ResultScanIdResponse* = object
    data: JsonNode
    lists: JsonNode
    meta: JsonNode
    page: JsonNode
    scanner: JsonNode
    stats: JsonNode
    task: JsonNode
    verdicts: JsonNode
  PostAccountsAccountIdUrlscannerV2ScanRequest = object
    agent_readiness: Option[bool]
    country: Option[string]
    custom_headers: Option[JsonNode]
    customagent: Option[string]
    referer: Option[string]
    screenshots_resolutions: Option[seq[string]]
    url: string
    visibility: Option[string]
  PostAccountsAccountIdUrlscannerV2ScanResponse* = object
    api: string
      ## URL to api report.
    message: string
    options: JsonNode
    result: string
      ## Public URL to report.
    url: string
      ## Canonical form of submitted URL. Use this if you want to later search by URL.
    uuid: string
      ## Scan ID.
    visibility: string
      ## Submitted visibility status.
  GetAccountsAccountIdUrlscannerV2SearchResponse* = object
    results: seq[JsonNode]
  UrlScannerResolutionOption* = enum
    resolutionDesktop = "desktop"
    resolutionMobile = "mobile"
    resolutionTablet = "tablet"


proc postAccountsAccountIdUrlscannerV2Bulk*(client: CloudflareClient,
                                            accountId: string): Future[seq[JsonNode]] {.async.} =
  ## Submit URLs to scan. Check limits at
  ## https://developers.cloudflare.com/security-center/investigate/scan-limits/ and
  ## take into account scans submitted in bulk have lower priority and may take
  ## longer to finish.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/urlscanner/v2/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdUrlscannerV2DomScanId*(client: CloudflareClient,
                                                scanId: string,
                                                accountId: string): Future[AsyncResponse] {.async.} =
  ## Returns a plain text response, with the scan's DOM content as rendered by
  ## Chrome.

  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/v2/dom/{scanId}")
  return res

proc getAccountsAccountIdUrlscannerV2HarScanId*(client: CloudflareClient,
                                                scanId: string,
                                                accountId: string): Future[GetAccountsAccountIdUrlscannerV2HarScanIdResponse] {.async.} =
  ## Get a URL scan's HAR file. See HAR spec at
  ## http://www.softwareishard.com/blog/har-12-spec/.

  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/v2/har/{scanId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdUrlscannerV2HarScanIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdUrlscannerV2ResponsesResponseId*(client: CloudflareClient,
                                                          responseId: string,
                                                          accountId: string): Future[AsyncResponse] {.async.} =
  ## Returns the raw response of the network request. Find the `response_id` in the
  ## `data.requests.response.hash`.

  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/v2/responses/{responseId}")
  return res

proc getAccountsAccountIdUrlscannerV2ResultScanId*(client: CloudflareClient,
                                                   scanId: string,
                                                   accountId: string): Future[GetAccountsAccountIdUrlscannerV2ResultScanIdResponse] {.async.} =
  ## Get URL scan by uuid

  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/v2/result/{scanId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdUrlscannerV2ResultScanIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdUrlscannerV2Scan*(client: CloudflareClient,
                                            accountId: string,
                                            body: PostAccountsAccountIdUrlscannerV2ScanRequest): Future[PostAccountsAccountIdUrlscannerV2ScanResponse] {.async.} =
  ## Submit a URL to scan. Check limits at
  ## https://developers.cloudflare.com/security-center/investigate/scan-limits/.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/urlscanner/v2/scan", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdUrlscannerV2ScanResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdUrlscannerV2ScreenshotsScanIdPng*(client: CloudflareClient,
                                                           scanId: string,
                                                           accountId: string,
                                                           resolution: string = "desktop"): Future[AsyncResponse] {.async.} =
  ## Get scan's screenshot by resolution (desktop/mobile/tablet).

  var q = initOrderedTable[string, string]()
  for v in resolution: q["resolution"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/v2/screenshots/{scanId}.png", q)
  return res

proc getAccountsAccountIdUrlscannerV2Search*(client: CloudflareClient,
                                             accountId: string,
                                             size: int64 = default(int64),
                                             q: string = default(string)): Future[GetAccountsAccountIdUrlscannerV2SearchResponse] {.async.} =
  ## Use a subset of ElasticSearch Query syntax to filter scans. Some example
  ## queries:<br/> <br/>- 'path:"/bundles/jquery.js"': Searches for scans who
  ## requested resources with the given path.<br/>- 'page.asn:AS24940 AND hash:xxx':
  ## Websites hosted in AS24940 where a resource with the given hash was
  ## downloaded.<br/>- 'page.domain:microsoft* AND verdicts.malicious:true AND NOT
  ## page.domain:microsoft.com': malicious scans whose hostname starts with
  ## "microsoft".<br/>- 'apikey:me AND date:[2025-01 TO 2025-02]': my scans from 2025
  ## January to 2025 February.

  var q = initOrderedTable[string, string]()
  q["size"] = $size
  q["q"] = $q
  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/v2/search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdUrlscannerV2SearchResponse)
  else:
    raise newException(CloudflareClientError, body)
