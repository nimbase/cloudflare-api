# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdHyperdriveConfigs*(client: CloudflareClient,
                                            accountId: types.HyperdriveIdentifier,
                                            page: int64 = 1, perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns a list of Hyperdrives.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/hyperdrive/configs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdHyperdriveConfigs*(client: CloudflareClient,
                                             accountId: types.HyperdriveIdentifier,
                                             body: types.HyperdriveHyperdriveConfig): Future[JsonNode] {.async.} =
  ## Creates and returns a new Hyperdrive configuration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/hyperdrive/configs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdHyperdriveConfigsHyperdriveId*(client: CloudflareClient,
                                                        accountId: types.HyperdriveIdentifier,
                                                        hyperdriveId: types.HyperdriveIdentifier): Future[JsonNode] {.async.} =
  ## Returns the specified Hyperdrive configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/hyperdrive/configs/{hyperdriveId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdHyperdriveConfigsHyperdriveId*(client: CloudflareClient,
                                                        accountId: types.HyperdriveIdentifier,
                                                        hyperdriveId: types.HyperdriveIdentifier,
                                                        body: types.HyperdriveHyperdriveConfig): Future[JsonNode] {.async.} =
  ## Replaces and returns the specified Hyperdrive configuration. The request must
  ## include the name and complete origin connection details. Omitted caching
  ## settings are reset to their defaults, while omitted mTLS settings and origin
  ## connection limits are preserved. Use the update operation to modify only
  ## selected fields.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/hyperdrive/configs/{hyperdriveId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdHyperdriveConfigsHyperdriveId*(client: CloudflareClient,
                                                           accountId: types.HyperdriveIdentifier,
                                                           hyperdriveId: types.HyperdriveIdentifier): Future[JsonNode] {.async.} =
  ## Deletes the specified Hyperdrive.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/hyperdrive/configs/{hyperdriveId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdHyperdriveConfigsHyperdriveId*(client: CloudflareClient,
                                                          accountId: types.HyperdriveIdentifier,
                                                          hyperdriveId: types.HyperdriveIdentifier,
                                                          body: types.HyperdriveHyperdriveConfigPatch): Future[JsonNode] {.async.} =
  ## Updates and returns the specified fields of the Hyperdrive configuration. Custom
  ## caching settings are not kept if caching is disabled.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/hyperdrive/configs/{hyperdriveId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdHyperdriveConfigsHyperdriveIdRestart*(client: CloudflareClient,
                                                                accountId: types.HyperdriveIdentifier,
                                                                hyperdriveId: types.HyperdriveIdentifier): Future[JsonNode] {.async.} =
  ## Restarts the connection pool for the specified Hyperdrive configuration without
  ## changing its configuration. Existing connections are drained and a new pool is
  ## established at the edge.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/hyperdrive/configs/{hyperdriveId}/restart")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdHyperdriveIntegrationsOperationsIntegrationCreateDatabaseSignature*(client: CloudflareClient,
                                                                                              accountId: types.HyperdriveIdentifier,
                                                                                              integration: types.HyperdriveHyperdriveIntegration): Future[JsonNode] {.async.} =
  ## Returns a short-lived signed authorization for creating a database that is
  ## billed through Cloudflare. The caller passes these values to the integration
  ## partner's own CLI, which verifies the signature before creating the database.
  ## Requires the account to be entitled to Cloudflare-billed databases for the
  ## integration.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/hyperdrive/integrationsOperations/{integration}/createDatabaseSignature")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
