# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessPolicies*(client: CloudflareClient,
                                         accountId: types.AccessIdentifier,
                                         page: int64 = 1, perPage: int64 = 100): Future[types.AccessResponseCollection9] {.async.} =
  ## Lists Access reusable policies.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/policies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection9)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessPolicies*(client: CloudflareClient,
                                          accountId: types.AccessIdentifier,
                                          body: types.AccessPolicyReq): Future[types.AccessSingleResponse10] {.async.} =
  ## Creates a new Access reusable policy.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/policies", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse10)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessPoliciesPolicyId*(client: CloudflareClient,
                                                 accountId: types.AccessIdentifier,
                                                 policyId: types.AccessUuid2): Future[types.AccessSingleResponse10] {.async.} =
  ## Fetches a single Access reusable policy.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse10)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessPoliciesPolicyId*(client: CloudflareClient,
                                                 accountId: types.AccessIdentifier,
                                                 policyId: types.AccessUuid2,
                                                 body: types.AccessPolicyReq): Future[types.AccessSingleResponse10] {.async.} =
  ## Updates a Access reusable policy.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse10)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessPoliciesPolicyId*(client: CloudflareClient,
                                                    accountId: types.AccessIdentifier,
                                                    policyId: types.AccessUuid2): Future[types.AccessIdResponse4] {.async.} =
  ## Deletes an Access reusable policy.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse4)
  else:
    raise newException(CloudflareClientError, body)
