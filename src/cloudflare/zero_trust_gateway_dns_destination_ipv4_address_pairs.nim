# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdGatewayDnsDestinationIps*(client: CloudflareClient,
                                                   accountId: types.ZeroTrustGatewayIdentifier): Future[types.ZeroTrustGatewayResponseCollection2] {.async.} =
  ## List Zero Trust Gateway IPv4 address pairs for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/dns_destination_ips")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)
