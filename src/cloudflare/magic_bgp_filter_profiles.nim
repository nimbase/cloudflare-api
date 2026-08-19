# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicBgpFilterProfiles*(client: CloudflareClient,
                                                 accountId: types.MagicIdentifier): Future[types.MagicMagicBgpFilterProfilesListResponse] {.async.} =
  ## Lists all BGP filter profiles for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/bgp/filter_profiles")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMagicBgpFilterProfilesListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicBgpFilterProfiles*(client: CloudflareClient,
                                                  accountId: types.MagicIdentifier,
                                                  body: types.MagicCreateBgpFilterProfileRequest): Future[types.MagicMagicBgpFilterProfileResponse] {.async.} =
  ## Creates a new BGP filter profile for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/bgp/filter_profiles", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMagicBgpFilterProfileResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicBgpFilterProfilesProfileId*(client: CloudflareClient,
                                                          accountId: types.MagicIdentifier,
                                                          profileId: types.MagicIdentifier): Future[types.MagicMagicBgpFilterProfileResponse] {.async.} =
  ## Gets a specific BGP filter profile for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/bgp/filter_profiles/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMagicBgpFilterProfileResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicBgpFilterProfilesProfileId*(client: CloudflareClient,
                                                          accountId: types.MagicIdentifier,
                                                          profileId: types.MagicIdentifier,
                                                          body: types.MagicUpdateBgpFilterProfileRequest): Future[types.MagicMagicBgpFilterProfileResponse] {.async.} =
  ## Updates a BGP filter profile. Omitted properties are left unchanged. To clear an
  ## existing description send `description: ""`.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/bgp/filter_profiles/{profileId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMagicBgpFilterProfileResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicBgpFilterProfilesProfileId*(client: CloudflareClient,
                                                             accountId: types.MagicIdentifier,
                                                             profileId: types.MagicIdentifier): Future[types.MagicMagicBgpFilterProfileResponse] {.async.} =
  ## Deletes a BGP filter profile.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/bgp/filter_profiles/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMagicBgpFilterProfileResponse)
  else:
    raise newException(CloudflareClientError, body)
