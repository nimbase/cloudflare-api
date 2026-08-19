# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdVectorizeIndexes*(client: CloudflareClient,
                                           accountId: types.VectorizeIdentifier): Future[JsonNode] {.async.} =
  ## Returns a list of Vectorize Indexes

  let res = await client.httpGET(fmt"/accounts/{accountId}/vectorize/indexes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeIndexes*(client: CloudflareClient,
                                            accountId: types.VectorizeIdentifier,
                                            body: types.VectorizeCreateIndexRequest): Future[JsonNode] {.async.} =
  ## Creates and returns a new Vectorize Index.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/indexes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdVectorizeIndexesIndexName*(client: CloudflareClient,
                                                    accountId: types.VectorizeIdentifier,
                                                    indexName: types.VectorizeIndexName): Future[JsonNode] {.async.} =
  ## Returns the specified Vectorize Index.

  let res = await client.httpGET(fmt"/accounts/{accountId}/vectorize/indexes/{indexName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdVectorizeIndexesIndexName*(client: CloudflareClient,
                                                    accountId: types.VectorizeIdentifier,
                                                    indexName: types.VectorizeIndexName,
                                                    body: types.VectorizeUpdateIndexRequest): Future[JsonNode] {.async.} =
  ## Updates and returns the specified Vectorize Index.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/vectorize/indexes/{indexName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdVectorizeIndexesIndexName*(client: CloudflareClient,
                                                       accountId: types.VectorizeIdentifier,
                                                       indexName: types.VectorizeIndexName): Future[JsonNode] {.async.} =
  ## Deletes the specified Vectorize Index.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/vectorize/indexes/{indexName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeIndexesIndexNameDeleteByIds*(client: CloudflareClient,
                                                                accountId: types.VectorizeIdentifier,
                                                                indexName: types.VectorizeIndexName,
                                                                body: types.VectorizeIndexDeleteVectorsByIdRequest): Future[JsonNode] {.async.} =
  ## Delete a set of vectors from an index by their vector identifiers.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/indexes/{indexName}/delete-by-ids", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeIndexesIndexNameGetByIds*(client: CloudflareClient,
                                                             accountId: types.VectorizeIdentifier,
                                                             indexName: types.VectorizeIndexName,
                                                             body: types.VectorizeIndexGetVectorsByIdRequest): Future[JsonNode] {.async.} =
  ## Get a set of vectors from an index by their vector identifiers.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/indexes/{indexName}/get-by-ids", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeIndexesIndexNameInsert*(client: CloudflareClient,
                                                           accountId: types.VectorizeIdentifier,
                                                           indexName: types.VectorizeIndexName): Future[JsonNode] {.async.} =
  ## Inserts vectors into the specified index and returns the count of the vectors
  ## successfully inserted.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/indexes/{indexName}/insert")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeIndexesIndexNameQuery*(client: CloudflareClient,
                                                          accountId: types.VectorizeIdentifier,
                                                          indexName: types.VectorizeIndexName,
                                                          body: types.VectorizeIndexQueryRequest): Future[JsonNode] {.async.} =
  ## Finds vectors closest to a given vector in an index.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/indexes/{indexName}/query", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdVectorizeIndexesIndexNameUpsert*(client: CloudflareClient,
                                                           accountId: types.VectorizeIdentifier,
                                                           indexName: types.VectorizeIndexName): Future[JsonNode] {.async.} =
  ## Upserts vectors into the specified index, creating them if they do not exist and
  ## returns the count of values and ids successfully inserted.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/vectorize/indexes/{indexName}/upsert")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
