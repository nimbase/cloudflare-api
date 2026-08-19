# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdContainersApplicationsApplicationIdRollouts*(client: CloudflareClient,
                                                                       applicationId: types.CcApplicationID,
                                                                       body: types.CcCreateApplicationRolloutRequest): Future[JsonNode] {.async.} =
  ## Creates a rollout to update the application's configuration across instances
  ## with minimal downtime.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/containers/applications/{applicationId}/rollouts", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
