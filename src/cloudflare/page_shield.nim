# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PutZonesZoneIdPageShieldRequest = object
    enabled: Option[types.PageShieldEnabled]
    use_cloudflare_reporting_endpoint: Option[types.PageShieldUseCloudflareReportingEndpoint]
    use_connection_url_path: Option[types.PageShieldUseConnectionUrlPath]
  PutZonesZoneIdPageShieldPoliciesPolicyIdRequest = object
    action: Option[types.PageShieldPolicyAction]
    description: Option[types.PageShieldPolicyDescription]
    enabled: Option[types.PageShieldPolicyEnabled]
    expression: Option[types.PageShieldPolicyExpression]
    value: Option[types.PageShieldPolicyValue]
  PageShieldOrderByOption* = enum
    orderByFirstSeenAt = "first_seen_at"
    orderByLastSeenAt = "last_seen_at"

  PageShieldDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  PageShieldExportOption* = enum
    exportCsv = "csv"

  PageShieldSameSiteOption* = enum
    sameSiteLax = "lax"
    sameSiteStrict = "strict"
    sameSiteNone = "none"

  PageShieldTypeOption* = enum
    typeFirstParty = "first_party"
    typeUnknown = "unknown"


proc getZonesZoneIdPageShield*(client: CloudflareClient,
                               zoneId: types.PageShieldId): Future[JsonNode] {.async.} =
  ## Fetches the Page Shield settings.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdPageShield*(client: CloudflareClient,
                               zoneId: types.PageShieldId,
                               body: PutZonesZoneIdPageShieldRequest): Future[JsonNode] {.async.} =
  ## Updates Page Shield settings.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/page_shield", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldConnections*(client: CloudflareClient,
                                          zoneId: types.PageShieldId,
                                          excludeUrls: string = default(string),
                                          urls: string = default(string),
                                          hosts: string = default(string),
                                          page: string = default(string),
                                          perPage: float64 = default(float64),
                                          orderBy: set[PageShieldOrderByOption] = {},
                                          direction: set[PageShieldDirectionOption] = {},
                                          prioritizeMalicious: bool = default(bool),
                                          excludeCdnCgi: bool = default(bool),
                                          status: string = default(string),
                                          pageUrl: string = default(string),
                                          `export`: set[PageShieldExportOption] = {}): Future[types.PageShieldListZoneConnectionsResponse] {.async.} =
  ## Lists all connections detected by Page Shield.

  var q = initOrderedTable[string, string]()
  q["exclude_urls"] = $excludeUrls
  q["urls"] = $urls
  q["hosts"] = $hosts
  q["page"] = $page
  q["per_page"] = $perPage
  for v in orderBy: q["order_by"] = $v
  for v in direction: q["direction"] = $v
  q["prioritize_malicious"] = $prioritizeMalicious
  q["exclude_cdn_cgi"] = $excludeCdnCgi
  q["status"] = $status
  q["page_url"] = $pageUrl
  for v in `export`: q["export"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/connections", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldListZoneConnectionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldConnectionsConnectionId*(client: CloudflareClient,
                                                      zoneId: types.PageShieldId,
                                                      connectionId: types.PageShieldId): Future[types.PageShieldGetZoneConnectionResponse] {.async.} =
  ## Fetches a connection detected by Page Shield by connection ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/connections/{connectionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldGetZoneConnectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldCookies*(client: CloudflareClient,
                                      zoneId: types.PageShieldId,
                                      hosts: string = default(string),
                                      page: string = default(string),
                                      perPage: float64 = default(float64),
                                      orderBy: set[PageShieldOrderByOption] = {},
                                      direction: set[PageShieldDirectionOption] = {},
                                      pageUrl: string = default(string),
                                      `export`: set[PageShieldExportOption] = {},
                                      name: string = default(string),
                                      secure: bool = default(bool),
                                      httpOnly: bool = default(bool),
                                      sameSite: set[PageShieldSameSiteOption] = {},
                                      `type`: set[PageShieldTypeOption] = {},
                                      path: string = default(string),
                                      domain: string = default(string)): Future[types.PageShieldListZoneCookiesResponse] {.async.} =
  ## Lists all cookies collected by Page Shield.

  var q = initOrderedTable[string, string]()
  q["hosts"] = $hosts
  q["page"] = $page
  q["per_page"] = $perPage
  for v in orderBy: q["order_by"] = $v
  for v in direction: q["direction"] = $v
  q["page_url"] = $pageUrl
  for v in `export`: q["export"] = $v
  q["name"] = $name
  q["secure"] = $secure
  q["http_only"] = $httpOnly
  for v in sameSite: q["same_site"] = $v
  for v in `type`: q["type"] = $v
  q["path"] = $path
  q["domain"] = $domain
  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/cookies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldListZoneCookiesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldCookiesCookieId*(client: CloudflareClient,
                                              zoneId: types.PageShieldId,
                                              cookieId: types.PageShieldId): Future[types.PageShieldGetZoneCookieResponse] {.async.} =
  ## Fetches a cookie collected by Page Shield by cookie ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/cookies/{cookieId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldGetZoneCookieResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldPolicies*(client: CloudflareClient,
                                       zoneId: types.PageShieldId): Future[types.PageShieldListZonePoliciesResponse] {.async.} =
  ## Lists all Page Shield policies.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/policies")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldListZonePoliciesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdPageShieldPolicies*(client: CloudflareClient,
                                        zoneId: types.PageShieldId,
                                        body: types.PageShieldPolicy): Future[types.PageShieldGetZonePolicyResponse] {.async.} =
  ## Create a Page Shield policy.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/page_shield/policies", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldGetZonePolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldPoliciesPolicyId*(client: CloudflareClient,
                                               zoneId: types.PageShieldId,
                                               policyId: types.PageShieldId): Future[types.PageShieldGetZonePolicyResponse] {.async.} =
  ## Fetches a Page Shield policy by ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldGetZonePolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdPageShieldPoliciesPolicyId*(client: CloudflareClient,
                                               zoneId: types.PageShieldId,
                                               policyId: types.PageShieldId,
                                               body: PutZonesZoneIdPageShieldPoliciesPolicyIdRequest): Future[types.PageShieldGetZonePolicyResponse] {.async.} =
  ## Update a Page Shield policy by ID.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/page_shield/policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldGetZonePolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdPageShieldPoliciesPolicyId*(client: CloudflareClient,
                                                  zoneId: types.PageShieldId,
                                                  policyId: types.PageShieldId): Future[AsyncResponse] {.async.} =
  ## Delete a Page Shield policy by ID.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/page_shield/policies/{policyId}")
  return res

