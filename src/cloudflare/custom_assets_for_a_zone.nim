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
  PostZonesZoneIdCustomPagesAssetsRequest = object
    description: types.CustomPagesAssetDescription
    name: types.CustomPagesAssetName
    url: types.CustomPagesAssetUrl
  PutZonesZoneIdCustomPagesAssetsAssetNameRequest = object
    description: types.CustomPagesAssetDescription
    url: types.CustomPagesAssetUrl

proc getZonesZoneIdCustomPagesAssets*(client: CloudflareClient,
                                      zoneId: types.CustomPagesIdentifier,
                                      page: int64 = 1, perPage: int64 = 20): Future[types.CustomPagesCustomAssetResultList] {.async.} =
  ## Lists custom assets for a zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_pages/assets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResultList)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdCustomPagesAssets*(client: CloudflareClient,
                                       zoneId: types.CustomPagesIdentifier,
                                       body: PostZonesZoneIdCustomPagesAssetsRequest): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Creates a custom asset for a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/custom_pages/assets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCustomPagesAssetsAssetName*(client: CloudflareClient,
                                               assetName: types.CustomPagesAssetName,
                                               zoneId: types.CustomPagesIdentifier): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Returns a custom asset for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_pages/assets/{assetName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdCustomPagesAssetsAssetName*(client: CloudflareClient,
                                               assetName: types.CustomPagesAssetName,
                                               zoneId: types.CustomPagesIdentifier,
                                               body: PutZonesZoneIdCustomPagesAssetsAssetNameRequest): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Updates a custom asset for a zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/custom_pages/assets/{assetName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                  assetName: types.CustomPagesAssetName,
                                                  zoneId: types.CustomPagesIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes a custom asset from a zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/custom_pages/assets/{assetName}")
  return res
