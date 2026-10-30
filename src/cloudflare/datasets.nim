# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneEventsDatasetsPopulateResponse* = object
    properties: JsonNode
    `type`: string

proc postAccountsAccountIdCloudforceOneEventsDatasetsPopulate*(client: CloudflareClient,
                                                               accountId: string): Future[PostAccountsAccountIdCloudforceOneEventsDatasetsPopulateResponse] {.async.} =
  ## Rebuilds the lists of attackers, categories, indicator types, and target
  ## industries for the account's datasets from their existing events. Datasets are
  ## processed in batches.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/events/datasets/populate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneEventsDatasetsPopulateResponse)
  else:
    raise newException(CloudflareClientError, body)
