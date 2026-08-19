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
  PutAccountsAccountIdGatewayAppsReviewStatusRequest = object
    approved_apps: types.ZeroTrustGatewayApprovedApps
    in_review_apps: types.ZeroTrustGatewayInReviewApps
    unapproved_apps: types.ZeroTrustGatewayUnapprovedApps

proc getAccountsAccountIdGatewayAppsReviewStatus*(client: CloudflareClient,
                                                  accountId: types.ZeroTrustGatewayIdentifier3): Future[types.ZeroTrustGatewayApplicationsReviewStatusResponse] {.async.} =
  ## Retrieve the statuses of your applications.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/apps/review_status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayApplicationsReviewStatusResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdGatewayAppsReviewStatus*(client: CloudflareClient,
                                                  accountId: types.ZeroTrustGatewayIdentifier3,
                                                  body: PutAccountsAccountIdGatewayAppsReviewStatusRequest): Future[types.ZeroTrustGatewayApplicationsReviewStatusResponse] {.async.} =
  ## Update the statuses of your applications.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/gateway/apps/review_status", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayApplicationsReviewStatusResponse)
  else:
    raise newException(CloudflareClientError, body)
