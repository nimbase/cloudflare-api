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
