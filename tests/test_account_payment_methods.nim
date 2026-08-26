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

suite "account_payment_methods serialization":
  test "round-trips BillSubsApiPaymentMethodResponseSingle":
    let obj = newBillSubsApiPaymentMethodResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiPaymentMethodResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseSingle":
    let obj = newBillSubsApiApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiPaymentMethod":
    let obj = newBillSubsApiPaymentMethod()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiPaymentMethod)) == openjson.toJson(obj)

  test "round-trips BillSubsApiApiResponseCommonFailure":
    let obj = newBillSubsApiApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsApiPaymentMethodResponseCollection":
    let obj = newBillSubsApiPaymentMethodResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiPaymentMethodResponseCollection)) == openjson.toJson(obj)

suite "account_payment_methods endpoints":
  test "GET /accounts/{account_id}/payment-methods":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPaymentMethods("test", 1, 1)

  test "POST /accounts/{account_id}/payment-methods":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPaymentMethods("test", newBillSubsApiPaymentMethod())

  test "GET /accounts/{account_id}/payment-methods/{payment_method_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPaymentMethodsPaymentMethodId("test", "test")

  test "PUT /accounts/{account_id}/payment-methods/{payment_method_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdPaymentMethodsPaymentMethodId("test", "test", newBillSubsApiPaymentMethod())

  test "DELETE /accounts/{account_id}/payment-methods/{payment_method_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPaymentMethodsPaymentMethodId("test", "test")

  test "POST /accounts/{account_id}/payment-methods/{payment_method_id}/set-as-default":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPaymentMethodsPaymentMethodIdSetAsDefault("test", "test")

