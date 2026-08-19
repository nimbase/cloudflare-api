# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdImagesV2SourcingkitMigrations*(client: CloudflareClient,
                                                        accountId: types.ImagesAccountIdentifier,
                                                        offset: int64 = 0,
                                                        limit: int64 = 25): Future[types.ImagesSourcingkitMigrationListResponse] {.async.} =
  ## List all migrations for the account.

  var q = initOrderedTable[string, string]()
  q["offset"] = $offset
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2/sourcingkit/migrations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitMigrationListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdImagesV2SourcingkitMigrations*(client: CloudflareClient,
                                                         accountId: types.ImagesAccountIdentifier,
                                                         body: types.ImagesSourcingkitMigrationCreateRequest): Future[types.ImagesSourcingkitMigrationCreateResponse] {.async.} =
  ## Create a new migration from an existing source. The migration will import
  ## objects from the source bucket into Cloudflare Images.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/images/v2/sourcingkit/migrations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitMigrationCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV2SourcingkitMigrationsMigrationId*(client: CloudflareClient,
                                                                   accountId: types.ImagesAccountIdentifier,
                                                                   migrationId: types.ImagesSourcingkitIdentifier): Future[types.ImagesSourcingkitMigrationSingleResponse] {.async.} =
  ## Fetch details for a single migration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2/sourcingkit/migrations/{migrationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitMigrationSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdImagesV2SourcingkitMigrationsMigrationId*(client: CloudflareClient,
                                                                      accountId: types.ImagesAccountIdentifier,
                                                                      migrationId: types.ImagesSourcingkitIdentifier): Future[types.ImagesDeletedResponse] {.async.} =
  ## Delete an existing migration. Only completed, errored, or aborted migrations can
  ## be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/images/v2/sourcingkit/migrations/{migrationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV2SourcingkitMigrationsMigrationIdLifecycle*(client: CloudflareClient,
                                                                            accountId: types.ImagesAccountIdentifier,
                                                                            migrationId: types.ImagesSourcingkitIdentifier): Future[types.ImagesSourcingkitMigrationProgressResponse] {.async.} =
  ## Get the current progress of a migration including counts of scanned, imported,
  ## skipped, and errored objects.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2/sourcingkit/migrations/{migrationId}/lifecycle")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitMigrationProgressResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdImagesV2SourcingkitMigrationsMigrationIdLifecycleAbort*(client: CloudflareClient,
                                                                                   accountId: types.ImagesAccountIdentifier,
                                                                                   migrationId: types.ImagesSourcingkitIdentifier): Future[types.ImagesSourcingkitMigrationSingleResponse] {.async.} =
  ## Abort a running migration. Objects already imported will not be removed.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/images/v2/sourcingkit/migrations/{migrationId}/lifecycle/abort")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitMigrationSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdImagesV2SourcingkitMigrationsMigrationIdLifecycleStart*(client: CloudflareClient,
                                                                                   accountId: types.ImagesAccountIdentifier,
                                                                                   migrationId: types.ImagesSourcingkitIdentifier): Future[types.ImagesSourcingkitMigrationSingleResponse] {.async.} =
  ## Start a pending migration. The migration will begin importing objects from the
  ## configured source.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/images/v2/sourcingkit/migrations/{migrationId}/lifecycle/start")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitMigrationSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV2SourcingkitMigrationsMigrationIdLogs*(client: CloudflareClient,
                                                                       accountId: types.ImagesAccountIdentifier,
                                                                       migrationId: types.ImagesSourcingkitIdentifier,
                                                                       offset: int64 = 0,
                                                                       limit: int64 = 25): Future[types.ImagesSourcingkitMigrationLogListResponse] {.async.} =
  ## List log entries for a specific migration.

  var q = initOrderedTable[string, string]()
  q["offset"] = $offset
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2/sourcingkit/migrations/{migrationId}/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitMigrationLogListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV2SourcingkitSources*(client: CloudflareClient,
                                                     accountId: types.ImagesAccountIdentifier,
                                                     offset: int64 = 0,
                                                     limit: int64 = 25,
                                                     name: string = default(string)): Future[types.ImagesSourcingkitSourceListResponse] {.async.} =
  ## List all configured migration sources for the account.

  var q = initOrderedTable[string, string]()
  q["offset"] = $offset
  q["limit"] = $limit
  q["name"] = $name
  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2/sourcingkit/sources", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitSourceListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdImagesV2SourcingkitSources*(client: CloudflareClient,
                                                      accountId: types.ImagesAccountIdentifier,
                                                      body: types.ImagesSourcingkitSourceCreateRequest): Future[types.ImagesSourcingkitSourceCreateResponse] {.async.} =
  ## Create a new migration source by providing storage credentials. The service
  ## will verify connectivity to the bucket before accepting the source.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/images/v2/sourcingkit/sources", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitSourceCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdImagesV2SourcingkitSourcesConnectivityPrecheck*(client: CloudflareClient,
                                                                          accountId: types.ImagesAccountIdentifier,
                                                                          body: types.ImagesSourcingkitConnectivityPrecheckRequest): Future[types.ImagesSourcingkitConnectivityCheckResponse] {.async.} =
  ## Verify connectivity to a storage bucket before creating a source. Returns
  ## connectivity status without persisting any state.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/images/v2/sourcingkit/sources/connectivity-precheck", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitConnectivityCheckResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV2SourcingkitSourcesSourceId*(client: CloudflareClient,
                                                             accountId: types.ImagesAccountIdentifier,
                                                             sourceId: types.ImagesSourcingkitIdentifier): Future[types.ImagesSourcingkitSourceSingleResponse] {.async.} =
  ## Fetch details for a single migration source.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2/sourcingkit/sources/{sourceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitSourceSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdImagesV2SourcingkitSourcesSourceId*(client: CloudflareClient,
                                                                accountId: types.ImagesAccountIdentifier,
                                                                sourceId: types.ImagesSourcingkitIdentifier): Future[types.ImagesDeletedResponse] {.async.} =
  ## Delete an existing migration source. Sources with active migrations cannot be
  ## deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/images/v2/sourcingkit/sources/{sourceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdImagesV2SourcingkitSourcesSourceId*(client: CloudflareClient,
                                                               accountId: types.ImagesAccountIdentifier,
                                                               sourceId: types.ImagesSourcingkitIdentifier,
                                                               body: types.ImagesSourcingkitSourceUpdateRequest): Future[types.ImagesSourcingkitSourceUpdateResponse] {.async.} =
  ## Update the name of an existing migration source.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/images/v2/sourcingkit/sources/{sourceId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitSourceUpdateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV2SourcingkitSourcesSourceIdConnectivity*(client: CloudflareClient,
                                                                         accountId: types.ImagesAccountIdentifier,
                                                                         sourceId: types.ImagesSourcingkitIdentifier): Future[types.ImagesSourcingkitConnectivityCheckResponse] {.async.} =
  ## Check the current connectivity status of an existing migration source.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2/sourcingkit/sources/{sourceId}/connectivity")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitConnectivityCheckResponse)
  else:
    raise newException(CloudflareClientError, body)
