# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicCloudCatalogSyncs*(client: CloudflareClient,
                                                 accountId: types.McnAccountId): Future[types.McnReadAccountCatalogSyncsResponse] {.async.} =
  ## List Catalog Syncs (Closed Beta).

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/catalog-syncs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnReadAccountCatalogSyncsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCloudCatalogSyncs*(client: CloudflareClient,
                                                  accountId: types.McnAccountId,
                                                  body: types.McnCreateCatalogSyncRequest): Future[types.McnCreateCatalogSyncResponse] {.async.} =
  ## Create a new Catalog Sync (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/catalog-syncs", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.McnCreateCatalogSyncResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCloudCatalogSyncsPrebuiltPolicies*(client: CloudflareClient,
                                                                 accountId: types.McnAccountId,
                                                                 destinationType: types.McnCatalogSyncDestinationType = default(types.McnCatalogSyncDestinationType)): Future[types.McnCatalogSyncsPrebuiltPoliciesResponse] {.async.} =
  ## List prebuilt catalog sync policies (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["destination_type"] = $destinationType
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/catalog-syncs/prebuilt-policies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnCatalogSyncsPrebuiltPoliciesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCloudCatalogSyncsSyncId*(client: CloudflareClient,
                                                       accountId: types.McnAccountId,
                                                       syncId: types.McnCatalogSyncId): Future[types.McnReadAccountCatalogSyncResponse] {.async.} =
  ## Read a Catalog Sync (Closed Beta).

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/catalog-syncs/{syncId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnReadAccountCatalogSyncResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicCloudCatalogSyncsSyncId*(client: CloudflareClient,
                                                       accountId: types.McnAccountId,
                                                       syncId: types.McnCatalogSyncId,
                                                       body: types.McnUpdateCatalogSyncRequest): Future[types.McnUpdateCatalogSyncResponse] {.async.} =
  ## Update a Catalog Sync (Closed Beta).

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/cloud/catalog-syncs/{syncId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnUpdateCatalogSyncResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicCloudCatalogSyncsSyncId*(client: CloudflareClient,
                                                          accountId: types.McnAccountId,
                                                          syncId: types.McnCatalogSyncId,
                                                          deleteDestination: bool = default(bool)): Future[types.McnDeleteCatalogSyncResponse] {.async.} =
  ## Delete a Catalog Sync (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["delete_destination"] = $deleteDestination
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/cloud/catalog-syncs/{syncId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnDeleteCatalogSyncResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicCloudCatalogSyncsSyncId*(client: CloudflareClient,
                                                         accountId: types.McnAccountId,
                                                         syncId: types.McnCatalogSyncId,
                                                         body: types.McnUpdateCatalogSyncRequest): Future[types.McnUpdateCatalogSyncResponse] {.async.} =
  ## Update a Catalog Sync (Closed Beta).

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/cloud/catalog-syncs/{syncId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnUpdateCatalogSyncResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCloudCatalogSyncsSyncIdRefresh*(client: CloudflareClient,
                                                               accountId: types.McnAccountId,
                                                               syncId: types.McnCatalogSyncId): Future[types.McnRefreshCatalogSyncResponse] {.async.} =
  ## Refresh a Catalog Sync's destination by running the sync policy against latest
  ## resource catalog (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/catalog-syncs/{syncId}/refresh")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnRefreshCatalogSyncResponse)
  else:
    raise newException(CloudflareClientError, body)
