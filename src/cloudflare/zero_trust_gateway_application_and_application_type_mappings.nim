# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdGatewayAppTypes*(client: CloudflareClient,
                                          accountId: types.ZeroTrustGatewayIdentifier3): Future[types.ZeroTrustGatewayResponseCollection7] {.async.} =
  ## List all application and application type mappings.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/app_types")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection7)
  else:
    raise newException(CloudflareClientError, body)
