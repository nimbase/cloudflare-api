# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  GetAccountsAccountIdPipelinesResponse* = object
    result_info: JsonNode
    results: seq[types.CloudflarePipelinesWorkersPipelinesPipeline]
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  PostAccountsAccountIdPipelinesRequest = object
    destination: JsonNode
    name: string
    source: seq[JsonNode]
  PostAccountsAccountIdPipelinesResponse* = object
    result: types.CloudflarePipelinesWorkersPipelinesPipeline
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  GetAccountsAccountIdPipelinesV1PipelinesResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  PostAccountsAccountIdPipelinesV1PipelinesRequest = object
    name: string
    sql: string
  PostAccountsAccountIdPipelinesV1PipelinesResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  GetAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  DeleteAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  GetAccountsAccountIdPipelinesV1SinksResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  PostAccountsAccountIdPipelinesV1SinksRequest = object
    config: Option[JsonNode]
    format: Option[types.CloudflarePipelinesFormat]
    name: string
    schema: Option[types.CloudflarePipelinesConnectionSchema]
    `type`: string
  PostAccountsAccountIdPipelinesV1SinksResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  GetAccountsAccountIdPipelinesV1SinksSinkIdResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  DeleteAccountsAccountIdPipelinesV1SinksSinkIdResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  GetAccountsAccountIdPipelinesV1StreamsResponse* = object
    result: seq[JsonNode]
    result_info: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  PostAccountsAccountIdPipelinesV1StreamsRequest = object
    format: Option[types.CloudflarePipelinesFormat]
    http: Option[JsonNode]
    name: string
    schema: Option[types.CloudflarePipelinesConnectionSchema]
    worker_binding: Option[JsonNode]
  PostAccountsAccountIdPipelinesV1StreamsResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  GetAccountsAccountIdPipelinesV1StreamsStreamIdResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  DeleteAccountsAccountIdPipelinesV1StreamsStreamIdResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  PatchAccountsAccountIdPipelinesV1StreamsStreamIdRequest = object
    http: Option[JsonNode]
    worker_binding: Option[JsonNode]
  PatchAccountsAccountIdPipelinesV1StreamsStreamIdResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  PostAccountsAccountIdPipelinesV1ValidateSqlRequest = object
    sql: string
  PostAccountsAccountIdPipelinesV1ValidateSqlResponse* = object
    result: JsonNode
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  GetAccountsAccountIdPipelinesPipelineNameResponse* = object
    result: types.CloudflarePipelinesWorkersPipelinesPipeline
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess
  PutAccountsAccountIdPipelinesPipelineNameRequest = object
    destination: JsonNode
    name: string
    source: seq[JsonNode]
  PutAccountsAccountIdPipelinesPipelineNameResponse* = object
    result: types.CloudflarePipelinesWorkersPipelinesPipeline
    success: types.CloudflarePipelinesWorkerPipelinesCommonSuccess

