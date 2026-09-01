# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getBillingRatePlansPublicKey*(client: CloudflareClient, publicKey: string): Future[types.BillSubsApiRatePlanSimpleResponse] {.async.} =
  ## Gets a rate plan's details by its public key (e.g., 'teams_free',
  ## 'cf_pro_20_20'). This is a public catalog endpoint, so authentication is not
  ## enforced and credentials are accepted but not required.

  let res = await client.httpGET(fmt"/billing/rate_plans/{publicKey}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiRatePlanSimpleResponse)
  else:
    raise newException(CloudflareClientError, body)
