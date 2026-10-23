# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient


proc getHeartbeat*(client: CloudflareClient): Future[AsyncResponse] {.async.} =
  ## Used by Kubernetes readiness and liveness probes, and CI builder by executing
  ## test/staging.sh.

  let res = await client.httpGET("/_heartbeat")
  return res
