# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessUserPopulationsUserPopulationIdUsers*(client: CloudflareClient,
                                                                     accountId: types.AccessIdentifier,
                                                                     userPopulationId: types.AccessUuid,
                                                                     filter: string = default(string),
                                                                     startIndex: int64 = 1,
                                                                     count: int64 = default(int64),
                                                                     attributes: string = default(string),
                                                                     excludedAttributes: string = default(string)): Future[types.AccessScimUserCollectionResponse] {.async.} =
  ## Lists SCIM users in a user population.

  var q = initOrderedTable[string, string]()
  q["filter"] = $filter
  q["startIndex"] = $startIndex
  q["count"] = $count
  q["attributes"] = $attributes
  q["excludedAttributes"] = $excludedAttributes
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}/users", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessScimUserCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessUserPopulationsUserPopulationIdUsers*(client: CloudflareClient,
                                                                      accountId: types.AccessIdentifier,
                                                                      userPopulationId: types.AccessUuid,
                                                                      body: types.AccessScimUser): Future[types.AccessScimUserSingleResponse] {.async.} =
  ## Creates a SCIM user in a user population.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}/users", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessScimUserSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessUserPopulationsUserPopulationIdUsersUserId*(client: CloudflareClient,
                                                                           accountId: types.AccessIdentifier,
                                                                           userPopulationId: types.AccessUuid,
                                                                           userId: string,
                                                                           attributes: string = default(string),
                                                                           excludedAttributes: string = default(string)): Future[types.AccessScimUserSingleResponse] {.async.} =
  ## Fetches a SCIM user from a user population.

  var q = initOrderedTable[string, string]()
  q["attributes"] = $attributes
  q["excludedAttributes"] = $excludedAttributes
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}/users/{userId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessScimUserSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessUserPopulationsUserPopulationIdUsersUserId*(client: CloudflareClient,
                                                                           accountId: types.AccessIdentifier,
                                                                           userPopulationId: types.AccessUuid,
                                                                           userId: string,
                                                                           body: types.AccessScimUser): Future[types.AccessScimUserSingleResponse] {.async.} =
  ## Replaces a SCIM user in a user population.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}/users/{userId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessScimUserSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessUserPopulationsUserPopulationIdUsersUserId*(client: CloudflareClient,
                                                                              accountId: types.AccessIdentifier,
                                                                              userPopulationId: types.AccessUuid,
                                                                              userId: string): Future[AsyncResponse] {.async.} =
  ## Deletes a SCIM user from a user population.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}/users/{userId}")
  return res

proc patchAccountsAccountIdAccessUserPopulationsUserPopulationIdUsersUserId*(client: CloudflareClient,
                                                                             accountId: types.AccessIdentifier,
                                                                             userPopulationId: types.AccessUuid,
                                                                             userId: string,
                                                                             body: types.AccessScimPatchRequest): Future[types.AccessScimUserSingleResponse] {.async.} =
  ## Updates a SCIM user in a user population.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}/users/{userId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessScimUserSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
