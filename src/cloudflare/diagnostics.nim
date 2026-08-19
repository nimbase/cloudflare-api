# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdDiagnosticsTracerouteRequest = object
    colos: Option[types.MagicTransitColos]
    options: Option[types.MagicTransitOptions]
    targets: types.MagicTransitTargets

proc postAccountsAccountIdDiagnosticsTraceroute*(client: CloudflareClient,
                                                 accountId: types.MagicTransitIdentifier,
                                                 body: PostAccountsAccountIdDiagnosticsTracerouteRequest): Future[types.MagicTransitTracerouteResponseCollection] {.async.} =
  ## Run traceroutes from Cloudflare colos.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/diagnostics/traceroute", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicTransitTracerouteResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
