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
  PostZonesZoneIdentifierCustomPagesAssetsRequest = object
    description: types.CustomPagesAssetDescription
    name: types.CustomPagesAssetName
    url: types.CustomPagesAssetUrl
  PutZonesZoneIdentifierCustomPagesAssetsAssetNameRequest = object
    description: types.CustomPagesAssetDescription
    url: types.CustomPagesAssetUrl

proc getZonesZoneIdentifierCustomPagesAssets*(client: CloudflareClient,
                                              zoneIdentifier: types.CustomPagesIdentifier,
                                              page: int64 = 1,
                                              perPage: int64 = 20): Future[types.CustomPagesCustomAssetResultList] {.async.} =
  ## Fetches all the custom assets at the zone level.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneIdentifier}/custom_pages/assets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResultList)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdentifierCustomPagesAssets*(client: CloudflareClient,
                                               zoneIdentifier: types.CustomPagesIdentifier,
                                               body: PostZonesZoneIdentifierCustomPagesAssetsRequest): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Creates a new custom asset at the zone level.

  let res = await client.httpPOST(fmt"/zones/{zoneIdentifier}/custom_pages/assets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdentifierCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                       assetName: types.CustomPagesAssetName,
                                                       zoneIdentifier: types.CustomPagesIdentifier): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Fetches the details of a custom asset.

  let res = await client.httpGET(fmt"/zones/{zoneIdentifier}/custom_pages/assets/{assetName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdentifierCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                       assetName: types.CustomPagesAssetName,
                                                       zoneIdentifier: types.CustomPagesIdentifier,
                                                       body: PutZonesZoneIdentifierCustomPagesAssetsAssetNameRequest): Future[types.CustomPagesCustomAssetResult] {.async.} =
  ## Updates the configuration of an existing custom asset.

  let res = await client.httpPUT(fmt"/zones/{zoneIdentifier}/custom_pages/assets/{assetName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CustomPagesCustomAssetResult)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdentifierCustomPagesAssetsAssetName*(client: CloudflareClient,
                                                          assetName: types.CustomPagesAssetName,
                                                          zoneIdentifier: types.CustomPagesIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes an existing custom asset.

  let res = await client.httpDELETE(fmt"/zones/{zoneIdentifier}/custom_pages/assets/{assetName}")
  return res
