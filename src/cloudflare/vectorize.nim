# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  VectorizeUnparsableBehaviorOption* = enum
    unparsableBehaviorError = "error"
    unparsableBehaviorDiscard = "discard"


proc getAccountsAccountIdVectorizeV2Indexes*(client: CloudflareClient,
                                             accountId: types.VectorizeIdentifier): Future[JsonNode] {.async.} =
  ## Returns a list of Vectorize Indexes

  let res = await client.httpGET(fmt"/accounts/{accountId}/vectorize/v2/indexes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeV2Indexes*(client: CloudflareClient,
                                              accountId: types.VectorizeIdentifier,
                                              body: types.VectorizeCreateIndexRequest): Future[JsonNode] {.async.} =
  ## Creates and returns a new Vectorize Index.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/v2/indexes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVectorizeV2IndexesIndexName*(client: CloudflareClient,
                                                      accountId: types.VectorizeIdentifier,
                                                      indexName: types.VectorizeIndexName): Future[JsonNode] {.async.} =
  ## Returns the specified Vectorize Index.

  let res = await client.httpGET(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdVectorizeV2IndexesIndexName*(client: CloudflareClient,
                                                         accountId: types.VectorizeIdentifier,
                                                         indexName: types.VectorizeIndexName): Future[JsonNode] {.async.} =
  ## Deletes the specified Vectorize Index.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeV2IndexesIndexNameDeleteByIds*(client: CloudflareClient,
                                                                  accountId: types.VectorizeIdentifier,
                                                                  indexName: types.VectorizeIndexName,
                                                                  body: types.VectorizeIndexDeleteVectorsByIdRequest): Future[JsonNode] {.async.} =
  ## Delete a set of vectors from an index by their vector identifiers.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/delete_by_ids", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeV2IndexesIndexNameGetByIds*(client: CloudflareClient,
                                                               accountId: types.VectorizeIdentifier,
                                                               indexName: types.VectorizeIndexName,
                                                               body: types.VectorizeIndexGetVectorsByIdRequest): Future[JsonNode] {.async.} =
  ## Get a set of vectors from an index by their vector identifiers.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/get_by_ids", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVectorizeV2IndexesIndexNameInfo*(client: CloudflareClient,
                                                          accountId: types.VectorizeIdentifier,
                                                          indexName: types.VectorizeIndexName): Future[JsonNode] {.async.} =
  ## Get information about a vectorize index.

  let res = await client.httpGET(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/info")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeV2IndexesIndexNameInsert*(client: CloudflareClient,
                                                             accountId: types.VectorizeIdentifier,
                                                             indexName: types.VectorizeIndexName,
                                                             unparsableBehavior: VectorizeUnparsableBehaviorOption): Future[JsonNode] {.async.} =
  ## Inserts vectors into the specified index and returns a mutation id corresponding
  ## to the vectors enqueued for insertion.

  var q = initOrderedTable[string, string]()
  q["unparsable-behavior"] = $unparsableBehavior
  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/insert", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVectorizeV2IndexesIndexNameList*(client: CloudflareClient,
                                                          accountId: types.VectorizeIdentifier,
                                                          indexName: types.VectorizeIndexName,
                                                          count: int64 = 100,
                                                          cursor: string = default(string)): Future[JsonNode] {.async.} =
  ## Returns a paginated list of vector identifiers from the specified index.

  var q = initOrderedTable[string, string]()
  q["count"] = $count
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/list", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeV2IndexesIndexNameMetadataIndexCreate*(client: CloudflareClient,
                                                                          accountId: types.VectorizeIdentifier,
                                                                          indexName: types.VectorizeIndexName,
                                                                          body: types.VectorizeCreateMetadataIndexRequest): Future[JsonNode] {.async.} =
  ## Enable metadata filtering based on metadata property. Limited to 10 properties.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/metadata_index/create", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeV2IndexesIndexNameMetadataIndexDelete*(client: CloudflareClient,
                                                                          accountId: types.VectorizeIdentifier,
                                                                          indexName: types.VectorizeIndexName,
                                                                          body: types.VectorizeDeleteMetadataIndexRequest): Future[JsonNode] {.async.} =
  ## Allow Vectorize to delete the specified metadata index.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/metadata_index/delete", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVectorizeV2IndexesIndexNameMetadataIndexList*(client: CloudflareClient,
                                                                       accountId: types.VectorizeIdentifier,
                                                                       indexName: types.VectorizeIndexName): Future[JsonNode] {.async.} =
  ## List Metadata Indexes for the specified Vectorize Index.

  let res = await client.httpGET(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/metadata_index/list")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeV2IndexesIndexNameQuery*(client: CloudflareClient,
                                                            accountId: types.VectorizeIdentifier,
                                                            indexName: types.VectorizeIndexName,
                                                            body: types.VectorizeIndexQueryV2Request): Future[JsonNode] {.async.} =
  ## Finds vectors closest to a given vector in an index.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/query", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeV2IndexesIndexNameUpsert*(client: CloudflareClient,
                                                             accountId: types.VectorizeIdentifier,
                                                             indexName: types.VectorizeIndexName,
                                                             unparsableBehavior: VectorizeUnparsableBehaviorOption): Future[JsonNode] {.async.} =
  ## Upserts vectors into the specified index, creating them if they do not exist and
  ## returns a mutation id corresponding to the vectors enqueued for upsertion.

  var q = initOrderedTable[string, string]()
  q["unparsable-behavior"] = $unparsableBehavior
  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/v2/indexes/{indexName}/upsert", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
