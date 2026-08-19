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

suite "ai_gateway serialization":
  test "round-trips AigBillingSetTopupConfigResponse":
    let obj = newAigBillingSetTopupConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingSetTopupConfigResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingGetTopupConfigResponse":
    let obj = newAigBillingGetTopupConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingGetTopupConfigResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingGetCreditBalanceResponse":
    let obj = newAigBillingGetCreditBalanceResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingGetCreditBalanceResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingDeleteSpendingLimitResponse":
    let obj = newAigBillingDeleteSpendingLimitResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingDeleteSpendingLimitResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingErrorResponse":
    let obj = newAigBillingErrorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingErrorResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingCreateTopupResponse":
    let obj = newAigBillingCreateTopupResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingCreateTopupResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingGetInvoiceHistoryResponse":
    let obj = newAigBillingGetInvoiceHistoryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingGetInvoiceHistoryResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingGetSpendingLimitResponse":
    let obj = newAigBillingGetSpendingLimitResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingGetSpendingLimitResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingGetTopupLimitsResponse":
    let obj = newAigBillingGetTopupLimitsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingGetTopupLimitsResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingGetInvoicePreviewResponse":
    let obj = newAigBillingGetInvoicePreviewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingGetInvoicePreviewResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingTopupStatusResponse":
    let obj = newAigBillingTopupStatusResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingTopupStatusResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingSetSpendingLimitResponse":
    let obj = newAigBillingSetSpendingLimitResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingSetSpendingLimitResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingDeleteTopupConfigResponse":
    let obj = newAigBillingDeleteTopupConfigResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingDeleteTopupConfigResponse)) == openjson.toJson(obj)

  test "round-trips AigBillingGetUsageHistoryResponse":
    let obj = newAigBillingGetUsageHistoryResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AigBillingGetUsageHistoryResponse)) == openjson.toJson(obj)

suite "ai_gateway endpoints":
  test "GET /accounts/{account_id}/ai-gateway/billing/credit-balance":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayBillingCreditBalance("test")

  test "GET /accounts/{account_id}/ai-gateway/billing/invoice-history":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayBillingInvoiceHistory("test", {})

  test "GET /accounts/{account_id}/ai-gateway/billing/invoice-preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayBillingInvoicePreview("test")

  test "GET /accounts/{account_id}/ai-gateway/billing/spending-limit":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayBillingSpendingLimit("test")

  test "DELETE /accounts/{account_id}/ai-gateway/billing/spending-limit":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayBillingSpendingLimit("test")

  test "GET /accounts/{account_id}/ai-gateway/billing/topup/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayBillingTopupConfig("test")

  test "DELETE /accounts/{account_id}/ai-gateway/billing/topup/config":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAiGatewayBillingTopupConfig("test")

  test "GET /accounts/{account_id}/ai-gateway/billing/topup/limits":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayBillingTopupLimits("test")

  test "GET /accounts/{account_id}/ai-gateway/billing/usage-history":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAiGatewayBillingUsageHistory("test", {}, 1.0, 1.0)

