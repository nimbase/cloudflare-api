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

suite "sso serialization":
  test "round-trips IamSsoConnectorCollectionResponse":
    let obj = newIamSsoConnectorCollectionResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSsoConnectorCollectionResponse)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingleId":
    let obj = newIamApiResponseSingleId()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingleId)) == openjson.toJson(obj)

  test "round-trips IamAccountIdentifier":
    let obj = newIamAccountIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamAccountIdentifier)) == openjson.toJson(obj)

  test "round-trips IamSsoConnectorResponse":
    let obj = newIamSsoConnectorResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSsoConnectorResponse)) == openjson.toJson(obj)

  test "round-trips IamApiResponseCommonFailure":
    let obj = newIamApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips IamSsoConnectorIdentifier":
    let obj = newIamSsoConnectorIdentifier()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamSsoConnectorIdentifier)) == openjson.toJson(obj)

  test "round-trips IamApiResponseSingle":
    let obj = newIamApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.IamApiResponseSingle)) == openjson.toJson(obj)

suite "sso endpoints":
  test "GET /accounts/{account_id}/sso_connectors":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSsoConnectors(newIamAccountIdentifier())

  test "GET /accounts/{account_id}/sso_connectors/{sso_connector_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdSsoConnectorsSsoConnectorId(newIamAccountIdentifier(), newIamSsoConnectorIdentifier())

  test "DELETE /accounts/{account_id}/sso_connectors/{sso_connector_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdSsoConnectorsSsoConnectorId(newIamAccountIdentifier(), newIamSsoConnectorIdentifier())

  test "POST /accounts/{account_id}/sso_connectors/{sso_connector_id}/begin_verification":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdSsoConnectorsSsoConnectorIdBeginVerification(newIamAccountIdentifier(), newIamSsoConnectorIdentifier())