proc getZonesZoneIdPageShieldScripts*(client: CloudflareClient,
                                      zoneId: types.PageShieldId,
                                      excludeUrls: string = default(string),
                                      urls: string = default(string),
                                      hosts: string = default(string),
                                      page: string = default(string),
                                      perPage: float64 = default(float64),
                                      orderBy: set[PageShieldOrderByOption] = {},
                                      direction: set[PageShieldDirectionOption] = {},
                                      prioritizeMalicious: bool = default(bool),
                                      excludeCdnCgi: bool = true,
                                      excludeDuplicates: bool = true,
                                      status: string = default(string),
                                      pageUrl: string = default(string),
                                      `export`: set[PageShieldExportOption] = {}): Future[types.PageShieldListZoneScriptsResponse] {.async.} =
  ## Lists all scripts detected by Page Shield.

  var q = initOrderedTable[string, string]()
  q["exclude_urls"] = $excludeUrls
  q["urls"] = $urls
  q["hosts"] = $hosts
  q["page"] = $page
  q["per_page"] = $perPage
  for v in orderBy: q["order_by"] = $v
  for v in direction: q["direction"] = $v
  q["prioritize_malicious"] = $prioritizeMalicious
  q["exclude_cdn_cgi"] = $excludeCdnCgi
  q["exclude_duplicates"] = $excludeDuplicates
  q["status"] = $status
  q["page_url"] = $pageUrl
  for v in `export`: q["export"] = $v
  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/scripts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldListZoneScriptsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldScriptsScriptId*(client: CloudflareClient,
                                              zoneId: types.PageShieldId,
                                              scriptId: types.PageShieldId): Future[types.PageShieldGetZoneScriptResponse] {.async.} =
  ## Fetches a script detected by Page Shield by script ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/scripts/{scriptId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PageShieldGetZoneScriptResponse)
  else:
    raise newException(CloudflareClientError, body)
