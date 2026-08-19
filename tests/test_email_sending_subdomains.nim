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

suite "email_sending_subdomains serialization":
  test "round-trips EmailSendingSubdomainPreviewResponse":
    let obj = newEmailSendingSubdomainPreviewResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingSubdomainPreviewResponse)) == openjson.toJson(obj)

  test "round-trips EmailUpdateSendingSubdomainProperties":
    let obj = newEmailUpdateSendingSubdomainProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailUpdateSendingSubdomainProperties)) == openjson.toJson(obj)

  test "round-trips EmailApiResponseSingle":
    let obj = newEmailApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailSendingSubdomainReputationComplaintsResponse":
    let obj = newEmailSendingSubdomainReputationComplaintsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingSubdomainReputationComplaintsResponse)) == openjson.toJson(obj)

  test "round-trips EmailDnsSettingsResponseCollection":
    let obj = newEmailDnsSettingsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailDnsSettingsResponseCollection)) == openjson.toJson(obj)

  test "round-trips EmailSendingSubdomainResponseSingle":
    let obj = newEmailSendingSubdomainResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingSubdomainResponseSingle)) == openjson.toJson(obj)

  test "round-trips EmailCreateSendingSubdomainProperties":
    let obj = newEmailCreateSendingSubdomainProperties()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailCreateSendingSubdomainProperties)) == openjson.toJson(obj)

  test "round-trips EmailSendingSubdomainDnsStatusResponse":
    let obj = newEmailSendingSubdomainDnsStatusResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingSubdomainDnsStatusResponse)) == openjson.toJson(obj)

  test "round-trips EmailSendingSubdomainsResponseCollection":
    let obj = newEmailSendingSubdomainsResponseCollection()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.EmailSendingSubdomainsResponseCollection)) == openjson.toJson(obj)

suite "email_sending_subdomains endpoints":
  test "GET /zones/{zone_id}/email/sending/subdomains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailSendingSubdomains("test")

  test "POST /zones/{zone_id}/email/sending/subdomains":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEmailSendingSubdomains("test", newEmailCreateSendingSubdomainProperties())

  test "POST /zones/{zone_id}/email/sending/subdomains/preview":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEmailSendingSubdomainsPreview("test", newEmailCreateSendingSubdomainProperties())

  test "GET /zones/{zone_id}/email/sending/subdomains/{subdomain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailSendingSubdomainsSubdomainId("test", "test")

  test "DELETE /zones/{zone_id}/email/sending/subdomains/{subdomain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteZonesZoneIdEmailSendingSubdomainsSubdomainId("test", "test")

  test "PATCH /zones/{zone_id}/email/sending/subdomains/{subdomain_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.patchZonesZoneIdEmailSendingSubdomainsSubdomainId("test", "test", newEmailUpdateSendingSubdomainProperties())

  test "GET /zones/{zone_id}/email/sending/subdomains/{subdomain_id}/dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailSendingSubdomainsSubdomainIdDns("test", "test")

  test "POST /zones/{zone_id}/email/sending/subdomains/{subdomain_id}/dns":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdEmailSendingSubdomainsSubdomainIdDns("test", "test")

  test "GET /zones/{zone_id}/email/sending/subdomains/{subdomain_id}/dns/status":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailSendingSubdomainsSubdomainIdDnsStatus("test", "test")

  test "GET /zones/{zone_id}/email/sending/subdomains/{subdomain_id}/reputation/complaints":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getZonesZoneIdEmailSendingSubdomainsSubdomainIdReputationComplaints("test", "test", "test", "test")

