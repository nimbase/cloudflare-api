# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersScriptsScriptNameSchedules*(client: CloudflareClient,
                                                            accountId: types.WorkersIdentifier,
                                                            scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Fetches Cron Triggers for a Worker.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/schedules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersScriptsScriptNameSchedules*(client: CloudflareClient,
                                                            accountId: types.WorkersIdentifier,
                                                            scriptName: types.WorkersScriptName): Future[JsonNode] {.async.} =
  ## Updates Cron Triggers for a Worker.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/scripts/{scriptName}/schedules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
