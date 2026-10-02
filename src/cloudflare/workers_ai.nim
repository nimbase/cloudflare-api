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
  ## Retrieves the input and output JSON Schema definitions for an AI model. Use
  ## these definitions to determine the model-specific request fields and response
  ## format.

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
                                         format: WorkersAiFormatOption = formatOpenrouter): Future[JsonNode] {.async.} =
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
  q["format"] = $format
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/models/search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiRun*(client: CloudflareClient, accountId: string,
                                 body: PostAccountsAccountIdAiRunRequest): Future[PostAccountsAccountIdAiRunResponse] {.async.} =
  ## Runs an AI model using a JSON body containing model, input, and optional options
  ## fields. Unlike the model-specific URL endpoint, this endpoint takes the model
  ## identifier in the body and nests the model's inputs under input.
  ##
  ## Use options.extraHeaders to pass additional provider headers. Accepts Workers AI
  ## model identifiers and AI Gateway provider model identifiers.
  ##
  ## See the [Workers AI model
  ## catalog](https://developers.cloudflare.com/workers-ai/models/) for Workers AI
  ## model inputs, or the provider's documentation for models accessed through AI
  ## Gateway.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai/run", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiRunResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiRunModelName*(client: CloudflareClient,
                                          accountId: string, modelName: string): Future[PostAccountsAccountIdAiRunModelNameResponse] {.async.} =
  ## Runs the Workers AI model specified in the URL path. Send the model's inputs
  ## directly in the request body, without a model/input/options wrapper.
  ##
  ## Accepts model-specific JSON or binary input. The response format depends on the
  ## model and the requested output.
  ##
  ## See the [model catalog](https://developers.cloudflare.com/workers-ai/models/)
  ## for supported models and their input formats.

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
  ## Converts files uploaded as multipart form data into Markdown using Workers AI.
  ## Returns a conversion result for each file. Use the supported-formats endpoint to
  ## check accepted file types.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai/tomarkdown")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiTomarkdownResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiTomarkdownSupported*(client: CloudflareClient,
                                                accountId: string): Future[GetAccountsAccountIdAiTomarkdownSupportedResponse] {.async.} =
  ## Lists the file extensions and MIME types accepted by Workers AI's Markdown
  ## conversion endpoint. Use this list to check whether a file can be converted
  ## before uploading it.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/tomarkdown/supported")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiTomarkdownSupportedResponse)
  else:
    raise newException(CloudflareClientError, body)
