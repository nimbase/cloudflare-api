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
  PostZonesZoneIdAccessOrganizationsRequest = object
    auth_domain: types.AccessAuthDomain2
    is_ui_read_only: Option[types.AccessIsUiReadOnly2]
    login_design: Option[types.AccessLoginDesign2]
    name: types.AccessName15
    ui_read_only_toggle_reason: Option[types.AccessUiReadOnlyToggleReason]
    user_seat_expiration_inactive_time: Option[types.AccessUserSeatExpirationInactiveTime2]
  PutZonesZoneIdAccessOrganizationsRequest = object
    auth_domain: Option[types.AccessAuthDomain2]
    is_ui_read_only: Option[types.AccessIsUiReadOnly2]
    login_design: Option[types.AccessLoginDesign2]
    name: Option[types.AccessName15]
    ui_read_only_toggle_reason: Option[types.AccessUiReadOnlyToggleReason]
    user_seat_expiration_inactive_time: Option[types.AccessUserSeatExpirationInactiveTime2]
  PostZonesZoneIdAccessOrganizationsRevokeUserRequest = object
    email: string

proc getZonesZoneIdAccessOrganizations*(client: CloudflareClient,
                                        zoneId: types.AccessIdentifier4): Future[types.AccessSingleResponse15] {.async.} =
  ## Returns the configuration for your Zero Trust organization.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/organizations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse15)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessOrganizations*(client: CloudflareClient,
                                         zoneId: types.AccessIdentifier4,
                                         body: PostZonesZoneIdAccessOrganizationsRequest): Future[types.AccessSingleResponse15] {.async.} =
  ## Sets up a Zero Trust organization for your account.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/organizations", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse15)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessOrganizations*(client: CloudflareClient,
                                        zoneId: types.AccessIdentifier4,
                                        body: PutZonesZoneIdAccessOrganizationsRequest): Future[types.AccessSingleResponse15] {.async.} =
  ## Updates the configuration for your Zero Trust organization.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/organizations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse15)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessOrganizationsRevokeUser*(client: CloudflareClient,
                                                   zoneId: types.AccessIdentifier4,
                                                   body: PostZonesZoneIdAccessOrganizationsRevokeUserRequest): Future[types.AccessEmptyResponse] {.async.} =
  ## Revokes a user's access across all applications.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/organizations/revoke_user", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)
