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
  GetAccountsAccountIdDevicesRegistrationsRegistrationIdOverrideCodesResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesOverrideCodes
    success: bool
      ## Whether the API call was successful.

proc getAccountsAccountIdDevicesRegistrationsRegistrationIdOverrideCodes*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          registrationId: string): Future[GetAccountsAccountIdDevicesRegistrationsRegistrationIdOverrideCodesResponse] {.async.} =
  ## Fetches one-time use admin override codes for a registration. This relies on the
  ## **Admin Override** setting being enabled in your device configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/registrations/{registrationId}/override_codes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdDevicesRegistrationsRegistrationIdOverrideCodesResponse)
  else:
    raise newException(CloudflareClientError, body)
