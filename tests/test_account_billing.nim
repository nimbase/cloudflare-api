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
  test "round-trips BillSubsApiClientSecretResponseSingle":
    let obj = newBillSubsApiClientSecretResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiClientSecretResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiAccountCreditsResponse":
    let obj = newBillSubsApiAccountCreditsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiAccountCreditsResponse)) == openjson.toJson(obj)

  test "round-trips BillSubsApiAddressValidationResponseSingle":
    let obj = newBillSubsApiAddressValidationResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiAddressValidationResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseSingle":
    let obj = newBillSubsApiApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiBadDebtResponseSingle":
    let obj = newBillSubsApiBadDebtResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiBadDebtResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiPaymentIntentResponseSingle":
    let obj = newBillSubsApiPaymentIntentResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiPaymentIntentResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCommonFailure":
    let obj = newBillSubsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsApiAddressValidationRequest":
    let obj = newBillSubsApiAddressValidationRequest()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiAddressValidationRequest)) == openjson.toJson(obj)

  test "round-trips BillSubsApiUnpaidInvoicesResponseSingle":
    let obj = newBillSubsApiUnpaidInvoicesResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiUnpaidInvoicesResponseSingle)) == openjson.toJson(obj)

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
    discard waitFor client.postBillingAddressValidation(newBillSubsApiAddressValidationRequest())

