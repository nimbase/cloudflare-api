# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdNetworkqualityToken*(client: CloudflareClient,
                                               accountId: string,
                                               body: types.NetworkqualityTokenRequest): Future[types.NetworkqualityTokenSuccess] {.async.} =
  ## Issues an authorization token for a Network Quality Test client.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/networkquality/token", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.NetworkqualityTokenSuccess)
  else:
    raise newException(CloudflareClientError, body)
