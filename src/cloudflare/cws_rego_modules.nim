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
  CwsRegoModuleOrderOption* = enum
    orderName = "name"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsRegoModuleDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsRegoModules*(client: CloudflareClient,
                                         accountId: string,
                                         cursor: string = default(string),
                                         perPage: int64 = 20,
                                         order: CwsRegoModuleOrderOption = orderCreatedAt,
                                         direction: CwsRegoModuleDirectionOption = directionAsc,
                                         name: string = default(string),
                                         packagePath: string = default(string)): Future[types.CwsPageResponseRegoModule] {.async.} =
  ## Returns a paginated list of library Rego modules in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["name"] = $name
  q["package_path"] = $packagePath
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/rego-modules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseRegoModule)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsRegoModules*(client: CloudflareClient,
                                          accountId: string,
                                          body: types.CwsCreateRegoModuleInputBody): Future[types.CwsResponseRegoModule] {.async.} =
  ## Creates a library Rego module and derives its package path from the source.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/rego-modules", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseRegoModule)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsRegoModulesRegoModuleId*(client: CloudflareClient,
                                                     accountId: string,
                                                     regoModuleId: string): Future[types.CwsResponseRegoModule] {.async.} =
  ## Returns the library Rego module with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/rego-modules/{regoModuleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseRegoModule)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsRegoModulesRegoModuleId*(client: CloudflareClient,
                                                     accountId: string,
                                                     regoModuleId: string,
                                                     body: types.CwsUpdateRegoModuleInputBody): Future[types.CwsResponseRegoModule] {.async.} =
  ## Replaces the module and validates policies and libraries that depend on it.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/rego-modules/{regoModuleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseRegoModule)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsRegoModulesRegoModuleId*(client: CloudflareClient,
                                                        accountId: string,
                                                        regoModuleId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the module if no policy or library references its rules.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/rego-modules/{regoModuleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
