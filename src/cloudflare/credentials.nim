# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentials*(client: CloudflareClient,
                                                                              page: int64 = 1,
                                                                              perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns all credentials within a credential set.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentials*(client: CloudflareClient,
                                                                               body: types.VulnScannerCreateCredentialRequest): Future[JsonNode] {.async.} =
  ## Creates a new credential within a credential set.

  let res = await client.httpPOST("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentialsCredentialId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns a single credential by ID.

  let res = await client.httpGET("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials/{credential_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentialsCredentialId*(client: CloudflareClient,
                                                                                          body: types.VulnScannerUpdateCredentialRequest): Future[JsonNode] {.async.} =
  ## Replaces a credential. All fields must be provided.

  let res = await client.httpPUT("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials/{credential_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentialsCredentialId*(client: CloudflareClient): Future[types.VulnScannerEmptyResponse] {.async.} =
  ## Deletes a credential.

  let res = await client.httpDELETE("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials/{credential_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.VulnScannerEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdVulnScannerCredentialSetsCredentialSetIdCredentialsCredentialId*(client: CloudflareClient,
                                                                                            body: types.VulnScannerPatchCredentialRequest): Future[JsonNode] {.async.} =
  ## Updates a credential with only the provided fields; omitted fields remain
  ## unchanged.

  let res = await client.httpPATCH("/accounts/{account_id}/vuln_scanner/credential_sets/{credential_set_id}/credentials/{credential_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
