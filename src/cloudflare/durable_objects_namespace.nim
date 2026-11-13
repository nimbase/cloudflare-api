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
  DurableObjectsNamespaceJurisdictionOption* = enum
    jurisdictionFedramp = "fedramp"
    jurisdictionEu = "eu"
    jurisdictionNone = "none"


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

proc getAccountsAccountIdWorkersDurableObjectsNamespacesIdExport*(client: CloudflareClient,
                                                                  accountId: types.WorkersIdentifier,
                                                                  id: types.WorkersSchemasId,
                                                                  durableObjectId: string = default(string),
                                                                  durableObjectName: string = default(string),
                                                                  jurisdiction: DurableObjectsNamespaceJurisdictionOption = jurisdictionFedramp): Future[AsyncResponse] {.async.} =
  ## Downloads a SQLite-backed Durable Object's database as a zip of main.sqlite and
  ## main.sqlite-wal, as of its last write to durable storage. If the export could
  ## not read all of the object's history, it holds the last state it could read and
  ## an INCOMPLETE.txt. Select the object by ID, or by name and jurisdiction.

  var q = initOrderedTable[string, string]()
  q["durable_object_id"] = $durableObjectId
  q["durable_object_name"] = $durableObjectName
  q["jurisdiction"] = $jurisdiction
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/durable_objects/namespaces/{id}/export", q)
  return res

proc getAccountsAccountIdWorkersDurableObjectsNamespacesIdObjects*(client: CloudflareClient,
                                                                   accountId: types.WorkersIdentifier,
                                                                   id: types.WorkersSchemasId,
                                                                   limit: float64 = default(float64),
                                                                   cursor: string = default(string)): Future[JsonNode] {.async.} =
  ## Returns the Durable Objects in a given Durable Object namespace.

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

proc postAccountsAccountIdWorkersDurableObjectsNamespacesIdQueryV2*(client: CloudflareClient,
                                                                    accountId: types.WorkersIdentifier,
                                                                    id: types.WorkersSchemasId): Future[JsonNode] {.async.} =
  ## Executes one or more SQL queries against a Durable Object.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/durable_objects/namespaces/{id}/query/v2", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
