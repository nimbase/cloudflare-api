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
    enabled: Option[types.ClientSideSecurityEnabled]
    use_cloudflare_reporting_endpoint: Option[types.ClientSideSecurityUseCloudflareReportingEndpoint]
    use_connection_url_path: Option[types.ClientSideSecurityUseConnectionUrlPath]
  PutZonesZoneIdPageShieldPoliciesPolicyIdRequest = object
    action: Option[types.ClientSideSecurityPolicyAction]
    description: Option[types.ClientSideSecurityPolicyDescription]
    enabled: Option[types.ClientSideSecurityPolicyEnabled]
    expression: Option[types.ClientSideSecurityPolicyExpression]
    value: Option[types.ClientSideSecurityPolicyValue]
  ClientSideSecurityOrderByOption* = enum
    orderByFirstSeenAt = "first_seen_at"
    orderByLastSeenAt = "last_seen_at"

  ClientSideSecurityDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  ClientSideSecurityExportOption* = enum
    exportCsv = "csv"

  ClientSideSecuritySameSiteOption* = enum
    sameSiteLax = "lax"
    sameSiteStrict = "strict"
    sameSiteNone = "none"

  ClientSideSecurityTypeOption* = enum
    typeFirstParty = "first_party"
    typeUnknown = "unknown"


proc getZonesZoneIdPageShield*(client: CloudflareClient,
                               zoneId: types.ClientSideSecurityId): Future[JsonNode] {.async.} =
  ## Returns the client-side security product enablement status and reporting
  ## behaviors.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdPageShield*(client: CloudflareClient,
                               zoneId: types.ClientSideSecurityId,
                               body: PutZonesZoneIdPageShieldRequest): Future[JsonNode] {.async.} =
  ## Updates client-side security enablement and reporting behaviors for the zone.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/page_shield", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldConnections*(client: CloudflareClient,
                                          zoneId: types.ClientSideSecurityId,
                                          excludeUrls: string = default(string),
                                          urls: string = default(string),
                                          hosts: string = default(string),
                                          page: string = default(string),
                                          perPage: float64 = default(float64),
                                          orderBy: ClientSideSecurityOrderByOption,
                                          direction: ClientSideSecurityDirectionOption,
                                          prioritizeMalicious: bool = default(bool),
                                          excludeCdnCgi: bool = default(bool),
                                          status: string = default(string),
                                          pageUrl: string = default(string),
                                          `export`: ClientSideSecurityExportOption): Future[types.ClientSideSecurityListZoneConnectionsResponse] {.async.} =
  ## Lists outbound connections made by webpages in the zone.

  var q = initOrderedTable[string, string]()
  q["exclude_urls"] = $excludeUrls
  q["urls"] = $urls
  q["hosts"] = $hosts
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["direction"] = $direction
  q["prioritize_malicious"] = $prioritizeMalicious
  q["exclude_cdn_cgi"] = $excludeCdnCgi
  q["status"] = $status
  q["page_url"] = $pageUrl
  q["export"] = $`export`
  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/connections", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityListZoneConnectionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldConnectionsConnectionId*(client: CloudflareClient,
                                                      zoneId: types.ClientSideSecurityId,
                                                      connectionId: types.ClientSideSecurityId): Future[types.ClientSideSecurityGetZoneConnectionResponse] {.async.} =
  ## Returns a webpage connection detected on the zone by connection ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/connections/{connectionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityGetZoneConnectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldCookies*(client: CloudflareClient,
                                      zoneId: types.ClientSideSecurityId,
                                      hosts: string = default(string),
                                      page: string = default(string),
                                      perPage: float64 = default(float64),
                                      orderBy: ClientSideSecurityOrderByOption,
                                      direction: ClientSideSecurityDirectionOption,
                                      pageUrl: string = default(string),
                                      `export`: ClientSideSecurityExportOption,
                                      name: string = default(string),
                                      secure: bool = default(bool),
                                      httpOnly: bool = default(bool),
                                      sameSite: ClientSideSecuritySameSiteOption,
                                      `type`: ClientSideSecurityTypeOption,
                                      path: string = default(string),
                                      domain: string = default(string)): Future[types.ClientSideSecurityListZoneCookiesResponse] {.async.} =
  ## Lists cookies detected on the zone.

  var q = initOrderedTable[string, string]()
  q["hosts"] = $hosts
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["direction"] = $direction
  q["page_url"] = $pageUrl
  q["export"] = $`export`
  q["name"] = $name
  q["secure"] = $secure
  q["http_only"] = $httpOnly
  q["same_site"] = $sameSite
  q["type"] = $`type`
  q["path"] = $path
  q["domain"] = $domain
  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/cookies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityListZoneCookiesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldCookiesCookieId*(client: CloudflareClient,
                                              zoneId: types.ClientSideSecurityId,
                                              cookieId: types.ClientSideSecurityId): Future[types.ClientSideSecurityGetZoneCookieResponse] {.async.} =
  ## Returns a cookie detected on the zone by cookie ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/cookies/{cookieId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityGetZoneCookieResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldPolicies*(client: CloudflareClient,
                                       zoneId: types.ClientSideSecurityId): Future[types.ClientSideSecurityListZonePoliciesResponse] {.async.} =
  ## Lists content security rules configured for the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/policies")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityListZonePoliciesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdPageShieldPolicies*(client: CloudflareClient,
                                        zoneId: types.ClientSideSecurityId,
                                        body: types.ClientSideSecurityPolicy): Future[types.ClientSideSecurityGetZonePolicyResponse] {.async.} =
  ## Creates a rule that applies a client-side security action when its filter
  ## expression matches.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/page_shield/policies", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityGetZonePolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldPoliciesPolicyId*(client: CloudflareClient,
                                               zoneId: types.ClientSideSecurityId,
                                               policyId: types.ClientSideSecurityId): Future[types.ClientSideSecurityGetZonePolicyResponse] {.async.} =
  ## Returns a content security rule by ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityGetZonePolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdPageShieldPoliciesPolicyId*(client: CloudflareClient,
                                               zoneId: types.ClientSideSecurityId,
                                               policyId: types.ClientSideSecurityId,
                                               body: PutZonesZoneIdPageShieldPoliciesPolicyIdRequest): Future[types.ClientSideSecurityGetZonePolicyResponse] {.async.} =
  ## Updates the description, action, expression, enabled state, and policy value for
  ## a content security rule.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/page_shield/policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityGetZonePolicyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdPageShieldPoliciesPolicyId*(client: CloudflareClient,
                                                  zoneId: types.ClientSideSecurityId,
                                                  policyId: types.ClientSideSecurityId): Future[AsyncResponse] {.async.} =
  ## Permanently deletes a content security rule by ID.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/page_shield/policies/{policyId}")
  return res

