# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicBgpSettings*(client: CloudflareClient,
                                           accountId: types.MagicIdentifier): Future[types.MagicMagicBgpSettingsResponse] {.async.} =
  ## Gets the BGP settings for an account, including the default ASN and
  ## redistribution configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/bgp/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMagicBgpSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicBgpSettings*(client: CloudflareClient,
                                           accountId: types.MagicIdentifier,
                                           body: types.MagicUpdateBgpSettingsRequest): Future[types.MagicMagicBgpSettingsResponse] {.async.} =
  ## Modifies the BGP settings for an account, including the default ASN and
  ## redistribution configuration.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/bgp/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicMagicBgpSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)
