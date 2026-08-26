# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getApiV4Health*(client: CloudflareClient): Future[types.MonolithHealthResponse] {.async.} =
  ## Returns the operational health status of the Cloudflare API monolith.
  ## This is an internal infrastructure health check endpoint and is not
  ## intended for customer use. It is permanently exempt from SDK and public
  ## docs generation (see x-fern-ignore). Ref: APIOPS-12957.

  let res = await client.httpGET("/api/v4/health")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MonolithHealthResponse)
  else:
    raise newException(CloudflareClientError, body)
