# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBillingProfile*(client: CloudflareClient,
                                         accountId: types.BillSubsApiIdentifier): Future[types.BillSubsApiBillingResponseSingle] {.async.} =
  ## Gets the current billing profile for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/profile")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBillingResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
