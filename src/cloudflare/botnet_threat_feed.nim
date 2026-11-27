# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBotnetFeedAsnAsnIdDayReport*(client: CloudflareClient,
                                                      accountId: types.BotnetFeedIdentifier,
                                                      asnId: types.BotnetFeedAsn,
                                                      date: types.BotnetFeedTimestamp = default(types.BotnetFeedTimestamp)): Future[JsonNode] {.async.} =
  ## Gets all the data the botnet tracking database has for a given ASN registered to
  ## user account for given date. If no date is given, it will return results for the
  ## previous day.

  var q = initOrderedTable[string, string]()
  q["date"] = $date
  let res = await client.httpGET(fmt"/accounts/{accountId}/botnet_feed/asn/{asnId}/day_report", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBotnetFeedAsnAsnIdFullReport*(client: CloudflareClient,
                                                       accountId: types.BotnetFeedIdentifier,
                                                       asnId: types.BotnetFeedAsn): Future[JsonNode] {.async.} =
  ## Gets all the data the botnet threat feed tracking database has for a given ASN
  ## registered to user account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/botnet_feed/asn/{asnId}/full_report")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBotnetFeedConfigsAsn*(client: CloudflareClient,
                                               accountId: types.BotnetFeedIdentifier): Future[JsonNode] {.async.} =
  ## Gets a list of all ASNs registered for a user for the DDoS Botnet Feed API.

  let res = await client.httpGET(fmt"/accounts/{accountId}/botnet_feed/configs/asn")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBotnetFeedConfigsAsnAsnId*(client: CloudflareClient,
                                                       accountId: types.BotnetFeedIdentifier,
                                                       asnId: types.BotnetFeedAsn): Future[JsonNode] {.async.} =
  ## Delete an ASN from botnet threat feed for a given user.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/botnet_feed/configs/asn/{asnId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
