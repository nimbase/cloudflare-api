# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PutAccountsAccountIdEventNotificationsR2BucketNameConfigurationQueuesQueueIdRequest = object
    rules: seq[types.R2Rule]
  DeleteAccountsAccountIdEventNotificationsR2BucketNameConfigurationQueuesQueueIdRequest = object
    rule_ids: Option[seq[string]]
  PostAccountsAccountIdR2BucketsRequest = object
    location_hint: Option[types.R2BucketLocation]
    name: types.R2BucketName
    storage_class: Option[types.R2StorageClass]
  PutAccountsAccountIdR2BucketsBucketNameCorsRequest = object
    rules: Option[seq[types.R2CorsRule]]
  PutAccountsAccountIdR2BucketsBucketNameLifecycleRequest = object
    rules: Option[seq[types.R2LifecycleRule]]
  PutAccountsAccountIdR2BucketsBucketNameLocalUploadsRequest = object
    enabled: bool
  PutAccountsAccountIdR2BucketsBucketNameLockRequest = object
    rules: Option[seq[types.R2BucketLockRule]]
  R2BucketOrderOption* = enum
    orderName = "name"

  R2BucketDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  R2BucketJobTypeOption* = enum
    jobTypePrefixDelete = "prefixDelete"


proc getAccountsAccountIdEventNotificationsR2BucketNameConfiguration*(client: CloudflareClient,
                                                                      bucketName: types.R2BucketName,
                                                                      accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## List all event notification rules for a bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/event_notifications/r2/{bucketName}/configuration")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEventNotificationsR2BucketNameConfigurationQueuesQueueId*(client: CloudflareClient,
                                                                                   queueId: types.R2QueueIdentifier,
                                                                                   bucketName: types.R2BucketName,
                                                                                   accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## Get a single event notification rule.

  let res = await client.httpGET(fmt"/accounts/{accountId}/event_notifications/r2/{bucketName}/configuration/queues/{queueId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdEventNotificationsR2BucketNameConfigurationQueuesQueueId*(client: CloudflareClient,
                                                                                   queueId: types.R2QueueIdentifier,
                                                                                   bucketName: types.R2BucketName,
                                                                                   accountId: types.R2AccountIdentifier,
                                                                                   body: PutAccountsAccountIdEventNotificationsR2BucketNameConfigurationQueuesQueueIdRequest): Future[JsonNode] {.async.} =
  ## Create event notification rule.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/event_notifications/r2/{bucketName}/configuration/queues/{queueId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEventNotificationsR2BucketNameConfigurationQueuesQueueId*(client: CloudflareClient,
                                                                                      queueId: types.R2QueueIdentifier,
                                                                                      bucketName: types.R2BucketName,
                                                                                      accountId: types.R2AccountIdentifier,
                                                                                      body: DeleteAccountsAccountIdEventNotificationsR2BucketNameConfigurationQueuesQueueIdRequest): Future[JsonNode] {.async.} =
  ## Delete an event notification rule. **If no body is provided, all rules for
  ## specified queue will be deleted**.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/event_notifications/r2/{bucketName}/configuration/queues/{queueId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2Buckets*(client: CloudflareClient,
                                    accountId: types.R2AccountIdentifier,
                                    nameContains: string = default(string),
                                    startAfter: string = default(string),
                                    perPage: float64 = default(float64),
                                    order: set[R2BucketOrderOption] = {},
                                    direction: set[R2BucketDirectionOption] = {},
                                    cursor: string = default(string)): Future[JsonNode] {.async.} =
  ## Lists all R2 buckets on your account.

  var q = initOrderedTable[string, string]()
  q["name_contains"] = $nameContains
  q["start_after"] = $startAfter
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdR2Buckets*(client: CloudflareClient,
                                     accountId: types.R2AccountIdentifier,
                                     body: PostAccountsAccountIdR2BucketsRequest): Future[JsonNode] {.async.} =
  ## Creates a new R2 bucket.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2/buckets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketName*(client: CloudflareClient,
                                              accountId: types.R2AccountIdentifier,
                                              bucketName: types.R2BucketName): Future[JsonNode] {.async.} =
  ## Gets properties of an existing R2 bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdR2BucketsBucketName*(client: CloudflareClient,
                                                 bucketName: types.R2BucketName,
                                                 accountId: types.R2AccountIdentifier): Future[types.R2V4Response] {.async.} =
  ## Deletes an existing R2 bucket.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/r2/buckets/{bucketName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.R2V4Response)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdR2BucketsBucketName*(client: CloudflareClient,
                                                accountId: types.R2AccountIdentifier,
                                                bucketName: types.R2BucketName): Future[JsonNode] {.async.} =
  ## Updates properties of an existing R2 bucket.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/r2/buckets/{bucketName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameCors*(client: CloudflareClient,
                                                  bucketName: types.R2BucketName,
                                                  accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## Get the CORS policy for a bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/cors")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdR2BucketsBucketNameCors*(client: CloudflareClient,
                                                  bucketName: types.R2BucketName,
                                                  accountId: types.R2AccountIdentifier,
                                                  body: PutAccountsAccountIdR2BucketsBucketNameCorsRequest): Future[JsonNode] {.async.} =
  ## Set the CORS policy for a bucket.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/cors", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdR2BucketsBucketNameCors*(client: CloudflareClient,
                                                     bucketName: types.R2BucketName,
                                                     accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## Delete the CORS policy for a bucket.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/cors")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameDomainsCustom*(client: CloudflareClient,
                                                           accountId: types.R2AccountIdentifier,
                                                           bucketName: types.R2BucketName): Future[JsonNode] {.async.} =
  ## Gets a list of all custom domains registered with an existing R2 bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/domains/custom")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdR2BucketsBucketNameDomainsCustom*(client: CloudflareClient,
                                                            accountId: types.R2AccountIdentifier,
                                                            bucketName: types.R2BucketName,
                                                            body: types.R2AddCustomDomainRequest): Future[JsonNode] {.async.} =
  ## Register a new custom domain for an existing R2 bucket.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/domains/custom", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameDomainsCustomDomain*(client: CloudflareClient,
                                                                 accountId: types.R2AccountIdentifier,
                                                                 bucketName: types.R2BucketName,
                                                                 domain: types.R2DomainName): Future[JsonNode] {.async.} =
  ## Get the configuration for a custom domain on an existing R2 bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/domains/custom/{domain}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdR2BucketsBucketNameDomainsCustomDomain*(client: CloudflareClient,
                                                                 accountId: types.R2AccountIdentifier,
                                                                 bucketName: types.R2BucketName,
                                                                 domain: types.R2DomainName,
                                                                 body: types.R2EditCustomDomainRequest): Future[JsonNode] {.async.} =
  ## Edit the configuration for a custom domain on an existing R2 bucket.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/domains/custom/{domain}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdR2BucketsBucketNameDomainsCustomDomain*(client: CloudflareClient,
                                                                    bucketName: types.R2BucketName,
                                                                    accountId: types.R2AccountIdentifier,
                                                                    domain: types.R2DomainName): Future[JsonNode] {.async.} =
  ## Remove custom domain registration from an existing R2 bucket.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/domains/custom/{domain}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameDomainsManaged*(client: CloudflareClient,
                                                            accountId: types.R2AccountIdentifier,
                                                            bucketName: types.R2BucketName): Future[JsonNode] {.async.} =
  ## Gets state of public access over the bucket's R2-managed (r2.dev) domain.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/domains/managed")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdR2BucketsBucketNameDomainsManaged*(client: CloudflareClient,
                                                            accountId: types.R2AccountIdentifier,
                                                            bucketName: types.R2BucketName,
                                                            body: types.R2EditManagedDomainRequest): Future[JsonNode] {.async.} =
  ## Updates state of public access over the bucket's R2-managed (r2.dev) domain.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/domains/managed", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameJobs*(client: CloudflareClient,
                                                  accountId: types.R2AccountIdentifier,
                                                  bucketName: types.R2BucketName,
                                                  jobType: set[R2BucketJobTypeOption] = {},
                                                  status: types.R2R2BucketJobStatus = default(types.R2R2BucketJobStatus),
                                                  maxKeys: int64 = default(int64),
                                                  continuationToken: string = default(string)): Future[JsonNode] {.async.} =
  ## Lists background jobs for an R2 bucket. Use this endpoint to poll jobs returned
  ## by
  ## asynchronous operations such as deleting objects by prefix or emptying a bucket.

  var q = initOrderedTable[string, string]()
  for v in jobType: q["jobType"] = $v
  q["status"] = $status
  q["maxKeys"] = $maxKeys
  q["continuationToken"] = $continuationToken
  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/jobs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameJobsJobId*(client: CloudflareClient,
                                                       accountId: types.R2AccountIdentifier,
                                                       bucketName: types.R2BucketName,
                                                       jobId: string): Future[JsonNode] {.async.} =
  ## Gets the current status of a background job for an R2 bucket. Poll this endpoint
  ## with
  ## the job identifier returned when the operation was submitted until the status is
  ## `COMPLETED`, `FAILED`, or `CANCELLED`.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameLifecycle*(client: CloudflareClient,
                                                       bucketName: types.R2BucketName,
                                                       accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## Get object lifecycle rules for a bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/lifecycle")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdR2BucketsBucketNameLifecycle*(client: CloudflareClient,
                                                       bucketName: types.R2BucketName,
                                                       accountId: types.R2AccountIdentifier,
                                                       body: PutAccountsAccountIdR2BucketsBucketNameLifecycleRequest): Future[JsonNode] {.async.} =
  ## Set the object lifecycle rules for a bucket.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/lifecycle", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameLocalUploads*(client: CloudflareClient,
                                                          bucketName: types.R2BucketName,
                                                          accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## Get the local uploads configuration for a bucket. When enabled, object's data is
  ## written to the nearest region first, then asynchronously replicated to the
  ## bucket's primary region.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/local-uploads")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdR2BucketsBucketNameLocalUploads*(client: CloudflareClient,
                                                          bucketName: types.R2BucketName,
                                                          accountId: types.R2AccountIdentifier,
                                                          body: PutAccountsAccountIdR2BucketsBucketNameLocalUploadsRequest): Future[JsonNode] {.async.} =
  ## Set the local uploads configuration for a bucket. When enabled, object's data is
  ## written to the nearest region first, then asynchronously replicated to the
  ## bucket's primary region.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/local-uploads", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameLock*(client: CloudflareClient,
                                                  bucketName: types.R2BucketName,
                                                  accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## Get lock rules for a bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/lock")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdR2BucketsBucketNameLock*(client: CloudflareClient,
                                                  bucketName: types.R2BucketName,
                                                  accountId: types.R2AccountIdentifier,
                                                  body: PutAccountsAccountIdR2BucketsBucketNameLockRequest): Future[JsonNode] {.async.} =
  ## Set lock rules for a bucket.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/lock", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdR2BucketsBucketNameSippy*(client: CloudflareClient,
                                                   accountId: types.R2AccountIdentifier,
                                                   bucketName: types.R2BucketName): Future[JsonNode] {.async.} =
  ## Gets configuration for Sippy for an existing R2 bucket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/sippy")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdR2BucketsBucketNameSippy*(client: CloudflareClient,
                                                   accountId: types.R2AccountIdentifier,
                                                   bucketName: types.R2BucketName): Future[JsonNode] {.async.} =
  ## Sets configuration for Sippy for an existing R2 bucket.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/sippy", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdR2BucketsBucketNameSippy*(client: CloudflareClient,
                                                      bucketName: types.R2BucketName,
                                                      accountId: types.R2AccountIdentifier): Future[JsonNode] {.async.} =
  ## Disables Sippy on this bucket.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/r2/buckets/{bucketName}/sippy")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdR2TempAccessCredentials*(client: CloudflareClient,
                                                   accountId: types.R2AccountIdentifier,
                                                   body: types.R2TempAccessCredsRequest): Future[JsonNode] {.async.} =
  ## Creates temporary access credentials on a bucket that can be optionally scoped
  ## to prefixes or objects.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/r2/temp-access-credentials", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
