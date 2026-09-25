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
  PostAccountsAccountIdDevicesOverrideCodesResponse* = object
    errors: seq[types.TeamsDevicesV4ResponseMessage]
    messages: seq[types.TeamsDevicesV4ResponseMessage]
    result: types.TeamsDevicesOverrideCode
    success: bool
      ## Whether the API call was successful.

proc postAccountsAccountIdDevicesOverrideCodes*(client: CloudflareClient,
                                                accountId: string,
                                                body: types.TeamsDevicesOverrideCodeCreateRequest): Future[PostAccountsAccountIdDevicesOverrideCodesResponse] {.async.} =
  ## Generates an account-wide or device-specific uninstall protection override code.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/override_codes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdDevicesOverrideCodesResponse)
  else:
    raise newException(CloudflareClientError, body)
