# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBrandProtectionLogoMatches*(client: CloudflareClient,
                                                     logoId: seq[string] = @[],
                                                     offset: string = default(string),
                                                     limit: string = default(string)): Future[types.BrandProtectionApiLogoMatch] {.async.} =
  ## Return matches for logo queries based on ID

  var q = initOrderedTable[string, string]()
  for v in logoId: q["logo_id"] = $v
  q["offset"] = $offset
  q["limit"] = $limit
  let res = await client.httpGET("/accounts/{account_id}/brand-protection/logo-matches", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrandProtectionApiLogoMatch)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrandProtectionLogoMatchesDownload*(client: CloudflareClient,
                                                             logoId: seq[string] = @[],
                                                             offset: string = default(string),
                                                             limit: string = default(string)): Future[types.BrandProtectionApiLogoMatch] {.async.} =
  ## Return matches as CSV for logo queries based on ID

  var q = initOrderedTable[string, string]()
  for v in logoId: q["logo_id"] = $v
  q["offset"] = $offset
  q["limit"] = $limit
  let res = await client.httpGET("/accounts/{account_id}/brand-protection/logo-matches/download", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrandProtectionApiLogoMatch)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrandProtectionLogos*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return all saved logo queries

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/logos")
  return res

proc postAccountsAccountIdBrandProtectionLogos*(client: CloudflareClient,
                                                tag: string = default(string),
                                                matchType: string = default(string),
                                                threshold: float64 = default(float64)): Future[types.BrandProtectionApiLogo] {.async.} =
  ## Return new saved logo queries created from image files

  var q = initOrderedTable[string, string]()
  q["tag"] = $tag
  q["match_type"] = $matchType
  q["threshold"] = $threshold
  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/logos", q)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.BrandProtectionApiLogo)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrandProtectionLogosLogoId*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return saved logo queries based on ID

  let res = await client.httpGET("/accounts/{account_id}/brand-protection/logos/{logo_id}")
  return res

proc deleteAccountsAccountIdBrandProtectionLogosLogoId*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return a success message after deleting saved logo queries by ID

  let res = await client.httpDELETE("/accounts/{account_id}/brand-protection/logos/{logo_id}")
  return res

proc postAccountsAccountIdBrandProtectionScanLogo*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return new logo queries created from image files

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/scan-logo")
  return res

proc postAccountsAccountIdBrandProtectionScanPage*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Return new logo queries created from URLs

  let res = await client.httpPOST("/accounts/{account_id}/brand-protection/scan-page")
  return res

proc getSignedUrl*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Internal route for testing signed URLs.

  let res = await client.httpGET("/signed-url")
  return res
