# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevels*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       sensitivityGroupId: string): Future[JsonNode] {.async.} =
  ## Lists sensitivity levels in a sensitivity group.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}/levels")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevels*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        sensitivityGroupId: string,
                                                                        body: types.DlpNewSensitivityLevel): Future[JsonNode] {.async.} =
  ## Creates a sensitivity level in a group.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}/levels", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelsSensitivityLevelId*(client: CloudflareClient,
                                                                                         accountId: string,
                                                                                         sensitivityGroupId: string,
                                                                                         sensitivityLevelId: string): Future[JsonNode] {.async.} =
  ## Gets a sensitivity level from a group.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}/levels/{sensitivityLevelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelsSensitivityLevelId*(client: CloudflareClient,
                                                                                         accountId: string,
                                                                                         sensitivityGroupId: string,
                                                                                         sensitivityLevelId: string,
                                                                                         body: types.DlpSensitivityLevelUpdate): Future[JsonNode] {.async.} =
  ## Updates a sensitivity level in a group.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}/levels/{sensitivityLevelId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpSensitivityGroupsSensitivityGroupIdLevelsSensitivityLevelId*(client: CloudflareClient,
                                                                                            accountId: string,
                                                                                            sensitivityGroupId: string,
                                                                                            sensitivityLevelId: string): Future[JsonNode] {.async.} =
  ## Deletes a sensitivity level from a group.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/sensitivity_groups/{sensitivityGroupId}/levels/{sensitivityLevelId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
