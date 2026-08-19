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
  test "round-trips DosExpressionFilterUpdate":
    let obj = newDosExpressionFilterUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosExpressionFilterUpdate)) == openjson.toJson(obj)

  test "round-trips DosTcpFlowProtectionRuleListResponse":
    let obj = newDosTcpFlowProtectionRuleListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosTcpFlowProtectionRuleListResponse)) == openjson.toJson(obj)

  test "round-trips DosDnsProtectionRuleListResponse":
    let obj = newDosDnsProtectionRuleListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosDnsProtectionRuleListResponse)) == openjson.toJson(obj)

  test "round-trips DosNewTcpFlowProtectionRule":
    let obj = newDosNewTcpFlowProtectionRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosNewTcpFlowProtectionRule)) == openjson.toJson(obj)

  test "round-trips DosPrefixUpdate":
    let obj = newDosPrefixUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosPrefixUpdate)) == openjson.toJson(obj)

  test "round-trips DosExpressionFilterListResponse":
    let obj = newDosExpressionFilterListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosExpressionFilterListResponse)) == openjson.toJson(obj)

  test "round-trips DosNewDnsProtectionRule":
    let obj = newDosNewDnsProtectionRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosNewDnsProtectionRule)) == openjson.toJson(obj)

  test "round-trips DosNewInfraPrefix":
    let obj = newDosNewInfraPrefix()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosNewInfraPrefix)) == openjson.toJson(obj)

  test "round-trips DosInfraPrefixUpdate":
    let obj = newDosInfraPrefixUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosInfraPrefixUpdate)) == openjson.toJson(obj)

  test "round-trips DosNewSynProtectionRule":
    let obj = newDosNewSynProtectionRule()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosNewSynProtectionRule)) == openjson.toJson(obj)

  test "round-trips DosProtectionStatusResponse":
    let obj = newDosProtectionStatusResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosProtectionStatusResponse)) == openjson.toJson(obj)

  test "round-trips DosPrefixResponse":
    let obj = newDosPrefixResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosPrefixResponse)) == openjson.toJson(obj)

  test "round-trips DosTcpFlowProtectionRuleResponse":
    let obj = newDosTcpFlowProtectionRuleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosTcpFlowProtectionRuleResponse)) == openjson.toJson(obj)

  test "round-trips DosSynProtectionRuleUpdate":
    let obj = newDosSynProtectionRuleUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosSynProtectionRuleUpdate)) == openjson.toJson(obj)

  test "round-trips DosApiResponseCommon":
    let obj = newDosApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips DosTcpFlowProtectionRuleUpdate":
    let obj = newDosTcpFlowProtectionRuleUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosTcpFlowProtectionRuleUpdate)) == openjson.toJson(obj)

  test "round-trips DosExpressionFilterResponse":
    let obj = newDosExpressionFilterResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosExpressionFilterResponse)) == openjson.toJson(obj)

  test "round-trips DosDnsProtectionRuleUpdate":
    let obj = newDosDnsProtectionRuleUpdate()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosDnsProtectionRuleUpdate)) == openjson.toJson(obj)

  test "round-trips DosDnsProtectionRuleResponse":
    let obj = newDosDnsProtectionRuleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosDnsProtectionRuleResponse)) == openjson.toJson(obj)

  test "round-trips DosInfraPrefixListResponse":
    let obj = newDosInfraPrefixListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosInfraPrefixListResponse)) == openjson.toJson(obj)

  test "round-trips DosUpdateProtectionStatus":
    let obj = newDosUpdateProtectionStatus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosUpdateProtectionStatus)) == openjson.toJson(obj)

  test "round-trips DosNewExpressionFilter":
    let obj = newDosNewExpressionFilter()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosNewExpressionFilter)) == openjson.toJson(obj)

  test "round-trips DosApiResponseCommonFailure":
    let obj = newDosApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DosSynProtectionRuleResponse":
    let obj = newDosSynProtectionRuleResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosSynProtectionRuleResponse)) == openjson.toJson(obj)

  test "round-trips DosNewPrefix":
    let obj = newDosNewPrefix()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosNewPrefix)) == openjson.toJson(obj)

  test "round-trips DosInfraPrefixResponse":
    let obj = newDosInfraPrefixResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosInfraPrefixResponse)) == openjson.toJson(obj)

  test "round-trips DosSynProtectionRuleListResponse":
    let obj = newDosSynProtectionRuleListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosSynProtectionRuleListResponse)) == openjson.toJson(obj)

  test "round-trips DosPrefixListResponse":
    let obj = newDosPrefixListResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DosPrefixListResponse)) == openjson.toJson(obj)

suite "dos_flowtrackd_api_other endpoints":
  test "GET /accounts/{account_id}/magic/advanced_dns_protection/configs/dns_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_dns_protection/configs/dns_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRules("test", newDosNewDnsProtectionRule())

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
    discard waitFor client.patchAccountsAccountIdMagicAdvancedDnsProtectionConfigsDnsProtectionRulesRuleId("test", "test", newDosDnsProtectionRuleUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/allowlist":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/allowlist":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlist("test", newDosNewInfraPrefix())

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
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsAllowlistPrefixId("test", "test", newDosInfraPrefixUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/prefixes":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixes("test", newDosNewPrefix())

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
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsPrefixesPrefixId("test", "test", newDosPrefixUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters("test", "test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFilters("test", newDosNewExpressionFilter())

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
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionFiltersFilterId("test", "test", newDosExpressionFilterUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/syn_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRules("test", newDosNewSynProtectionRule())

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
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsSynProtectionRulesRuleId("test", "test", newDosSynProtectionRuleUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters("test", "test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/filters":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFilters("test", newDosNewExpressionFilter())

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
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionFiltersFilterId("test", "test", newDosExpressionFilterUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules("test", 1, 1, "test", "test")

  test "POST /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_flow_protection/rules":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRules("test", newDosNewTcpFlowProtectionRule())

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
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpFlowProtectionRulesRuleId("test", "test", newDosTcpFlowProtectionRuleUpdate())

  test "GET /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_protection_status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpProtectionStatus("test")

  test "PATCH /accounts/{account_id}/magic/advanced_tcp_protection/configs/tcp_protection_status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchAccountsAccountIdMagicAdvancedTcpProtectionConfigsTcpProtectionStatus("test", newDosUpdateProtectionStatus())

