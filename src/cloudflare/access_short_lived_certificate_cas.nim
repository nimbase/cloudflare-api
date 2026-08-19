# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessAppsCa*(client: CloudflareClient,
                                       accountId: types.AccessIdentifier,
                                       page: int64 = 1, perPage: int64 = 100): Future[types.AccessResponseCollection4] {.async.} =
  ## Lists short-lived certificate CAs and their public keys.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/apps/ca", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection4)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAppsAppIdCa*(client: CloudflareClient,
                                            appId: types.AccessUuid,
                                            accountId: types.AccessIdentifier): Future[types.AccessSingleResponse5] {.async.} =
  ## Fetches a short-lived certificate CA and its public key.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/apps/{appId}/ca")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse5)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessAppsAppIdCa*(client: CloudflareClient,
                                             appId: types.AccessUuid,
                                             accountId: types.AccessIdentifier): Future[types.AccessSingleResponse5] {.async.} =
  ## Generates a new short-lived certificate CA and public key.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/apps/{appId}/ca")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse5)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessAppsAppIdCa*(client: CloudflareClient,
                                               appId: types.AccessUuid,
                                               accountId: types.AccessIdentifier): Future[types.AccessIdResponse2] {.async.} =
  ## Deletes a short-lived certificate CA.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/apps/{appId}/ca")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse2)
  else:
    raise newException(CloudflareClientError, body)
