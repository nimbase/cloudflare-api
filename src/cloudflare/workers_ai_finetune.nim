# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiFinetunesResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdAiFinetunesRequest = object
    description: Option[string]
    model: string
    name: string
    public: Option[bool]
  PostAccountsAccountIdAiFinetunesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiFinetunesPublicResponse* = object
    result: seq[JsonNode]
    success: bool
  DeleteAccountsAccountIdAiFinetunesFinetuneIdResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsResponse* = object
    success: bool

proc getAccountsAccountIdAiFinetunes*(client: CloudflareClient,
                                      accountId: string): Future[GetAccountsAccountIdAiFinetunesResponse] {.async.} =
  ## Lists all fine-tuning jobs created by the account, including status and metrics.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/finetunes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiFinetunesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiFinetunes*(client: CloudflareClient,
                                       accountId: string,
                                       body: PostAccountsAccountIdAiFinetunesRequest): Future[PostAccountsAccountIdAiFinetunesResponse] {.async.} =
  ## Creates a new fine-tuning job for a Workers AI model using custom training data.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai/finetunes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiFinetunesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiFinetunesPublic*(client: CloudflareClient,
                                            accountId: string,
                                            limit: float64 = default(float64),
                                            offset: float64 = default(float64),
                                            orderBy: string = default(string)): Future[GetAccountsAccountIdAiFinetunesPublicResponse] {.async.} =
  ## Lists publicly available fine-tuned models that can be used with Workers AI.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["orderBy"] = $orderBy
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/finetunes/public", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiFinetunesPublicResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiFinetunesFinetuneId*(client: CloudflareClient,
                                                   accountId: string,
                                                   finetuneId: string): Future[DeleteAccountsAccountIdAiFinetunesFinetuneIdResponse] {.async.} =
  ## Delete a finetune. Any in-flight requests referencing the lora will fail after
  ## the files are deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai/finetunes/{finetuneId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiFinetunesFinetuneIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssets*(client: CloudflareClient,
                                                               accountId: string,
                                                               finetuneId: string): Future[PostAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsResponse] {.async.} =
  ## Uploads training data assets for a Workers AI fine-tuning job.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai/finetunes/{finetuneId}/finetune-assets")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsResponse)
  else:
    raise newException(CloudflareClientError, body)
