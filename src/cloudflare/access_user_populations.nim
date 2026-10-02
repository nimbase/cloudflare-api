# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessUserPopulations*(client: CloudflareClient,
                                                accountId: types.AccessIdentifier,
                                                page: int64 = 1,
                                                perPage: int64 = 100): Future[types.AccessResponseCollection3] {.async.} =
  ## Lists the user populations in an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/user_populations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection3)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessUserPopulations*(client: CloudflareClient,
                                                 accountId: types.AccessIdentifier,
                                                 body: types.AccessUserPopulationRequest): Future[types.AccessSingleResponse5] {.async.} =
  ## Creates a user population in an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/user_populations", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse5)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessUserPopulationsUserPopulationId*(client: CloudflareClient,
                                                                accountId: types.AccessIdentifier,
                                                                userPopulationId: types.AccessUuid): Future[types.AccessSingleResponse5] {.async.} =
  ## Fetches a user population.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse5)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessUserPopulationsUserPopulationId*(client: CloudflareClient,
                                                                accountId: types.AccessIdentifier,
                                                                userPopulationId: types.AccessUuid,
                                                                body: types.AccessUserPopulationRequest): Future[types.AccessSingleResponse5] {.async.} =
  ## Updates a user population's name.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse5)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessUserPopulationsUserPopulationId*(client: CloudflareClient,
                                                                   accountId: types.AccessIdentifier,
                                                                   userPopulationId: types.AccessUuid): Future[types.AccessIdResponse] {.async.} =
  ## Deletes a user population that is not attached to an application.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/user_populations/{userPopulationId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)
