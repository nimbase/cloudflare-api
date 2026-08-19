# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdCloudConnectorRules*(client: CloudflareClient,
                                        zoneId: types.CloudConnectorIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves the Cloud Connector rules configured for a zone. Rules define how
  ## traffic is routed to cloud services.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cloud_connector/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
