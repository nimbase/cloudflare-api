# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsRequest = object
    domain: string
  PostAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdCloudforceOneV2CredentialMonitorMatchesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool

proc getAccountsAccountIdCloudforceOneV2CredentialMonitorDomains*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  page: int64 = 1,
                                                                  perPage: int64 = 100): Future[GetAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse] {.async.} =
  ## List all domains registered for credential monitoring.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/credential-monitor/domains", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2CredentialMonitorDomains*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   body: PostAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsRequest): Future[PostAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse] {.async.} =
  ## Register a domain for credential monitoring.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/credential-monitor/domains", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsId*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       id: int64): Future[DeleteAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsIdResponse] {.async.} =
  ## Remove a domain from credential monitoring.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/v2/credential-monitor/domains/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdCloudforceOneV2CredentialMonitorDomainsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2CredentialMonitorMatches*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  domain: string = default(string),
                                                                  username: string = default(string),
                                                                  page: int64 = 1,
                                                                  perPage: int64 = 100): Future[GetAccountsAccountIdCloudforceOneV2CredentialMonitorMatchesResponse] {.async.} =
  ## Get credential matches for the account's monitored domains.

  var q = initOrderedTable[string, string]()
  q["domain"] = $domain
  q["username"] = $username
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/credential-monitor/matches", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2CredentialMonitorMatchesResponse)
  else:
    raise newException(CloudflareClientError, body)
