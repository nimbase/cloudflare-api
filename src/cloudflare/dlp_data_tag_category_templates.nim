# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient


proc getAccountsAccountIdDlpDataTagCategoryTemplates*(client: CloudflareClient,
                                                      accountId: string): Future[JsonNode] {.async.} =
  ## Lists available data tag category templates.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/data_tag_category_templates")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpDataTagCategoryTemplatesTemplateId*(client: CloudflareClient,
                                                                accountId: string,
                                                                templateId: string): Future[JsonNode] {.async.} =
  ## Gets an available data tag category template.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/data_tag_category_templates/{templateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
