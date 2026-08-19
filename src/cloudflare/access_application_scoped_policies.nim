# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessAppsAppIdPolicies*(client: CloudflareClient,
                                                  appId: types.AccessUuid,
                                                  accountId: types.AccessIdentifier,
                                                  page: int64 = 1,
                                                  perPage: int64 = 200): Future[types.AccessResponseCollection8] {.async.} =
  ## Lists Access policies configured for an application. Returns both exclusively
  ## scoped and reusable policies used by the application.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/apps/{appId}/policies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection8)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessAppsAppIdPolicies*(client: CloudflareClient,
                                                   appId: types.AccessUuid,
                                                   accountId: types.AccessIdentifier,
                                                   body: types.AccessAppPolicyWriteRequest): Future[types.AccessSingleResponse9] {.async.} =
  ## Creates a policy applying exclusive to a single application that defines the
  ## users or groups who can reach it. We recommend creating a reusable policy
  ## instead and subsequently referencing its ID in the application's 'policies'
  ## array.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/apps/{appId}/policies", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse9)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAppsAppIdPoliciesPolicyId*(client: CloudflareClient,
                                                          appId: types.AccessUuid,
                                                          policyId: types.AccessUuid,
                                                          accountId: types.AccessIdentifier): Future[types.AccessSingleResponse9] {.async.} =
  ## Fetches a single Access policy configured for an application. Returns both
  ## exclusively owned and reusable policies used by the application.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/apps/{appId}/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse9)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessAppsAppIdPoliciesPolicyId*(client: CloudflareClient,
                                                          appId: types.AccessUuid,
                                                          policyId: types.AccessUuid,
                                                          accountId: types.AccessIdentifier,
                                                          body: types.AccessAppPolicyWriteRequest): Future[types.AccessSingleResponse9] {.async.} =
  ## Updates an Access policy specific to an application. To update a reusable
  ## policy, use the /accounts/{account_id}/policies/{uid} endpoint.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/apps/{appId}/policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse9)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessAppsAppIdPoliciesPolicyId*(client: CloudflareClient,
                                                             appId: types.AccessUuid,
                                                             policyId: types.AccessUuid,
                                                             accountId: types.AccessIdentifier): Future[types.AccessIdResponse4] {.async.} =
  ## Deletes an Access policy specific to an application. To delete a reusable
  ## policy, use the /accounts/{account_id}/policies/{uid} endpoint.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/apps/{appId}/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse4)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessAppsAppIdPoliciesPolicyIdMakeReusable*(client: CloudflareClient,
                                                                      appId: types.AccessUuid,
                                                                      policyId: types.AccessUuid,
                                                                      accountId: types.AccessIdentifier): Future[types.AccessResponseCollection8] {.async.} =
  ## Converts an application-scoped policy to a reusable policy. The policy will no
  ## longer be exclusively scoped to the application. Further updates to the policy
  ## should go through the /accounts/{account_id}/policies/{uid} endpoint.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/apps/{appId}/policies/{policyId}/make_reusable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection8)
  else:
    raise newException(CloudflareClientError, body)
