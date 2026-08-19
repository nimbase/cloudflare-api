# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getUserBillingProfile*(client: CloudflareClient): Future[types.BillSubsApiBillingResponseSingle] {.async.} =
  ## Accesses your billing profile object.

  let res = await client.httpGET("/user/billing/profile")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBillingResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
