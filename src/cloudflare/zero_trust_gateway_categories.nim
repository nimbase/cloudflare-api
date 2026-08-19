# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdGatewayCategories*(client: CloudflareClient,
                                            accountId: types.ZeroTrustGatewayIdentifier3): Future[types.ZeroTrustGatewayResponseCollection8] {.async.} =
  ## List all categories.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/categories")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection8)
  else:
    raise newException(CloudflareClientError, body)
