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
  test "round-trips BillSubsPaymentMethodResponseSingle":
    let obj = newBillSubsPaymentMethodResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsPaymentMethodResponseSingle)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseCommonFailure":
    let obj = newBillSubsApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips BillSubsPaymentMethodResponseCollection":
    let obj = newBillSubsPaymentMethodResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsPaymentMethodResponseCollection)) == openjson.toJson(obj)

  test "round-trips BillSubsPaymentMethod":
    let obj = newBillSubsPaymentMethod()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsPaymentMethod)) == openjson.toJson(obj)

  test "round-trips BillSubsApiResponseSingle":
    let obj = newBillSubsApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BillSubsApiResponseSingle)) == openjson.toJson(obj)

suite "account_payment_methods endpoints":
  test "GET /accounts/{account_id}/payment-methods":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPaymentMethods("test", 1, 1)

  test "POST /accounts/{account_id}/payment-methods":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPaymentMethods("test", newBillSubsPaymentMethod())

  test "GET /accounts/{account_id}/payment-methods/{payment_method_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPaymentMethodsPaymentMethodId("test", "test")

  test "PUT /accounts/{account_id}/payment-methods/{payment_method_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdPaymentMethodsPaymentMethodId("test", "test", newBillSubsPaymentMethod())

  test "DELETE /accounts/{account_id}/payment-methods/{payment_method_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPaymentMethodsPaymentMethodId("test", "test")

  test "POST /accounts/{account_id}/payment-methods/{payment_method_id}/set-as-default":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdPaymentMethodsPaymentMethodIdSetAsDefault("test", "test")

