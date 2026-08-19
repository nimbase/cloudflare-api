# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  PatchAccountsAccountIdBrandProtectionQueriesRequest = object
    id: Option[int64]
    scan: Option[bool]
    string_matches: Option[seq[JsonNode]]
    tag: Option[string]

proc getAccountsAccountIdBrandProtectionMatches*(client: CloudflareClient,
                                                 id: string = default(string),
                                                 offset: int64 = default(int64),
                                                 limit: int64 = default(int64),
                                                 includeDomainId: bool = default(bool),
                                                 includeDismissed: bool = default(bool)): Future[types.BrandProtectionApiQueryMatch] {.async.} =
  ## Return matches for string queries based on ID

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["offset"] = $offset
  q["limit"] = $limit
  q["include_domain_id"] = $includeDomainId
  q["include_dismissed"] = $includeDismissed
  let res = await client.httpGET("/accounts/{account_id}/brand-protection/matches", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrandProtectionApiQueryMatch)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrandProtectionMatchesDownload*(client: CloudflareClient,
                                                         id: string = default(string),
                                                         offset: int64 = default(int64),
                                                         limit: int64 = default(int64),
                                                         includeDomainId: bool = default(bool),
                                                         includeDismissed: bool = default(bool)): Future[types.BrandProtectionApiQueryMatch] {.async.} =
  ## Return matches as CSV for string queries based on ID

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["offset"] = $offset
  q["limit"] = $limit
  q["include_domain_id"] = $includeDomainId
  q["include_dismissed"] = $includeDismissed
  let res = await client.httpGET("/accounts/{account_id}/brand-protection/matches/download", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrandProtectionApiQueryMatch)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrandProtectionQueries*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return string queries based on ID

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/queries")
  return res

proc postAccountsAccountIdBrandProtectionQueries*(client: CloudflareClient,
                                                  id: string = default(string),
                                                  tag: string = default(string),
                                                  scan: bool = default(bool),
                                                  body: types.BrandProtectionApiQuery): Future[AsyncResponse] {.async.} =
  ## Return a success message after creating new saved string queries

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["tag"] = $tag
  q["scan"] = $scan
  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/queries", q)
  return res

proc deleteAccountsAccountIdBrandProtectionQueries*(client: CloudflareClient,
                                                    id: string = default(string),
                                                    tag: string = default(string),
                                                    scan: bool = default(bool)): Future[AsyncResponse] {.async.} =
  ## Return a success message after deleting saved string queries by ID

  var q = initOrderedTable[string, string]()
  q["id"] = $id
  q["tag"] = $tag
  q["scan"] = $scan
  let res = await client.httpDELETE("/accounts/{account_id}/brand-protection/queries", q)
  return res

proc patchAccountsAccountIdBrandProtectionQueries*(client: CloudflareClient,
                                                   body: PatchAccountsAccountIdBrandProtectionQueriesRequest): Future[AsyncResponse] {.async.} =
  ## Update a saved query's tag, scan setting, or string_matches (pattern). When
  ## string_matches is provided, the query parameters and hash are updated. At least
  ## one of tag, scan, or string_matches is required.

  let res = await client.httpPATCH("/accounts/{account_id}/brand-protection/queries", body)
  return res

proc postAccountsAccountIdBrandProtectionQueriesBulk*(client: CloudflareClient,
                                                      body: types.BrandProtectionApiQueryBulk): Future[AsyncResponse] {.async.} =
  ## Return a success message after creating new saved string queries in bulk

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/queries/bulk", body)
  return res

proc postAccountsAccountIdBrandProtectionQueriesQueryIdMatchesDomainIdDismiss*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Hide a matched domain from the default view of a saved query's results.
  ## Dismissal is scoped to the calling account.

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/queries/{query_id}/matches/{domain_id}/dismiss")
  return res

proc postAccountsAccountIdBrandProtectionQueriesQueryIdMatchesDomainIdUndismiss*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Restore a previously dismissed matched domain to the default view. Dismissal is
  ## scoped to the calling account.

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/queries/{query_id}/matches/{domain_id}/undismiss")
  return res

proc postAccountsAccountIdBrandProtectionSearch*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return new string queries

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/search")
  return res

proc getAccountsAccountIdBrandProtectionTotalQueries*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return the total number of saved string queries

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/total-queries")
  return res
