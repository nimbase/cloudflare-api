# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAlertingV3DestinationsEligible*(client: CloudflareClient,
                                                         accountId: types.AaaAccountId): Future[types.AaaSchemasResponseCollection] {.async.} =
  ## Get a list of all delivery mechanism types for which an account is eligible.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/destinations/eligible")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
