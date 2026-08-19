# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdBotManagementFeedback*(client: CloudflareClient,
                                          zoneId: types.BotManagementIdentifier): Future[seq[types.BotManagementFeedbackReport]] {.async.} =
  ## Returns all feedback reports previously submitted for the specified zone.
  ## Feedback reports help improve detection by sharing samples of traffic that were
  ## misclassified as bots or humans.

  let res = await client.httpGET(fmt"/zones/{zoneId}/bot_management/feedback")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[types.BotManagementFeedbackReport])
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdBotManagementFeedback*(client: CloudflareClient,
                                           zoneId: types.BotManagementIdentifier,
                                           body: types.BotManagementFeedbackReport): Future[AsyncResponse] {.async.} =
  ## Submit a feedback report for the specified zone. Use `type` to indicate whether
  ## the report is a false positive (good traffic flagged as bot) or a false negative
  ## (bot traffic missed). Furthermore, you can also use `expression` as a wirefilter
  ## to identify the affected traffic sample.
  ##
  ## See more accepted API fields and expression types at
  ## https://developers.cloudflare.com/bots/concepts/feedback-loop/#api-fields andht
  ## tps://developers.cloudflare.com/bots/concepts/feedback-loop/#expression-fields,
  ## respectively.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/bot_management/feedback", body)
  return res
