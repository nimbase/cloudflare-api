# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpLimits*(client: CloudflareClient, accountId: string): Future[JsonNode] {.async.} =
  ## Retrieves current DLP usage limits and quotas for the account, including
  ## maximum allowed counts and current usage for custom entries, dataset cells,
  ## and document fingerprints.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/limits")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpPatternsValidate*(client: CloudflareClient,
                                               accountId: string,
                                               body: types.DlpRegexValidationQuery): Future[JsonNode] {.async.} =
  ## Validates whether this pattern is a valid regular expression. Rejects it if
  ## the regular expression is too complex or can match an unbounded-length
  ## string. The regex will be rejected if it uses `*` or `+`. Bound the maximum
  ## number of characters that can be matched using a range, e.g. `{1,100}`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/patterns/validate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpPayloadLog*(client: CloudflareClient,
                                        accountId: string): Future[JsonNode] {.async.} =
  ## Gets the current payload logging configuration for DLP, showing whether matched
  ## content is being logged.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/payload_log")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpPayloadLog*(client: CloudflareClient,
                                        accountId: string,
                                        body: types.DlpPayloadLogSettingUpdateLegacy): Future[JsonNode] {.async.} =
  ## Enables or disables payload logging for DLP matches. When enabled, matched
  ## content is stored for review.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/payload_log", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpSettings*(client: CloudflareClient,
                                      accountId: string): Future[JsonNode] {.async.} =
  ## Gets the account-level DLP settings.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpSettings*(client: CloudflareClient,
                                      accountId: string,
                                      body: types.DlpDlpSettingsUpdate): Future[JsonNode] {.async.} =
  ## Missing fields are reset to initial (unconfigured) values.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpSettings*(client: CloudflareClient,
                                         accountId: string): Future[JsonNode] {.async.} =
  ## Deletes account-level DLP settings and returns the initial values.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDlpSettings*(client: CloudflareClient,
                                        accountId: string,
                                        body: types.DlpDlpSettingsUpdate): Future[JsonNode] {.async.} =
  ## Missing fields keep their existing values.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/dlp/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
