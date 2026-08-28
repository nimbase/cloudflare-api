# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdTags*(client: CloudflareClient,
                               accountId: types.ResourceTaggingAccountId,
                               resourceId: types.ResourceTaggingResourceId,
                               resourceType: types.ResourceTaggingAccountResourceType,
                               workerId: types.ResourceTaggingWorkerId = default(types.ResourceTaggingWorkerId)): Future[types.ResourceTaggingTaggedResourceResponseSingle] {.async.} =
  ## Retrieves tags for a specific account-level resource.

  var q = initOrderedTable[string, string]()
  q["resource_id"] = $resourceId
  q["resource_type"] = $resourceType
  q["worker_id"] = $workerId
  let res = await client.httpGET(fmt"/accounts/{accountId}/tags", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceTaggingTaggedResourceResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdTags*(client: CloudflareClient,
                               accountId: types.ResourceTaggingAccountId,
                               body: types.ResourceTaggingSetTagsRequestAccountLevel): Future[types.ResourceTaggingTaggedResourceResponseSingle] {.async.} =
  ## Creates or updates tags for a specific account-level resource.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/tags", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceTaggingTaggedResourceResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdTags*(client: CloudflareClient,
                                  accountId: types.ResourceTaggingAccountId,
                                  body: types.ResourceTaggingDeleteTagsRequestAccountLevel): Future[AsyncResponse] {.async.} =
  ## Removes all tags from a specific account-level resource.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/tags", body)
  return res

proc getAccountsAccountIdTagsKeys*(client: CloudflareClient,
                                   accountId: types.ResourceTaggingAccountId,
                                   cursor: string = default(string)): Future[types.ResourceTaggingTagKeysResponseCollection] {.async.} =
  ## Lists all distinct tag keys used across resources in an account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/tags/keys", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceTaggingTagKeysResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTagsResources*(client: CloudflareClient,
                                        accountId: types.ResourceTaggingAccountId,
                                        `type`: seq[string] = @[],
                                        name: string = default(string),
                                        id: seq[string] = @[],
                                        caseInsensitive: bool = false,
                                        tag: seq[string] = @[],
                                        cursor: string = default(string)): Future[types.ResourceTaggingTaggedResourceResponseCollection] {.async.} =
  ## Lists all tagged resources for an account.

  var q = initOrderedTable[string, string]()
  for v in `type`: q["type"] = $v
  q["name"] = $name
  for v in id: q["id"] = $v
  q["case_insensitive"] = $caseInsensitive
  for v in tag: q["tag"] = $v
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/tags/resources", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceTaggingTaggedResourceResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTagsSummary*(client: CloudflareClient,
                                      accountId: types.ResourceTaggingAccountId,
                                      cursor: string = default(string)): Future[types.ResourceTaggingTagKeySummaryResponseCollection] {.async.} =
  ## Lists all distinct tag keys and their distinct values across resources in an
  ## account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/tags/summary", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceTaggingTagKeySummaryResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdTagsValuesTagKey*(client: CloudflareClient,
                                           accountId: types.ResourceTaggingAccountId,
                                           tagKey: string,
                                           `type`: types.ResourceTaggingResourceType = default(types.ResourceTaggingResourceType),
                                           cursor: string = default(string)): Future[types.ResourceTaggingTagValuesResponseCollection] {.async.} =
  ## Lists all distinct values for a given tag key, optionally filtered by resource
  ## type.

  var q = initOrderedTable[string, string]()
  q["type"] = $`type`
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{accountId}/tags/values/{tagKey}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceTaggingTagValuesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdTags*(client: CloudflareClient,
                         zoneId: types.ResourceTaggingZoneId,
                         resourceId: types.ResourceTaggingResourceId,
                         resourceType: types.ResourceTaggingZoneResourceType,
                         accessApplicationId: types.ResourceTaggingAccessApplicationId = default(types.ResourceTaggingAccessApplicationId)): Future[types.ResourceTaggingTaggedResourceResponseSingle] {.async.} =
  ## Retrieves tags for a specific zone-level resource.

  var q = initOrderedTable[string, string]()
  q["resource_id"] = $resourceId
  q["resource_type"] = $resourceType
  q["access_application_id"] = $accessApplicationId
  let res = await client.httpGET(fmt"/zones/{zoneId}/tags", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceTaggingTaggedResourceResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdTags*(client: CloudflareClient,
                         zoneId: types.ResourceTaggingZoneId,
                         body: types.ResourceTaggingSetTagsRequestZoneLevel): Future[types.ResourceTaggingTaggedResourceResponseSingle] {.async.} =
  ## Creates or updates tags for a specific zone-level resource. Replaces all
  ## existing tags for the resource.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/tags", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceTaggingTaggedResourceResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdTags*(client: CloudflareClient,
                            zoneId: types.ResourceTaggingZoneId,
                            body: types.ResourceTaggingDeleteTagsRequestZoneLevel): Future[AsyncResponse] {.async.} =
  ## Removes all tags from a specific zone-level resource.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/tags", body)
  return res
