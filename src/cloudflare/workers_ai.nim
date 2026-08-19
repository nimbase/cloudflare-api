# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiAuthorsSearchResponse* = object
    errors: seq[JsonNode]
    messages: seq[string]
    result: seq[JsonNode]
    success: bool
  GetAccountsAccountIdAiModelsSchemaResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdAiRunRequest = object
    input: JsonNode
    model: string
    options: Option[JsonNode]
  PostAccountsAccountIdAiRunResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
      ## Model-specific output. Format varies by model type.
    success: bool
  PostAccountsAccountIdAiRunModelNameResponse* = object
    result: JsonNode
  GetAccountsAccountIdAiTasksSearchResponse* = object
    errors: seq[JsonNode]
    messages: seq[string]
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAiTomarkdownResponse* = object
    result: seq[JsonNode]
    success: bool
  GetAccountsAccountIdAiTomarkdownSupportedResponse* = object
    result: seq[JsonNode]
    success: bool
  WorkersAiFormatOption* = enum
    formatOpenrouter = "openrouter"


proc getAccountsAccountIdAiAuthorsSearch*(client: CloudflareClient,
                                          accountId: string): Future[GetAccountsAccountIdAiAuthorsSearchResponse] {.async.} =
  ## Searches Workers AI models by author or organization name.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/authors/search")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiAuthorsSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiModelsSchema*(client: CloudflareClient,
                                         accountId: string, model: string): Future[GetAccountsAccountIdAiModelsSchemaResponse] {.async.} =
  ## Retrieves the input and output JSON schema definition for a Workers AI model.

  var q = initOrderedTable[string, string]()
  q["model"] = $model
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/models/schema", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiModelsSchemaResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiModelsSearch*(client: CloudflareClient,
                                         accountId: string, perPage: int64 = 100,
                                         page: int64 = 1, task: string = "",
                                         author: string = "",
                                         source: float64 = default(float64),
                                         hideExperimental: bool = false,
                                         search: string = "",
                                         includeDeprecated: bool = false,
                                         format: set[WorkersAiFormatOption] = {}): Future[JsonNode] {.async.} =
  ## Searches Workers AI models by name or description.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page"] = $page
  q["task"] = $task
  q["author"] = $author
  q["source"] = $source
  q["hide_experimental"] = $hideExperimental
  q["search"] = $search
  q["include_deprecated"] = $includeDeprecated
  for v in format: q["format"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/models/search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiRun*(client: CloudflareClient, accountId: string,
                                 body: PostAccountsAccountIdAiRunRequest): Future[PostAccountsAccountIdAiRunResponse] {.async.} =
  ## Execute an AI model by specifying the model name in the request body.
  ##
  ## This endpoint provides a generic interface for running AI models where the model
  ## name is part of the request payload rather than the URL path. It supports all AI
  ## Gateway features including caching, custom headers, and request options.
  ##
  ## Model-specific inputs available in [Cloudflare
  ## Docs](https://developers.cloudflare.com/workers-ai/models/).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai/run", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiRunResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiRunModelName*(client: CloudflareClient,
                                          accountId: string, modelName: string): Future[PostAccountsAccountIdAiRunModelNameResponse] {.async.} =
  ## This endpoint provides users with the capability to run specific AI models
  ## on-demand.
  ##
  ## By submitting the required input data, users can receive real-time predictions
  ## or results generated by the chosen AI
  ## model. The endpoint supports various AI model types, ensuring flexibility and
  ## adaptability for diverse use cases.
  ##
  ## Model specific inputs available in [Cloudflare
  ## Docs](https://developers.cloudflare.com/workers-ai/models/).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai/run/{modelName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiRunModelNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiTasksSearch*(client: CloudflareClient,
                                        accountId: string): Future[GetAccountsAccountIdAiTasksSearchResponse] {.async.} =
  ## Searches Workers AI models by task type (e.g., text-generation, embeddings).

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/tasks/search")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiTasksSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiTomarkdown*(client: CloudflareClient,
                                        accountId: string): Future[PostAccountsAccountIdAiTomarkdownResponse] {.async.} =
  ## Converts uploaded files into Markdown format using Workers AI.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai/tomarkdown")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiTomarkdownResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiTomarkdownSupported*(client: CloudflareClient,
                                                accountId: string): Future[GetAccountsAccountIdAiTomarkdownSupportedResponse] {.async.} =
  ## Lists all file formats supported for conversion to Markdown.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/tomarkdown/supported")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiTomarkdownSupportedResponse)
  else:
    raise newException(CloudflareClientError, body)
