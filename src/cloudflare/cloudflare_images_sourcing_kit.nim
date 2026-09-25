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
  ## List CF Images imports.

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
  ## Create a pending CF Images import from a configured source.

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
  ## Get the configuration and status of a CF Images import.

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
  ## Delete a completed, failed, or aborted CF Images import.

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
  ## Get progress and object counts for a CF Images import.

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
  ## Abort a running CF Images import. Already imported images will remain.

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
  ## Start a pending CF Images import.

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
  ## List log entries for a CF Images import.

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
  ## List sources configured for CF Images imports.

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
  ## Configure an S3 source for CF Images imports.

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
  ## Check S3 credentials without saving a source.

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
  ## Get details of a source configured for CF Images imports.

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
  ## Delete a source configured for CF Images imports. Sources used by active imports
  ## cannot be deleted.

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
  ## Rename a source configured for CF Images imports.

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
  ## Check whether a source can still access its S3 bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v2/sourcingkit/sources/{sourceId}/connectivity")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesSourcingkitConnectivityCheckResponse)
  else:
    raise newException(CloudflareClientError, body)
