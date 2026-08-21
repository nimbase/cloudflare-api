# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  RateLimitingAnalyticTimeDeltaOption* = enum
    timeDelta60 = "60"
    timeDelta3600 = "3600"
    timeDelta86400 = "86400"
    timeDelta2592000 = "2592000"


proc getZonesZoneIdRateLimitAnalytics*(client: CloudflareClient, zoneId: string,
                                       since: string, until: string,
                                       timeDelta: RateLimitingAnalyticTimeDeltaOption): Future[types.RlanalyticsRateLimitAnalytics] {.async.} =
  ## Returns rate limiting analytics for a zone over the specified time period.
  ## The time period divides into time segments of a given length. Each segment
  ## contains total action counts and action counts broken down by colo.

  var q = initOrderedTable[string, string]()
  q["since"] = $since
  q["until"] = $until
  q["time_delta"] = $timeDelta
  let res = await client.httpGET(fmt"/zones/{zoneId}/rate_limit_analytics", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RlanalyticsRateLimitAnalytics)
  else:
    raise newException(CloudflareClientError, body)
