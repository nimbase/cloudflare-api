# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdCloudforceOneScansConfigRequest = object
    frequency: Option[types.CloudforceOnePortScanApiFrequency]
    ips: types.CloudforceOnePortScanApiIps
    ports: Option[types.CloudforceOnePortScanApiPorts]
  DeleteAccountsAccountIdCloudforceOneScansConfigConfigIdResponse* = object
    errors: seq[string]
    messages: seq[string]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdCloudforceOneScansConfigConfigIdRequest = object
    frequency: Option[types.CloudforceOnePortScanApiFrequency]
    ips: Option[types.CloudforceOnePortScanApiIps]
    ports: Option[types.CloudforceOnePortScanApiPorts]
  GetAccountsAccountIdCloudforceOneScansResultsConfigIdResponse* = object
    errors: seq[string]
    messages: seq[string]
    result: JsonNode
    success: bool

proc getAccountsAccountIdCloudforceOneScansConfig*(client: CloudflareClient,
                                                   accountId: string): Future[JsonNode] {.async.} =
  ## List Scan Configs

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/scans/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneScansConfig*(client: CloudflareClient,
                                                    accountId: string,
                                                    body: PostAccountsAccountIdCloudforceOneScansConfigRequest): Future[JsonNode] {.async.} =
  ## Create a new Scan Config

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/scans/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneScansConfigConfigId*(client: CloudflareClient,
                                                              accountId: string,
                                                              configId: string): Future[DeleteAccountsAccountIdCloudforceOneScansConfigConfigIdResponse] {.async.} =
  ## Delete a Scan Config

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/scans/config/{configId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneScansConfigConfigIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneScansConfigConfigId*(client: CloudflareClient,
                                                             accountId: string,
                                                             configId: string,
                                                             body: PatchAccountsAccountIdCloudforceOneScansConfigConfigIdRequest): Future[JsonNode] {.async.} =
  ## Update an existing Scan Config

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/scans/config/{configId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneScansResultsConfigId*(client: CloudflareClient,
                                                            accountId: string,
                                                            configId: string): Future[GetAccountsAccountIdCloudforceOneScansResultsConfigIdResponse] {.async.} =
  ## Get the Latest Scan Result

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/scans/results/{configId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneScansResultsConfigIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVulnScannerScans*(client: CloudflareClient,
                                           page: int64 = 1, perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns all scans for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/accounts/{account_id}/vuln_scanner/scans", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVulnScannerScans*(client: CloudflareClient,
                                            body: types.VulnScannerCreateScanRequest): Future[JsonNode] {.async.} =
  ## Creates and starts a new vulnerability scan. The response may include
  ## non-fatal warnings in the `messages` array.

  let res = await client.httpPOST("/accounts/{account_id}/vuln_scanner/scans", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVulnScannerScansScanId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns a single scan by ID.

  let res = await client.httpGET("/accounts/{account_id}/vuln_scanner/scans/{scan_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdVulnScannerScansScanId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Deletes a scan and all associated data.
  ##
  ## Only scans in a terminal state (`finished`, `failed`) may be deleted.
  ## Attempting to delete a scan that is still being created or executed
  ## (`created`, `scheduled`, `planning`, `running`) returns `400`.

  let res = await client.httpDELETE("/accounts/{account_id}/vuln_scanner/scans/{scan_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
