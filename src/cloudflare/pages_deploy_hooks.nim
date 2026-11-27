# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient


proc postPagesWebhooksDeployHooksDeployHookId*(client: CloudflareClient,
                                               deployHookId: string): Future[JsonNode] {.async.} =
  ## Start a deployment of the deploy hook's branch at its latest commit.
  ## This endpoint does not require authentication. The deploy hook ID in
  ## the URL acts as a secret token.

  let res = await client.httpPOST(fmt"/pages/webhooks/deploy_hooks/{deployHookId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
