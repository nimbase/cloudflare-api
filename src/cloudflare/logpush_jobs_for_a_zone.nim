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
  PostZonesZoneIdLogpushJobsRequest = object
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
  PutZonesZoneIdLogpushJobsJobIdRequest = object
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
  PostZonesZoneIdLogpushOwnershipRequest = object
    destination_conf: types.LogpushDestinationConf
  PostZonesZoneIdLogpushOwnershipValidateRequest = object
    destination_conf: types.LogpushDestinationConf
    ownership_challenge: types.LogpushOwnershipChallenge
  PostZonesZoneIdLogpushValidateDestinationRequest = object
    destination_conf: types.LogpushDestinationConf
  PostZonesZoneIdLogpushValidateDestinationExistsRequest = object
    destination_conf: types.LogpushDestinationConf
  PostZonesZoneIdLogpushValidateOriginRequest = object
    logpull_options: Option[types.LogpushLogpullOptions]

proc getZonesZoneIdLogpushDatasetsDatasetIdFields*(client: CloudflareClient,
                                                   datasetId: types.LogpushDataset,
                                                   zoneId: types.LogpushIdentifier): Future[types.LogpushLogpushFieldResponseCollection] {.async.} =
  ## Lists all fields available for a dataset. The response result is. an object with
  ## key-value pairs, where keys are field names, and values are descriptions.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logpush/datasets/{datasetId}/fields")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushFieldResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogpushDatasetsDatasetIdJobs*(client: CloudflareClient,
                                                 datasetId: types.LogpushDataset,
                                                 zoneId: types.LogpushIdentifier): Future[types.LogpushLogpushJobResponseCollection] {.async.} =
  ## Lists Logpush jobs for a zone for a dataset.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logpush/datasets/{datasetId}/jobs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogpushJobs*(client: CloudflareClient,
                                zoneId: types.LogpushIdentifier): Future[types.LogpushLogpushJobResponseCollection] {.async.} =
  ## Lists Logpush jobs for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logpush/jobs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogpushJobs*(client: CloudflareClient,
                                 zoneId: types.LogpushIdentifier,
                                 body: PostZonesZoneIdLogpushJobsRequest): Future[types.LogpushLogpushJobResponseSingle] {.async.} =
  ## Creates a new Logpush job for a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logpush/jobs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdLogpushJobsJobId*(client: CloudflareClient,
                                     jobId: types.LogpushId,
                                     zoneId: types.LogpushIdentifier): Future[types.LogpushLogpushJobResponseSingle] {.async.} =
  ## Gets the details of a Logpush job.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logpush/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdLogpushJobsJobId*(client: CloudflareClient,
                                     jobId: types.LogpushId,
                                     zoneId: types.LogpushIdentifier,
                                     body: PutZonesZoneIdLogpushJobsJobIdRequest): Future[types.LogpushLogpushJobResponseSingle] {.async.} =
  ## Updates a Logpush job.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/logpush/jobs/{jobId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushLogpushJobResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdLogpushJobsJobId*(client: CloudflareClient,
                                        jobId: types.LogpushId,
                                        zoneId: types.LogpushIdentifier): Future[JsonNode] {.async.} =
  ## Deletes a Logpush job.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/logpush/jobs/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogpushOwnership*(client: CloudflareClient,
                                      zoneId: types.LogpushIdentifier,
                                      body: PostZonesZoneIdLogpushOwnershipRequest): Future[types.LogpushGetOwnershipResponse] {.async.} =
  ## Gets a new ownership challenge sent to your destination.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logpush/ownership", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushGetOwnershipResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogpushOwnershipValidate*(client: CloudflareClient,
                                              zoneId: types.LogpushIdentifier,
                                              body: PostZonesZoneIdLogpushOwnershipValidateRequest): Future[types.LogpushValidateOwnershipResponse] {.async.} =
  ## Validates ownership challenge of the destination.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logpush/ownership/validate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushValidateOwnershipResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogpushValidateDestination*(client: CloudflareClient,
                                                zoneId: types.LogpushIdentifier,
                                                body: PostZonesZoneIdLogpushValidateDestinationRequest): Future[types.LogpushValidateResponse] {.async.} =
  ## Validates destination.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logpush/validate/destination", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushValidateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogpushValidateDestinationExists*(client: CloudflareClient,
                                                      zoneId: types.LogpushIdentifier,
                                                      body: PostZonesZoneIdLogpushValidateDestinationExistsRequest): Future[types.LogpushDestinationExistsResponse] {.async.} =
  ## Checks if there is an existing job with a destination.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logpush/validate/destination/exists", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushDestinationExistsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogpushValidateOrigin*(client: CloudflareClient,
                                           zoneId: types.LogpushIdentifier,
                                           body: PostZonesZoneIdLogpushValidateOriginRequest): Future[types.LogpushValidateResponse] {.async.} =
  ## Validates logpull origin with logpull_options.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logpush/validate/origin", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushValidateResponse)
  else:
    raise newException(CloudflareClientError, body)
