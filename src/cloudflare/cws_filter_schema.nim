# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getCwsFilterSchema*(client: CloudflareClient): Future[types.CwsResponseFilterSchema] {.async.} =
  ## Returns separate policy and workload field catalogs with metadata and UI hints
  ## for building filter expressions.

  let res = await client.httpGET("/cws/filter-schema")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseFilterSchema)
  else:
    raise newException(CloudflareClientError, body)
