# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdUrlscannerScanResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
      ## Whether search request was successful or not
  PostAccountsAccountIdUrlscannerScanRequest = object
    country: Option[string]
    custom_headers: Option[JsonNode]
    screenshots_resolutions: Option[seq[string]]
    url: string
    visibility: Option[string]
  PostAccountsAccountIdUrlscannerScanResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  GetAccountsAccountIdUrlscannerScanScanIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
      ## Whether request was successful or not
  GetAccountsAccountIdUrlscannerScanScanIdHarResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
      ## Whether search request was successful or not
  UrlScannerDeprecatedResolutionOption* = enum
    resolutionDesktop = "desktop"
    resolutionMobile = "mobile"
    resolutionTablet = "tablet"


proc getAccountsAccountIdUrlscannerResponseResponseId*(client: CloudflareClient,
                                                       responseId: string,
                                                       accountId: string): Future[AsyncResponse] {.async.} =
  ## Returns the plain response of the network request.

  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/response/{responseId}")
  return res

proc getAccountsAccountIdUrlscannerScan*(client: CloudflareClient,
                                         accountId: string,
                                         scanId: string = default(string),
                                         limit: int64 = default(int64),
                                         nextCursor: string = default(string),
                                         dateStart: string = default(string),
                                         dateEnd: string = default(string),
                                         url: string = default(string),
                                         hostname: string = default(string),
                                         path: string = default(string),
                                         ip: string = default(string),
                                         hash: string = default(string),
                                         pageUrl: string = default(string),
                                         pageHostname: string = default(string),
                                         pagePath: string = default(string),
                                         pageAsn: string = default(string),
                                         pageIp: string = default(string),
                                         accountScans: bool = default(bool),
                                         isMalicious: bool = default(bool)): Future[GetAccountsAccountIdUrlscannerScanResponse] {.async.} =
  ## Search scans by date and webpages' requests, including full URL (after
  ## redirects), hostname, and path. <br/> A successful scan will appear in search
  ## results a few minutes after finishing but may take much longer if the system in
  ## under load. By default, only successfully completed scans will appear in search
  ## results, unless searching by `scanId`. Please take into account that older scans
  ## may be removed from the search index at an unspecified time.

  var q = initOrderedTable[string, string]()
  q["scan_id"] = $scanId
  q["limit"] = $limit
  q["next_cursor"] = $nextCursor
  q["date_start"] = $dateStart
  q["date_end"] = $dateEnd
  q["url"] = $url
  q["hostname"] = $hostname
  q["path"] = $path
  q["ip"] = $ip
  q["hash"] = $hash
  q["page_url"] = $pageUrl
  q["page_hostname"] = $pageHostname
  q["page_path"] = $pagePath
  q["page_asn"] = $pageAsn
  q["page_ip"] = $pageIp
  q["account_scans"] = $accountScans
  q["is_malicious"] = $isMalicious
  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/scan", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdUrlscannerScanResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdUrlscannerScan*(client: CloudflareClient,
                                          accountId: string,
                                          body: PostAccountsAccountIdUrlscannerScanRequest): Future[PostAccountsAccountIdUrlscannerScanResponse] {.async.} =
  ## Submit a URL to scan. You can also set some options, like the visibility level
  ## and custom headers. Check limits at
  ## https://developers.cloudflare.com/security-center/investigate/scan-limits/.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/urlscanner/scan", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdUrlscannerScanResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdUrlscannerScanScanId*(client: CloudflareClient,
                                               scanId: string, accountId: string,
                                               full: bool = default(bool)): Future[GetAccountsAccountIdUrlscannerScanScanIdResponse] {.async.} =
  ## Get URL scan by uuid

  var q = initOrderedTable[string, string]()
  q["full"] = $full
  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/scan/{scanId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdUrlscannerScanScanIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdUrlscannerScanScanIdHar*(client: CloudflareClient,
                                                  scanId: string,
                                                  accountId: string): Future[GetAccountsAccountIdUrlscannerScanScanIdHarResponse] {.async.} =
  ## Get a URL scan's HAR file. See HAR spec at
  ## http://www.softwareishard.com/blog/har-12-spec/.

  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/scan/{scanId}/har")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdUrlscannerScanScanIdHarResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdUrlscannerScanScanIdScreenshot*(client: CloudflareClient,
                                                         scanId: string,
                                                         accountId: string,
                                                         resolution: UrlScannerDeprecatedResolutionOption = resolutionDesktop): Future[GetAccountsAccountIdUrlscannerScanScanIdScreenshotResponse] {.async.} =
  ## Get scan's screenshot by resolution (desktop/mobile/tablet).

  var q = initOrderedTable[string, string]()
  q["resolution"] = $resolution
  let res = await client.httpGET(fmt"/accounts/{accountId}/urlscanner/scan/{scanId}/screenshot", q)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, GetAccountsAccountIdUrlscannerScanScanIdScreenshotResponse)
  else:
    raise newException(CloudflareClientError, body)
