# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdWorkersWorkersWorkerIdVersionsVersionIdProfileRequest = object
    actor_id: Option[string]
    duration_ms: int32
    namespace_id: Option[string]
    profile_type: Option[string]

proc postAccountsAccountIdWorkersWorkersWorkerIdVersionsVersionIdProfile*(client: CloudflareClient,
                                                                          accountId: types.WorkersIdentifier,
                                                                          workerId: string,
                                                                          versionId: string,
                                                                          body: PostAccountsAccountIdWorkersWorkersWorkerIdVersionsVersionIdProfileRequest): Future[AsyncResponse] {.async.} =
  ## Captures a CPU or heap profile from a recently active isolate running the
  ## specified Worker version. This endpoint requires the Worker profiling feature to
  ## be enabled for the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/workers/{workerId}/versions/{versionId}/profile", body)
  return res
