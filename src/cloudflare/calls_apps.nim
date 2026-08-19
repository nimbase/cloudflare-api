# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdCallsApps*(client: CloudflareClient,
                                    accountId: types.CallsAccountIdentifier): Future[types.CallsAppResponseCollection] {.async.} =
  ## Lists all apps in the Cloudflare account

  let res = await client.httpGET(fmt"/accounts/{accountId}/calls/apps")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CallsAppResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCallsApps*(client: CloudflareClient,
                                     accountId: types.CallsAccountIdentifier,
                                     body: types.CallsAppEditableFields): Future[types.CallsAppResponseSingleWithSecret] {.async.} =
  ## Creates a new Cloudflare calls app. An app is an unique enviroment where each
  ## Session can access all Tracks within the app.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/calls/apps", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CallsAppResponseSingleWithSecret)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCallsAppsAppId*(client: CloudflareClient,
                                         appId: types.CallsIdentifier,
                                         accountId: types.CallsAccountIdentifier): Future[types.CallsAppResponseSingle] {.async.} =
  ## Fetches details for a single Calls app.

  let res = await client.httpGET(fmt"/accounts/{accountId}/calls/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CallsAppResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCallsAppsAppId*(client: CloudflareClient,
                                         appId: types.CallsIdentifier,
                                         accountId: types.CallsAccountIdentifier,
                                         body: types.CallsAppEditableFields): Future[types.CallsAppResponseSingle] {.async.} =
  ## Edit details for a single app.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/calls/apps/{appId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CallsAppResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCallsAppsAppId*(client: CloudflareClient,
                                            appId: types.CallsIdentifier,
                                            accountId: types.CallsAccountIdentifier): Future[types.CallsAppResponseSingle] {.async.} =
  ## Deletes an app from Cloudflare Calls

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/calls/apps/{appId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CallsAppResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
