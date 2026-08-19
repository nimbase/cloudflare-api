# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDiagnosticsEndpointHealthchecks*(client: CloudflareClient,
                                                          accountId: types.MagicTransitIdentifier): Future[types.MagicTransitEndpointHealthCheckResponseSingle] {.async.} =
  ## List Endpoint Health Checks.

  let res = await client.httpGET(fmt"/accounts/{accountId}/diagnostics/endpoint-healthchecks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTransitEndpointHealthCheckResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDiagnosticsEndpointHealthchecks*(client: CloudflareClient,
                                                           accountId: types.MagicTransitIdentifier,
                                                           body: types.MagicTransitEndpointHealthCheck): Future[types.MagicTransitEndpointHealthCheckResponseSingle] {.async.} =
  ## Create Endpoint Health Check.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/diagnostics/endpoint-healthchecks", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.MagicTransitEndpointHealthCheckResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDiagnosticsEndpointHealthchecksId*(client: CloudflareClient,
                                                            accountId: types.MagicTransitIdentifier,
                                                            id: types.MagicTransitUuid): Future[types.MagicTransitEndpointHealthCheckResponseSingle] {.async.} =
  ## Get a single Endpoint Health Check.

  let res = await client.httpGET(fmt"/accounts/{accountId}/diagnostics/endpoint-healthchecks/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTransitEndpointHealthCheckResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDiagnosticsEndpointHealthchecksId*(client: CloudflareClient,
                                                            accountId: types.MagicTransitIdentifier,
                                                            id: types.MagicTransitUuid,
                                                            body: types.MagicTransitEndpointHealthCheck): Future[types.MagicTransitEndpointHealthCheckResponseSingle] {.async.} =
  ## Update a Endpoint Health Check.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/diagnostics/endpoint-healthchecks/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTransitEndpointHealthCheckResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDiagnosticsEndpointHealthchecksId*(client: CloudflareClient,
                                                               accountId: types.MagicTransitIdentifier,
                                                               id: types.MagicTransitUuid): Future[types.MagicTransitApiResponseCommon] {.async.} =
  ## Delete Endpoint Health Check.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/diagnostics/endpoint-healthchecks/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTransitApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
