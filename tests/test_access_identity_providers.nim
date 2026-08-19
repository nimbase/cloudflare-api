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

suite "access_identity_providers serialization":
  test "round-trips AccessIdentityProviders":
    let obj = newAccessIdentityProviders()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdentityProviders)) == openjson.toJson(obj)

  test "round-trips AccessResponseCollection":
    let obj = newAccessResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessResponseCollection)) == openjson.toJson(obj)

  test "round-trips AccessApiResponseCommonFailure":
    let obj = newAccessApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips AccessSingleResponse3":
    let obj = newAccessSingleResponse3()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSingleResponse3)) == openjson.toJson(obj)

  test "round-trips AccessScimGroupsResponse":
    let obj = newAccessScimGroupsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessScimGroupsResponse)) == openjson.toJson(obj)

  test "round-trips AccessIdResponse":
    let obj = newAccessIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessIdResponse)) == openjson.toJson(obj)

  test "round-trips AccessScimUsersResponse":
    let obj = newAccessScimUsersResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessScimUsersResponse)) == openjson.toJson(obj)

  test "round-trips AccessSamlCertificateSetResponse":
    let obj = newAccessSamlCertificateSetResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.AccessSamlCertificateSetResponse)) == openjson.toJson(obj)

suite "access_identity_providers endpoints":
  test "GET /accounts/{account_id}/access/identity_providers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessIdentityProviders("test", "test", 1, 1)

  test "POST /accounts/{account_id}/access/identity_providers":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessIdentityProviders("test", newAccessIdentityProviders())

  test "GET /accounts/{account_id}/access/identity_providers/{identity_provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdAccessIdentityProvidersIdentityProviderId("test", "test")

  test "PUT /accounts/{account_id}/access/identity_providers/{identity_provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdAccessIdentityProvidersIdentityProviderId("test", "test", newAccessIdentityProviders())

  test "DELETE /accounts/{account_id}/access/identity_providers/{identity_provider_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdAccessIdentityProvidersIdentityProviderId("test", "test")

  test "POST /accounts/{account_id}/access/identity_providers/{identity_provider_id}/saml_certificate":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdAccessIdentityProvidersIdentityProviderIdSamlCertificate("test", "test")

