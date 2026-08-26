# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdAiSecurityCustomTopics*(client: CloudflareClient,
                                           zoneId: types.WafProductApiBundleZoneId): Future[types.WafProductApiBundleResponseCustomTopics] {.async.} =
  ## Get the custom topic categories defined for the zone. While AI Security for Apps
  ## is enabled, it scores every incoming prompt against these topics and writes the
  ## scores to the `cf.llm.prompt.custom_topic_categories` field, keyed by topic
  ## label. Topics can be configured while the detection is disabled, but no prompt
  ## is scored until you enable it.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ai-security/custom-topics")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomTopics)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAiSecurityCustomTopics*(client: CloudflareClient,
                                           zoneId: types.WafProductApiBundleZoneId,
                                           body: types.WafProductApiBundleCustomTopics): Future[types.WafProductApiBundleResponseCustomTopics] {.async.} =
  ## Update the custom topic list of the zone, overwriting it entirely with the
  ## topics in the request, so include
  ## every topic you want to keep. Changes can take up to a minute to propagate.
  ##
  ## Each entry has a `label`, used to reference the topic in rule expressions and
  ## analytics, and a `topic`
  ## description, which the classifier scores prompts against while AI Security for
  ## Apps is enabled. The following
  ## rules apply:
  ##
  ## - A zone can hold at most 20 topics.
  ## - `label` must be 2–20 characters, using only lowercase letters (a–z), digits
  ## (0–9), and hyphens.
  ## - `topic` must be 2–50 printable ASCII characters.
  ## - Labels must be unique within the zone, and so must topic descriptions.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/ai-security/custom-topics", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseCustomTopics)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAiSecuritySettings*(client: CloudflareClient,
                                       zoneId: types.WafProductApiBundleZoneId): Future[types.WafProductApiBundleResponseSettings] {.async.} =
  ## Get the current AI Security for Apps status for the zone. While enabled,
  ## Cloudflare scans prompts sent to endpoints labeled `cf-llm` for personally
  ## identifiable information, unsafe topics, and prompt injection attempts.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ai-security/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseSettings)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAiSecuritySettings*(client: CloudflareClient,
                                       zoneId: types.WafProductApiBundleZoneId,
                                       body: types.WafProductApiBundleSettings): Future[types.WafProductApiBundleResponseSettings] {.async.} =
  ## Update the AI Security for Apps status for the zone, enabling or disabling the
  ## detection. The detection results are exposed as `cf.llm.prompt.*` fields for use
  ## in custom rules and rate limiting rules; changes can take up to a minute to
  ## propagate.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/ai-security/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WafProductApiBundleResponseSettings)
  else:
    raise newException(CloudflareClientError, body)
