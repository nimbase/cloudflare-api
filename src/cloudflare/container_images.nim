# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdContainersImagePreparations*(client: CloudflareClient,
                                                       body: types.CcPrepareContainerImageRequestBody): Future[JsonNode] {.async.} =
  ## Idempotently starts or observes preparation of the runtime artifacts required to
  ## run one digest-pinned managed container image on Cloudflare's network. Returns
  ## 202 while durable preparation continues and 200 when the image is ready or
  ## preparation has reached a terminal error.

  let res = await client.httpPOST("/accounts/{account_id}/containers/image-preparations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
