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

suite "account_billing serialization":
  test "round-trips BillSubsAddressValidationRequest":
    let obj = newBillSubsAddressValidationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsAddressValidationRequest)) == openjson.toJson(obj)

  test "round-trips BillSubsBadDebtResponseSingle":
    let obj = newBillSubsBadDebtResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsBadDebtResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseCommonFailure":
    let obj = newBillSubsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsClientSecretResponseSingle":
    let obj = newBillSubsClientSecretResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsClientSecretResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsAccountCreditsResponse":
    let obj = newBillSubsAccountCreditsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsAccountCreditsResponse)) == openjson.toJson(obj)

  test "round-trips BillSubsAddressValidationResponseSingle":
    let obj = newBillSubsAddressValidationResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsAddressValidationResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsPaymentIntentResponseSingle":
    let obj = newBillSubsPaymentIntentResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsPaymentIntentResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseSingle":
    let obj = newBillSubsApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsUnpaidInvoicesResponseSingle":
    let obj = newBillSubsUnpaidInvoicesResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsUnpaidInvoicesResponseSingle)) == openjson.toJson(obj)

suite "account_billing endpoints":
  test "GET /accounts/{account_id}/billing/bad-debt":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingBadDebt("test")

  test "GET /accounts/{account_id}/billing/credits":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingCredits("test")

  test "POST /accounts/{account_id}/billing/profile/payment-method":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBillingProfilePaymentMethod("test")

  test "GET /accounts/{account_id}/billing/unpaid-invoice":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBillingUnpaidInvoice("test")

  test "POST /accounts/{account_id}/client-secret":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdClientSecret("test")

  test "GET /accounts/{account_id}/receipts/{receipt_id}/pdf":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdReceiptsReceiptIdPdf("test", "test", "test")

  test "POST /billing/address-validation":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postBillingAddressValidation(newBillSubsAddressValidationRequest())

