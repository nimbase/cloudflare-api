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
  PostAccountsAccountIdLogpushJobsRequest = object
    dataset: Option[types.LogpushDataset]
    destination_conf: types.LogpushDestinationConf
    enabled: Option[types.LogpushEnabled]
    filter: Option[types.LogpushFilter]
    frequency: Option[types.LogpushFrequency]
    kind: Option[types.LogpushKind]
    logpull_options: Option[types.LogpushLogpullOptions]
    max_upload_bytes: Option[types.LogpushMaxUploadBytes]
    max_upload_interval_seconds: Option[types.LogpushMaxUploadIntervalSeconds]
    max_upload_records: Option[types.LogpushMaxUploadRecords]
    name: Option[types.LogpushName]
    output_options: Option[types.LogpushOutputOptions]
    ownership_challenge: Option[types.LogpushOwnershipChallenge]
  PutAccountsAccountIdLogpushJobsJobIdRequest = object
    destination_conf: Option[types.LogpushDestinationConf]
    enabled: Option[types.LogpushEnabled]
    filter: Option[types.LogpushFilter]
    frequency: Option[types.LogpushFrequency]
    kind: Option[types.LogpushKind]
    logpull_options: Option[types.LogpushLogpullOptions]
    max_upload_bytes: Option[types.LogpushMaxUploadBytes]
    max_upload_interval_seconds: Option[types.LogpushMaxUploadIntervalSeconds]
    max_upload_records: Option[types.LogpushMaxUploadRecords]
    name: Option[types.LogpushName]
    output_options: Option[types.LogpushOutputOptions]
    ownership_challenge: Option[types.LogpushOwnershipChallenge]
  PostAccountsAccountIdLogpushOwnershipRequest = object
    destination_conf: types.LogpushDestinationConf
  PostAccountsAccountIdLogpushOwnershipValidateRequest = object
    destination_conf: types.LogpushDestinationConf
    ownership_challenge: types.LogpushOwnershipChallenge
  PostAccountsAccountIdLogpushValidateDestinationRequest = object
    destination_conf: types.LogpushDestinationConf
  PostAccountsAccountIdLogpushValidateDestinationExistsRequest = object
    destination_conf: types.LogpushDestinationConf
  PostAccountsAccountIdLogpushValidateOriginRequest = object
    logpull_options: Option[types.LogpushLogpullOptions]

proc getAccountsAccountIdLogpushDatasetsDatasetIdFields*(client: CloudflareClient,
                                                         datasetId: types.LogpushDataset,
                                                         accountId: types.LogpushIdentifier): Future[types.LogpushLogpushFieldResponseCollection] {.async.} =
  ## Lists all fields available for a dataset. The response result is. an object with
  ## key-value pairs, where keys are field names, and values are descriptions.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logpush/datasets/{datasetId}/fields")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushFieldResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogpushDatasetsDatasetIdJobs*(client: CloudflareClient,
                                                       datasetId: types.LogpushDataset,
                                                       accountId: types.LogpushIdentifier): Future[types.LogpushLogpushJobResponseCollection] {.async.} =
  ## Lists Logpush jobs for an account for a dataset.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logpush/datasets/{datasetId}/jobs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogpushJobs*(client: CloudflareClient,
                                      accountId: types.LogpushIdentifier): Future[types.LogpushLogpushJobResponseCollection] {.async.} =
  ## Lists Logpush jobs for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logpush/jobs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogpushJobs*(client: CloudflareClient,
                                       accountId: types.LogpushIdentifier,
                                       body: PostAccountsAccountIdLogpushJobsRequest): Future[types.LogpushLogpushJobResponseSingle] {.async.} =
  ## Creates a new Logpush job for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logpush/jobs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLogpushJobsJobId*(client: CloudflareClient,
                                           jobId: types.LogpushId,
                                           accountId: types.LogpushIdentifier): Future[types.LogpushLogpushJobResponseSingle] {.async.} =
  ## Gets the details of a Logpush job.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logpush/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdLogpushJobsJobId*(client: CloudflareClient,
                                           jobId: types.LogpushId,
                                           accountId: types.LogpushIdentifier,
                                           body: PutAccountsAccountIdLogpushJobsJobIdRequest): Future[types.LogpushLogpushJobResponseSingle] {.async.} =
  ## Updates a Logpush job.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/logpush/jobs/{jobId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdLogpushJobsJobId*(client: CloudflareClient,
                                              jobId: types.LogpushId,
                                              accountId: types.LogpushIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a Logpush job.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/logpush/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogpushOwnership*(client: CloudflareClient,
                                            accountId: types.LogpushIdentifier,
                                            body: PostAccountsAccountIdLogpushOwnershipRequest): Future[types.LogpushGetOwnershipResponse] {.async.} =
  ## Gets a new ownership challenge sent to your destination.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logpush/ownership", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushGetOwnershipResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogpushOwnershipValidate*(client: CloudflareClient,
                                                    accountId: types.LogpushIdentifier,
                                                    body: PostAccountsAccountIdLogpushOwnershipValidateRequest): Future[types.LogpushValidateOwnershipResponse] {.async.} =
  ## Validates ownership challenge of the destination.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logpush/ownership/validate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushValidateOwnershipResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogpushValidateDestination*(client: CloudflareClient,
                                                      accountId: types.LogpushIdentifier,
                                                      body: PostAccountsAccountIdLogpushValidateDestinationRequest): Future[types.LogpushValidateResponse] {.async.} =
  ## Validates destination.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logpush/validate/destination", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushValidateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogpushValidateDestinationExists*(client: CloudflareClient,
                                                            accountId: types.LogpushIdentifier,
                                                            body: PostAccountsAccountIdLogpushValidateDestinationExistsRequest): Future[types.LogpushDestinationExistsResponse] {.async.} =
  ## Checks if there is an existing job with a destination.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logpush/validate/destination/exists", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushDestinationExistsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogpushValidateOrigin*(client: CloudflareClient,
                                                 accountId: types.LogpushIdentifier,
                                                 body: PostAccountsAccountIdLogpushValidateOriginRequest): Future[types.LogpushValidateResponse] {.async.} =
  ## Validates logpull origin with logpull_options.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logpush/validate/origin", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushValidateResponse)
  else:
    raise newException(CloudflareClientError, body)
