# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdAlertingV3PoliciesRequest = object
    alert_interval: Option[types.AaaAlertInterval]
    alert_type: types.AaaAlertType
    description: Option[types.AaaSchemasDescription]
    enabled: types.AaaEnabled
    filters: Option[types.AaaFilters]
    mechanisms: types.AaaMechanisms
    name: types.AaaSchemasName
  PutAccountsAccountIdAlertingV3PoliciesPolicyIdRequest = object
    alert_interval: Option[types.AaaAlertInterval]
    alert_type: Option[types.AaaAlertType]
    description: Option[types.AaaSchemasDescription]
    enabled: Option[types.AaaEnabled]
    filters: Option[types.AaaFilters]
    mechanisms: Option[types.AaaMechanisms]
    name: Option[types.AaaSchemasName]
  PostAccountsAccountIdAlertingV3PoliciesPolicyIdTestRequest = object
    severity: Option[int64]
    source: Option[string]
    state_correlation_id: Option[string]
    state_event: Option[int64]

proc getAccountsAccountIdAlertingV3Policies*(client: CloudflareClient,
                                             accountId: types.AaaAccountId): Future[types.AaaPoliciesComponentsSchemasResponseCollection] {.async.} =
  ## Get a list of all Notification policies.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/policies")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaPoliciesComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAlertingV3Policies*(client: CloudflareClient,
                                              accountId: types.AaaAccountId,
                                              body: PostAccountsAccountIdAlertingV3PoliciesRequest): Future[types.AaaIdResponse] {.async.} =
  ## Creates a new Notification policy.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/alerting/v3/policies", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAlertingV3PoliciesPolicyId*(client: CloudflareClient,
                                                     accountId: types.AaaAccountId,
                                                     policyId: types.AaaPolicyId): Future[types.AaaSingleResponse] {.async.} =
  ## Get details for a single policy.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAlertingV3PoliciesPolicyId*(client: CloudflareClient,
                                                     accountId: types.AaaAccountId,
                                                     policyId: types.AaaPolicyId,
                                                     body: PutAccountsAccountIdAlertingV3PoliciesPolicyIdRequest): Future[types.AaaIdResponse] {.async.} =
  ## Update a Notification policy.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/alerting/v3/policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAlertingV3PoliciesPolicyId*(client: CloudflareClient,
                                                        accountId: types.AaaAccountId,
                                                        policyId: types.AaaPolicyId): Future[types.AaaApiResponseCollection] {.async.} =
  ## Delete a Notification policy.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/alerting/v3/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaApiResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAlertingV3PoliciesPolicyIdEmailUnsubscribe*(client: CloudflareClient,
                                                                     accountId: types.AaaAccountId,
                                                                     policyId: types.AaaPolicyId,
                                                                     email: string,
                                                                     token: string): Future[types.AaaUnsubscribeEmailSingleResponse] {.async.} =
  ## Shows details for unsubscribing an email address from a notification policy.

  var q = initOrderedTable[string, string]()
  q["email"] = $email
  q["token"] = $token
  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/policies/{policyId}/email/unsubscribe", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaUnsubscribeEmailSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAlertingV3PoliciesPolicyIdEmailUnsubscribe*(client: CloudflareClient,
                                                                      accountId: types.AaaAccountId,
                                                                      policyId: types.AaaPolicyId,
                                                                      email: string,
                                                                      token: string): Future[types.AaaUnsubscribeEmailPostSingleResponse] {.async.} =
  ## Unsubscribes an email address from a notification policy.

  var q = initOrderedTable[string, string]()
  q["email"] = $email
  q["token"] = $token
  let res = await client.httpPOST(fmt"/accounts/{accountId}/alerting/v3/policies/{policyId}/email/unsubscribe", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaUnsubscribeEmailPostSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAlertingV3PoliciesPolicyIdTest*(client: CloudflareClient,
                                                          accountId: types.AaaAccountId,
                                                          policyId: types.AaaPolicyId,
                                                          body: PostAccountsAccountIdAlertingV3PoliciesPolicyIdTestRequest): Future[types.AaaApiResponseCommon2] {.async.} =
  ## Send a test notification for a policy to verify delivery mechanisms are working
  ## as expected.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/alerting/v3/policies/{policyId}/test", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)
