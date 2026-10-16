# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpValidators*(client: CloudflareClient,
                                        kind: JsonNode = default(JsonNode),
                                        accountId: string): Future[JsonNode] {.async.} =
  ## Lists the validators configured for the account, of every kind.

  var q = initOrderedTable[string, string]()
  q["kind"] = $kind
  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/validators", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpValidatorsProximityWords*(client: CloudflareClient,
                                                      accountId: string): Future[JsonNode] {.async.} =
  ## Lists the `proximity_words` validators configured for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/validators/proximity_words")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpValidatorsProximityWords*(client: CloudflareClient,
                                                       accountId: string,
                                                       body: types.DlpProximityWordValidatorWrite): Future[JsonNode] {.async.} =
  ## Creates a reusable list of weighted words that detection entries can attach to
  ## in order to
  ## refine their matches. An account may own at most 100 validators across all
  ## kinds.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/validators/proximity_words", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpValidatorsProximityWordsValidatorId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 validatorId: string): Future[JsonNode] {.async.} =
  ## Fetches a `proximity_words` validator by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/validators/proximity_words/{validatorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpValidatorsProximityWordsValidatorId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 validatorId: string,
                                                                 body: types.DlpProximityWordValidatorWrite): Future[JsonNode] {.async.} =
  ## Replaces the name and word list of a `proximity_words` validator. Attachments to
  ## detection
  ## entries are owned from the entry side and are not affected.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/validators/proximity_words/{validatorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpValidatorsProximityWordsValidatorId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    validatorId: string): Future[JsonNode] {.async.} =
  ## Deletes a `proximity_words` validator. Fails with `409` while any detection
  ## entry is still
  ## attached to it; detach it from those entries first.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/validators/proximity_words/{validatorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpValidatorsWorker*(client: CloudflareClient,
                                              accountId: string): Future[JsonNode] {.async.} =
  ## Lists the `worker` validators configured for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/validators/worker")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpValidatorsWorker*(client: CloudflareClient,
                                               accountId: string,
                                               body: types.DlpWorkerValidatorWrite): Future[JsonNode] {.async.} =
  ## Registers a customer Worker as a validator. An account may own at most 100
  ## validators across
  ## all kinds.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/validators/worker", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpValidatorsWorkerValidatorId*(client: CloudflareClient,
                                                         accountId: string,
                                                         validatorId: string): Future[JsonNode] {.async.} =
  ## Fetches a `worker` validator by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/validators/worker/{validatorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpValidatorsWorkerValidatorId*(client: CloudflareClient,
                                                         accountId: string,
                                                         validatorId: string,
                                                         body: types.DlpWorkerValidatorWrite): Future[JsonNode] {.async.} =
  ## Replaces the name, script tag and fallback verdict of a `worker` validator.
  ## Attachments to
  ## detection entries are owned from the entry side and are not affected.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/validators/worker/{validatorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpValidatorsWorkerValidatorId*(client: CloudflareClient,
                                                            accountId: string,
                                                            validatorId: string): Future[JsonNode] {.async.} =
  ## Deletes a `worker` validator. Fails with `409` while any detection entry is
  ## still attached to
  ## it; detach it from those entries first.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/validators/worker/{validatorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpValidatorsWorkerValidatorIdStatus*(client: CloudflareClient,
                                                               accountId: string,
                                                               validatorId: string): Future[JsonNode] {.async.} =
  ## Reports whether the validator's Worker can be used. Returns `worker_not_found`
  ## if the Worker
  ## cannot be found, and `worker_error` if the Worker does not have a valid
  ## validation entrypoint
  ## or is returning incorrect responses.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/validators/worker/{validatorId}/status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpValidatorsValidatorId*(client: CloudflareClient,
                                                   accountId: string,
                                                   validatorId: string): Future[JsonNode] {.async.} =
  ## Fetches a validator of any kind by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/validators/{validatorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
