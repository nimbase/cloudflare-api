# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicRoutes*(client: CloudflareClient,
                                      accountId: types.MagicIdentifier): Future[types.MagicRoutesCollectionResponse] {.async.} =
  ## List all Magic static routes.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/routes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicRoutesCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicRoutes*(client: CloudflareClient,
                                       accountId: types.MagicIdentifier,
                                       body: types.MagicCreateRouteRequest): Future[types.MagicCreateRouteResponse] {.async.} =
  ## Creates a new Magic static route. Use `?validate_only=true` as an optional query
  ## parameter to run validation only without persisting changes.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/routes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicCreateRouteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicRoutes*(client: CloudflareClient,
                                      accountId: types.MagicIdentifier,
                                      body: types.MagicRouteUpdateManyRequest): Future[types.MagicMultipleRouteModifiedResponse] {.async.} =
  ## Update multiple Magic static routes. Use `?validate_only=true` as an optional
  ## query parameter to run validation only without persisting changes. Only fields
  ## for a route that need to be changed need be provided.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/routes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMultipleRouteModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicRoutes*(client: CloudflareClient,
                                         accountId: types.MagicIdentifier,
                                         body: types.MagicRouteDeleteManyRequest): Future[types.MagicMultipleRouteDeleteResponse] {.async.} =
  ## Delete multiple Magic static routes.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/routes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMultipleRouteDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicRoutesRouteId*(client: CloudflareClient,
                                             routeId: types.MagicIdentifier,
                                             accountId: types.MagicIdentifier): Future[types.MagicRouteSingleResponse] {.async.} =
  ## Get a specific Magic static route.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/routes/{routeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicRouteSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicRoutesRouteId*(client: CloudflareClient,
                                             routeId: types.MagicIdentifier,
                                             accountId: types.MagicIdentifier,
                                             body: types.MagicRouteUpdateRequest): Future[types.MagicRouteModifiedResponse] {.async.} =
  ## Update a specific Magic static route. Use `?validate_only=true` as an optional
  ## query parameter to run validation only without persisting changes.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/routes/{routeId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicRouteModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicRoutesRouteId*(client: CloudflareClient,
                                                routeId: types.MagicIdentifier,
                                                accountId: types.MagicIdentifier): Future[types.MagicRouteDeletedResponse] {.async.} =
  ## Disable and remove a specific Magic static route.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/routes/{routeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicRouteDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)
