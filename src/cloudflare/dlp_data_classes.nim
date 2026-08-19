# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpDataClasses*(client: CloudflareClient,
                                         accountId: string): Future[JsonNode] {.async.} =
  ## Lists data classes configured for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/data_classes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpDataClasses*(client: CloudflareClient,
                                          accountId: string,
                                          body: types.DlpNewDataClass): Future[JsonNode] {.async.} =
  ## Creates a data class for use in DLP profiles.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/data_classes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpDataClassesDataClassId*(client: CloudflareClient,
                                                    accountId: string,
                                                    dataClassId: string): Future[JsonNode] {.async.} =
  ## Gets the configuration for a data class.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/data_classes/{dataClassId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpDataClassesDataClassId*(client: CloudflareClient,
                                                    accountId: string,
                                                    dataClassId: string,
                                                    body: types.DlpDataClassUpdate): Future[JsonNode] {.async.} =
  ## Updates the configuration for a data class.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/data_classes/{dataClassId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpDataClassesDataClassId*(client: CloudflareClient,
                                                       accountId: string,
                                                       dataClassId: string): Future[JsonNode] {.async.} =
  ## Deletes a data class from the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/data_classes/{dataClassId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
