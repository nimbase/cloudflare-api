# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdContainersInstancesInstanceIdSsh*(client: CloudflareClient,
                                                           instanceId: types.CcInstanceID): Future[JsonNode] {.async.} =
  ## Get a JWT to hit the SSH port on a given container.

  let res = await client.httpGET(fmt"/accounts/{account_id}/containers/instances/{instanceId}/ssh")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
