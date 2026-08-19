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

suite "api_shield_waf_expression_templates serialization":
  test "round-trips ApiShieldApiResponseCommonFailure":
    let obj = newApiShieldApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips ApiShieldApiResponseCommon":
    let obj = newApiShieldApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips ApiShieldRequestExpressionTemplatesFallthrough":
    let obj = newApiShieldRequestExpressionTemplatesFallthrough()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldRequestExpressionTemplatesFallthrough)) == openjson.toJson(obj)

  test "round-trips ApiShieldResponseExpressionTemplatesFallthrough":
    let obj = newApiShieldResponseExpressionTemplatesFallthrough()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.ApiShieldResponseExpressionTemplatesFallthrough)) == openjson.toJson(obj)

suite "api_shield_waf_expression_templates endpoints":
  test "POST /zones/{zone_id}/api_gateway/expression-template/fallthrough":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postZonesZoneIdApiGatewayExpressionTemplateFallthrough(newApiShieldRequestExpressionTemplatesFallthrough())

