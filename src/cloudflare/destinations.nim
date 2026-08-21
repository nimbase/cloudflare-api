# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdWorkersObservabilityDestinationsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdWorkersObservabilityDestinationsRequest = object
    configuration: JsonNode
    enabled: bool
    name: string
    skip_preflight_check: Option[bool]
  PostAccountsAccountIdWorkersObservabilityDestinationsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdWorkersObservabilityDestinationsSlugResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  PatchAccountsAccountIdWorkersObservabilityDestinationsSlugRequest = object
    configuration: JsonNode
    enabled: bool
  PatchAccountsAccountIdWorkersObservabilityDestinationsSlugResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    success: bool
  DestinationOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"

  DestinationOrderByOption* = enum
    orderByCreated = "created"
    orderByUpdated = "updated"


proc getAccountsAccountIdWorkersObservabilityDestinations*(client: CloudflareClient,
                                                           page: float64 = default(float64),
                                                           perPage: float64 = default(float64),
                                                           order: DestinationOrderOption = orderDesc,
                                                           orderBy: DestinationOrderByOption = orderByUpdated): Future[GetAccountsAccountIdWorkersObservabilityDestinationsResponse] {.async.} =
  ## List your Workers Observability Telemetry Destinations.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["perPage"] = $perPage
  q["order"] = $order
  q["orderBy"] = $orderBy
  let res = await client.httpGET("/accounts/{account_id}/workers/observability/destinations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityDestinationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersObservabilityDestinations*(client: CloudflareClient,
                                                            body: PostAccountsAccountIdWorkersObservabilityDestinationsRequest): Future[PostAccountsAccountIdWorkersObservabilityDestinationsResponse] {.async.} =
  ## Create a new Workers Observability Telemetry Destination.

  let res = await client.httpPOST("/accounts/{account_id}/workers/observability/destinations", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdWorkersObservabilityDestinationsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersObservabilityDestinationsSlug*(client: CloudflareClient,
                                                                  slug: string): Future[DeleteAccountsAccountIdWorkersObservabilityDestinationsSlugResponse] {.async.} =
  ## Delete a Workers Observability Telemetry Destination.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/workers/observability/destinations/{slug}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdWorkersObservabilityDestinationsSlugResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersObservabilityDestinationsSlug*(client: CloudflareClient,
                                                                 slug: string,
                                                                 body: PatchAccountsAccountIdWorkersObservabilityDestinationsSlugRequest): Future[PatchAccountsAccountIdWorkersObservabilityDestinationsSlugResponse] {.async.} =
  ## Update an existing Workers Observability Telemetry Destination.

  let res = await client.httpPATCH(fmt"/accounts/{account_id}/workers/observability/destinations/{slug}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdWorkersObservabilityDestinationsSlugResponse)
  else:
    raise newException(CloudflareClientError, body)
