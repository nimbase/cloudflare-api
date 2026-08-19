# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdRequestTracerTraceRequest = object
    body: Option[JsonNode]
    context: Option[JsonNode]
    cookies: Option[JsonNode]
    headers: Option[JsonNode]
    `method`: string
    protocol: Option[string]
    skip_response: Option[bool]
    url: string

proc postAccountsAccountIdRequestTracerTrace*(client: CloudflareClient,
                                              accountId: types.RequestTracerIdentifier,
                                              body: PostAccountsAccountIdRequestTracerTraceRequest): Future[JsonNode] {.async.} =
  ## Traces a simulated HTTP request through Cloudflare's edge to analyze how rules,
  ## settings, and configurations would process the request. Useful for debugging
  ## firewall rules, page rules, and other request transformations without sending
  ## actual traffic. Supports custom headers, cookies, body content, and geolocation
  ## context.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/request-tracer/trace", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
