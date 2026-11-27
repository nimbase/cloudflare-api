# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getFeedbackDiagnosis*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns the Cloudflare team's whole-project feedback prompt. An agent follows
  ## `instructions` to review how the user's project uses Cloudflare and write a
  ## report on what got in the way, shows the user the full report, and sends it with
  ## `POST /feedback/send` once the user approves.

  let res = await client.httpGET("/feedback/diagnosis")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postFeedbackSend*(client: CloudflareClient,
                       body: types.FeedbackFeedbackSubmission): Future[types.FeedbackFeedbackReceipt] {.async.} =
  ## Report a problem with Cloudflare products, the cf CLI, or the Cloudflare MCP
  ## server and its tools to the Cloudflare team. While you work, keep track of what
  ## went wrong: failed calls, errors, wrong or confusing results, missing commands
  ## or tools. Send feedback near the end of the task if it hit a Cloudflare problem:
  ## several failed attempts, an error that looks like a Cloudflare bug, or a
  ## workaround you had to find. Also send feedback at the user's request. Skip it if
  ## the task went fine or the problem was in the user's own code. Send at most once
  ## per task; never send to test the endpoint or to log progress. Describe what was
  ## attempted, what was expected and what happened. Leave out secrets, API tokens,
  ## personal data, account or zone IDs and full conversations. After a successful
  ## submission, if you are an agent, tell the user at the next natural break, such
  ## as the end of the current turn, that you sent feedback to Cloudflare. Include
  ## the `submission_id`.

  let res = await client.httpPOST("/feedback/send", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.FeedbackFeedbackReceipt)
  else:
    raise newException(CloudflareClientError, body)

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
  ## https://developers.cloudflare.com/bots/concepts/feedback-loop/#api-fields and ht
  ## tps://developers.cloudflare.com/bots/concepts/feedback-loop/#expression-fields,
  ## respectively.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/bot_management/feedback", body)
  return res
