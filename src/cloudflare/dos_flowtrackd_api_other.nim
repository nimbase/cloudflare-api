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
                                                                              accountId: types.DosIdentifier,
                                                                              page: int64 = default(int64),
                                                                              perPage: int64 = default(int64),
                                                                              order: string = default(string),
                                                                              direction: string = default(string)): Future[types.DosDnsProtectionRuleListResponse] {.async.} =
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
    result = fromJson(body, types.DosDnsProtectionRuleListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules*(client: CloudflareClient,
                                                                               accountId: types.DosIdentifier,
                                                                               body: types.DosNewDnsProtectionRule): Future[types.DosDnsProtectionRuleResponse] {.async.} =
  ## Create a DNS Protection rule for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosDnsProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules*(client: CloudflareClient,
                                                                                 accountId: types.DosIdentifier): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete all DNS Protection rules for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId*(client: CloudflareClient,
                                                                                    accountId: types.DosIdentifier,
                                                                                    ruleId: types.DosUuid): Future[types.DosDnsProtectionRuleResponse] {.async.} =
  ## Get a DNS Protection rule specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosDnsProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId*(client: CloudflareClient,
                                                                                       accountId: types.DosIdentifier,
                                                                                       ruleId: types.DosUuid): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete a DNS Protection rule specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId*(client: CloudflareClient,
                                                                                      accountId: types.DosIdentifier,
                                                                                      ruleId: types.DosUuid,
                                                                                      body: types.DosDnsProtectionRuleUpdate): Future[types.DosDnsProtectionRuleResponse] {.async.} =
  ## Update a DNS Protection rule specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_dns_protection/configs/dns_protection/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosDnsProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist*(client: CloudflareClient,
                                                                     accountId: types.DosIdentifier,
                                                                     page: int64 = default(int64),
                                                                     perPage: int64 = default(int64),
                                                                     order: string = default(string),
                                                                     direction: string = default(string)): Future[types.DosInfraPrefixListResponse] {.async.} =
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
    result = fromJson(body, types.DosInfraPrefixListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist*(client: CloudflareClient,
                                                                      accountId: types.DosIdentifier,
                                                                      body: types.DosNewInfraPrefix): Future[types.DosInfraPrefixResponse] {.async.} =
  ## Create an allowlist prefix for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosInfraPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist*(client: CloudflareClient,
                                                                        accountId: types.DosIdentifier): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete all allowlist prefixes for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId*(client: CloudflareClient,
                                                                             accountId: types.DosIdentifier,
                                                                             prefixId: types.DosUuid): Future[types.DosInfraPrefixResponse] {.async.} =
  ## Get an allowlist prefix specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosInfraPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId*(client: CloudflareClient,
                                                                                accountId: types.DosIdentifier,
                                                                                prefixId: types.DosUuid): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete the allowlist prefix for an account given a UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId*(client: CloudflareClient,
                                                                               accountId: types.DosIdentifier,
                                                                               prefixId: types.DosUuid,
                                                                               body: types.DosInfraPrefixUpdate): Future[types.DosInfraPrefixResponse] {.async.} =
  ## Update an allowlist prefix specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/allowlist/{prefixId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosInfraPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes*(client: CloudflareClient,
                                                                    accountId: types.DosIdentifier,
                                                                    page: int64 = default(int64),
                                                                    perPage: int64 = default(int64),
                                                                    order: string = default(string),
                                                                    direction: string = default(string)): Future[types.DosPrefixListResponse] {.async.} =
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
    result = fromJson(body, types.DosPrefixListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes*(client: CloudflareClient,
                                                                     accountId: types.DosIdentifier,
                                                                     body: types.DosNewPrefix): Future[types.DosPrefixResponse] {.async.} =
  ## Create a prefix for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes*(client: CloudflareClient,
                                                                       accountId: types.DosIdentifier): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete all prefixes for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesBulk*(client: CloudflareClient,
                                                                         accountId: types.DosIdentifier): Future[types.DosPrefixListResponse] {.async.} =
  ## Create multiple prefixes for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes/bulk", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosPrefixListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId*(client: CloudflareClient,
                                                                            accountId: types.DosIdentifier,
                                                                            prefixId: types.DosUuid): Future[types.DosPrefixResponse] {.async.} =
  ## Get a prefix specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId*(client: CloudflareClient,
                                                                               accountId: types.DosIdentifier,
                                                                               prefixId: types.DosUuid): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete the prefix for an account given a UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes/{prefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId*(client: CloudflareClient,
                                                                              accountId: types.DosIdentifier,
                                                                              prefixId: types.DosUuid,
                                                                              body: types.DosPrefixUpdate): Future[types.DosPrefixResponse] {.async.} =
  ## Update a prefix specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/prefixes/{prefixId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosPrefixResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters*(client: CloudflareClient,
                                                                                accountId: types.DosIdentifier,
                                                                                mode: string = default(string),
                                                                                page: int64 = default(int64),
                                                                                perPage: int64 = default(int64),
                                                                                order: string = default(string),
                                                                                direction: string = default(string)): Future[types.DosExpressionFilterListResponse] {.async.} =
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
    result = fromJson(body, types.DosExpressionFilterListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters*(client: CloudflareClient,
                                                                                 accountId: types.DosIdentifier,
                                                                                 body: types.DosNewExpressionFilter): Future[types.DosExpressionFilterResponse] {.async.} =
  ## Create a SYN Protection filter for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters*(client: CloudflareClient,
                                                                                   accountId: types.DosIdentifier): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete all SYN Protection filters for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                        accountId: types.DosIdentifier,
                                                                                        filterId: types.DosUuid): Future[types.DosExpressionFilterResponse] {.async.} =
  ## Get a SYN Protection filter specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                           accountId: types.DosIdentifier,
                                                                                           filterId: types.DosUuid): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete a SYN Protection filter specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                          accountId: types.DosIdentifier,
                                                                                          filterId: types.DosUuid,
                                                                                          body: types.DosExpressionFilterUpdate): Future[types.DosExpressionFilterResponse] {.async.} =
  ## Update a SYN Protection filter specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filterId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules*(client: CloudflareClient,
                                                                              accountId: types.DosIdentifier,
                                                                              page: int64 = default(int64),
                                                                              perPage: int64 = default(int64),
                                                                              order: string = default(string),
                                                                              direction: string = default(string)): Future[types.DosSynProtectionRuleListResponse] {.async.} =
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
    result = fromJson(body, types.DosSynProtectionRuleListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules*(client: CloudflareClient,
                                                                               accountId: types.DosIdentifier,
                                                                               body: types.DosNewSynProtectionRule): Future[types.DosSynProtectionRuleResponse] {.async.} =
  ## Create a SYN Protection rule for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosSynProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules*(client: CloudflareClient,
                                                                                 accountId: types.DosIdentifier): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete all SYN Protection rules for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId*(client: CloudflareClient,
                                                                                    accountId: types.DosIdentifier,
                                                                                    ruleId: types.DosUuid): Future[types.DosSynProtectionRuleResponse] {.async.} =
  ## Get a SYN Protection rule specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosSynProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId*(client: CloudflareClient,
                                                                                       accountId: types.DosIdentifier,
                                                                                       ruleId: types.DosUuid): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete a SYN Protection rule specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId*(client: CloudflareClient,
                                                                                      accountId: types.DosIdentifier,
                                                                                      ruleId: types.DosUuid,
                                                                                      body: types.DosSynProtectionRuleUpdate): Future[types.DosSynProtectionRuleResponse] {.async.} =
  ## Update a SYN Protection rule specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/syn_protection/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosSynProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters*(client: CloudflareClient,
                                                                                    accountId: types.DosIdentifier,
                                                                                    mode: string = default(string),
                                                                                    page: int64 = default(int64),
                                                                                    perPage: int64 = default(int64),
                                                                                    order: string = default(string),
                                                                                    direction: string = default(string)): Future[types.DosExpressionFilterListResponse] {.async.} =
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
    result = fromJson(body, types.DosExpressionFilterListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters*(client: CloudflareClient,
                                                                                     accountId: types.DosIdentifier,
                                                                                     body: types.DosNewExpressionFilter): Future[types.DosExpressionFilterResponse] {.async.} =
  ## Create a TCP Flow Protection filter for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters*(client: CloudflareClient,
                                                                                       accountId: types.DosIdentifier): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete all TCP Flow Protection filters for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                            accountId: types.DosIdentifier,
                                                                                            filterId: types.DosUuid): Future[types.DosExpressionFilterResponse] {.async.} =
  ## Get a TCP Flow Protection filter specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                               accountId: types.DosIdentifier,
                                                                                               filterId: types.DosUuid): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete a TCP Flow Protection filter specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filterId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId*(client: CloudflareClient,
                                                                                              accountId: types.DosIdentifier,
                                                                                              filterId: types.DosUuid,
                                                                                              body: types.DosExpressionFilterUpdate): Future[types.DosExpressionFilterResponse] {.async.} =
  ## Update a TCP Flow Protection filter specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filterId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosExpressionFilterResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules*(client: CloudflareClient,
                                                                                  accountId: types.DosIdentifier,
                                                                                  page: int64 = default(int64),
                                                                                  perPage: int64 = default(int64),
                                                                                  order: string = default(string),
                                                                                  direction: string = default(string)): Future[types.DosTcpFlowProtectionRuleListResponse] {.async.} =
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
    result = fromJson(body, types.DosTcpFlowProtectionRuleListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules*(client: CloudflareClient,
                                                                                   accountId: types.DosIdentifier,
                                                                                   body: types.DosNewTcpFlowProtectionRule): Future[types.DosTcpFlowProtectionRuleResponse] {.async.} =
  ## Create a TCP Flow Protection rule for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosTcpFlowProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules*(client: CloudflareClient,
                                                                                     accountId: types.DosIdentifier): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete all TCP Flow Protection rules for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId*(client: CloudflareClient,
                                                                                        accountId: types.DosIdentifier,
                                                                                        ruleId: types.DosUuid): Future[types.DosTcpFlowProtectionRuleResponse] {.async.} =
  ## Get a TCP Flow Protection rule specified by the given UUID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosTcpFlowProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId*(client: CloudflareClient,
                                                                                           accountId: types.DosIdentifier,
                                                                                           ruleId: types.DosUuid): Future[types.DosApiResponseCommon] {.async.} =
  ## Delete a TCP Flow Protection rule specified by the given UUID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId*(client: CloudflareClient,
                                                                                          accountId: types.DosIdentifier,
                                                                                          ruleId: types.DosUuid,
                                                                                          body: types.DosTcpFlowProtectionRuleUpdate): Future[types.DosTcpFlowProtectionRuleResponse] {.async.} =
  ## Update a TCP Flow Protection rule specified by the given UUID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosTcpFlowProtectionRuleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpProtectionStatus*(client: CloudflareClient,
                                                                               accountId: types.DosIdentifier): Future[types.DosProtectionStatusResponse] {.async.} =
  ## Get the protection status of the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_protection_status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosProtectionStatusResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpProtectionStatus*(client: CloudflareClient,
                                                                                 accountId: types.DosIdentifier,
                                                                                 body: types.DosUpdateProtectionStatus): Future[types.DosProtectionStatusResponse] {.async.} =
  ## Update the protection status of the account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/advanced_tcp_protection/configs/tcp_protection_status", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DosProtectionStatusResponse)
  else:
    raise newException(CloudflareClientError, body)
