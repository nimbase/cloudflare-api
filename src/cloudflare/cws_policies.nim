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
  CwsPolicieOrderOption* = enum
    orderName = "name"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsPolicieDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsPolicies*(client: CloudflareClient,
                                      accountId: string,
                                      cursor: string = default(string),
                                      perPage: int64 = 20,
                                      order: CwsPolicieOrderOption = orderCreatedAt,
                                      direction: CwsPolicieDirectionOption = directionAsc,
                                      name: string = default(string),
                                      policySetId: string = default(string),
                                      packagePath: string = default(string)): Future[types.CwsPageResponsePolicy] {.async.} =
  ## Returns a paginated list of policies in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["name"] = $name
  q["policy_set_id"] = $policySetId
  q["package_path"] = $packagePath
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/policies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponsePolicy)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsPolicies*(client: CloudflareClient,
                                       accountId: string,
                                       body: types.CwsCreatePolicyInputBody): Future[types.CwsResponsePolicy] {.async.} =
  ## Creates a policy from inline Rego source, an entrypoint, and a filter
  ## expression.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/policies", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponsePolicy)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsPoliciesPolicyId*(client: CloudflareClient,
                                              accountId: string,
                                              policyId: string): Future[types.CwsResponsePolicy] {.async.} =
  ## Returns the policy with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponsePolicy)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsPoliciesPolicyId*(client: CloudflareClient,
                                              accountId: string,
                                              policyId: string,
                                              body: types.CwsUpdatePolicyInputBody): Future[types.CwsResponsePolicy] {.async.} =
  ## Replaces the policy's configuration. Omit tags or use {} to clear them.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponsePolicy)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsPoliciesPolicyId*(client: CloudflareClient,
                                                 accountId: string,
                                                 policyId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the policy and cascades its policy-set membership rows. The policy sets
  ## remain.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
