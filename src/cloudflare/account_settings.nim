# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  PatchAccountsAccountIdSettingsUtBillingRequest = object
    value: types.SpeedUtBillingValue

proc getAccountsAccountIdSettingsTransformations*(client: CloudflareClient,
                                                  accountId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Returns a list of Image Resizing configurations across all zones for the
  ## account.
  ## This endpoint is useful for retrieving the transformations (image_resizing)
  ## state
  ## for all zones belonging to an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/settings/transformations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSettingsTransformationsWorkersScriptName*(client: CloudflareClient,
                                                                   accountId: types.SpeedIdentifier,
                                                                   scriptName: types.SpeedWorkerScriptName): Future[JsonNode] {.async.} =
  ## Returns the `/cdn-cgi/image/` URL transformations setting for requests served by
  ## a Worker.
  ## The result is `null` when the Worker has no setting of its own, in which case
  ## the zone-level
  ## Image Transformations settings apply.

  let res = await client.httpGET(fmt"/accounts/{accountId}/settings/transformations/workers/{scriptName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSettingsTransformationsWorkersScriptName*(client: CloudflareClient,
                                                                   accountId: types.SpeedIdentifier,
                                                                   scriptName: types.SpeedWorkerScriptName,
                                                                   body: types.SpeedWorkerTransformations): Future[JsonNode] {.async.} =
  ## Sets the `/cdn-cgi/image/` URL transformations setting for requests served by a
  ## Worker.
  ## This overrides the zone-level Image Transformations and Allowed Origins settings
  ## for
  ## requests handled by the Worker.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/settings/transformations/workers/{scriptName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSettingsTransformationsWorkersScriptName*(client: CloudflareClient,
                                                                      accountId: types.SpeedIdentifier,
                                                                      scriptName: types.SpeedWorkerScriptName): Future[JsonNode] {.async.} =
  ## Removes the Worker's `/cdn-cgi/image/` URL transformations setting, so the
  ## zone-level
  ## Image Transformations settings apply again.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/settings/transformations/workers/{scriptName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSettingsUtBilling*(client: CloudflareClient,
                                            accountId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Retrieves the Unique Transformations billing configuration for an account.
  ## When enabled, billing data is directed to the Transformations pipeline.

  let res = await client.httpGET(fmt"/accounts/{accountId}/settings/ut-billing")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdSettingsUtBilling*(client: CloudflareClient,
                                              accountId: types.SpeedIdentifier,
                                              body: PatchAccountsAccountIdSettingsUtBillingRequest): Future[JsonNode] {.async.} =
  ## Updates the Unique Transformations billing configuration for an account.
  ## When enabled, billing data is directed to the Transformations pipeline.
  ## Note: setting the value to "off" is not permitted once enabled.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/settings/ut-billing", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
