# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdEntitlements*(client: CloudflareClient,
                                       accountId: types.EntitlementsIdentifier): Future[types.EntitlementsEntitlementsResponse] {.async.} =
  ## Returns the list of entitlements (features and their allocations) for a given
  ## account. Each entitlement describes a product feature the account is permitted
  ## to use and the allocation value (boolean, count, range, enum, or string) that
  ## governs its behaviour.

  let res = await client.httpGET(fmt"/accounts/{accountId}/entitlements")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EntitlementsEntitlementsResponse)
  else:
    raise newException(CloudflareClientError, body)
