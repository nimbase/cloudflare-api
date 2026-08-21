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
  ExtensionDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  ExtensionSortByOption* = enum
    sortByName = "name"
    sortByCreatedAt = "created_at"
    sortByUpdatedAt = "updated_at"


proc getAccountsAccountIdRegistrarSandboxExtensions*(client: CloudflareClient,
                                                     accountId: types.RegistrarApiSandboxIdentifier,
                                                     name: string = default(string),
                                                     cursor: string = default(string),
                                                     perPage: int64 = 20,
                                                     direction: ExtensionDirectionOption = directionAsc,
                                                     sortBy: ExtensionSortByOption = sortByName): Future[types.RegistrarApiSandboxExtensionResponseCollection] {.async.} =
  ## Returns metadata and JSON Schema documents describing the expected input
  ## structure for registration operations on each supported
  ## extension (TLD).
  ##
  ## This endpoint uses cursor-based pagination. Results are ordered by
  ## extension name by default. To fetch the next page, pass the `cursor`
  ## value from the `result_info` object in the response as the `cursor`
  ## query parameter in your next request. An empty `cursor` string
  ## indicates there are no more pages.
  ##
  ## Supports HTTP conditional GET via `ETag`. Include the `ETag` value
  ## from a previous response in an `If-None-Match` header to receive a
  ## `304 Not Modified` when the data has not changed.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["direction"] = $direction
  q["sort_by"] = $sortBy
  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar-sandbox/extensions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxExtensionResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarSandboxExtensionsExtension*(client: CloudflareClient,
                                                              accountId: types.RegistrarApiSandboxIdentifier,
                                                              extension: string): Future[types.RegistrarApiSandboxExtensionResponseSingle] {.async.} =
  ## Returns metadata and JSON Schema documents describing the expected input
  ## structure for registration operations on a specific
  ## extension (TLD).
  ##
  ## Supports HTTP conditional GET via `ETag`. Include the `ETag` value
  ## from a previous response in an `If-None-Match` header to receive a
  ## `304 Not Modified` when the data has not changed.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar-sandbox/extensions/{extension}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxExtensionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarExtensions*(client: CloudflareClient,
                                              accountId: types.RegistrarApiIdentifier,
                                              name: string = default(string),
                                              cursor: string = default(string),
                                              perPage: int64 = 20,
                                              direction: ExtensionDirectionOption = directionAsc,
                                              sortBy: ExtensionSortByOption = sortByName): Future[types.RegistrarApiExtensionResponseCollection] {.async.} =
  ## Returns metadata and JSON Schema documents describing the expected input
  ## structure for registration operations on each supported
  ## extension (TLD).
  ##
  ## This endpoint uses cursor-based pagination. Results are ordered by
  ## extension name by default. To fetch the next page, pass the `cursor`
  ## value from the `result_info` object in the response as the `cursor`
  ## query parameter in your next request. An empty `cursor` string
  ## indicates there are no more pages.
  ##
  ## Supports HTTP conditional GET via `ETag`. Include the `ETag` value
  ## from a previous response in an `If-None-Match` header to receive a
  ## `304 Not Modified` when the data has not changed.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["direction"] = $direction
  q["sort_by"] = $sortBy
  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/extensions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiExtensionResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarExtensionsExtension*(client: CloudflareClient,
                                                       accountId: types.RegistrarApiIdentifier,
                                                       extension: string): Future[types.RegistrarApiExtensionResponseSingle] {.async.} =
  ## Returns metadata and JSON Schema documents describing the expected input
  ## structure for registration operations on a specific
  ## extension (TLD).
  ##
  ## Supports HTTP conditional GET via `ETag`. Include the `ETag` value
  ## from a previous response in an `If-None-Match` header to receive a
  ## `304 Not Modified` when the data has not changed.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/extensions/{extension}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiExtensionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
