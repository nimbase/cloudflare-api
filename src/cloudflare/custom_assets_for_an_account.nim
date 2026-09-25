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
  PostAccountsAccountIdCustomPagesAssetsRequest = object
    description: types.CustomPagesAssetDescription
    name: types.CustomPagesAssetName
    url: types.CustomPagesAssetUrl
  PutAccountsAccountIdCustomPagesAssetsAssetNameRequest = object
    description: types.CustomPagesAssetDescription
    url: types.CustomPagesAssetUrl

proc getAccountsAccountIdCustomPagesAssets*(client: CloudflareClient,
                                            accountId: types.CustomPagesIdentifier,
                                            page: int64 = 1, perPage: int64 = 20): Future[types.CustomPagesCustomAssetResultList] {.async.} =
  ## Lists custom assets for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/custom_pages/assets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResultList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCustomPagesAssets*(client: CloudflareClient,
                                             accountId: types.CustomPagesIdentifier,
                                             body: PostAccountsAccountIdCustomPagesAssetsRequest): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Creates a custom asset for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/custom_pages/assets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                     assetName: types.CustomPagesAssetName,
                                                     accountId: types.CustomPagesIdentifier): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Returns a custom asset for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/custom_pages/assets/{assetName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                     assetName: types.CustomPagesAssetName,
                                                     accountId: types.CustomPagesIdentifier,
                                                     body: PutAccountsAccountIdCustomPagesAssetsAssetNameRequest): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Updates a custom asset for an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/custom_pages/assets/{assetName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                        assetName: types.CustomPagesAssetName,
                                                        accountId: types.CustomPagesIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes a custom asset from an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/custom_pages/assets/{assetName}")
  return res
