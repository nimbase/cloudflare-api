# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostZonesZoneIdLogpushEdgeJobsRequest = object
    fields: Option[types.LogpushFields]
    filter: Option[types.LogpushFilter2]
    sample: Option[types.LogpushSample]

proc getZonesZoneIdLogpushEdgeJobs*(client: CloudflareClient,
                                    zoneId: types.LogpushIdentifier): Future[types.LogpushInstantLogsJobResponseCollection] {.async.} =
  ## Lists Instant Logs jobs for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/logpush/edge/jobs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushInstantLogsJobResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdLogpushEdgeJobs*(client: CloudflareClient,
                                     zoneId: types.LogpushIdentifier,
                                     body: PostZonesZoneIdLogpushEdgeJobsRequest): Future[types.LogpushInstantLogsJobResponseSingle] {.async.} =
  ## Creates a new Instant Logs job for a zone.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/logpush/edge/jobs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogpushInstantLogsJobResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
