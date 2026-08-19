# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getUserCommunicationPreferences*(client: CloudflareClient): Future[types.CpsCommunicationPreferencesResponse] {.async.} =
  ## Retrieve the communication preferences for the authenticated user, including
  ## email verification status, marketing subscription opt-in/opt-out state, and
  ## language locale. Callers authenticate with standard Cloudflare API tokens or
  ## keys.

  let res = await client.httpGET("/user/communication_preferences")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CpsCommunicationPreferencesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putUserCommunicationPreferences*(client: CloudflareClient,
                                      body: types.CpsUpdateCommunicationPreferencesRequest): Future[types.CpsCommunicationPreferencesResponse] {.async.} =
  ## Set one or more communication preferences for the authenticated user. Supply a
  ## map of preference keys to subscription states, and an optional language locale.
  ## This endpoint does not modify email verification settings. Callers authenticate
  ## with standard Cloudflare API tokens or keys.

  let res = await client.httpPUT("/user/communication_preferences", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CpsCommunicationPreferencesResponse)
  else:
    raise newException(CloudflareClientError, body)
