# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpSensitivityGroups*(client: CloudflareClient,
                                               accountId: string): Future[JsonNode] {.async.} =
  ## Lists sensitivity groups configured for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/sensitivity_groups")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpSensitivityGroups*(client: CloudflareClient,
                                                accountId: string,
                                                body: types.DlpNewSensitivityGroup): Future[JsonNode] {.async.} =
  ## Creates a sensitivity group, optionally from a template.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/sensitivity_groups", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpSensitivityGroupsSensitivityGroupId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 sensitivityGroupId: string): Future[JsonNode] {.async.} =
  ## Gets a sensitivity group and its levels.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpSensitivityGroupsSensitivityGroupId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 sensitivityGroupId: string,
                                                                 body: types.DlpSensitivityGroupUpdate): Future[JsonNode] {.async.} =
  ## Updates a sensitivity group and its levels.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpSensitivityGroupsSensitivityGroupId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    sensitivityGroupId: string): Future[JsonNode] {.async.} =
  ## Deletes a sensitivity group and its levels.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelOrder*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           sensitivityGroupId: string): Future[JsonNode] {.async.} =
  ## Gets the current order of sensitivity levels in a group.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}/level_order")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelOrder*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           sensitivityGroupId: string,
                                                                           body: types.DlpSensitivityLevelOrder): Future[JsonNode] {.async.} =
  ## Updates the order of sensitivity levels in a group.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}/level_order", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
