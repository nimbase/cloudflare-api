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
                                              order: WorkersKvNamespaceOrderOption,
                                              direction: WorkersKvNamespaceDirectionOption): Future[JsonNode] {.async.} =
  ## Returns the namespaces owned by an account.

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
  ## Creates a namespace under the given title. A `400` is returned if the account
  ## already owns a namespace with this title. A namespace must be explicitly deleted
  ## to be replaced.

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
  ## Get the namespace corresponding to the given ID.

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
  ## Modifies a namespace's title.

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
  ## Deletes the namespace corresponding to the given ID.

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
  ## Write multiple keys and values at once. Body should be an array of up to 10,000
  ## key-value pairs to be stored, along with optional expiration information.
  ## Existing values and expirations will be overwritten. If neither `expiration` nor
  ## `expiration_ttl` is specified, the key-value pair will never expire. If both are
  ## set, `expiration_ttl` is used and `expiration` is ignored. The entire request
  ## size must be 100 megabytes or less.

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
  ## Remove multiple KV pairs from the namespace. Body should be an array of up to
  ## 10,000 keys to be removed.

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
  ## Retrieve up to 100 KV pairs from the namespace. Keys must contain text-based
  ## values. JSON values can optionally be parsed instead of being returned as a
  ## string value. Metadata can be included if `withMetadata` is true.

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
  ## Lists a namespace's keys.

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
  ## Returns the metadata associated with the given key in the given namespace. Use
  ## URL-encoding to use special characters (for example, `:`, `!`, `%`) in the key
  ## name.

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
  ## Returns the value associated with the given key in the given namespace. Use
  ## URL-encoding to use special characters (for example, `:`, `!`, `%`) in the key
  ## name. If the KV-pair is set to expire at some point, the expiration time as
  ## measured in seconds since the UNIX epoch will be returned in the `expiration`
  ## response header.

  let res = await client.httpGET(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/values/{keyName}")
  return res

proc putAccountsAccountIdStorageKvNamespacesNamespaceIdValuesKeyName*(client: CloudflareClient,
                                                                      keyName: types.WorkersKvKeyName,
                                                                      namespaceId: types.WorkersKvNamespaceIdentifier,
                                                                      accountId: types.WorkersKvIdentifier,
                                                                      expiration: types.WorkersKvExpiration = default(types.WorkersKvExpiration),
                                                                      expirationTtl: types.WorkersKvExpirationTtl = default(types.WorkersKvExpirationTtl)): Future[types.WorkersKvApiResponseCommonNoResult] {.async.} =
  ## Write a value identified by a key. Use URL-encoding to use special characters
  ## (for example, `:`, `!`, `%`) in the key name. Body should be the value to be
  ## stored. If JSON metadata to be associated with the key/value pair is needed, use
  ## `multipart/form-data` content type for your PUT request (see dropdown below in
  ## `REQUEST BODY SCHEMA`). Existing values, expirations, and metadata will be
  ## overwritten. If neither `expiration` nor `expiration_ttl` is specified, the
  ## key-value pair will never expire. If both are set, `expiration_ttl` is used and
  ## `expiration` is ignored.

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
  ## Remove a KV pair from the namespace. Use URL-encoding to use special characters
  ## (for example, `:`, `!`, `%`) in the key name.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/storage/kv/namespaces/{namespaceId}/values/{keyName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersKvApiResponseCommonNoResult)
  else:
    raise newException(CloudflareClientError, body)
