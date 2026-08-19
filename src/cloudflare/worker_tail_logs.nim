# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersScriptsScriptNameTails*(client: CloudflareClient,
                                                        accountId: types.WorkersIdentifier,
                                                        scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Get list of tails currently deployed on a Worker.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/tails")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkersScriptsScriptNameTails*(client: CloudflareClient,
                                                         accountId: types.WorkersIdentifier,
                                                         scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Starts a tail that receives logs and exception from a Worker.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/tails")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersScriptsScriptNameTailsId*(client: CloudflareClient,
                                                             accountId: types.WorkersIdentifier,
                                                             scriptName: types.WorkersScriptName,
                                                             id: types.WorkersIdentifier): Future[types.WorkersApiResponseCommon] {.async.} =
  ## Deletes a tail from a Worker.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/tails/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
