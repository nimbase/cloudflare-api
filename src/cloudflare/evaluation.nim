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
  PostAccountsAccountIdFlagshipAppsAppIdEvaluateRequest = object
    context: Option[JsonNode]
    flag_key: string

proc getAccountsAccountIdFlagshipAppsAppIdEvaluate*(client: CloudflareClient,
                                                    accountId: string,
                                                    appId: string,
                                                    flagKey: string,
                                                    targetingKey: string = default(string)): Future[types.FlagshipEvaluationResult] {.async.} =
  ## Evaluates a flag against the provided context. Pass context attributes as query
  ## parameters; values are coerced to numbers or booleans where unambiguous. For
  ## low-latency in-Worker evaluation, prefer the Flagship binding over this
  ## endpoint.

  var q = initOrderedTable[string, string]()
  q["flagKey"] = $flagKey
  q["targetingKey"] = $targetingKey
  let res = await client.httpGET(fmt"/accounts/{accountId}/flagship/apps/{appId}/evaluate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FlagshipEvaluationResult)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdFlagshipAppsAppIdEvaluate*(client: CloudflareClient,
                                                     accountId: string,
                                                     appId: string,
                                                     body: PostAccountsAccountIdFlagshipAppsAppIdEvaluateRequest): Future[types.FlagshipEvaluationResult] {.async.} =
  ## Evaluates a flag against the provided context, passed as a JSON request body
  ## (OFREP-shaped) rather than query parameters. Returns the same response shape as
  ## the GET variant.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/flagship/apps/{appId}/evaluate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FlagshipEvaluationResult)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdFlagshipAppsAppIdOfrepV1EvaluateFlags*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 appId: string,
                                                                 body: types.FlagshipOfrepEvaluationRequest): Future[types.FlagshipOfrepBulkEvaluationResponse] {.async.} =
  ## Evaluates every flag in the app following the [OpenFeature Remote Evaluation
  ## Protocol](https://github.com/open-feature/protocol) (OFREP) bulk contract. A
  ## flag with an invalid config appears as a failure entry rather than failing the
  ## request. Send the returned `ETag` in `If-None-Match` to receive `304` when the
  ## evaluated results are unchanged; a rollout whose targeting attribute is missing
  ## re-buckets randomly on each request, so it does not stay cached. Request-level
  ## failures omit `key` from the OFREP error body.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/flagship/apps/{appId}/ofrep/v1/evaluate/flags", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FlagshipOfrepBulkEvaluationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdFlagshipAppsAppIdOfrepV1EvaluateFlagsFlagKey*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        appId: string,
                                                                        flagKey: string,
                                                                        body: types.FlagshipOfrepEvaluationRequest): Future[types.FlagshipOfrepEvaluationSuccess] {.async.} =
  ## Evaluates a single flag following the [OpenFeature Remote Evaluation
  ## Protocol](https://github.com/open-feature/protocol) (OFREP). Send the evaluation
  ## context as `{ "context": { ... } }`; it may be omitted. A disabled flag returns
  ## `reason: DISABLED` without `value` or `variant` so the client uses its own
  ## default. Failures use the OFREP error shape `{ key, errorCode, errorDetails }`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/flagship/apps/{appId}/ofrep/v1/evaluate/flags/{flagKey}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FlagshipOfrepEvaluationSuccess)
  else:
    raise newException(CloudflareClientError, body)
