# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdLogpushTransformers*(client: CloudflareClient,
                                              accountId: types.LogpushIdentifier): Future[types.LogpushTransformerResponseCollection] {.async.} =
  ## Lists all custom log transformers for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logpush/transformers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushTransformerResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogpushTransformers*(client: CloudflareClient,
                                               accountId: types.LogpushIdentifier,
                                               body: types.LogpushTransformerCreateRequest): Future[types.LogpushTransformerResponseSingle] {.async.} =
  ## Creates a new custom log transformer for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logpush/transformers", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.LogpushTransformerResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogpushTransformersPreview*(client: CloudflareClient,
                                                      accountId: types.LogpushIdentifier,
                                                      body: types.LogpushTransformerPreviewRequest): Future[types.LogpushTransformerPreviewResponse] {.async.} =
  ## Executes a SQL transformer against a single input record and returns the
  ## transformed output. This is a stateless endpoint — nothing is persisted.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logpush/transformers/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushTransformerPreviewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogpushTransformersTransformerId*(client: CloudflareClient,
                                                           accountId: types.LogpushIdentifier,
                                                           transformerId: types.LogpushTransformerIdentifier): Future[types.LogpushTransformerResponseSingle] {.async.} =
  ## Gets a single custom log transformer by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logpush/transformers/{transformerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushTransformerResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdLogpushTransformersTransformerId*(client: CloudflareClient,
                                                           accountId: types.LogpushIdentifier,
                                                           transformerId: types.LogpushTransformerIdentifier,
                                                           body: types.LogpushTransformerUpdateRequest): Future[types.LogpushTransformerResponseSingle] {.async.} =
  ## Updates an existing custom log transformer. When `code` is provided, the SQL
  ## query is validated and a new version is created. When `code` is omitted, only
  ## the name and description are updated. Omitting `description` clears the existing
  ## description.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/logpush/transformers/{transformerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushTransformerResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdLogpushTransformersTransformerId*(client: CloudflareClient,
                                                              accountId: types.LogpushIdentifier,
                                                              transformerId: types.LogpushTransformerIdentifier): Future[types.LogpushTransformerDeleteResponse] {.async.} =
  ## Deletes a custom log transformer. Returns 409 Conflict if any active logpush
  ## jobs reference the transformer.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/logpush/transformers/{transformerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushTransformerDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogpushTransformersTransformerIdContent*(client: CloudflareClient,
                                                                  accountId: types.LogpushIdentifier,
                                                                  transformerId: types.LogpushTransformerIdentifier,
                                                                  versionId: int64 = default(int64)): Future[types.LogpushTransformerContentResponse] {.async.} =
  ## Returns the SQL query content for a transformer. Without query params, returns
  ## the latest version. With `version_id`, returns the specified version.

  var q = initOrderedTable[string, string]()
  q["version_id"] = $versionId
  let res = await client.httpGET(fmt"/accounts/{accountId}/logpush/transformers/{transformerId}/content", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushTransformerContentResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogpushTransformersTransformerIdVersions*(client: CloudflareClient,
                                                                   accountId: types.LogpushIdentifier,
                                                                   transformerId: types.LogpushTransformerIdentifier,
                                                                   limit: int64 = 10): Future[types.LogpushTransformerVersionResponseCollection] {.async.} =
  ## Returns version metadata for a transformer, newest first. Each version
  ## corresponds to a SQL query update.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/logpush/transformers/{transformerId}/versions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushTransformerVersionResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
