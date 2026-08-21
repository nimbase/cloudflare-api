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
  GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainMatchesResponse* = object
    matches: seq[JsonNode]
    total: int64
  GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
      ## Present on paginated list responses when page or per_page is supplied.
    success: bool
  PostAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesRequest = object
    max_time: Option[string]
    min_time: Option[string]
    scan: Option[bool]
    scan_matches: Option[bool]
    search_lookback: Option[bool]
    string_matches: seq[JsonNode]
    tag: string
  PostAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse* = object
    message: string
    query_id: int64
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse* = object
    message: string
    success: bool
  PatchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdRequest = object
    max_time: Option[string]
    min_time: Option[string]
    scan: Option[bool]
    scan_matches: Option[bool]
    search_lookback: Option[bool]
    string_matches: seq[JsonNode]
    tag: string
  PatchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse* = object
    message: string
    query_id: int64
    success: bool
  PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerateRequest = object
    create_notice: Option[bool]
    fields: JsonNode
    format: Option[string]
    notice_params: Option[JsonNode]
    template_id: string
  PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerateResponse* = object
    letter: string
    letter_id: int64
    notice: JsonNode
  GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse* = object
    templates: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesRequest = object
    body: string
    category: string
    description: Option[string]
    name: string
  PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse* = object
    body: string
    category: string
    created_at: string
    description: string
    id: string
    name: string
    source: string
    updated_at: string
  GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesExamplesResponse* = object
    templates: seq[JsonNode]
  GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse* = object
    body: string
    category: string
    created_at: string
    description: string
    id: string
    name: string
    source: string
    updated_at: string
  PutAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdRequest = object
    body: Option[string]
    category: Option[string]
    description: Option[string]
    name: Option[string]
  PutAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse* = object
    body: string
    category: string
    created_at: string
    description: string
    id: string
    name: string
    source: string
    updated_at: string
  DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse* = object
    message: string
    success: bool
  GetAccountsAccountIdCloudforceOneV2BrandProtectionLogoMatchesResponse* = object
    matches: seq[JsonNode]
    total: int64
  PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesRequest = object
    image_data: string
    search_lookback: Option[bool]
    similarity_threshold: float64
    tag: string
  PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesResponse* = object
    message: string
    query_id: int64
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesQueryIdResponse* = object
    message: string
    success: bool
  PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearchRequest = object
    image_data: string
    score_threshold: Option[float64]
    top_k: Option[int64]
  PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearchResponse* = object
    matches: seq[JsonNode]
  GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse* = object
    notices: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesRequest = object
    domain: string
    match_id: Option[int64]
    match_type: Option[string]
    query_id: Option[int64]
    status: Option[string]
  PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse* = object
    created_at: string
    domain: string
    id: float64
    match_id: float64
    match_type: string
    query_id: float64
    status: string
    updated_at: string
  PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookupRequest = object
    domains: seq[string]
    query_id: Option[int64]
    query_ids: Option[seq[int64]]
  PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookupResponse* = object
    notices: seq[JsonNode]
  GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse* = object
    created_at: string
    domain: string
    id: float64
    match_id: float64
    match_type: string
    query_id: float64
    status: string
    updated_at: string
  PutAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdRequest = object
    domain: Option[string]
    match_id: Option[int64]
    match_type: Option[string]
    query_id: Option[int64]
    status: Option[string]
  PutAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse* = object
    created_at: string
    domain: string
    id: float64
    match_id: float64
    match_type: string
    query_id: float64
    status: string
    updated_at: string
  DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse* = object
    message: string
    success: bool
  GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse* = object
    letters: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersRequest = object
    fields: JsonNode
    template_id: string
  PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse* = object
    created_at: string
    id: float64
    letter_text: string
    letter_type: string
    takedown_notice_id: float64
    template_id: string
  GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse* = object
    created_at: string
    id: float64
    letter_text: string
    letter_type: string
    takedown_notice_id: float64
    template_id: string
  DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse* = object
    message: string
    success: bool
  BrandProtectionOrderByOption* = enum
    orderByDomain = "domain"
    orderByFirstSeen = "first_seen"
    orderByRegistrar = "registrar"

  BrandProtectionOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"


proc getAccountsAccountIdBrandProtectionAlerts*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return all alerts on submitted domains

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/alerts")
  return res

