# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  CwsWorkloadOrderOption* = enum
    orderName = "name"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsWorkloadDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsWorkloads*(client: CloudflareClient,
                                       accountId: string,
                                       cursor: string = default(string),
                                       perPage: int64 = 20,
                                       order: CwsWorkloadOrderOption = orderCreatedAt,
                                       direction: CwsWorkloadDirectionOption = directionAsc,
                                       name: string = default(string),
                                       policySetId: string = default(string)): Future[types.CwsPageResponseWorkload] {.async.} =
  ## Returns a paginated list of workloads in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["name"] = $name
  q["policy_set_id"] = $policySetId
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/workloads", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseWorkload)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsWorkloads*(client: CloudflareClient,
                                        accountId: string,
                                        body: types.CwsCreateWorkloadInputBody): Future[types.CwsResponseWorkload] {.async.} =
  ## Creates a reusable workload selector from a filter expression.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/workloads", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseWorkload)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsWorkloadsWorkloadId*(client: CloudflareClient,
                                                 accountId: string,
                                                 workloadId: string): Future[types.CwsResponseWorkload] {.async.} =
  ## Returns the workload with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/workloads/{workloadId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseWorkload)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsWorkloadsWorkloadId*(client: CloudflareClient,
                                                 accountId: string,
                                                 workloadId: string,
                                                 body: types.CwsUpdateWorkloadInputBody): Future[types.CwsResponseWorkload] {.async.} =
  ## Replaces the workload's configuration. Omit tags or use {} to clear them.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/workloads/{workloadId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseWorkload)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsWorkloadsWorkloadId*(client: CloudflareClient,
                                                    accountId: string,
                                                    workloadId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the workload if it is not targeted by a policy set.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/workloads/{workloadId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
