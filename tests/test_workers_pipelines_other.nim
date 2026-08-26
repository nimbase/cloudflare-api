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

suite "workers_pipelines_other serialization":
  test "round-trips CloudflarePipelinesWorkersPipelinesPipeline":
    let obj = newCloudflarePipelinesWorkersPipelinesPipeline()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflarePipelinesWorkersPipelinesPipeline)) == openjson.toJson(obj)

  test "round-trips CloudflarePipelinesFormat":
    let obj = newCloudflarePipelinesFormat()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflarePipelinesFormat)) == openjson.toJson(obj)

  test "round-trips CloudflarePipelinesPipelineGraph":
    let obj = newCloudflarePipelinesPipelineGraph()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflarePipelinesPipelineGraph)) == openjson.toJson(obj)

  test "round-trips CloudflarePipelinesConnectionSchema":
    let obj = newCloudflarePipelinesConnectionSchema()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.CloudflarePipelinesConnectionSchema)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdPipelinesResponse":
    let obj = cloudflare.GetAccountsAccountIdPipelinesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdPipelinesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdPipelinesResponse":
    let obj = cloudflare.PostAccountsAccountIdPipelinesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdPipelinesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdPipelinesV1PipelinesResponse":
    let obj = cloudflare.GetAccountsAccountIdPipelinesV1PipelinesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdPipelinesV1PipelinesResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdPipelinesV1PipelinesResponse":
    let obj = cloudflare.PostAccountsAccountIdPipelinesV1PipelinesResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdPipelinesV1PipelinesResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse":
    let obj = cloudflare.GetAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdPipelinesV1SinksResponse":
    let obj = cloudflare.GetAccountsAccountIdPipelinesV1SinksResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdPipelinesV1SinksResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdPipelinesV1SinksResponse":
    let obj = cloudflare.PostAccountsAccountIdPipelinesV1SinksResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdPipelinesV1SinksResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdPipelinesV1SinksSinkIdResponse":
    let obj = cloudflare.GetAccountsAccountIdPipelinesV1SinksSinkIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdPipelinesV1SinksSinkIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdPipelinesV1SinksSinkIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdPipelinesV1SinksSinkIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdPipelinesV1SinksSinkIdResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdPipelinesV1StreamsResponse":
    let obj = cloudflare.GetAccountsAccountIdPipelinesV1StreamsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdPipelinesV1StreamsResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdPipelinesV1StreamsResponse":
    let obj = cloudflare.PostAccountsAccountIdPipelinesV1StreamsResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdPipelinesV1StreamsResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdPipelinesV1StreamsStreamIdResponse":
    let obj = cloudflare.GetAccountsAccountIdPipelinesV1StreamsStreamIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdPipelinesV1StreamsStreamIdResponse)) == openjson.toJson(obj)

  test "round-trips DeleteAccountsAccountIdPipelinesV1StreamsStreamIdResponse":
    let obj = cloudflare.DeleteAccountsAccountIdPipelinesV1StreamsStreamIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.DeleteAccountsAccountIdPipelinesV1StreamsStreamIdResponse)) == openjson.toJson(obj)

  test "round-trips PatchAccountsAccountIdPipelinesV1StreamsStreamIdResponse":
    let obj = cloudflare.PatchAccountsAccountIdPipelinesV1StreamsStreamIdResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PatchAccountsAccountIdPipelinesV1StreamsStreamIdResponse)) == openjson.toJson(obj)

  test "round-trips PostAccountsAccountIdPipelinesV1ValidateSqlResponse":
    let obj = cloudflare.PostAccountsAccountIdPipelinesV1ValidateSqlResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PostAccountsAccountIdPipelinesV1ValidateSqlResponse)) == openjson.toJson(obj)

  test "round-trips GetAccountsAccountIdPipelinesPipelineNameResponse":
    let obj = cloudflare.GetAccountsAccountIdPipelinesPipelineNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.GetAccountsAccountIdPipelinesPipelineNameResponse)) == openjson.toJson(obj)

  test "round-trips PutAccountsAccountIdPipelinesPipelineNameResponse":
    let obj = cloudflare.PutAccountsAccountIdPipelinesPipelineNameResponse()
    check openjson.toJson(openjson.fromJson(openjson.toJson(obj), cloudflare.PutAccountsAccountIdPipelinesPipelineNameResponse)) == openjson.toJson(obj)

suite "workers_pipelines_other endpoints":
  test "GET /accounts/{account_id}/pipelines":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPipelines("test", "test", "test", "test")

  test "GET /accounts/{account_id}/pipelines/v1/pipelines":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPipelinesV1Pipelines("test", 1.0, 1.0, "test")

  test "GET /accounts/{account_id}/pipelines/v1/pipelines/{pipeline_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPipelinesV1PipelinesPipelineId("test", "test")

  test "DELETE /accounts/{account_id}/pipelines/v1/pipelines/{pipeline_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPipelinesV1PipelinesPipelineId("test", "test")

  test "GET /accounts/{account_id}/pipelines/v1/sinks":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPipelinesV1Sinks("test", "test", "test", 1.0, 1.0)

  test "GET /accounts/{account_id}/pipelines/v1/sinks/{sink_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPipelinesV1SinksSinkId("test", "test")

  test "DELETE /accounts/{account_id}/pipelines/v1/sinks/{sink_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPipelinesV1SinksSinkId("test", "test")

  test "GET /accounts/{account_id}/pipelines/v1/streams":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPipelinesV1Streams("test", "test", "test", 1.0, 1.0)

  test "GET /accounts/{account_id}/pipelines/v1/streams/{stream_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPipelinesV1StreamsStreamId("test", "test")

  test "DELETE /accounts/{account_id}/pipelines/v1/streams/{stream_id}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPipelinesV1StreamsStreamId("test", "test")

  test "GET /accounts/{account_id}/pipelines/{pipeline_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.getAccountsAccountIdPipelinesPipelineName("test", "test")

  test "DELETE /accounts/{account_id}/pipelines/{pipeline_name}":
    let client = initCloudflareClient("test-key")
    client.baseUri = "http://127.0.0.1:" & $int(startMock())
    discard waitFor client.deleteAccountsAccountIdPipelinesPipelineName("test", "test")

