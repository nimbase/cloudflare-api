# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdAccessOrganizationsRequest = object
    allow_authenticate_via_warp: Option[types.AccessAllowAuthenticateViaWarp]
    auth_domain: types.AccessAuthDomain
    auto_redirect_to_identity: Option[types.AccessAutoRedirectToIdentity]
    deny_unmatched_requests: Option[types.AccessDenyUnmatchedRequests]
    deny_unmatched_requests_exempted_zone_names: Option[types.AccessDenyUnmatchedRequestsExemptedZoneNames]
    is_ui_read_only: Option[types.AccessIsUiReadOnly]
    login_design: Option[types.AccessLoginDesign]
    mfa_config: Option[types.AccessOrgMfaConfig]
    mfa_piv_key_requirements: Option[types.AccessMfaPivKeyRequirements]
    mfa_required_for_all_apps: Option[types.AccessMfaRequiredForAllApps]
    name: types.AccessName
    session_duration: Option[types.AccessSessionDuration]
    ui_read_only_toggle_reason: Option[types.AccessUiReadOnlyToggleReason]
    user_seat_expiration_inactive_time: Option[types.AccessUserSeatExpirationInactiveTime]
    warp_auth_non_browser_401: Option[types.AccessWarpAuthNonBrowser401]
    warp_auth_session_duration: Option[types.AccessWarpAuthSessionDuration]
  PutAccountsAccountIdAccessOrganizationsRequest = object
    allow_authenticate_via_warp: Option[types.AccessAllowAuthenticateViaWarp]
    auth_domain: Option[types.AccessAuthDomain]
    auto_redirect_to_identity: Option[types.AccessAutoRedirectToIdentity]
    custom_pages: Option[types.AccessCustomPages]
    deny_unmatched_requests: Option[types.AccessDenyUnmatchedRequests]
    deny_unmatched_requests_exempted_zone_names: Option[types.AccessDenyUnmatchedRequestsExemptedZoneNames]
    is_ui_read_only: Option[types.AccessIsUiReadOnly]
    login_design: Option[types.AccessLoginDesign]
    mfa_config: Option[types.AccessOrgMfaConfig]
    mfa_piv_key_requirements: Option[types.AccessMfaPivKeyRequirements]
    mfa_required_for_all_apps: Option[types.AccessMfaRequiredForAllApps]
    name: Option[types.AccessName]
    session_duration: Option[types.AccessSessionDuration]
    ui_read_only_toggle_reason: Option[types.AccessUiReadOnlyToggleReason]
    user_seat_expiration_inactive_time: Option[types.AccessUserSeatExpirationInactiveTime]
    warp_auth_non_browser_401: Option[types.AccessWarpAuthNonBrowser401]
    warp_auth_session_duration: Option[types.AccessWarpAuthSessionDuration]
  PutAccountsAccountIdAccessOrganizationsDohRequest = object
    doh_jwt_duration: Option[types.AccessDohJwtDuration]
    service_token_id: Option[string]
  PostAccountsAccountIdAccessOrganizationsRevokeUserRequest = object
    devices: Option[bool]
    email: string
    user_uid: Option[string]
    warp_session_reauth: Option[bool]

proc getAccountsAccountIdAccessOrganizations*(client: CloudflareClient,
                                              accountId: types.AccessIdentifier): Future[types.AccessSingleResponse] {.async.} =
  ## Returns the configuration for your Zero Trust organization.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/organizations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessOrganizations*(client: CloudflareClient,
                                               accountId: types.AccessIdentifier,
                                               body: PostAccountsAccountIdAccessOrganizationsRequest): Future[types.AccessSingleResponse] {.async.} =
  ## Sets up a Zero Trust organization for your account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/organizations", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessOrganizations*(client: CloudflareClient,
                                              accountId: types.AccessIdentifier,
                                              body: PutAccountsAccountIdAccessOrganizationsRequest): Future[types.AccessSingleResponse] {.async.} =
  ## Updates the configuration for your Zero Trust organization.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/organizations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessOrganizationsDoh*(client: CloudflareClient,
                                                 accountId: types.AccessIdentifier): Future[JsonNode] {.async.} =
  ## Returns the DoH settings for your Zero Trust organization.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/organizations/doh")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessOrganizationsDoh*(client: CloudflareClient,
                                                 accountId: types.AccessIdentifier,
                                                 body: PutAccountsAccountIdAccessOrganizationsDohRequest): Future[JsonNode] {.async.} =
  ## Updates the DoH settings for your Zero Trust organization.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/organizations/doh", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessOrganizationsRevokeUser*(client: CloudflareClient,
                                                         accountId: types.AccessIdentifier,
                                                         devices: bool = default(bool),
                                                         body: PostAccountsAccountIdAccessOrganizationsRevokeUserRequest): Future[types.AccessEmptyResponse] {.async.} =
  ## Revokes a user's access across all applications.

  var q = initOrderedTable[string, string]()
  q["devices"] = $devices
  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/organizations/revoke_user", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)