proc patchAccountsAccountIdBrandProtectionAlerts*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after updating alerts on submitted domains by ID

  let res = await client.httpPATCH("/accounts/{account_id}/brand-protection/alerts")
  return res

proc patchAccountsAccountIdBrandProtectionAlertsClear*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after updating verification statuses of tracked URLs to
  ## awaiting by ID

  let res = await client.httpPATCH("/accounts/{account_id}/brand-protection/alerts/clear")
  return res

proc patchAccountsAccountIdBrandProtectionAlertsRefute*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after updating verification statuses of tracked URLs to
  ## disproven by ID

  let res = await client.httpPATCH("/accounts/{account_id}/brand-protection/alerts/refute")
  return res

proc patchAccountsAccountIdBrandProtectionAlertsVerify*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after updating verification statuses of tracked URLs to
  ## confirmed by ID

  let res = await client.httpPATCH("/accounts/{account_id}/brand-protection/alerts/verify")
  return res

proc getAccountsAccountIdBrandProtectionBrands*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return all brands

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/brands")
  return res

proc postAccountsAccountIdBrandProtectionBrands*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return new brands

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/brands")
  return res

proc deleteAccountsAccountIdBrandProtectionBrands*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after deleting brands by ID

  let res = await client.httpDELETE("/accounts/{account_id}/brand-protection/brands")
  return res

proc getAccountsAccountIdBrandProtectionBrandsPatterns*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return patterns for brands based on ID

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/brands/patterns")
  return res

proc postAccountsAccountIdBrandProtectionBrandsPatterns*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after creating new patterns for brands by ID

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/brands/patterns")
  return res

proc deleteAccountsAccountIdBrandProtectionBrandsPatterns*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after deleting patterns for brands by ID

  let res = await client.httpDELETE("/accounts/{account_id}/brand-protection/brands/patterns")
  return res

proc patchAccountsAccountIdBrandProtectionClear*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after updating verification statuses of submitted URLs
  ## to awaiting by ID

  let res = await client.httpPATCH("/accounts/{account_id}/brand-protection/clear")
  return res

proc getAccountsAccountIdBrandProtectionDomainInfo*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return submitted domains based on ID

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/domain-info")
  return res

proc getAccountsAccountIdBrandProtectionRecentSubmissions*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return recent URL submissions

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/recent-submissions")
  return res

proc patchAccountsAccountIdBrandProtectionRefute*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after updating verification statuses of submitted URLs
  ## to disproven by ID

  let res = await client.httpPATCH("/accounts/{account_id}/brand-protection/refute")
  return res

proc getAccountsAccountIdBrandProtectionSubmissionInfo*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return URL submissions based on ID

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/submission-info")
  return res

proc postAccountsAccountIdBrandProtectionSubmit*(client: CloudflareClient): Future[types.BrandProtectionApiURLSubmit] {.async.} =
  ## Return new URL submissions

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/submit")
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.BrandProtectionApiURLSubmit)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrandProtectionTrackedDomains*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return submitted domains based on pattern

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/tracked-domains")
  return res

proc getAccountsAccountIdBrandProtectionUrlInfo*(client: CloudflareClient): Future[types.BrandProtectionApiURLInfo] {.async.} =
  ## Return submitted URLs based on ID

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/url-info")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrandProtectionApiURLInfo)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdBrandProtectionVerify*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after updating verification statuses of submitted URLs
  ## to confirmed by ID

  let res = await client.httpPATCH("/accounts/{account_id}/brand-protection/verify")
  return res

