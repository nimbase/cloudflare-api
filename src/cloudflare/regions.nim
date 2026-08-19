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
  RegionTypeOption* = enum
    typeManaged = "managed"
    typeCustom = "custom"


proc getAccountsAccountIdDlsRegions*(client: CloudflareClient,
                                     accountId: types.DlsAccountIdentifier,
                                     cursor: string = default(string),
                                     perPage: int64 = 25,
                                     `type`: set[RegionTypeOption] = {}): Future[types.DlsRegionPublicPaginatedListResponse] {.async.} =
  ## List the DLS regions (managed and custom) available to an account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  for v in `type`: q["type"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/dls/regions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DlsRegionPublicPaginatedListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlsRegionsRegionId*(client: CloudflareClient,
                                             accountId: types.DlsAccountIdentifier,
                                             regionId: string): Future[types.DlsFetchPublicRegionResponse] {.async.} =
  ## Retrieve a single DLS region (managed or custom) by ID or region key.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dls/regions/{regionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DlsFetchPublicRegionResponse)
  else:
    raise newException(CloudflareClientError, body)
