# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  CwsTenantStructureOrderOption* = enum
    orderName = "name"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsTenantStructureDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsTenantStructures*(client: CloudflareClient,
                                              accountId: string,
                                              cursor: string = default(string),
                                              perPage: int64 = 20,
                                              order: CwsTenantStructureOrderOption = orderCreatedAt,
                                              direction: CwsTenantStructureDirectionOption = directionAsc,
                                              name: string = default(string),
                                              importPath: string = default(string)): Future[types.CwsPageResponseTenantStructure] {.async.} =
  ## Returns a paginated list of tenant structures in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["name"] = $name
  q["import_path"] = $importPath
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/tenant-structures", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseTenantStructure)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsTenantStructures*(client: CloudflareClient,
                                               accountId: string,
                                               body: types.CwsCreateTenantStructureInputBody): Future[types.CwsResponseTenantStructure] {.async.} =
  ## Creates an empty tenant hierarchy for the selected cloud application.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/tenant-structures", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseTenantStructure)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsTenantStructuresStructureId*(client: CloudflareClient,
                                                         accountId: string,
                                                         structureId: string): Future[types.CwsResponseTenantStructure] {.async.} =
  ## Returns the tenant structure with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseTenantStructure)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsTenantStructuresStructureId*(client: CloudflareClient,
                                                         accountId: string,
                                                         structureId: string,
                                                         body: types.CwsUpdateTenantStructureInputBody): Future[types.CwsResponseTenantStructure] {.async.} =
  ## Updates the tenant structure's name and import path; its application remains
  ## immutable.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseTenantStructure)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsTenantStructuresStructureId*(client: CloudflareClient,
                                                            accountId: string,
                                                            structureId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the tenant structure and all nodes in its hierarchy.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsTenantStructuresStructureIdNodes*(client: CloudflareClient,
                                                              accountId: string,
                                                              structureId: string,
                                                              cursor: string = default(string),
                                                              perPage: int64 = 20,
                                                              order: CwsTenantStructureOrderOption = orderCreatedAt,
                                                              direction: CwsTenantStructureDirectionOption = directionAsc,
                                                              nodeKind: string = default(string),
                                                              nativeId: string = default(string),
                                                              name: string = default(string),
                                                              parent: string = default(string)): Future[types.CwsPageResponseTenantStructureNode] {.async.} =
  ## Returns a paginated list of nodes in the tenant structure.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["node_kind"] = $nodeKind
  q["native_id"] = $nativeId
  q["name"] = $name
  q["parent"] = $parent
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}/nodes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseTenantStructureNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsTenantStructuresStructureIdNodes*(client: CloudflareClient,
                                                               accountId: string,
                                                               structureId: string,
                                                               body: types.CwsTenantNodeBody): Future[types.CwsResponseTenantStructureNode] {.async.} =
  ## Adds a validated cloud-native node to the tenant hierarchy.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}/nodes", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseTenantStructureNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsTenantStructuresStructureIdNodesBatch*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    structureId: string,
                                                                    body: types.CwsBatchTenantNodesInputBody): Future[types.CwsResponseTenantNodeBatchResult] {.async.} =
  ## Atomically validates and applies 1 to 500 unordered node operations. Creates may
  ## reference new parents but cannot reuse a native_id deleted in the same batch.
  ## Maximum body size: 1 MiB.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}/nodes/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseTenantNodeBatchResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsTenantStructuresStructureIdNodesNodeId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    structureId: string,
                                                                    nodeId: string): Future[types.CwsResponseTenantStructureNode] {.async.} =
  ## Returns the tenant node with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}/nodes/{nodeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseTenantStructureNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsTenantStructuresStructureIdNodesNodeId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    structureId: string,
                                                                    nodeId: string,
                                                                    body: types.CwsTenantNodeBody): Future[types.CwsResponseTenantStructureNode] {.async.} =
  ## Updates the node's display name or parent while preserving its immutable
  ## identity fields.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}/nodes/{nodeId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseTenantStructureNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsTenantStructuresStructureIdNodesNodeId*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       structureId: string,
                                                                       nodeId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes a childless node from the tenant hierarchy.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/tenant-structures/{structureId}/nodes/{nodeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
