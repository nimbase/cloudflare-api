# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersPlacementRegions*(client: CloudflareClient,
                                                  accountId: types.WorkersIdentifier): Future[JsonNode] {.async.} =
  ## Returns a list of available placement regions organized by cloud provider. These
  ## regions can be used to configure Smart Placement for Workers.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/placement/regions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
