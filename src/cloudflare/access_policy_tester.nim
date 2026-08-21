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
  AccessPolicyTesterStatusOption* = enum
    statusSuccess = "success"
    statusFail = "fail"
    statusError = "error"


proc postAccountsAccountIdAccessPolicyTests*(client: CloudflareClient,
                                             accountId: types.AccessIdentifier,
                                             body: types.AccessPolicyInitReq): Future[types.AccessPolicyInitResp] {.async.} =
  ## Starts an Access policy test.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/policy-tests", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessPolicyInitResp)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessPolicyTestsPolicyTestId*(client: CloudflareClient,
                                                        accountId: types.AccessIdentifier,
                                                        policyTestId: types.AccessPolicyTestId): Future[types.AccessPolicyUpdateResp] {.async.} =
  ## Fetches the current status of a given Access policy test.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/policy-tests/{policyTestId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessPolicyUpdateResp)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessPolicyTestsPolicyTestIdUsers*(client: CloudflareClient,
                                                             accountId: types.AccessIdentifier,
                                                             policyTestId: types.AccessPolicyTestId,
                                                             page: int64 = 1,
                                                             perPage: int64 = 25,
                                                             status: AccessPolicyTesterStatusOption): Future[types.AccessPolicyUsersResp] {.async.} =
  ## Fetches a single page of user results from an Access policy test.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["status"] = $status
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/policy-tests/{policyTestId}/users", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessPolicyUsersResp)
  else:
    raise newException(CloudflareClientError, body)
