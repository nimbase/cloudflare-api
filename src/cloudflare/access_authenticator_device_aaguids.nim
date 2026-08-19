# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessAuthenticatorDeviceAaguids*(client: CloudflareClient,
                                                           accountId: types.AccessIdentifier): Future[types.AccessResponseCollection16] {.async.} =
  ## Returns a list of Authenticator Device AAGUIDs for MFA configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/authenticator_device_aaguids")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection16)
  else:
    raise newException(CloudflareClientError, body)
