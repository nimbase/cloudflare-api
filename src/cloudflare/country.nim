# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient


proc getAccountsAccountIdCloudforceOneEventsCountries*(client: CloudflareClient,
                                                       accountId: string): Future[seq[JsonNode]] {.async.} =
  ## Lists countries referenced in Cloudforce One threat intelligence data.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/events/countries")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)
