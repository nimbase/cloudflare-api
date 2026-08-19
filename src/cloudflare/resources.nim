# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicCloudResources*(client: CloudflareClient,
                                              accountId: types.McnAccountId,
                                              providerId: string = default(string),
                                              resourceType: seq[string] = @[],
                                              resourceId: seq[string] = @[],
                                              region: string = default(string),
                                              resourceGroup: string = default(string),
                                              managed: bool = default(bool),
                                              search: seq[string] = @[],
                                              orderBy: string = default(string),
                                              desc: bool = default(bool),
                                              perPage: int64 = default(int64),
                                              page: int64 = default(int64),
                                              cloudflare: bool = default(bool),
                                              v2: bool = default(bool)): Future[types.McnReadAccountResourcesResponse] {.async.} =
  ## List resources in the Resource Catalog (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["provider_id"] = $providerId
  for v in resourceType: q["resource_type"] = $v
  for v in resourceId: q["resource_id"] = $v
  q["region"] = $region
  q["resource_group"] = $resourceGroup
  q["managed"] = $managed
  for v in search: q["search"] = $v
  q["order_by"] = $orderBy
  q["desc"] = $desc
  q["per_page"] = $perPage
  q["page"] = $page
  q["cloudflare"] = $cloudflare
  q["v2"] = $v2
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/resources", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnReadAccountResourcesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCloudResourcesExport*(client: CloudflareClient,
                                                    accountId: types.McnAccountId,
                                                    providerId: string = default(string),
                                                    resourceType: seq[string] = @[],
                                                    resourceId: seq[string] = @[],
                                                    region: string = default(string),
                                                    resourceGroup: string = default(string),
                                                    search: seq[string] = @[],
                                                    orderBy: string = default(string),
                                                    desc: bool = default(bool),
                                                    v2: bool = default(bool)): Future[AsyncResponse] {.async.} =
  ## Export resources in the Resource Catalog as a JSON file (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["provider_id"] = $providerId
  for v in resourceType: q["resource_type"] = $v
  for v in resourceId: q["resource_id"] = $v
  q["region"] = $region
  q["resource_group"] = $resourceGroup
  for v in search: q["search"] = $v
  q["order_by"] = $orderBy
  q["desc"] = $desc
  q["v2"] = $v2
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/resources/export", q)
  return res

proc postAccountsAccountIdMagicCloudResourcesPolicyPreview*(client: CloudflareClient,
                                                            accountId: types.McnAccountId,
                                                            body: types.McnResourcesCatalogPolicyPreviewRequest): Future[types.McnResourcesCatalogPolicyPreviewResponse] {.async.} =
  ## Preview Rego query result against the latest resource catalog (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/resources/policy-preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnResourcesCatalogPolicyPreviewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCloudResourcesResourceId*(client: CloudflareClient,
                                                        accountId: types.McnAccountId,
                                                        resourceId: types.McnResourceId,
                                                        v2: bool = default(bool)): Future[types.McnReadAccountResourceResponse] {.async.} =
  ## Read an resource from the Resource Catalog (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["v2"] = $v2
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/resources/{resourceId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnReadAccountResourceResponse)
  else:
    raise newException(CloudflareClientError, body)
