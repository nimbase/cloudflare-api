# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[asyncdispatch]
import unittest
import pkg/openparser/json as openjson
import cloudflare
import ./common

suite "dos_flowtrackd_api_other serialization":
  test "round-trips AdvancedDdosProtectionNewSynProtectionRule":
    let obj = newAdvancedDdosProtectionNewSynProtectionRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionNewSynProtectionRule)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionPrefixListResponse":
    let obj = newAdvancedDdosProtectionPrefixListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionPrefixListResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionExpressionFilterListResponse":
    let obj = newAdvancedDdosProtectionExpressionFilterListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionExpressionFilterListResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionSynProtectionRuleUpdate":
    let obj = newAdvancedDdosProtectionSynProtectionRuleUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionSynProtectionRuleUpdate)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionInfraPrefixListResponse":
    let obj = newAdvancedDdosProtectionInfraPrefixListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionInfraPrefixListResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionTcpFlowProtectionRuleListResponse":
    let obj = newAdvancedDdosProtectionTcpFlowProtectionRuleListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionTcpFlowProtectionRuleListResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionTcpFlowProtectionRuleResponse":
    let obj = newAdvancedDdosProtectionTcpFlowProtectionRuleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionTcpFlowProtectionRuleResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionPrefixResponse":
    let obj = newAdvancedDdosProtectionPrefixResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionPrefixResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionInfraPrefixResponse":
    let obj = newAdvancedDdosProtectionInfraPrefixResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionInfraPrefixResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionTcpFlowProtectionRuleUpdate":
    let obj = newAdvancedDdosProtectionTcpFlowProtectionRuleUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionTcpFlowProtectionRuleUpdate)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionExpressionFilterResponse":
    let obj = newAdvancedDdosProtectionExpressionFilterResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionExpressionFilterResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionDnsProtectionRuleListResponse":
    let obj = newAdvancedDdosProtectionDnsProtectionRuleListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionDnsProtectionRuleListResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionUpdateProtectionStatus":
    let obj = newAdvancedDdosProtectionUpdateProtectionStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionUpdateProtectionStatus)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionNewExpressionFilter":
    let obj = newAdvancedDdosProtectionNewExpressionFilter()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionNewExpressionFilter)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionSynProtectionRuleListResponse":
    let obj = newAdvancedDdosProtectionSynProtectionRuleListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionSynProtectionRuleListResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionApiResponseCommon":
    let obj = newAdvancedDdosProtectionApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionNewTcpFlowProtectionRule":
    let obj = newAdvancedDdosProtectionNewTcpFlowProtectionRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionNewTcpFlowProtectionRule)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionExpressionFilterUpdate":
    let obj = newAdvancedDdosProtectionExpressionFilterUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionExpressionFilterUpdate)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionSynProtectionRuleResponse":
    let obj = newAdvancedDdosProtectionSynProtectionRuleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionSynProtectionRuleResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionProtectionStatusResponse":
    let obj = newAdvancedDdosProtectionProtectionStatusResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionProtectionStatusResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionDnsProtectionRuleResponse":
    let obj = newAdvancedDdosProtectionDnsProtectionRuleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionDnsProtectionRuleResponse)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionInfraPrefixUpdate":
    let obj = newAdvancedDdosProtectionInfraPrefixUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionInfraPrefixUpdate)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionNewInfraPrefix":
    let obj = newAdvancedDdosProtectionNewInfraPrefix()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionNewInfraPrefix)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionPrefixUpdate":
    let obj = newAdvancedDdosProtectionPrefixUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionPrefixUpdate)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionNewDnsProtectionRule":
    let obj = newAdvancedDdosProtectionNewDnsProtectionRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionNewDnsProtectionRule)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionApiResponseCommonFailure":
    let obj = newAdvancedDdosProtectionApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionDnsProtectionRuleUpdate":
    let obj = newAdvancedDdosProtectionDnsProtectionRuleUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionDnsProtectionRuleUpdate)) == openjson.toJson(obj)

  test "round-trips AdvancedDdosProtectionNewPrefix":
    let obj = newAdvancedDdosProtectionNewPrefix()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AdvancedDdosProtectionNewPrefix)) == openjson.toJson(obj)

suite "dos_flowtrackd_api_other endpoints":
  test "GET /accounts/{account_id}/magic/advanced_dns_protection/configs/dns_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_dns_protection/configs/dns_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules("test", newAdvancedDdosProtectionNewDnsProtectionRule())

  test "DELETE /accounts/{account_id}/magic/advanced_dns_protection/configs/dns_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules("test")

  test "GET /accounts/{account_id}/magic/advanced_dns_protection/configs/dns_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId("test", "test")

  test "DELETE /accounts/{account_id}/magic/advanced_dns_protection/configs/dns_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId("test", "test")

  test "PATCH /accounts/{account_id}/magic/advanced_dns_protection/configs/dns_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId("test", "test", newAdvancedDdosProtectionDnsProtectionRuleUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/allowlist":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/allowlist":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist("test", newAdvancedDdosProtectionNewInfraPrefix())

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/allowlist":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist("test")

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/allowlist/{prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId("test", "test")

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/allowlist/{prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId("test", "test")

  test "PATCH /accounts/{account_id}/magic/advanced_tcp_protection/configs/allowlist/{prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId("test", "test", newAdvancedDdosProtectionInfraPrefixUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes("test", newAdvancedDdosProtectionNewPrefix())

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes("test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes/bulk":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesBulk("test")

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes/{prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId("test", "test")

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes/{prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId("test", "test")

  test "PATCH /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes/{prefix_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId("test", "test", newAdvancedDdosProtectionPrefixUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters("test", "test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters("test", newAdvancedDdosProtectionNewExpressionFilter())

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters("test")

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId("test", "test")

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId("test", "test")

  test "PATCH /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId("test", "test", newAdvancedDdosProtectionExpressionFilterUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules("test", newAdvancedDdosProtectionNewSynProtectionRule())

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules("test")

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId("test", "test")

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId("test", "test")

  test "PATCH /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId("test", "test", newAdvancedDdosProtectionSynProtectionRuleUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters("test", "test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters("test", newAdvancedDdosProtectionNewExpressionFilter())

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters("test")

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId("test", "test")

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId("test", "test")

  test "PATCH /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters/{filter_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId("test", "test", newAdvancedDdosProtectionExpressionFilterUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules("test", newAdvancedDdosProtectionNewTcpFlowProtectionRule())

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules("test")

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId("test", "test")

  test "DELETE /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId("test", "test")

  test "PATCH /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules/{rule_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId("test", "test", newAdvancedDdosProtectionTcpFlowProtectionRuleUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_protection_status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpProtectionStatus("test")

  test "PATCH /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_protection_status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpProtectionStatus("test", newAdvancedDdosProtectionUpdateProtectionStatus())

