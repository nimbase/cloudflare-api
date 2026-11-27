# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules*(client: CloudflareClient,
                                                                              accountId: types.AdvancedDdosProtectionIdentifier,
                                                                              page: int64 = default(int64),
                                                                              perPage: int64 = default(int64),
                                                                              order: string = default(string),
                                                                              direction: string = default(string)): Future[types.AdvancedDdosProtectionDnsProtectionRuleListResponse] {.async.} =
  ## List all DNS Protection rules for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionDnsProtectionRuleListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules*(client: CloudflareClient,
                                                                               accountId: types.AdvancedDdosProtectionIdentifier,
                                                                               body: types.AdvancedDdosProtectionNewDnsProtectionRule): Future[types.AdvancedDdosProtectionDnsProtectionRuleResponse] {.async.} =
  ## Create a DNS Protection rule for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionDnsProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules*(client: CloudflareClient,
                                                                                 accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete all DNS Protection rules for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId*(client: CloudflareClient,
                                                                                    accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                    ruleId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionDnsProtectionRuleResponse] {.async.} =
  ## Get a DNS Protection rule specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionDnsProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId*(client: CloudflareClient,
                                                                                       accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                       ruleId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete a DNS Protection rule specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId*(client: CloudflareClient,
                                                                                      accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                      ruleId: types.AdvancedDdosProtectionUuid,
                                                                                      body: types.AdvancedDdosProtectionDnsProtectionRuleUpdate): Future[types.AdvancedDdosProtectionDnsProtectionRuleResponse] {.async.} =
  ## Update a DNS Protection rule specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionDnsProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist*(client: CloudflareClient,
                                                                     accountId: types.AdvancedDdosProtectionIdentifier,
                                                                     page: int64 = default(int64),
                                                                     perPage: int64 = default(int64),
                                                                     order: string = default(string),
                                                                     direction: string = default(string)): Future[types.AdvancedDdosProtectionInfraPrefixListResponse] {.async.} =
  ## List all allowlist prefixes for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionInfraPrefixListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist*(client: CloudflareClient,
                                                                      accountId: types.AdvancedDdosProtectionIdentifier,
                                                                      body: types.AdvancedDdosProtectionNewInfraPrefix): Future[types.AdvancedDdosProtectionInfraPrefixResponse] {.async.} =
  ## Create an allowlist prefix for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionInfraPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist*(client: CloudflareClient,
                                                                        accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete all allowlist prefixes for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId*(client: CloudflareClient,
                                                                             accountId: types.AdvancedDdosProtectionIdentifier,
                                                                             prefixId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionInfraPrefixResponse] {.async.} =
  ## Get an allowlist prefix specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionInfraPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId*(client: CloudflareClient,
                                                                                accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                prefixId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete the allowlist prefix for an account given a UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId*(client: CloudflareClient,
                                                                               accountId: types.AdvancedDdosProtectionIdentifier,
                                                                               prefixId: types.AdvancedDdosProtectionUuid,
                                                                               body: types.AdvancedDdosProtectionInfraPrefixUpdate): Future[types.AdvancedDdosProtectionInfraPrefixResponse] {.async.} =
  ## Update an allowlist prefix specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist/{prefixId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionInfraPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes*(client: CloudflareClient,
                                                                    accountId: types.AdvancedDdosProtectionIdentifier,
                                                                    page: int64 = default(int64),
                                                                    perPage: int64 = default(int64),
                                                                    order: string = default(string),
                                                                    direction: string = default(string)): Future[types.AdvancedDdosProtectionPrefixListResponse] {.async.} =
  ## List all prefixes for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionPrefixListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes*(client: CloudflareClient,
                                                                     accountId: types.AdvancedDdosProtectionIdentifier,
                                                                     body: types.AdvancedDdosProtectionNewPrefix): Future[types.AdvancedDdosProtectionPrefixResponse] {.async.} =
  ## Create a prefix for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes*(client: CloudflareClient,
                                                                       accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete all prefixes for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesBulk*(client: CloudflareClient,
                                                                         accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionPrefixListResponse] {.async.} =
  ## Create multiple prefixes for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionPrefixListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId*(client: CloudflareClient,
                                                                            accountId: types.AdvancedDdosProtectionIdentifier,
                                                                            prefixId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionPrefixResponse] {.async.} =
  ## Get a prefix specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId*(client: CloudflareClient,
                                                                               accountId: types.AdvancedDdosProtectionIdentifier,
                                                                               prefixId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete the prefix for an account given a UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId*(client: CloudflareClient,
                                                                              accountId: types.AdvancedDdosProtectionIdentifier,
                                                                              prefixId: types.AdvancedDdosProtectionUuid,
                                                                              body: types.AdvancedDdosProtectionPrefixUpdate): Future[types.AdvancedDdosProtectionPrefixResponse] {.async.} =
  ## Update a prefix specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes/{prefixId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters*(client: CloudflareClient,
                                                                                accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                mode: string = default(string),
                                                                                page: int64 = default(int64),
                                                                                perPage: int64 = default(int64),
                                                                                order: string = default(string),
                                                                                direction: string = default(string)): Future[types.AdvancedDdosProtectionExpressionFilterListResponse] {.async.} =
  ## List all SYN Protection filters for an account.

  var q = initOrderedTable[string, string]()
  q["mode"] = $mode
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionExpressionFilterListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters*(client: CloudflareClient,
                                                                                 accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                 body: types.AdvancedDdosProtectionNewExpressionFilter): Future[types.AdvancedDdosProtectionExpressionFilterResponse] {.async.} =
  ## Create a SYN Protection filter for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters*(client: CloudflareClient,
                                                                                   accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete all SYN Protection filters for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                        accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                        filterId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionExpressionFilterResponse] {.async.} =
  ## Get a SYN Protection filter specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                           accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                           filterId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete a SYN Protection filter specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                          accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                          filterId: types.AdvancedDdosProtectionUuid,
                                                                                          body: types.AdvancedDdosProtectionExpressionFilterUpdate): Future[types.AdvancedDdosProtectionExpressionFilterResponse] {.async.} =
  ## Update a SYN Protection filter specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filterId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules*(client: CloudflareClient,
                                                                              accountId: types.AdvancedDdosProtectionIdentifier,
                                                                              page: int64 = default(int64),
                                                                              perPage: int64 = default(int64),
                                                                              order: string = default(string),
                                                                              direction: string = default(string)): Future[types.AdvancedDdosProtectionSynProtectionRuleListResponse] {.async.} =
  ## List all SYN Protection rules for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionSynProtectionRuleListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules*(client: CloudflareClient,
                                                                               accountId: types.AdvancedDdosProtectionIdentifier,
                                                                               body: types.AdvancedDdosProtectionNewSynProtectionRule): Future[types.AdvancedDdosProtectionSynProtectionRuleResponse] {.async.} =
  ## Create a SYN Protection rule for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionSynProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules*(client: CloudflareClient,
                                                                                 accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete all SYN Protection rules for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId*(client: CloudflareClient,
                                                                                    accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                    ruleId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionSynProtectionRuleResponse] {.async.} =
  ## Get a SYN Protection rule specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionSynProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId*(client: CloudflareClient,
                                                                                       accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                       ruleId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete a SYN Protection rule specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId*(client: CloudflareClient,
                                                                                      accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                      ruleId: types.AdvancedDdosProtectionUuid,
                                                                                      body: types.AdvancedDdosProtectionSynProtectionRuleUpdate): Future[types.AdvancedDdosProtectionSynProtectionRuleResponse] {.async.} =
  ## Update a SYN Protection rule specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionSynProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters*(client: CloudflareClient,
                                                                                    accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                    mode: string = default(string),
                                                                                    page: int64 = default(int64),
                                                                                    perPage: int64 = default(int64),
                                                                                    order: string = default(string),
                                                                                    direction: string = default(string)): Future[types.AdvancedDdosProtectionExpressionFilterListResponse] {.async.} =
  ## List all TCP Flow Protection filters for an account.

  var q = initOrderedTable[string, string]()
  q["mode"] = $mode
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionExpressionFilterListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters*(client: CloudflareClient,
                                                                                     accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                     body: types.AdvancedDdosProtectionNewExpressionFilter): Future[types.AdvancedDdosProtectionExpressionFilterResponse] {.async.} =
  ## Create a TCP Flow Protection filter for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters*(client: CloudflareClient,
                                                                                       accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete all TCP Flow Protection filters for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                            accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                            filterId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionExpressionFilterResponse] {.async.} =
  ## Get a TCP Flow Protection filter specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                               accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                               filterId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete a TCP Flow Protection filter specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                              accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                              filterId: types.AdvancedDdosProtectionUuid,
                                                                                              body: types.AdvancedDdosProtectionExpressionFilterUpdate): Future[types.AdvancedDdosProtectionExpressionFilterResponse] {.async.} =
  ## Update a TCP Flow Protection filter specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filterId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules*(client: CloudflareClient,
                                                                                  accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                  page: int64 = default(int64),
                                                                                  perPage: int64 = default(int64),
                                                                                  order: string = default(string),
                                                                                  direction: string = default(string)): Future[types.AdvancedDdosProtectionTcpFlowProtectionRuleListResponse] {.async.} =
  ## List all TCP Flow Protection rules for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionTcpFlowProtectionRuleListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules*(client: CloudflareClient,
                                                                                   accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                   body: types.AdvancedDdosProtectionNewTcpFlowProtectionRule): Future[types.AdvancedDdosProtectionTcpFlowProtectionRuleResponse] {.async.} =
  ## Create a TCP Flow Protection rule for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionTcpFlowProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules*(client: CloudflareClient,
                                                                                     accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete all TCP Flow Protection rules for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId*(client: CloudflareClient,
                                                                                        accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                        ruleId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionTcpFlowProtectionRuleResponse] {.async.} =
  ## Get a TCP Flow Protection rule specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionTcpFlowProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId*(client: CloudflareClient,
                                                                                           accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                           ruleId: types.AdvancedDdosProtectionUuid): Future[types.AdvancedDdosProtectionApiResponseCommon] {.async.} =
  ## Delete a TCP Flow Protection rule specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId*(client: CloudflareClient,
                                                                                          accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                          ruleId: types.AdvancedDdosProtectionUuid,
                                                                                          body: types.AdvancedDdosProtectionTcpFlowProtectionRuleUpdate): Future[types.AdvancedDdosProtectionTcpFlowProtectionRuleResponse] {.async.} =
  ## Update a TCP Flow Protection rule specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionTcpFlowProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpProtectionStatus*(client: CloudflareClient,
                                                                               accountId: types.AdvancedDdosProtectionIdentifier): Future[types.AdvancedDdosProtectionProtectionStatusResponse] {.async.} =
  ## Get the protection status of the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_protection_status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionProtectionStatusResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpProtectionStatus*(client: CloudflareClient,
                                                                                 accountId: types.AdvancedDdosProtectionIdentifier,
                                                                                 body: types.AdvancedDdosProtectionUpdateProtectionStatus): Future[types.AdvancedDdosProtectionProtectionStatusResponse] {.async.} =
  ## Update the protection status of the account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_protection_status", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AdvancedDdosProtectionProtectionStatusResponse)
  else:
    raise newException(CloudflareClientError, body)
