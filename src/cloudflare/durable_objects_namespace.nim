# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersDurableObjectsNamespaces*(client: CloudflareClient,
                                                          accountId: types.WorkersIdentifier,
                                                          page: int64 = 1,
                                                          perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns the Durable Object namespaces owned by an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/durable_objects/namespaces", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDurableObjectsNamespacesIdObjects*(client: CloudflareClient,
                                                                   accountId: types.WorkersIdentifier,
                                                                   id: types.WorkersSchemasId,
                                                                   limit: float64 = default(float64),
                                                                   cursor: string = default(string)): Future[JsonNode] {.async.} =
  ## Returns the Durable Objects in a given namespace.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/durable_objects/namespaces/{id}/objects", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
