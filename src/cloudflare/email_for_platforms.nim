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
  EmailForPlatformIncludeOption* = enum
    includeDnsRecords = "dns_records"


proc getAccountsAccountIdEmailDomainChanges*(client: CloudflareClient,
                                             accountId: types.EmailIdentifier,
                                             perPage: int64 = 20,
                                             cursor: string = default(string),
                                             modifiedSince: string = default(string)): Future[types.EmailEmailDomainChangeCollectionResponse] {.async.} =
  ## Returns retained domain-specific state changes and completed-removal tombstones
  ## in a transaction-safe opaque order. The top-level platform field is the current
  ## shared gate and must be combined with each domain's state. Store next_cursor
  ## after processing every response, and continue immediately while has_more is
  ## true. To take a checkpoint, request this operation with modified_since set to
  ## the current time, follow has_more to the end, and save the final next_cursor; it
  ## replays every change committed after the first of those requests. Initial
  ## bootstrap and error 2086 recovery take a checkpoint, list the full inventory,
  ## then replay from the saved checkpoint, so changes made during the inventory are
  ## not lost. Only a tombstone proves that a domain was removed. Available only to
  ## the configured OpenAI pilot account behind a default-off gate; while the gate is
  ## off, the pilot account gets 503 with error 2090 and Retry-After, and existing
  ## domains are unaffected. Unsupported methods return 405 with error 2091.
  ## Authentication failures may use the gateway error envelope.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  q["modified_since"] = $modifiedSince
  let res = await client.httpGET(fmt"/accounts/{accountId}/email/domain-changes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailDomainChangeCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailDomains*(client: CloudflareClient,
                                       accountId: types.EmailIdentifier,
                                       perPage: int64 = 20,
                                       cursor: string = default(string),
                                       hostname: string = default(string),
                                       `include`: EmailForPlatformIncludeOption = includeDnsRecords): Future[types.EmailEmailDomainCollectionResponse] {.async.} =
  ## Returns account-scoped domain status. DNS records are omitted unless requested;
  ## exact hostname filtering may return several candidates; retain the EmailDomain
  ## ID for each enrollment. Available only to the configured OpenAI pilot account
  ## behind a default-off gate; while the gate is off, the pilot account gets 503
  ## with error 2090 and Retry-After, and existing domains are unaffected.
  ## Unsupported methods return 405 with error 2091. Authentication failures may use
  ## the gateway error envelope.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  q["hostname"] = $hostname
  q["include"] = $`include`
  let res = await client.httpGET(fmt"/accounts/{accountId}/email/domains", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailDomainCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailDomains*(client: CloudflareClient,
                                        accountId: types.EmailIdentifier,
                                        body: types.EmailEmailDomainCreate): Future[types.EmailEmailDomainResponse] {.async.} =
  ## Creates a candidate and four DNS instructions. Rejects hostnames with more than
  ## 16 labels or whose assigned Return-Path exceeds 201 ASCII characters; error 2077
  ## names the hostname rule that failed. Creation follows read-only checks of the
  ## saved provider bundle and published exclusion. Hostnames inside an active full
  ## Cloudflare DNS zone, including zones under a PSL private suffix such as
  ## workers.dev, or held by another enrollment, return the generic hostname conflict
  ## error 2083. While an earlier enrollment of this account with the same hostname
  ## or client_reference is being deleted, create returns error 2084 with Retry-After
  ## set to the expected completion time. No per-domain provider DNS writes occur.
  ## Customer DNS observations remain pending and mail remains inactive. Unverified
  ## candidates may share a hostname. Supply an account-unique client_reference to
  ## retry the same enrollment safely; reuse with a different hostname returns error
  ## 2089. A full domain quota returns error 2081 and frees only when domains are
  ## deleted or candidates expire, so it is not retryable; the create rate limit
  ## returns 429 with error 2088 and Retry-After. Requests rejected before the
  ## Cloudflare zone check do not count toward the rate limit. Final public-DNS,
  ## namespace protection and runtime readiness are separate gates. Available only to
  ## the configured OpenAI pilot account behind a default-off gate; while the gate is
  ## off, the pilot account gets 503 with error 2090 and Retry-After, and existing
  ## domains are unaffected. Unsupported methods return 405 with error 2091.
  ## Authentication failures may use the gateway error envelope.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/domains", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.EmailEmailDomainResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailDomainsEmailDomainId*(client: CloudflareClient,
                                                    accountId: types.EmailIdentifier,
                                                    emailDomainId: string): Future[types.EmailEmailDomainResponse] {.async.} =
  ## Returns domain status and its four assigned DNS records. Shared provider health
  ## is reported by the capability states rather than duplicated on each DNS record.
  ## Expired unclaimed candidates and completed deletions return 404. Available only
  ## to the configured OpenAI pilot account behind a default-off gate; while the gate
  ## is off, the pilot account gets 503 with error 2090 and Retry-After, and existing
  ## domains are unaffected. Unsupported methods return 405 with error 2091.
  ## Authentication failures may use the gateway error envelope.

  let res = await client.httpGET(fmt"/accounts/{accountId}/email/domains/{emailDomainId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailEmailDomainResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailDomainsEmailDomainId*(client: CloudflareClient,
                                                       accountId: types.EmailIdentifier,
                                                       emailDomainId: string): Future[types.EmailEmailDomainResponse] {.async.} =
  ## Requires an empty body. Unclaimed, unpublished candidates are removed
  ## immediately after token retirement. Acquired or published resources retain
  ## deleting state and claims until the deletion worker acknowledges safe revocation
  ## and token retirement: deletion completes after the last authorization FWDR may
  ## still hold has expired, up to about 31 minutes after the request. Until then the
  ## hostname and client_reference cannot be enrolled again. Repeated requests while
  ## deleting are idempotent. Retry-After is the expected time until GET returns 404;
  ## follow the Location header after it. Available only to the configured OpenAI
  ## pilot account behind a default-off gate; while the gate is off, the pilot
  ## account gets 503 with error 2090 and Retry-After, and existing domains are
  ## unaffected. Unsupported methods return 405 with error 2091. Authentication
  ## failures may use the gateway error envelope.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/email/domains/{emailDomainId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.EmailEmailDomainResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailDomainsEmailDomainIdVerify*(client: CloudflareClient,
                                                           accountId: types.EmailIdentifier,
                                                           emailDomainId: string): Future[types.EmailEmailDomainResponse] {.async.} =
  ## Requires an empty body. Schedules an expedited check and coalesces queued or
  ## leased work. It does not accept verification results, bypass activation gates,
  ## or perform customer DNS checks synchronously. Follow the Location header after
  ## Retry-After seconds until verification.observed_at appears or advances beyond
  ## the value in this 202 response; status may remain unchanged. Candidate expiry
  ## returns 404. A repeat within 30 seconds returns error 2082 with the remaining
  ## cooldown in Retry-After. Only a request that schedules a check counts toward the
  ## account rate limit, error 2088. Available only to the configured OpenAI pilot
  ## account behind a default-off gate; while the gate is off, the pilot account gets
  ## 503 with error 2090 and Retry-After, and existing domains are unaffected.
  ## Unsupported methods return 405 with error 2091. Authentication failures may use
  ## the gateway error envelope.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/domains/{emailDomainId}/verify")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.EmailEmailDomainResponse)
  else:
    raise newException(CloudflareClientError, body)
