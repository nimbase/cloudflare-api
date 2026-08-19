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

suite "zero_trust_risk_scoring_integrations serialization":
  test "round-trips DlpApiResponseSingle":
    let obj = newDlpApiResponseSingle()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseSingle)) == openjson.toJson(obj)

  test "round-trips DlpRiskScoreIntegration":
    let obj = newDlpRiskScoreIntegration()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpRiskScoreIntegration)) == openjson.toJson(obj)

  test "round-trips DlpApiResponseCommonFailure":
    let obj = newDlpApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips DlpUpdateIntegrationBody":
    let obj = newDlpUpdateIntegrationBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpUpdateIntegrationBody)) == openjson.toJson(obj)

  test "round-trips DlpCreateIntegrationBody":
    let obj = newDlpCreateIntegrationBody()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpCreateIntegrationBody)) == openjson.toJson(obj)

  test "round-trips DlpEmpty":
    let obj = newDlpEmpty()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DlpEmpty)) == openjson.toJson(obj)

suite "zero_trust_risk_scoring_integrations endpoints":
  test "GET /accounts/{account_id}/zt_risk_scoring/integrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringIntegrations("test")

  test "POST /accounts/{account_id}/zt_risk_scoring/integrations":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postAccountsAccountIdZtRiskScoringIntegrations("test", newDlpCreateIntegrationBody())

  test "GET /accounts/{account_id}/zt_risk_scoring/integrations/reference_id/{reference_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringIntegrationsReferenceIdReferenceId("test", "test")

  test "GET /accounts/{account_id}/zt_risk_scoring/integrations/{integration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdZtRiskScoringIntegrationsIntegrationId("test", "test")

  test "PUT /accounts/{account_id}/zt_risk_scoring/integrations/{integration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.putAccountsAccountIdZtRiskScoringIntegrationsIntegrationId("test", "test", newDlpUpdateIntegrationBody())

  test "DELETE /accounts/{account_id}/zt_risk_scoring/integrations/{integration_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdZtRiskScoringIntegrationsIntegrationId("test", "test")

