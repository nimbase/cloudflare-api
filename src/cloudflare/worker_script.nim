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
  PostAccountsAccountIdWorkersScriptsScriptNameSubdomainRequest = object
    enabled: bool
    previews_enabled: Option[bool]
  PutAccountsAccountIdWorkersScriptsScriptNameUsageModelRequest = object
    usage_model: Option[types.WorkersUsageModel]
    user_limits: Option[types.WorkersUserLimits]
  WorkerScriptBase64Option* = enum
    base64True = "true"

  WorkerScriptOrderByOption* = enum
    orderByCreatedOn = "created_on"
    orderByModifiedOn = "modified_on"
    orderByName = "name"

  WorkerScriptBindingsInheritOption* = enum
    bindingsInheritStrict = "strict"


proc postAccountsAccountIdWorkersAssetsUpload*(client: CloudflareClient,
                                               accountId: types.WorkersIdentifier,
                                               base64: set[WorkerScriptBase64Option] = {}): Future[types.WorkersCompletedUploadAssetsResponse] {.async.} =
  ## Upload assets ahead of creating a Worker version.  To learn more about the
  ## direct uploads of assets, see
  ## https://developers.cloudflare.com/workers/static-assets/direct-upload/.

  var q = initOrderedTable[string, string]()
  for v in base64: q["base64"] = $v
  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/assets/upload", q)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.WorkersCompletedUploadAssetsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScripts*(client: CloudflareClient,
                                         accountId: types.WorkersIdentifier,
                                         tags: string = default(string)): Future[types.WorkersScriptResponseCollection] {.async.} =
  ## Fetch a list of uploaded workers.

  var q = initOrderedTable[string, string]()
  q["tags"] = $tags
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsSearch*(client: CloudflareClient,
                                               accountId: types.WorkersIdentifier,
                                               name: string = default(string),
                                               id: string = default(string),
                                               orderBy: string = "name",
                                               page: int64 = 1,
                                               perPage: int64 = 10): Future[JsonNode] {.async.} =
  ## Search for Workers in an account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["id"] = $id
  for v in orderBy: q["order_by"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts-search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptName*(client: CloudflareClient,
                                                   accountId: types.WorkersIdentifier,
                                                   scriptName: types.WorkersScriptName): Future[AsyncResponse] {.async.} =
  ## Fetch raw script content for your worker. Note this is the original script
  ## content, not JSON encoded.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}")
  return res

proc putAccountsAccountIdWorkersScriptsScriptName*(client: CloudflareClient,
                                                   accountId: types.WorkersIdentifier,
                                                   scriptName: types.WorkersScriptName,
                                                   bindingsInherit: set[WorkerScriptBindingsInheritOption] = {}): Future[JsonNode] {.async.} =
  ## Upload a worker module. You can find more about the multipart metadata on our
  ## docs:https://developers.cloudflare.com/workers/configuration/multipart-upload-m
  ## etadata/.

  var q = initOrderedTable[string, string]()
  for v in bindingsInherit: q["bindings_inherit"] = $v
  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/scripts/{scriptName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersScriptsScriptName*(client: CloudflareClient,
                                                      accountId: types.WorkersIdentifier,
                                                      scriptName: types.WorkersScriptName,
                                                      force: bool = default(bool)): Future[types.WorkersApiResponseNullResult] {.async.} =
  ## Delete your worker. This call has no response body on a successful delete.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/scripts/{scriptName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseNullResult)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersScriptsScriptNameAssetsUploadSession*(client: CloudflareClient,
                                                                       accountId: types.WorkersIdentifier,
                                                                       scriptName: types.WorkersScriptName,
                                                                       body: types.WorkersCreateAssetsUploadSessionObject): Future[types.WorkersCreateAssetsUploadSessionResponse] {.async.} =
  ## Start uploading a collection of assets for use in a Worker version. To learn
  ## more about the direct uploads of assets, see
  ## https://developers.cloudflare.com/workers/static-assets/direct-upload/.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/assets-upload-session", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersCreateAssetsUploadSessionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersScriptsScriptNameContent*(client: CloudflareClient,
                                                          accountId: types.WorkersIdentifier,
                                                          scriptName: types.WorkersScriptName): Future[types.WorkersScriptResponseSingle] {.async.} =
  ## Put script content without touching config or metadata.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/content")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptNameContentV2*(client: CloudflareClient,
                                                            accountId: types.WorkersIdentifier,
                                                            scriptName: types.WorkersScriptName): Future[AsyncResponse] {.async.} =
  ## Fetch script content only.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/content/v2")
  return res

