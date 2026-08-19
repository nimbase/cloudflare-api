# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdChallengesWidgetsRequest = object
    bot_fight_mode: Option[types.TurnstileBotFightMode]
    clearance_level: Option[types.TurnstileClearanceLevel]
    domains: types.TurnstileDomains
    ephemeral_id: Option[types.TurnstileEphemeralId]
    mode: types.TurnstileWidgetMode
    name: types.TurnstileName
    offlabel: Option[types.TurnstileOfflabel]
    region: Option[types.TurnstileRegion]
  PutAccountsAccountIdChallengesWidgetsSitekeyRequest = object
    bot_fight_mode: Option[types.TurnstileBotFightMode]
    clearance_level: Option[types.TurnstileClearanceLevel]
    domains: types.TurnstileDomains
    ephemeral_id: Option[types.TurnstileEphemeralId]
    mode: types.TurnstileWidgetMode
    name: types.TurnstileName
    offlabel: Option[types.TurnstileOfflabel]
    region: Option[types.TurnstileRegion]
  PostAccountsAccountIdChallengesWidgetsSitekeyRotateSecretRequest = object
    invalidate_immediately: Option[types.TurnstileInvalidateImmediately]

proc getAccountsAccountIdChallengesWidgets*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Lists all turnstile widgets of an account.

  let res = await client.httpGET("/accounts/{account_id}/challenges/widgets")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdChallengesWidgets*(client: CloudflareClient,
                                             body: PostAccountsAccountIdChallengesWidgetsRequest): Future[JsonNode] {.async.} =
  ## Lists challenge widgets.

  let res = await client.httpPOST("/accounts/{account_id}/challenges/widgets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdChallengesWidgetsSitekey*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Show a single challenge widget configuration.

  let res = await client.httpGET("/accounts/{account_id}/challenges/widgets/{sitekey}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdChallengesWidgetsSitekey*(client: CloudflareClient,
                                                   body: PutAccountsAccountIdChallengesWidgetsSitekeyRequest): Future[JsonNode] {.async.} =
  ## Update the configuration of a widget.

  let res = await client.httpPUT("/accounts/{account_id}/challenges/widgets/{sitekey}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdChallengesWidgetsSitekey*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Destroy a Turnstile Widget.

  let res = await client.httpDELETE("/accounts/{account_id}/challenges/widgets/{sitekey}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdChallengesWidgetsSitekeyRotateSecret*(client: CloudflareClient,
                                                                body: PostAccountsAccountIdChallengesWidgetsSitekeyRotateSecretRequest): Future[JsonNode] {.async.} =
  ## Generate a new secret key for this widget. If `invalidate_immediately`
  ## is set to `false`, the previous secret remains valid for 2 hours.
  ##
  ## Note that secrets cannot be rotated again during the grace period.

  let res = await client.httpPOST("/accounts/{account_id}/challenges/widgets/{sitekey}/rotate_secret", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
