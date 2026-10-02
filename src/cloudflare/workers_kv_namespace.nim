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
  PostAccountsAccountIdStorageKvNamespacesNamespaceIdBulkGetRequest = object
    keys: seq[types.WorkersKvKeyNameBulk]
    `type`: Option[string]
    with_metadata: Option[bool]
  WorkersKvNamespaceOrderOption* = enum
    orderId = "id"
    orderTitle = "title"

  WorkersKvNamespaceDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdStorageKvNamespaces*(client: CloudflareClient,
                                              accountId: types.WorkersKvIdentifier,
                                              page: float64 = default(float64),
                                              perPage: float64 = default(float64),
                                              order: WorkersKvNamespaceOrderOption = orderId,
                                              direction: WorkersKvNamespaceDirectionOption = directionAsc): Future[JsonNode] {.async.} =
  ## Lists Workers KV namespaces owned by the specified account. Use `page` and
  ## `per_page` to select a page of results, and `order` and `direction` to control
  ## sorting.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/storage/kv/namespaces", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStorageKvNamespaces*(client: CloudflareClient,
                                               accountId: types.WorkersKvIdentifier,
                                               body: types.WorkersKvCreateNamespaceBody): Future[JsonNode] {.async.} =
  ## Creates a Workers KV namespace in the specified account with the given title.
  ## Returns `400` if the account already owns a namespace with that title; an
  ## existing namespace must be explicitly deleted before it can be replaced. An
  ## optional jurisdiction restricts where data is durably stored and can only be set
  ## at creation time.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/storage/kv/namespaces", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStorageKvNamespacesNamespaceId*(client: CloudflareClient,
                                                         namespaceId: types.WorkersKvNamespaceIdentifier,
                                                         accountId: types.WorkersKvIdentifier): Future[JsonNode] {.async.} =
  ## Returns the Workers KV namespace for the specified account and namespace ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdStorageKvNamespacesNamespaceId*(client: CloudflareClient,
                                                         namespaceId: types.WorkersKvNamespaceIdentifier,
                                                         accountId: types.WorkersKvIdentifier,
                                                         body: types.WorkersKvCreateRenameNamespaceBody): Future[JsonNode] {.async.} =
  ## Changes the title of the specified Workers KV namespace and returns the updated
  ## namespace. The namespace ID and stored key-value pairs are unchanged.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStorageKvNamespacesNamespaceId*(client: CloudflareClient,
                                                            namespaceId: types.WorkersKvNamespaceIdentifier,
                                                            accountId: types.WorkersKvIdentifier): Future[types.WorkersKvApiResponseCommonNoResult] {.async.} =
  ## Deletes the specified Workers KV namespace and its stored key-value pairs from
  ## the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersKvApiResponseCommonNoResult)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdStorageKvNamespacesNamespaceIdBulk*(client: CloudflareClient,
                                                             namespaceId: types.WorkersKvNamespaceIdentifier,
                                                             accountId: types.WorkersKvIdentifier,
                                                             body: types.WorkersKvBulkWrite): Future[JsonNode] {.async.} =
  ## Writes up to 10,000 key-value pairs to the specified Workers KV namespace from a
  ## JSON array, with optional metadata and expiration settings for each pair.
  ## Existing values and expirations are overwritten. If neither `expiration` nor
  ## `expiration_ttl` is specified, the key-value pair will not expire. If both are
  ## set, `expiration_ttl` takes precedence. The entire request must be 100 megabytes
  ## or less. The result reports the number of successful writes and any keys that
  ## failed and should be retried.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStorageKvNamespacesNamespaceIdBulk*(client: CloudflareClient,
                                                                namespaceId: types.WorkersKvNamespaceIdentifier,
                                                                accountId: types.WorkersKvIdentifier,
                                                                body: types.WorkersKvBulkDelete): Future[JsonNode] {.async.} =
  ## Remove multiple KV pairs from the namespace. Body should be an array of up to
  ## 10,000 keys to be removed.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStorageKvNamespacesNamespaceIdBulkDelete*(client: CloudflareClient,
                                                                    namespaceId: types.WorkersKvNamespaceIdentifier,
                                                                    accountId: types.WorkersKvIdentifier,
                                                                    body: types.WorkersKvBulkDelete): Future[JsonNode] {.async.} =
  ## Deletes up to 10,000 key-value pairs from the specified Workers KV namespace.
  ## Send a JSON array of the key names to delete. The result reports the number of
  ## successful deletions and any keys that failed and should be retried.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/bulk/delete", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStorageKvNamespacesNamespaceIdBulkGet*(client: CloudflareClient,
                                                                 namespaceId: types.WorkersKvNamespaceIdentifier,
                                                                 accountId: types.WorkersKvIdentifier,
                                                                 body: PostAccountsAccountIdStorageKvNamespacesNamespaceIdBulkGetRequest): Future[JsonNode] {.async.} =
  ## Retrieves the text-based values of up to 100 keys from the specified Workers KV
  ## namespace. The result maps each requested key to its value. Set `type` to `json`
  ## to parse JSON values instead of returning strings, and set `withMetadata` to
  ## `true` to include metadata with each value. Binary values are not supported by
  ## this operation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/bulk/get", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStorageKvNamespacesNamespaceIdKeys*(client: CloudflareClient,
                                                             namespaceId: types.WorkersKvNamespaceIdentifier,
                                                             accountId: types.WorkersKvIdentifier,
                                                             limit: float64 = default(float64),
                                                             prefix: string = default(string),
                                                             cursor: string = default(string)): Future[JsonNode] {.async.} =
  ## Lists key names in the specified Workers KV namespace, with expiration times and
  ## metadata when present. Use `prefix` to filter names and `cursor` to request the
  ## next page. Values are not included.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["prefix"] = $prefix
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/keys", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStorageKvNamespacesNamespaceIdMetadataKeyName*(client: CloudflareClient,
                                                                        keyName: types.WorkersKvKeyName,
                                                                        namespaceId: types.WorkersKvNamespaceIdentifier,
                                                                        accountId: types.WorkersKvIdentifier): Future[JsonNode] {.async.} =
  ## Returns the JSON metadata associated with the specified key in the Workers KV
  ## namespace, without retrieving its value. Use URL-encoding for special characters
  ## (for example, `:`, `!`, `%`) in the key name when constructing the request URL.

  let res = await client.httpGET(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/metadata/{keyName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStorageKvNamespacesNamespaceIdValuesKeyName*(client: CloudflareClient,
                                                                      keyName: types.WorkersKvKeyName,
                                                                      namespaceId: types.WorkersKvNamespaceIdentifier,
                                                                      accountId: types.WorkersKvIdentifier): Future[AsyncResponse] {.async.} =
  ## Returns the value stored under the specified key in the Workers KV namespace as
  ## raw bytes. Use URL-encoding for special characters (for example, `:`, `!`, `%`)
  ## in the key name when constructing the request URL. If the key-value pair
  ## expires, the `expiration` response header contains its expiration time in
  ## seconds since the UNIX epoch.

  let res = await client.httpGET(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/values/{keyName}")
  return res

proc putAccountsAccountIdStorageKvNamespacesNamespaceIdValuesKeyName*(client: CloudflareClient,
                                                                      keyName: types.WorkersKvKeyName,
                                                                      namespaceId: types.WorkersKvNamespaceIdentifier,
                                                                      accountId: types.WorkersKvIdentifier,
                                                                      expiration: types.WorkersKvExpiration = default(types.WorkersKvExpiration),
                                                                      expirationTtl: types.WorkersKvExpirationTtl = default(types.WorkersKvExpirationTtl)): Future[types.WorkersKvApiResponseCommonNoResult] {.async.} =
  ## Writes a value under the specified key in the Workers KV namespace, creating the
  ## key-value pair or replacing its existing value, expiration, and metadata. Send
  ## the value as an `application/octet-stream` request body, or use
  ## `multipart/form-data` with a `value` part and an optional JSON `metadata` part.
  ## Use URL-encoding for special characters (for example, `:`, `!`, `%`) in the key
  ## name when constructing the request URL. If neither `expiration` nor
  ## `expiration_ttl` is specified, the key-value pair will not expire. If both are
  ## set, `expiration_ttl` takes precedence.

  var q = initOrderedTable[string, string]()
  q["expiration"] = $expiration
  q["expiration_ttl"] = $expirationTtl
  let res = await client.httpPUT(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/values/{keyName}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersKvApiResponseCommonNoResult)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStorageKvNamespacesNamespaceIdValuesKeyName*(client: CloudflareClient,
                                                                         keyName: types.WorkersKvKeyName,
                                                                         namespaceId: types.WorkersKvNamespaceIdentifier,
                                                                         accountId: types.WorkersKvIdentifier): Future[types.WorkersKvApiResponseCommonNoResult] {.async.} =
  ## Deletes the specified key and its value from the Workers KV namespace. Use
  ## URL-encoding for special characters (for example, `:`, `!`, `%`) in the key name
  ## when constructing the request URL.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/values/{keyName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersKvApiResponseCommonNoResult)
  else:
    raise newException(CloudflareClientError, body)
