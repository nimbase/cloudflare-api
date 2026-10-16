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
  CwsPolicySetOrderOption* = enum
    orderName = "name"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsPolicySetDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsPolicySets*(client: CloudflareClient,
                                        accountId: string,
                                        cursor: string = default(string),
                                        perPage: int64 = 20,
                                        order: CwsPolicySetOrderOption = orderCreatedAt,
                                        direction: CwsPolicySetDirectionOption = directionAsc,
                                        name: string = default(string),
                                        deploymentId: string = default(string)): Future[types.CwsPageResponsePolicySet] {.async.} =
  ## Returns a paginated list of policy sets in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["name"] = $name
  q["deployment_id"] = $deploymentId
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/policy-sets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponsePolicySet)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsPolicySets*(client: CloudflareClient,
                                         accountId: string,
                                         body: types.CwsCreatePolicySetInputBody): Future[types.CwsResponsePolicySet] {.async.} =
  ## Creates a policy set containing the specified policies and workload targets.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/policy-sets", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponsePolicySet)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsPolicySetsPolicySetId*(client: CloudflareClient,
                                                   accountId: string,
                                                   policySetId: string): Future[types.CwsResponsePolicySet] {.async.} =
  ## Returns the policy set with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/policy-sets/{policySetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponsePolicySet)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsPolicySetsPolicySetId*(client: CloudflareClient,
                                                   accountId: string,
                                                   policySetId: string,
                                                   body: types.CwsUpdatePolicySetInputBody): Future[types.CwsResponsePolicySet] {.async.} =
  ## Replaces the policy set's configuration. Omit tags or use {} to clear them.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/policy-sets/{policySetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponsePolicySet)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsPolicySetsPolicySetId*(client: CloudflareClient,
                                                      accountId: string,
                                                      policySetId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the policy set and cascades its deployment attachment and policy and
  ## workload membership rows. The referenced deployments, policies, and workloads
  ## remain.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/policy-sets/{policySetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
