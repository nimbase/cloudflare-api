# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc patchAccountsAccountIdAccessSeats*(client: CloudflareClient,
                                        accountId: types.AccessIdentifier2,
                                        body: types.AccessSeatsDefinition): Future[types.AccessResponseCollection13] {.async.} =
  ## Removes a user from a Zero Trust seat when both `access_seat` and `gateway_seat`
  ## are set to false.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/access/seats", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection13)
  else:
    raise newException(CloudflareClientError, body)
