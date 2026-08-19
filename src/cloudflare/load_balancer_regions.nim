# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdLoadBalancersRegions*(client: CloudflareClient,
                                               accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                               subdivisionCode: types.LoadBalancingSubdivisionCodeA2 = default(types.LoadBalancingSubdivisionCodeA2),
                                               subdivisionCodeA2: types.LoadBalancingSubdivisionCodeA2 = default(types.LoadBalancingSubdivisionCodeA2),
                                               countryCodeA2: string = default(string)): Future[types.LoadBalancingRegionComponentsSchemasResponseCollection] {.async.} =
  ## List all region mappings.

  var q = initOrderedTable[string, string]()
  q["subdivision_code"] = $subdivisionCode
  q["subdivision_code_a2"] = $subdivisionCodeA2
  q["country_code_a2"] = $countryCodeA2
  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/regions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingRegionComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLoadBalancersRegionsRegionId*(client: CloudflareClient,
                                                       regionId: types.LoadBalancingRegionCode,
                                                       accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingComponentsSchemasSingleResponse] {.async.} =
  ## Get a single region mapping.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/regions/{regionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserLoadBalancersRegions*(client: CloudflareClient,
                                  subdivisionCode: types.LoadBalancingSubdivisionCodeA2 = default(types.LoadBalancingSubdivisionCodeA2),
                                  countryCode: string = default(string)): Future[types.LoadBalancingRegionComponentsSchemasResponseCollection] {.async.} =
  ## List all region mappings in the user context.

  var q = initOrderedTable[string, string]()
  q["subdivision_code"] = $subdivisionCode
  q["country_code"] = $countryCode
  let res = await client.httpGET("/user/load_balancers/regions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingRegionComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
