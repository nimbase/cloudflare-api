# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc putZonesZoneIdCloudConnectorRules*(client: CloudflareClient,
                                        zoneId: types.CloudConnectorIdentifier): Future[JsonNode] {.async.} =
  ## Updates Cloud Connector rules for a zone, replacing the existing rule
  ## configuration.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/cloud_connector/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
