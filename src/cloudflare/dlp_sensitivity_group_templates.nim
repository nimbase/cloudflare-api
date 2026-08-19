# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient


proc getAccountsAccountIdDlpSensitivityGroupsTemplates*(client: CloudflareClient,
                                                        accountId: string): Future[JsonNode] {.async.} =
  ## Lists available sensitivity group templates.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/sensitivity_groups/templates")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpSensitivityGroupsTemplatesTemplateId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  templateId: string): Future[JsonNode] {.async.} =
  ## Gets an available sensitivity group template.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/sensitivity_groups/templates/{templateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