proc getAccountsAccountIdCloudforceOneV2BrandProtectionDomainMatches*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      offset: string = "0",
                                                                      limit: string = "50",
                                                                      queryId: seq[string] = @[],
                                                                      includeDomainId: string = "false",
                                                                      includeDismissed: string = default(string),
                                                                      domainSearch: string = default(string),
                                                                      orderBy: BrandProtectionOrderByOption,
                                                                      order: BrandProtectionOrderOption): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainMatchesResponse] {.async.} =
  ## Get paginated list of domain matches for one or more brand protection queries.
  ## When multiple query_ids are provided (comma-separated), matches are deduplicated
  ## across queries and each match includes a match_details array with per-match
  ## query metadata and individual dismissed state.

  var q = initOrderedTable[string, string]()
  q["offset"] = $offset
  q["limit"] = $limit
  for v in queryId: q["query_id"] = $v
  q["include_domain_id"] = $includeDomainId
  q["include_dismissed"] = $includeDismissed
  q["domain_search"] = $domainSearch
  q["orderBy"] = $orderBy
  q["order"] = $order
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/domain/matches", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainMatchesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueries*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      id: string = default(string),
                                                                      page: int64 = default(int64),
                                                                      perPage: int64 = default(int64)): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse] {.async.} =
  ## Get all saved brand protection queries for an account

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/domain/queries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueries*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       body: PostAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesRequest): Future[PostAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse] {.async.} =
  ## Create a new saved brand protection query with string match patterns

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/domain/queries", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryId*(client: CloudflareClient,
                                                                                accountId: string,
                                                                                queryId: string): Future[DeleteAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse] {.async.} =
  ## Delete a saved brand protection domain query from the account_queries table.
  ## This operation will remove the query from the durable object database. Returns
  ## 404 if the query ID doesn't exist.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/domain/queries/{queryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryId*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               queryId: string,
                                                                               body: PatchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdRequest): Future[PatchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse] {.async.} =
  ## Update a saved brand protection domain query with string match patterns

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/domain/queries/{queryId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdCloudforceOneV2BrandProtectionDomainQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerate*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        body: PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerateRequest): Future[PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerateResponse] {.async.} =
  ## Generate a takedown letter from a template. Returns V4 JSON for text format or a
  ## PDF binary for pdf format.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/letter/generate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterGenerateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplates*(client: CloudflareClient,
                                                                        accountId: string): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse] {.async.} =
  ## List user-defined takedown letter templates. System example templates are
  ## available via the /templates/examples endpoint.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/letter/templates")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplates*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         body: PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesRequest): Future[PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse] {.async.} =
  ## Create a new user-defined takedown letter template

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/letter/templates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesExamples*(client: CloudflareClient,
                                                                                accountId: string): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesExamplesResponse] {.async.} =
  ## List system-provided example templates that can be used as starting points when
  ## creating custom templates. These templates cannot be used directly for letter
  ## generation.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/letter/templates/examples")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesExamplesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateId*(client: CloudflareClient,
                                                                                  accountId: string,
                                                                                  templateId: string): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse] {.async.} =
  ## Get a specific user-defined takedown letter template by ID. System example
  ## templates are available via the /templates/examples endpoint.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/letter/templates/{templateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateId*(client: CloudflareClient,
                                                                                  accountId: string,
                                                                                  templateId: string,
                                                                                  body: PutAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdRequest): Future[PutAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse] {.async.} =
  ## Update a user-defined takedown letter template. System templates cannot be
  ## modified.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/letter/templates/{templateId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateId*(client: CloudflareClient,
                                                                                     accountId: string,
                                                                                     templateId: string): Future[DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse] {.async.} =
  ## Delete a user-defined takedown letter template. System templates cannot be
  ## deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/letter/templates/{templateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLetterTemplatesTemplateIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionLogoMatches*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    offset: string = "0",
                                                                    limit: string = "50",
                                                                    queryId: string,
                                                                    download: string = default(string),
                                                                    orderBy: BrandProtectionOrderByOption,
                                                                    order: BrandProtectionOrderOption): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionLogoMatchesResponse] {.async.} =
  ## Get paginated list of logo matches for a specific brand protection logo query

  var q = initOrderedTable[string, string]()
  q["offset"] = $offset
  q["limit"] = $limit
  q["query_id"] = $queryId
  q["download"] = $download
  q["orderBy"] = $orderBy
  q["order"] = $order
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/logo/matches", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionLogoMatchesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueries*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    id: string = default(string),
                                                                    download: string = default(string)): Future[seq[JsonNode]] {.async.} =
  ## Get all saved brand protection logo queries for an account. Optionally specify
  ## id to get a single query. Set download=true to include base64-encoded image
  ## data.

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["download"] = $download
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/logo/queries", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueries*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     body: PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesRequest): Future[PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesResponse] {.async.} =
  ## Create a new saved brand protection logo query for visual similarity matching

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/logo/queries", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesQueryId*(client: CloudflareClient,
                                                                              accountId: string,
                                                                              queryId: string): Future[DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesQueryIdResponse] {.async.} =
  ## Delete a saved brand protection logo query. Returns 404 if the query ID doesn't
  ## exist.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/logo/queries/{queryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2BrandProtectionLogoQueriesQueryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearch*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    showHistoric: string = "false",
                                                                    download: string = default(string),
                                                                    body: PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearchRequest): Future[PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearchResponse] {.async.} =
  ## Submit an image and find the n closest matches from the scanned images index
  ## without creating any match records. Returns similarity scores and metadata for
  ## each match.

  var q = initOrderedTable[string, string]()
  q["showHistoric"] = $showHistoric
  q["download"] = $download
  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/logo/search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2BrandProtectionLogoSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNotices*(client: CloudflareClient,
                                                                        accountId: string): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse] {.async.} =
  ## List all takedown notices for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNotices*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         body: PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesRequest): Future[PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse] {.async.} =
  ## Create a new takedown notice for a domain suspected of trademark infringement.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookup*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               body: PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookupRequest): Future[PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookupResponse] {.async.} =
  ## Bulk lookup of takedown notices by domain names. Returns an array of { domain,
  ## queryId, notice } entries (notice is null when no match exists). Supports
  ## optional queryId or queryIds to scope lookups per query. Uses POST to avoid URL
  ## length limits when looking up many domains. This endpoint is read-only. Domains
  ## are normalized (trimmed, lowercased) and deduplicated.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/lookup", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesLookupResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeId*(client: CloudflareClient,
                                                                                accountId: string,
                                                                                noticeId: int64): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse] {.async.} =
  ## Get a specific takedown notice by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/{noticeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeId*(client: CloudflareClient,
                                                                                accountId: string,
                                                                                noticeId: int64,
                                                                                body: PutAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdRequest): Future[PutAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse] {.async.} =
  ## Update a takedown notice (e.g. change status to sent, resolved, etc.).

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/{noticeId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeId*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   noticeId: int64): Future[DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse] {.async.} =
  ## Delete a takedown notice and all associated letters. PDFs are also removed from
  ## storage.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/{noticeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLetters*(client: CloudflareClient,
                                                                                       accountId: string,
                                                                                       noticeId: int64): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse] {.async.} =
  ## List all letters for a specific takedown notice.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/{noticeId}/letters")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLetters*(client: CloudflareClient,
                                                                                        accountId: string,
                                                                                        noticeId: int64,
                                                                                        body: PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersRequest): Future[PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse] {.async.} =
  ## Generate a takedown letter for a notice and persist the rendered text. The PDF
  ## is generated lazily on download.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/{noticeId}/letters", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterId*(client: CloudflareClient,
                                                                                               accountId: string,
                                                                                               noticeId: int64,
                                                                                               letterId: int64): Future[GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse] {.async.} =
  ## Get a specific takedown letter by ID, including the rendered text.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/{noticeId}/letters/{letterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterId*(client: CloudflareClient,
                                                                                                  accountId: string,
                                                                                                  noticeId: int64,
                                                                                                  letterId: int64): Future[DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse] {.async.} =
  ## Delete a specific takedown letter and its associated PDF from storage.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/{noticeId}/letters/{letterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2BrandProtectionTakedownNoticesNoticeIdLettersLetterIdPdf*(client: CloudflareClient,
                                                                                                  accountId: string,
                                                                                                  noticeId: int64,
                                                                                                  letterId: int64): Future[AsyncResponse] {.async.} =
  ## Download the PDF for a stored takedown letter. If no PDF exists yet, it is
  ## generated from the stored letter text and cached for future downloads.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/takedown-notices/{noticeId}/letters/{letterId}/pdf")
  return res

proc getAccountsAccountIdCloudforceOneV2BrandProtectionTotalQueries*(client: CloudflareClient,
                                                                     accountId: string): Future[seq[JsonNode]] {.async.} =
  ## Get the total number of saved brand protection queries (domain + logo) for an
  ## account

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/brand-protection/total-queries")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc postInternalSubmit*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Internal route for testing URL submissions.

  let res = await client.httpPOST("/internal/submit")
  return res

proc getLive*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after running liveness checks

  let res = await client.httpGET("/live")
  return res

proc getReady*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after running readiness checks

  let res = await client.httpGET("/ready")
  return res