proc getAccountsAccountIdWorkersScriptsScriptNameScriptSettings*(client: CloudflareClient,
                                                                 accountId: types.WorkersIdentifier,
                                                                 scriptName: types.WorkersScriptName): Future[types.WorkersScriptSettingsResponse] {.async.} =
  ## Get script-level settings when using [WorkerVersions](https://developers.cloudf
  ## lare.com/api/operations/worker-versions-list-versions). Includes Logpush and
  ## Tail Consumers.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/script-settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersScriptsScriptNameScriptSettings*(client: CloudflareClient,
                                                                   accountId: types.WorkersIdentifier,
                                                                   scriptName: types.WorkersScriptName,
                                                                   body: types.WorkersScriptSettingsItem): Future[types.WorkersScriptSettingsResponse] {.async.} =
  ## Patch script-level settings when using [WorkerVersions](https://developers.clou
  ## dflare.com/api/operations/worker-versions-list-versions). Including but not
  ## limited to Logpush and Tail Consumers.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/script-settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptNameSecrets*(client: CloudflareClient,
                                                          accountId: types.WorkersIdentifier,
                                                          scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## List secrets bound to a script.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/secrets")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersScriptsScriptNameSecrets*(client: CloudflareClient,
                                                          accountId: types.WorkersIdentifier,
                                                          scriptName: types.WorkersScriptName,
                                                          body: types.WorkersSecret): Future[JsonNode] {.async.} =
  ## Add a secret to a script.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/secrets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersScriptsScriptNameSecretsBulk*(client: CloudflareClient,
                                                                accountId: types.WorkersIdentifier,
                                                                scriptName: types.WorkersScriptName,
                                                                body: types.WorkersSecretPatchRequest): Future[JsonNode] {.async.} =
  ## Create, update, or delete multiple secrets on a script in a single operation
  ## using JSON Merge Patch (RFC 7396).
  ##
  ## Usage:
  ##
  ## - To create or update a secret, set its value to a secret object.
  ## - To delete a secret, set its value to `null`.
  ## - Secrets not included in the request are left unchanged.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/secrets-bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptNameSecretsSecretName*(client: CloudflareClient,
                                                                    accountId: types.WorkersIdentifier,
                                                                    scriptName: types.WorkersScriptName,
                                                                    secretName: types.WorkersSecretName,
                                                                    urlEncoded: types.WorkersSecretNameUrlEncoded = default(types.WorkersSecretNameUrlEncoded)): Future[JsonNode] {.async.} =
  ## Get a given secret binding (value omitted) on a script.

  var q = initOrderedTable[string, string]()
  q["url_encoded"] = $urlEncoded
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/secrets/{secretName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersScriptsScriptNameSecretsSecretName*(client: CloudflareClient,
                                                                       accountId: types.WorkersIdentifier,
                                                                       scriptName: types.WorkersScriptName,
                                                                       secretName: types.WorkersSecretName,
                                                                       urlEncoded: types.WorkersSecretNameUrlEncoded = default(types.WorkersSecretNameUrlEncoded)): Future[types.WorkersApiResponseNullResult] {.async.} =
  ## Remove a secret from a script.

  var q = initOrderedTable[string, string]()
  q["url_encoded"] = $urlEncoded
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/secrets/{secretName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseNullResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptNameSettings*(client: CloudflareClient,
                                                           accountId: types.WorkersIdentifier,
                                                           scriptName: types.WorkersScriptName): Future[types.WorkersScriptAndVersionSettingsResponse] {.async.} =
  ## Get metadata and config, such as bindings or usage model.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptAndVersionSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersScriptsScriptNameSettings*(client: CloudflareClient,
                                                             accountId: types.WorkersIdentifier,
                                                             scriptName: types.WorkersScriptName): Future[types.WorkersScriptAndVersionSettingsResponse] {.async.} =
  ## Patch metadata or config, such as bindings or usage model.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptAndVersionSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptNameSubdomain*(client: CloudflareClient,
                                                            accountId: types.WorkersIdentifier,
                                                            scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Get if the Worker is available on the workers.dev subdomain.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/subdomain")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersScriptsScriptNameSubdomain*(client: CloudflareClient,
                                                             accountId: types.WorkersIdentifier,
                                                             scriptName: types.WorkersScriptName,
                                                             body: PostAccountsAccountIdWorkersScriptsScriptNameSubdomainRequest): Future[JsonNode] {.async.} =
  ## Enable or disable the Worker on the workers.dev subdomain.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/subdomain", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersScriptsScriptNameSubdomain*(client: CloudflareClient,
                                                               accountId: types.WorkersIdentifier,
                                                               scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Disable all workers.dev subdomains for a Worker.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/subdomain")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersScriptsScriptNameUsageModel*(client: CloudflareClient,
                                                             accountId: types.WorkersIdentifier,
                                                             scriptName: types.WorkersScriptName): Future[types.WorkersUsageModelResponse] {.async.} =
  ## Fetches the Usage Model for a given Worker.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/usage-model")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersUsageModelResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersScriptsScriptNameUsageModel*(client: CloudflareClient,
                                                             accountId: types.WorkersIdentifier,
                                                             scriptName: types.WorkersScriptName,
                                                             body: PutAccountsAccountIdWorkersScriptsScriptNameUsageModelRequest): Future[types.WorkersUsageModelResponse] {.async.} =
  ## Updates the Usage Model for a given Worker. Requires a Workers Paid
  ## subscription.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/usage-model", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersUsageModelResponse)
  else:
    raise newException(CloudflareClientError, body)
