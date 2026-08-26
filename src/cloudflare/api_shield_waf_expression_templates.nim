# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types


proc postZonesZoneIdApiGatewayExpressionTemplateFallthrough*(client: CloudflareClient,
                                                             body: types.ApiShieldRequestExpressionTemplatesFallthrough): Future[JsonNode] {.async.} =
  ## Generates a WAF expression template that matches fallthrough traffic for the
  ## supplied API hosts. This operation is deprecated and should not be used for new
  ## integrations.

  let res = await client.httpPOST("/zones/{zone_id}/api_gateway/expression-template/fallthrough", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
