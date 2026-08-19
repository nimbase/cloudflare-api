# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  ContentDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  ContentOrderOption* = enum
    orderAssetName = "asset_name"
    orderDlpProfileCount = "dlp_profile_count"
    orderIntegrationName = "integration_name"
    orderLatestAfflictionDate = "latest_affliction_date"


proc getAccountsAccountIdDataSecurityPostureContent*(client: CloudflareClient,
                                                     accountId: string,
                                                     direction: set[ContentDirectionOption] = {},
                                                     dlpProfileId: string = default(string),
                                                     integrationId: string = default(string),
                                                     maxAfflictionDate: string = default(string),
                                                     minAfflictionDate: string = default(string),
                                                     order: set[ContentOrderOption] = {},
                                                     page: int64 = default(int64),
                                                     perPage: int64 = default(int64),
                                                     search: string = default(string),
                                                     vendor: types.PostureApiVendorsEnum = default(types.PostureApiVendorsEnum)): Future[types.PostureApiPaginatedContentAssetList] {.async.} =
  ## List DLP content findings

  var q = initOrderedTable[string, string]()
  for v in direction: q["direction"] = $v
  q["dlp_profile_id"] = $dlpProfileId
  q["integration_id"] = $integrationId
  q["max_affliction_date"] = $maxAfflictionDate
  q["min_affliction_date"] = $minAfflictionDate
  for v in order: q["order"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["vendor"] = $vendor
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/content", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiPaginatedContentAssetList)
  else:
    raise newException(CloudflareClientError, body)
