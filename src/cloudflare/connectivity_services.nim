# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdConnectivityDirectoryServices*(client: CloudflareClient,
                                                        accountId: types.InfraAccountTag,
                                                        `type`: string = default(string),
                                                        page: int32 = 1,
                                                        perPage: int32 = 1000): Future[JsonNode] {.async.} =
  ## Lists the Workers VPC connectivity services in the account.

  var q = initOrderedTable[string, string]()
  q["type"] = $`type`
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/connectivity/directory/services", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdConnectivityDirectoryServices*(client: CloudflareClient,
                                                         accountId: types.InfraAccountTag,
                                                         body: types.InfraServiceConfig): Future[JsonNode] {.async.} =
  ## Creates a new Workers VPC connectivity service in the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/connectivity/directory/services", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdConnectivityDirectoryServicesServiceId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 serviceId: string): Future[JsonNode] {.async.} =
  ## Fetches a single Workers VPC connectivity service by its ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/connectivity/directory/services/{serviceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdConnectivityDirectoryServicesServiceId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 serviceId: string,
                                                                 body: types.InfraServiceConfig): Future[JsonNode] {.async.} =
  ## Updates an existing Workers VPC connectivity service by its ID.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/connectivity/directory/services/{serviceId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdConnectivityDirectoryServicesServiceId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    serviceId: string): Future[AsyncResponse] {.async.} =
  ## Removes a single Workers VPC connectivity service by its ID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/connectivity/directory/services/{serviceId}")
  return res
