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
  CwsRegoMetadataOrderOption* = enum
    orderName = "name"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsRegoMetadataDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsRegoMetadata*(client: CloudflareClient,
                                          accountId: string,
                                          cursor: string = default(string),
                                          perPage: int64 = 20,
                                          order: CwsRegoMetadataOrderOption = orderCreatedAt,
                                          direction: CwsRegoMetadataDirectionOption = directionAsc,
                                          name: string = default(string),
                                          importPath: string = default(string)): Future[types.CwsPageResponseRegoMetadata] {.async.} =
  ## Returns a paginated list of Rego metadata documents in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["name"] = $name
  q["import_path"] = $importPath
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/rego-metadata", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseRegoMetadata)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsRegoMetadata*(client: CloudflareClient,
                                           accountId: string,
                                           body: types.CwsRegoMetadataBody): Future[types.CwsResponseRegoMetadata] {.async.} =
  ## Creates a JSON document that Rego can access through its import path.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/rego-metadata", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseRegoMetadata)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsRegoMetadataRegoMetadataId*(client: CloudflareClient,
                                                        accountId: string,
                                                        regoMetadataId: string): Future[types.CwsResponseRegoMetadata] {.async.} =
  ## Returns the Rego metadata document with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/rego-metadata/{regoMetadataId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseRegoMetadata)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsRegoMetadataRegoMetadataId*(client: CloudflareClient,
                                                        accountId: string,
                                                        regoMetadataId: string,
                                                        body: types.CwsRegoMetadataBody): Future[types.CwsResponseRegoMetadata] {.async.} =
  ## Replaces the metadata document's name, import path, and JSON data.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/rego-metadata/{regoMetadataId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseRegoMetadata)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsRegoMetadataRegoMetadataId*(client: CloudflareClient,
                                                           accountId: string,
                                                           regoMetadataId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the specified Rego metadata document.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/rego-metadata/{regoMetadataId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
