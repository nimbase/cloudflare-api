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

suite "logo_match serialization":
  test "round-trips BrandProtectionApiLogoMatch":
    let obj = newBrandProtectionApiLogoMatch()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiLogoMatch)) == openjson.toJson(obj)

  test "round-trips BrandProtectionApiLogo":
    let obj = newBrandProtectionApiLogo()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiLogo)) == openjson.toJson(obj)

  test "round-trips BrandProtectionApiError":
    let obj = newBrandProtectionApiError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiError)) == openjson.toJson(obj)

  test "round-trips BrandProtectionApiImageFile":
    let obj = newBrandProtectionApiImageFile()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.BrandProtectionApiImageFile)) == openjson.toJson(obj)

suite "logo_match endpoints":
  test "GET /accounts/{account_id}/brand-protection/logo-matches":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionLogoMatches(@["test"], "test", "test")

  test "GET /accounts/{account_id}/brand-protection/logo-matches/download":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionLogoMatchesDownload(@["test"], "test", "test")

  test "GET /accounts/{account_id}/brand-protection/logos":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionLogos()

  test "POST /accounts/{account_id}/brand-protection/logos":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionLogos("test", "test", 1.0)

  test "GET /accounts/{account_id}/brand-protection/logos/{logo_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdBrandProtectionLogosLogoId()

  test "DELETE /accounts/{account_id}/brand-protection/logos/{logo_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdBrandProtectionLogosLogoId()

  test "POST /accounts/{account_id}/brand-protection/scan-logo":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionScanLogo()

  test "POST /accounts/{account_id}/brand-protection/scan-page":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdBrandProtectionScanPage()

  test "GET /signed-url":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getSignedUrl()

