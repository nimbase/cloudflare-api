# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdGatewayOperations*(client: CloudflareClient,
                                            accountId: types.ZeroTrustGatewayIdentifier3): Future[types.ZeroTrustGatewayResponseCollection4] {.async.} =
  ## List all Zero Trust Gateway operations for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/operations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection4)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayOperationsOperationId*(client: CloudflareClient,
                                                       operationId: types.ZeroTrustGatewayUuid2,
                                                       accountId: types.ZeroTrustGatewayIdentifier3): Future[types.ZeroTrustGatewaySingleResponse2] {.async.} =
  ## Fetch a single Zero Trust Gateway operation by its ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/operations/{operationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse2)
  else:
    raise newException(CloudflareClientError, body)
