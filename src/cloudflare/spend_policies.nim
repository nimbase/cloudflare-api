# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBillingSpendPolicies*(client: CloudflareClient,
                                               accountId: types.BillingSpendPoliciesIdentifier): Future[types.BillingSpendPoliciesPolicyListResponse] {.async.} =
  ## Returns every spend policy on the account that has not been deleted, including
  ## disabled ones. Results are sorted by `name`, then `id`. There is no pagination.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/spend-policies")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillingSpendPoliciesPolicyListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBillingSpendPolicies*(client: CloudflareClient,
                                                accountId: types.BillingSpendPoliciesIdentifier,
                                                body: types.BillingSpendPoliciesPolicyInput): Future[types.BillingSpendPoliciesPolicyResponse] {.async.} =
  ## Creates a spend policy. Each account can have only one enabled `usage_block`
  ## policy per product. A second one returns `409`. There is no limit on
  ## `notification` policies.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/billing/spend-policies", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.BillingSpendPoliciesPolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillingSpendPoliciesActivity*(client: CloudflareClient,
                                                       accountId: types.BillingSpendPoliciesIdentifier,
                                                       limit: int64 = 50,
                                                       cursor: string = default(string)): Future[types.BillingSpendPoliciesPolicyActivityResponse] {.async.} =
  ## Returns configuration history from immutable policy revisions for the account,
  ## including deleted policies. Entries contain before/after values and verified
  ## actor attribution. Pages use descending revision IDs, not event or commit order;
  ## refresh the first page for new entries. This cursor is not an incremental
  ## consumer checkpoint.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/spend-policies/activity", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillingSpendPoliciesPolicyActivityResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillingSpendPoliciesPolicyId*(client: CloudflareClient,
                                                       accountId: types.BillingSpendPoliciesIdentifier,
                                                       policyId: types.BillingSpendPoliciesPolicyId): Future[types.BillingSpendPoliciesPolicyResponse] {.async.} =
  ## Returns one spend policy. The `ETag` response header holds the current
  ## `version`; send it as `If-Match` on a later update or delete.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/spend-policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillingSpendPoliciesPolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdBillingSpendPoliciesPolicyId*(client: CloudflareClient,
                                                       accountId: types.BillingSpendPoliciesIdentifier,
                                                       policyId: types.BillingSpendPoliciesPolicyId,
                                                       body: types.BillingSpendPoliciesPolicyInput): Future[types.BillingSpendPoliciesPolicyResponse] {.async.} =
  ## Replaces the whole spend policy. Every field is required, as on create; there
  ## are no partial updates and `PATCH` is not supported. The `If-Match` header must
  ## equal the policy's current `version`. On success, `version` goes up by one and
  ## the new value is returned in `ETag`.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/billing/spend-policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillingSpendPoliciesPolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBillingSpendPoliciesPolicyId*(client: CloudflareClient,
                                                          accountId: types.BillingSpendPoliciesIdentifier,
                                                          policyId: types.BillingSpendPoliciesPolicyId): Future[types.BillingSpendPoliciesPolicyDeleteResponse] {.async.} =
  ## Soft-deletes the spend policy. The policy is disabled and no longer appears in
  ## list, get or audit responses. The `If-Match` header must equal the policy's
  ## current `version`.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/billing/spend-policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillingSpendPoliciesPolicyDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillingSpendPoliciesPolicyIdAudit*(client: CloudflareClient,
                                                            accountId: types.BillingSpendPoliciesIdentifier,
                                                            policyId: types.BillingSpendPoliciesPolicyId,
                                                            limit: int64 = 50): Future[types.BillingSpendPoliciesPolicyAuditResponse] {.async.} =
  ## Returns the policy's evaluation history, newest first. At most one entry is
  ## recorded per trigger (`approaching_limit` or `limit_reached`), policy version
  ## and billing period, so a policy update can record a new entry without any change
  ## in balance. Disabled policies still return their history; deleted policies
  ## return `404`. There is no pagination: use `limit` to set how many entries come
  ## back.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/spend-policies/{policyId}/audit", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillingSpendPoliciesPolicyAuditResponse)
  else:
    raise newException(CloudflareClientError, body)
