# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDataSecurityPosturePolicies*(client: CloudflareClient,
                                                      accountId: string,
                                                      cursor: string = default(string)): Future[JsonNode] {.async.} =
  ## Returns a list of integration-scoped policy configurations for the given
  ## account. This endpoint supports cursor based pagination. By default, results are
  ## returned in sorted order based on created_at.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/policies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPosturePolicies*(client: CloudflareClient,
                                                       accountId: string,
                                                       body: types.PostureApiCreatePolicyRequest): Future[JsonNode] {.async.} =
  ## Creates a new policy configuration that defines automated actions to be executed
  ## when security findings are detected. A policy can include multiple remediation
  ## and/or webhook actions that will be triggered automatically.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/policies", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPosturePoliciesLogs*(client: CloudflareClient,
                                                          accountId: string,
                                                          since: string = default(string),
                                                          until: string = default(string),
                                                          integrationId: string = default(string),
                                                          policyName: string = default(string),
                                                          page: int64 = default(int64),
                                                          perPage: int64 = default(int64)): Future[JsonNode] {.async.} =
  ## Returns a list of policy invocation logs for the given account, sourced from
  ## ClickHouse via Ready Analytics. Each entry represents one execution of a policy
  ## against a finding instance, including the actions (remediation jobs and
  ## webhooks) it dispatched.
  ##
  ## Results are scoped to the requesting account's CASB integrations. The
  ## `integration_id` query parameter, when supplied, is intersected against the
  ## account's integration allowlist; values outside the allowlist are silently
  ## dropped.
  ##
  ## Pagination is offset-based. The response does not include a total row count;
  ## clients should treat a result with fewer than `per_page` entries as the end of
  ## the list.

  var q = initOrderedTable[string, string]()
  q["since"] = $since
  q["until"] = $until
  q["integration_id"] = $integrationId
  q["policy_name"] = $policyName
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/policies/logs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPosturePoliciesPolicyId*(client: CloudflareClient,
                                                              accountId: string,
                                                              policyId: string): Future[JsonNode] {.async.} =
  ## Retrieves the details of a specific policy configuration, including its
  ## associated remediation and webhook actions.

  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDataSecurityPosturePoliciesPolicyId*(client: CloudflareClient,
                                                              accountId: string,
                                                              policyId: string,
                                                              body: types.PostureApiUpdatePolicyRequest): Future[JsonNode] {.async.} =
  ## Updates an existing policy configuration and replaces its actions.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/data-security/posture/policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDataSecurityPosturePoliciesPolicyId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 policyId: string): Future[JsonNode] {.async.} =
  ## Deletes a policy configuration.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/data-security/posture/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
