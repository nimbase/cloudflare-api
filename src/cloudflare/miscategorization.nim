# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdIntelMiscategorization*(client: CloudflareClient,
                                                  accountId: types.IntelIdentifier,
                                                  body: types.IntelMiscategorization): Future[types.IntelApiResponseSingle] {.async.} =
  ## Allows you to submit requests to change a domain’s category.
  ##
  ## Requests that include category `169` (New Domains) or category `177` (Newly
  ## Seen)
  ## in any of `content_adds`, `content_removes`, `security_adds`, or
  ## `security_removes`
  ## will be rejected with a `400 Bad Request`. These categories are automatically
  ## managed and fall off 30 days after they are applied.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/intel/miscategorization", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