proc getZonesZoneIdPageShieldScripts*(client: CloudflareClient,
                                      zoneId: types.ClientSideSecurityId,
                                      excludeUrls: string = default(string),
                                      urls: string = default(string),
                                      hosts: string = default(string),
                                      page: string = default(string),
                                      perPage: float64 = default(float64),
                                      orderBy: ClientSideSecurityOrderByOption,
                                      direction: ClientSideSecurityDirectionOption,
                                      prioritizeMalicious: bool = default(bool),
                                      excludeCdnCgi: bool = true,
                                      excludeDuplicates: bool = true,
                                      status: string = default(string),
                                      pageUrl: string = default(string),
                                      `export`: ClientSideSecurityExportOption): Future[types.ClientSideSecurityListZoneScriptsResponse] {.async.} =
  ## Lists scripts detected on webpages in the zone, with filtering and pagination.

  var q = initOrderedTable[string, string]()
  q["exclude_urls"] = $excludeUrls
  q["urls"] = $urls
  q["hosts"] = $hosts
  q["page"] = $page
  q["per_page"] = $perPage
  q["order_by"] = $orderBy
  q["direction"] = $direction
  q["prioritize_malicious"] = $prioritizeMalicious
  q["exclude_cdn_cgi"] = $excludeCdnCgi
  q["exclude_duplicates"] = $excludeDuplicates
  q["status"] = $status
  q["page_url"] = $pageUrl
  q["export"] = $`export`
  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/scripts", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityListZoneScriptsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdPageShieldScriptsScriptId*(client: CloudflareClient,
                                              zoneId: types.ClientSideSecurityId,
                                              scriptId: types.ClientSideSecurityId): Future[types.ClientSideSecurityGetZoneScriptResponse] {.async.} =
  ## Returns a script detected on the zone by script ID.

  let res = await client.httpGET(fmt"/zones/{zoneId}/page_shield/scripts/{scriptId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ClientSideSecurityGetZoneScriptResponse)
  else:
    raise newException(CloudflareClientError, body)
