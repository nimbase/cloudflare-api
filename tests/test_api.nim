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

suite "api serialization":
  test "round-trips DomainConnectHttpError":
    let obj = newDomainConnectHttpError()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DomainConnectHttpError)) == openjson.toJson(obj)

  test "round-trips DomainConnectPostData":
    let obj = newDomainConnectPostData()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DomainConnectPostData)) == openjson.toJson(obj)

  test "round-trips DomainConnectNeededByStratus":
    let obj = newDomainConnectNeededByStratus()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DomainConnectNeededByStratus)) == openjson.toJson(obj)

suite "api endpoints":
  test "POST /v1/verify":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postV1Verify(newDomainConnectPostData())

  test "GET /v2/domainTemplates/providers/{provider}/services/{service}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getV2DomainTemplatesProvidersProviderServicesService("test", "test", "test")

  test "GET /v2/provconf/{provider}/{service}/{account}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getV2ProvconfProviderServiceAccount("test", "test", "test")

  test "GET /v2/{domain}/settings":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getV2DomainSettings("test")

