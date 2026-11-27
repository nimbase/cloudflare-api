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
  PostAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsDeploymentIdProfileRequest = object
    actor_id: Option[string]
    duration_ms: int32
    namespace_id: Option[string]
    profile_type: Option[string]
  PostAccountsAccountIdWorkersWorkersWorkerIdVersionsVersionIdProfileRequest = object
    actor_id: Option[string]
    duration_ms: int32
    namespace_id: Option[string]
    profile_type: Option[string]

proc postAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsDeploymentIdProfile*(client: CloudflareClient,
                                                                                                 accountId: types.WorkersIdentifier,
                                                                                                 workerId: string,
                                                                                                 previewId: string,
                                                                                                 deploymentId: string,
                                                                                                 body: PostAccountsAccountIdWorkersWorkersWorkerIdPreviewsPreviewIdDeploymentsDeploymentIdProfileRequest): Future[AsyncResponse] {.async.} =
  ## Captures a CPU or heap profile from a recently active isolate running the
  ## specified Preview deployment. This endpoint requires the Worker Preview
  ## profiling feature to be enabled for the account. If the deployment's bundle is
  ## identical to another deployed Worker version in the account, the profile may be
  ## captured from an isolate running that version.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workers/workers/{workerId}/previews/{previewId}/deployments/{deploymentId}/profile", body)
  return res

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
