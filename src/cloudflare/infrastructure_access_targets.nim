# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdInfrastructureTargetsRequest = object
    hostname: string
    ip: types.InfraIPInfo
  DeleteAccountsAccountIdInfrastructureTargetsBatchRequest = object
    target_ids: seq[types.InfraTargetId]
  PostAccountsAccountIdInfrastructureTargetsBatchDeleteRequest = object
    target_ids: seq[types.InfraTargetId]
  PutAccountsAccountIdInfrastructureTargetsTargetIdRequest = object
    hostname: string
    ip: types.InfraIPInfo
  InfrastructureAccessTargetOrderOption* = enum
    orderHostname = "hostname"
    orderCreatedAt = "created_at"


proc getAccountsAccountIdInfrastructureTargets*(client: CloudflareClient,
                                                accountId: types.InfraAccountTag,
                                                hostname: string = default(string),
                                                hostnameContains: string = default(string),
                                                virtualNetworkId: string = default(string),
                                                ipV4: string = default(string),
                                                ipV6: string = default(string),
                                                createdBefore: string = default(string),
                                                createdAfter: string = default(string),
                                                modifiedBefore: string = default(string),
                                                modifiedAfter: string = default(string),
                                                ips: seq[string] = @[],
                                                targetIds: seq[string] = @[],
                                                ipLike: string = default(string),
                                                ipv4Start: string = default(string),
                                                ipv4End: string = default(string),
                                                ipv6Start: string = default(string),
                                                ipv6End: string = default(string),
                                                page: int32 = 1,
                                                perPage: int32 = 1000,
                                                order: InfrastructureAccessTargetOrderOption,
                                                direction: JsonNode = default(JsonNode)): Future[JsonNode] {.async.} =
  ## Lists and sorts an account's targets. Filters are optional and are ANDed
  ## together.

  var q = initOrderedTable[string, string]()
  q["hostname"] = $hostname
  q["hostname_contains"] = $hostnameContains
  q["virtual_network_id"] = $virtualNetworkId
  q["ip_v4"] = $ipV4
  q["ip_v6"] = $ipV6
  q["created_before"] = $createdBefore
  q["created_after"] = $createdAfter
  q["modified_before"] = $modifiedBefore
  q["modified_after"] = $modifiedAfter
  for v in ips: q["ips"] = $v
  for v in targetIds: q["target_ids"] = $v
  q["ip_like"] = $ipLike
  q["ipv4_start"] = $ipv4Start
  q["ipv4_end"] = $ipv4End
  q["ipv6_start"] = $ipv6Start
  q["ipv6_end"] = $ipv6End
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/infrastructure/targets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdInfrastructureTargets*(client: CloudflareClient,
                                                 accountId: types.InfraAccountTag,
                                                 body: PostAccountsAccountIdInfrastructureTargetsRequest): Future[JsonNode] {.async.} =
  ## Creates a new infrastructure access target in the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/infrastructure/targets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdInfrastructureTargetsBatch*(client: CloudflareClient,
                                                     accountId: types.InfraAccountTag): Future[JsonNode] {.async.} =
  ## Adds one or more targets.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/infrastructure/targets/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdInfrastructureTargetsBatch*(client: CloudflareClient,
                                                        accountId: types.InfraAccountTag,
                                                        body: DeleteAccountsAccountIdInfrastructureTargetsBatchRequest): Future[AsyncResponse] {.async.} =
  ## Removes one or more targets.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/infrastructure/targets/batch", body)
  return res

proc postAccountsAccountIdInfrastructureTargetsBatchDelete*(client: CloudflareClient,
                                                            accountId: types.InfraAccountTag,
                                                            body: PostAccountsAccountIdInfrastructureTargetsBatchDeleteRequest): Future[AsyncResponse] {.async.} =
  ## Removes one or more targets.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/infrastructure/targets/batch_delete", body)
  return res

proc getAccountsAccountIdInfrastructureTargetsTargetId*(client: CloudflareClient,
                                                        accountId: types.InfraAccountTag,
                                                        targetId: types.InfraTargetId): Future[JsonNode] {.async.} =
  ## Fetches a single infrastructure access target by its ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/infrastructure/targets/{targetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdInfrastructureTargetsTargetId*(client: CloudflareClient,
                                                        accountId: types.InfraAccountTag,
                                                        targetId: types.InfraTargetId,
                                                        body: PutAccountsAccountIdInfrastructureTargetsTargetIdRequest): Future[JsonNode] {.async.} =
  ## Updates an existing infrastructure access target by its ID.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/infrastructure/targets/{targetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdInfrastructureTargetsTargetId*(client: CloudflareClient,
                                                           accountId: types.InfraAccountTag,
                                                           targetId: types.InfraTargetId): Future[AsyncResponse] {.async.} =
  ## Removes a single infrastructure access target by its ID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/infrastructure/targets/{targetId}")
  return res
