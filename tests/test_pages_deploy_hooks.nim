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

suite "pages_deploy_hooks serialization":
  test "round-trips PagesApiResponseCommonFailure":
    let obj = newPagesApiResponseCommonFailure()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommonFailure)) == openjson.toJson(obj)

  test "round-trips PagesApiResponseCommon":
    let obj = newPagesApiResponseCommon()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesApiResponseCommon)) == openjson.toJson(obj)

  test "round-trips PagesPagesDeployHookResponse":
    let obj = newPagesPagesDeployHookResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PagesPagesDeployHookResponse)) == openjson.toJson(obj)

suite "pages_deploy_hooks endpoints":
  test "POST /pages/webhooks/deploy_hooks/{deploy_hook_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.postPagesWebhooksDeployHooksDeployHookId("test")

