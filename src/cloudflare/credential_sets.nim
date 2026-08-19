# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdVulnScannerCredentialSets*(client: CloudflareClient,
                                                    page: int64 = 1,
                                                    perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns all credential sets for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/accounts/{account_id}/vuln_scanner/credential_sets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVulnScannerCredentialSets*(client: CloudflareClient,
                                                     body: types.VulnScannerCreateCredentialSetRequest): Future[JsonNode] {.async.} =
  ## Creates a new credential set.

  let res = await client.httpPOST("/accounts/{account_id}/vuln_scanner/credential_sets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVulnScannerCredentialSetsCredentialSetId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns a single credential set by ID.

  let res = await client.httpGET("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdVulnScannerCredentialSetsCredentialSetId*(client: CloudflareClient,
                                                                   body: types.VulnScannerUpdateCredentialSetRequest): Future[JsonNode] {.async.} =
  ## Replaces a credential set. All fields must be provided.

  let res = await client.httpPUT("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdVulnScannerCredentialSetsCredentialSetId*(client: CloudflareClient): Future[types.VulnScannerEmptyResponse] {.async.} =
  ## Deletes a credential set and all of its credentials.

  let res = await client.httpDELETE("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.VulnScannerEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdVulnScannerCredentialSetsCredentialSetId*(client: CloudflareClient,
                                                                     body: types.VulnScannerPatchCredentialSetRequest): Future[JsonNode] {.async.} =
  ## Updates a credential set with only the provided fields; omitted fields remain
  ## unchanged.

  let res = await client.httpPATCH("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
