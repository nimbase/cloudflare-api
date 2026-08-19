# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAddressingLeases*(client: CloudflareClient,
                                           accountId: types.AddressingSchemasAccountIdentifier): Future[types.AddressingLeasesComponentsSchemasResponseCollection] {.async.} =
  ## List all leases owned by the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/leases")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingLeasesComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
