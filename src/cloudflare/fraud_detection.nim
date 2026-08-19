# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdFraudDetectionSettings*(client: CloudflareClient,
                                           zoneId: types.FraudIdentifier): Future[types.FraudFraudSettingsResponseBody] {.async.} =
  ## Retrieve Fraud Detection settings for a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/fraud_detection/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FraudFraudSettingsResponseBody)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdFraudDetectionSettings*(client: CloudflareClient,
                                           zoneId: types.FraudIdentifier,
                                           body: types.FraudFraudSettings): Future[types.FraudFraudSettingsResponseBody] {.async.} =
  ## Update Fraud Detection settings for a zone.
  ##
  ## Notes on `username_expressions` behavior:
  ## - If omitted or set to null, expressions are not modified.
  ## - If provided as an empty array `[]`, all expressions will be cleared.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/fraud_detection/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FraudFraudSettingsResponseBody)
  else:
    raise newException(CloudflareClientError, body)
