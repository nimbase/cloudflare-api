# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient


proc getAccountsAccountIdEmailSecurityAnalyticsMonthlyReport*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns an aggregated monthly email security report including detections,
  ## dispositions, and policy activity for the trailing 12 months.

  let res = await client.httpGET("/accounts/{account_id}/email-security/analytics/monthly_report")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
