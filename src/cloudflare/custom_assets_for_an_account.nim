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
  PostAccountsAccountIdentifierCustomPagesAssetsRequest = object
    description: types.CustomPagesAssetDescription
    name: types.CustomPagesAssetName
    url: types.CustomPagesAssetUrl
  PutAccountsAccountIdentifierCustomPagesAssetsAssetNameRequest = object
    description: types.CustomPagesAssetDescription
    url: types.CustomPagesAssetUrl

proc getAccountsAccountIdentifierCustomPagesAssets*(client: CloudflareClient,
                                                    accountIdentifier: types.CustomPagesIdentifier,
                                                    page: int64 = 1,
                                                    perPage: int64 = 20): Future[types.CustomPagesCustomAssetResultList] {.async.} =
  ## Fetches all the custom assets at the account level.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountIdentifier}/custom_pages/assets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResultList)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdentifierCustomPagesAssets*(client: CloudflareClient,
                                                     accountIdentifier: types.CustomPagesIdentifier,
                                                     body: PostAccountsAccountIdentifierCustomPagesAssetsRequest): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Creates a new custom asset at the account level.

  let res = await client.httpPOST(fmt"/accounts/{accountIdentifier}/custom_pages/assets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdentifierCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                             assetName: types.CustomPagesAssetName,
                                                             accountIdentifier: types.CustomPagesIdentifier): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Fetches the details of a custom asset.

  let res = await client.httpGET(fmt"/accounts/{accountIdentifier}/custom_pages/assets/{assetName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdentifierCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                             assetName: types.CustomPagesAssetName,
                                                             accountIdentifier: types.CustomPagesIdentifier,
                                                             body: PutAccountsAccountIdentifierCustomPagesAssetsAssetNameRequest): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Updates the configuration of an existing custom asset.

  let res = await client.httpPUT(fmt"/accounts/{accountIdentifier}/custom_pages/assets/{assetName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdentifierCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                                assetName: types.CustomPagesAssetName,
                                                                accountIdentifier: types.CustomPagesIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes an existing custom asset.

  let res = await client.httpDELETE(fmt"/accounts/{accountIdentifier}/custom_pages/assets/{assetName}")
  return res
