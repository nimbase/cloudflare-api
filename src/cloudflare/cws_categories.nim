# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getCwsCategoriesApis*(client: CloudflareClient,
                           cursor: string = default(string), perPage: int64 = 20,
                           application: string = default(string),
                           name: string = default(string),
                           variants: bool = default(bool)): Future[types.CwsPageResponseCategoryName] {.async.} =
  ## Returns distinct active API names across every application or beneath an exact
  ## application name.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["application"] = $application
  q["name"] = $name
  q["variants"] = $variants
  let res = await client.httpGET("/cws/categories/apis", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseCategoryName)
  else:
    raise newException(CloudflareClientError, body)

proc getCwsCategoriesApplications*(client: CloudflareClient,
                                   cursor: string = default(string),
                                   perPage: int64 = 20,
                                   name: string = default(string)): Future[types.CwsPageResponseCategoryApplication] {.async.} =
  ## Returns active applications and their stable keys.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["name"] = $name
  let res = await client.httpGET("/cws/categories/applications", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseCategoryApplication)
  else:
    raise newException(CloudflareClientError, body)

proc getCwsCategoriesApplicationsApplicationKeyVersions*(client: CloudflareClient,
                                                         cursor: string = default(string),
                                                         perPage: int64 = 20,
                                                         applicationKey: string): Future[types.CwsPageResponseCategoryVersionSummary] {.async.} =
  ## Lists immutable category bundle versions for an application.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/cws/categories/applications/{applicationKey}/versions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseCategoryVersionSummary)
  else:
    raise newException(CloudflareClientError, body)

proc getCwsCategoriesApplicationsApplicationKeyVersionsLatest*(client: CloudflareClient,
                                                               applicationKey: string): Future[types.CwsResponseCategoryVersion] {.async.} =
  ## Returns the latest immutable category bundle and supports conditional retrieval
  ## with If-None-Match.

  let res = await client.httpGET(fmt"/cws/categories/applications/{applicationKey}/versions/latest")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseCategoryVersion)
  else:
    raise newException(CloudflareClientError, body)

proc getCwsCategoriesApplicationsApplicationKeyVersionsVersionTag*(client: CloudflareClient,
                                                                   applicationKey: string,
                                                                   versionTag: string): Future[types.CwsResponseCategoryVersion] {.async.} =
  ## Returns a pinned immutable category bundle version.

  let res = await client.httpGET(fmt"/cws/categories/applications/{applicationKey}/versions/{versionTag}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseCategoryVersion)
  else:
    raise newException(CloudflareClientError, body)

proc getCwsCategoriesOperations*(client: CloudflareClient,
                                 cursor: string = default(string),
                                 perPage: int64 = 20,
                                 application: string = default(string),
                                 api: string = default(string),
                                 name: string = default(string),
                                 variants: bool = default(bool)): Future[types.CwsPageResponseCategoryName] {.async.} =
  ## Returns distinct active operation names across every path and supports
  ## independent exact application and API ancestor filters.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["application"] = $application
  q["api"] = $api
  q["name"] = $name
  q["variants"] = $variants
  let res = await client.httpGET("/cws/categories/operations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseCategoryName)
  else:
    raise newException(CloudflareClientError, body)
