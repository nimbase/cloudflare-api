# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  GetTenantsTenantIdAccountsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiLegacyAccount]
    result_info: types.OrganizationsApiAccountListResultInfo
    success: bool
  TenantStatusOption* = enum
    statusActive = "active"
    statusDeleted = "deleted"

  TenantOrderByOption* = enum
    orderByAccountName = "account_name"

  TenantDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getTenantsTenantIdAccounts*(client: CloudflareClient, tenantId: string,
                                 accountPubname: string = default(string),
                                 accountPubnameStartsWith: string = default(string),
                                 accountPubnameEndsWith: string = default(string),
                                 accountPubnameContains: string = default(string),
                                 name: string = default(string),
                                 nameStartsWith: string = default(string),
                                 nameEndsWith: string = default(string),
                                 nameContains: string = default(string),
                                 status: TenantStatusOption = statusActive,
                                 orderBy: TenantOrderByOption = orderByAccountName,
                                 direction: TenantDirectionOption = directionAsc,
                                 includeTotal: bool = true,
                                 page: int64 = default(int64),
                                 perPage: int64 = default(int64),
                                 pageToken: string = default(string),
                                 pageSize: int64 = default(int64)): Future[GetTenantsTenantIdAccountsResponse] {.async.} =
  ## Lists all Cloudflare accounts across this tenant's hierarchy using the legacy
  ## Account
  ## response shape. Use `GET /organizations/{organization_id}/accounts` to list only
  ## accounts
  ## immediately attached to a specific Organization using the modern Account
  ## response shape.
  ## Use `page_token` and `page_size` for cursor pagination, or provide `page` and
  ## `per_page`
  ## together for legacy offset pagination. Cursor pagination takes precedence when
  ## requested.

  var q = initOrderedTable[string, string]()
  q["account_pubname"] = $accountPubname
  q["account_pubname.startsWith"] = $accountPubnameStartsWith
  q["account_pubname.endsWith"] = $accountPubnameEndsWith
  q["account_pubname.contains"] = $accountPubnameContains
  q["name"] = $name
  q["name.startsWith"] = $nameStartsWith
  q["name.endsWith"] = $nameEndsWith
  q["name.contains"] = $nameContains
  q["status"] = $status
  q["order_by"] = $orderBy
  q["direction"] = $direction
  q["include_total"] = $includeTotal
  q["page"] = $page
  q["per_page"] = $perPage
  q["page_token"] = $pageToken
  q["page_size"] = $pageSize
  let res = await client.httpGET(fmt"/tenants/{tenantId}/accounts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetTenantsTenantIdAccountsResponse)
  else:
    raise newException(CloudflareClientError, body)