proc getAccountsAccountIdPipelines*(client: CloudflareClient,
                                    accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                    search: string = default(string),
                                    page: string = "1", perPage: string = "25"): Future[GetAccountsAccountIdPipelinesResponse] {.async.} =
  ## [DEPRECATED] List, filter, and paginate pipelines in an account. Use the new
  ## /pipelines/v1/pipelines endpoint instead.

  var q = initOrderedTable[string, string]()
  q["search"] = $search
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pipelines", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdPipelinesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPipelines*(client: CloudflareClient,
                                     accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                     body: PostAccountsAccountIdPipelinesRequest): Future[PostAccountsAccountIdPipelinesResponse] {.async.} =
  ## [DEPRECATED] Create a new pipeline. Use the new /pipelines/v1/pipelines endpoint
  ## instead.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pipelines", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdPipelinesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPipelinesV1Pipelines*(client: CloudflareClient,
                                               accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                               page: float64 = default(float64),
                                               perPage: float64 = default(float64),
                                               name: string = default(string)): Future[GetAccountsAccountIdPipelinesV1PipelinesResponse] {.async.} =
  ## List/Filter Pipelines in Account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["name"] = $name
  let res = await client.httpGET(fmt"/accounts/{accountId}/pipelines/v1/pipelines", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdPipelinesV1PipelinesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPipelinesV1Pipelines*(client: CloudflareClient,
                                                accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                body: PostAccountsAccountIdPipelinesV1PipelinesRequest): Future[PostAccountsAccountIdPipelinesV1PipelinesResponse] {.async.} =
  ## Create a new Pipeline.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pipelines/v1/pipelines", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdPipelinesV1PipelinesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPipelinesV1PipelinesPipelineId*(client: CloudflareClient,
                                                         accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                         pipelineId: types.CloudflarePipelinesWorkersPipelinesPipelineId): Future[GetAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse] {.async.} =
  ## Get Pipeline details.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pipelines/v1/pipelines/{pipelineId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPipelinesV1PipelinesPipelineId*(client: CloudflareClient,
                                                            accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                            pipelineId: types.CloudflarePipelinesWorkersPipelinesPipelineId): Future[DeleteAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse] {.async.} =
  ## Delete Pipeline in Account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pipelines/v1/pipelines/{pipelineId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdPipelinesV1PipelinesPipelineIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPipelinesV1Sinks*(client: CloudflareClient,
                                           accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                           pipelineId: string = default(string),
                                           name: string = default(string),
                                           page: float64 = default(float64),
                                           perPage: float64 = default(float64)): Future[GetAccountsAccountIdPipelinesV1SinksResponse] {.async.} =
  ## List/Filter Sinks in Account.

  var q = initOrderedTable[string, string]()
  q["pipeline_id"] = $pipelineId
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pipelines/v1/sinks", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdPipelinesV1SinksResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPipelinesV1Sinks*(client: CloudflareClient,
                                            accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                            body: PostAccountsAccountIdPipelinesV1SinksRequest): Future[PostAccountsAccountIdPipelinesV1SinksResponse] {.async.} =
  ## Create a new Sink.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pipelines/v1/sinks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdPipelinesV1SinksResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPipelinesV1SinksSinkId*(client: CloudflareClient,
                                                 accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                 sinkId: types.CloudflarePipelinesWorkersPipelinesSinkId): Future[GetAccountsAccountIdPipelinesV1SinksSinkIdResponse] {.async.} =
  ## Get Sink Details.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pipelines/v1/sinks/{sinkId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdPipelinesV1SinksSinkIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPipelinesV1SinksSinkId*(client: CloudflareClient,
                                                    accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                    sinkId: types.CloudflarePipelinesWorkersPipelinesSinkId,
                                                    force: string = default(string)): Future[DeleteAccountsAccountIdPipelinesV1SinksSinkIdResponse] {.async.} =
  ## Delete Sink in Account.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pipelines/v1/sinks/{sinkId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdPipelinesV1SinksSinkIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPipelinesV1Streams*(client: CloudflareClient,
                                             accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                             pipelineId: types.CloudflarePipelinesWorkersPipelinesPipelineId = default(types.CloudflarePipelinesWorkersPipelinesPipelineId),
                                             name: string = default(string),
                                             page: float64 = default(float64),
                                             perPage: float64 = default(float64)): Future[GetAccountsAccountIdPipelinesV1StreamsResponse] {.async.} =
  ## List/Filter Streams in Account.

  var q = initOrderedTable[string, string]()
  q["pipeline_id"] = $pipelineId
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/pipelines/v1/streams", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdPipelinesV1StreamsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPipelinesV1Streams*(client: CloudflareClient,
                                              accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                              body: PostAccountsAccountIdPipelinesV1StreamsRequest): Future[PostAccountsAccountIdPipelinesV1StreamsResponse] {.async.} =
  ## Create a new Stream.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pipelines/v1/streams", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdPipelinesV1StreamsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPipelinesV1StreamsStreamId*(client: CloudflareClient,
                                                     accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                     streamId: types.CloudflarePipelinesWorkersPipelinesStreamId): Future[GetAccountsAccountIdPipelinesV1StreamsStreamIdResponse] {.async.} =
  ## Get Stream Details.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pipelines/v1/streams/{streamId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdPipelinesV1StreamsStreamIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPipelinesV1StreamsStreamId*(client: CloudflareClient,
                                                        force: string = default(string),
                                                        accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                        streamId: types.CloudflarePipelinesWorkersPipelinesStreamId): Future[DeleteAccountsAccountIdPipelinesV1StreamsStreamIdResponse] {.async.} =
  ## Delete Stream in Account.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pipelines/v1/streams/{streamId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdPipelinesV1StreamsStreamIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdPipelinesV1StreamsStreamId*(client: CloudflareClient,
                                                       accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                       streamId: types.CloudflarePipelinesWorkersPipelinesStreamId,
                                                       body: PatchAccountsAccountIdPipelinesV1StreamsStreamIdRequest): Future[PatchAccountsAccountIdPipelinesV1StreamsStreamIdResponse] {.async.} =
  ## Update a Stream.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/pipelines/v1/streams/{streamId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdPipelinesV1StreamsStreamIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPipelinesV1ValidateSql*(client: CloudflareClient,
                                                  accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                  body: PostAccountsAccountIdPipelinesV1ValidateSqlRequest): Future[PostAccountsAccountIdPipelinesV1ValidateSqlResponse] {.async.} =
  ## Validates that the Pipelines SQL is correct.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pipelines/v1/validate_sql", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdPipelinesV1ValidateSqlResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPipelinesPipelineName*(client: CloudflareClient,
                                                accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                pipelineName: string): Future[GetAccountsAccountIdPipelinesPipelineNameResponse] {.async.} =
  ## [DEPRECATED] Get configuration of a pipeline. Use the new
  ## /pipelines/v1/pipelines endpoint instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pipelines/{pipelineName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdPipelinesPipelineNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdPipelinesPipelineName*(client: CloudflareClient,
                                                accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                pipelineName: string,
                                                body: PutAccountsAccountIdPipelinesPipelineNameRequest): Future[PutAccountsAccountIdPipelinesPipelineNameResponse] {.async.} =
  ## [DEPRECATED] Update an existing pipeline. Use the new /pipelines/v1/pipelines
  ## endpoint instead.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/pipelines/{pipelineName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdPipelinesPipelineNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPipelinesPipelineName*(client: CloudflareClient,
                                                   accountId: types.CloudflarePipelinesWorkersPipelinesAccountId,
                                                   pipelineName: string): Future[AsyncResponse] {.async.} =
  ## [DEPRECATED] Delete a pipeline. Use the new /pipelines/v1/pipelines endpoint
  ## instead.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pipelines/{pipelineName}")
  return res
