# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdVulnScannerTargetEnvironments*(client: CloudflareClient,
                                                        page: int64 = 1,
                                                        perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns all target environments for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/accounts/{account_id}/vuln_scanner/target_environments", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVulnScannerTargetEnvironments*(client: CloudflareClient,
                                                         body: types.VulnScannerCreateTargetEnvironmentRequest): Future[JsonNode] {.async.} =
  ## Creates a new target environment for the account.

  let res = await client.httpPOST("/accounts/{account_id}/vuln_scanner/target_environments", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVulnScannerTargetEnvironmentsTargetEnvironmentId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns a single target environment by ID.

  let res = await client.httpGET("/accounts/{account_id}/vuln_scanner/target_environments/{target_environment_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdVulnScannerTargetEnvironmentsTargetEnvironmentId*(client: CloudflareClient,
                                                                           body: types.VulnScannerUpdateTargetEnvironmentRequest): Future[JsonNode] {.async.} =
  ## Replaces a target environment. All fields must be provided.

  let res = await client.httpPUT("/accounts/{account_id}/vuln_scanner/target_environments/{target_environment_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdVulnScannerTargetEnvironmentsTargetEnvironmentId*(client: CloudflareClient): Future[types.VulnScannerEmptyResponse] {.async.} =
  ## Removes a target environment.

  let res = await client.httpDELETE("/accounts/{account_id}/vuln_scanner/target_environments/{target_environment_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.VulnScannerEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdVulnScannerTargetEnvironmentsTargetEnvironmentId*(client: CloudflareClient,
                                                                             body: types.VulnScannerPatchTargetEnvironmentRequest): Future[JsonNode] {.async.} =
  ## Updates a target environment with only the provided fields; omitted fields
  ## remain unchanged.

  let res = await client.httpPATCH("/accounts/{account_id}/vuln_scanner/target_environments/{target_environment_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
