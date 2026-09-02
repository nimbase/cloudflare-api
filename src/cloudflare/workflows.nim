# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdTriggersScriptNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PutAccountsAccountIdTriggersScriptNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  DeleteAccountsAccountIdTriggersScriptNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PatchAccountsAccountIdTriggersScriptNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsSettingsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PatchAccountsAccountIdWorkflowsSettingsRequest = object
    default_retention: Option[JsonNode]
  PatchAccountsAccountIdWorkflowsSettingsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PutAccountsAccountIdWorkflowsWorkflowNameRequest = object
    class_name: string
    concurrency: Option[JsonNode]
    default_retention: Option[JsonNode]
    limits: Option[JsonNode]
    schedules: Option[seq[JsonNode]]
    script_name: string
  PutAccountsAccountIdWorkflowsWorkflowNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  DeleteAccountsAccountIdWorkflowsWorkflowNameResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameInstancesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdWorkflowsWorkflowNameInstancesRequest = object
    instance_id: Option[string]
    instance_retention: Option[JsonNode]
    location_hint: Option[string]
    params: Option[string]
  PostAccountsAccountIdWorkflowsWorkflowNameInstancesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDeleteRequest = object
    instances: seq[string]
  PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDeleteResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchTerminateResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameInstancesTerminateResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  DeleteAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PostAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdEventsEventTypeResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  PatchAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStatusResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStepResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdSubscribeTokenResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameVersionsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[JsonNode]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdDagResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdGraphResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: JsonNode
    result_info: JsonNode
    success: bool
  WorkflowDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  WorkflowStatusOption* = enum
    statusQueued = "queued"
    statusRunning = "running"
    statusPaused = "paused"
    statusErrored = "errored"
    statusTerminated = "terminated"
    statusComplete = "complete"
    statusWaitingForPause = "waitingForPause"
    statusWaiting = "waiting"
    statusRollingBack = "rollingBack"

  WorkflowSimpleOption* = enum
    simpleTrue = "true"
    simpleFalse = "false"

  WorkflowOrderOption* = enum
    orderAsc = "asc"
    orderDesc = "desc"

  WorkflowTypeOption* = enum
    typeStep = "step"
    typeWaitForEvent = "waitForEvent"


proc getAccountsAccountIdTriggersScriptName*(client: CloudflareClient,
                                             scriptName: string,
                                             accountId: string): Future[GetAccountsAccountIdTriggersScriptNameResponse] {.async.} =
  ## Returns the event trigger declarations owned by a Worker script.

  let res = await client.httpGET(fmt"/accounts/{accountId}/triggers/{scriptName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdTriggersScriptNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdTriggersScriptName*(client: CloudflareClient,
                                             scriptName: string,
                                             accountId: string): Future[PutAccountsAccountIdTriggersScriptNameResponse] {.async.} =
  ## Replaces all event trigger declarations owned by a Worker script.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/triggers/{scriptName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdTriggersScriptNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdTriggersScriptName*(client: CloudflareClient,
                                                scriptName: string,
                                                accountId: string): Future[DeleteAccountsAccountIdTriggersScriptNameResponse] {.async.} =
  ## Deletes all event trigger declarations owned by a Worker script.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/triggers/{scriptName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdTriggersScriptNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdTriggersScriptName*(client: CloudflareClient,
                                               scriptName: string,
                                               accountId: string): Future[PatchAccountsAccountIdTriggersScriptNameResponse] {.async.} =
  ## Adds event trigger declarations without removing existing declarations owned by
  ## the script.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/triggers/{scriptName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdTriggersScriptNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflows*(client: CloudflareClient,
                                    perPage: float64 = default(float64),
                                    page: float64 = default(float64),
                                    search: string = default(string),
                                    accountId: string): Future[GetAccountsAccountIdWorkflowsResponse] {.async.} =
  ## Lists all workflows configured for the account.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page"] = $page
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsSettings*(client: CloudflareClient,
                                            accountId: string): Future[GetAccountsAccountIdWorkflowsSettingsResponse] {.async.} =
  ## Retrieves account-level Workflows settings, such as the default instance
  ## retention.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkflowsSettings*(client: CloudflareClient,
                                              accountId: string,
                                              body: PatchAccountsAccountIdWorkflowsSettingsRequest): Future[PatchAccountsAccountIdWorkflowsSettingsResponse] {.async.} =
  ## Updates only the account-level Workflows settings fields present in the request
  ## body.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workflows/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdWorkflowsSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowName*(client: CloudflareClient,
                                                workflowName: string,
                                                accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameResponse] {.async.} =
  ## Retrieves configuration and metadata for a specific workflow.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkflowsWorkflowName*(client: CloudflareClient,
                                                workflowName: string,
                                                accountId: string,
                                                body: PutAccountsAccountIdWorkflowsWorkflowNameRequest): Future[PutAccountsAccountIdWorkflowsWorkflowNameResponse] {.async.} =
  ## Creates a new workflow or updates an existing workflow definition.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workflows/{workflowName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdWorkflowsWorkflowNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkflowsWorkflowName*(client: CloudflareClient,
                                                   workflowName: string,
                                                   accountId: string): Future[DeleteAccountsAccountIdWorkflowsWorkflowNameResponse] {.async.} =
  ## Deletes a Workflow. This only deletes the Workflow and does not delete or modify
  ## any Worker associated to this Workflow or bounded to it.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workflows/{workflowName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdWorkflowsWorkflowNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameInstances*(client: CloudflareClient,
                                                         workflowName: string,
                                                         page: float64 = default(float64),
                                                         perPage: float64 = default(float64),
                                                         cursor: string = default(string),
                                                         direction: WorkflowDirectionOption,
                                                         status: WorkflowStatusOption,
                                                         dateStart: string = default(string),
                                                         dateEnd: string = default(string),
                                                         accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameInstancesResponse] {.async.} =
  ## Lists all instances of a workflow with their execution status.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  q["direction"] = $direction
  q["status"] = $status
  q["date_start"] = $dateStart
  q["date_end"] = $dateEnd
  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/instances", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameInstancesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkflowsWorkflowNameInstances*(client: CloudflareClient,
                                                          workflowName: string,
                                                          accountId: string,
                                                          body: PostAccountsAccountIdWorkflowsWorkflowNameInstancesRequest): Future[PostAccountsAccountIdWorkflowsWorkflowNameInstancesResponse] {.async.} =
  ## Creates a new instance of a workflow, starting its execution.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workflows/{workflowName}/instances", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkflowsWorkflowNameInstancesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkflowsWorkflowNameInstancesBatch*(client: CloudflareClient,
                                                               workflowName: string,
                                                               accountId: string): Future[PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchResponse] {.async.} =
  ## Creates multiple workflow instances in a single batch operation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDelete*(client: CloudflareClient,
                                                                     workflowName: string,
                                                                     accountId: string,
                                                                     body: PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDeleteRequest): Future[PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDeleteResponse] {.async.} =
  ## Deletes multiple workflow instances in a single batch operation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/batch/delete", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkflowsWorkflowNameInstancesBatchTerminate*(client: CloudflareClient,
                                                                        workflowName: string,
                                                                        accountId: string): Future[PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchTerminateResponse] {.async.} =
  ## Performs a batch termination of multiple workflow instances.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/batch/terminate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkflowsWorkflowNameInstancesBatchTerminateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameInstancesTerminate*(client: CloudflareClient,
                                                                  workflowName: string,
                                                                  accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameInstancesTerminateResponse] {.async.} =
  ## Gets the status of a bulk workflow instance termination job.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/terminate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameInstancesTerminateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceId*(client: CloudflareClient,
                                                                   workflowName: string,
                                                                   instanceId: string,
                                                                   simple: WorkflowSimpleOption = simpleFalse,
                                                                   order: WorkflowOrderOption = orderAsc,
                                                                   accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse] {.async.} =
  ## Retrieves logs and execution status for a specific workflow instance.

  var q = initOrderedTable[string, string]()
  q["simple"] = $simple
  q["order"] = $order
  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/{instanceId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceId*(client: CloudflareClient,
                                                                      workflowName: string,
                                                                      instanceId: string,
                                                                      accountId: string): Future[DeleteAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse] {.async.} =
  ## Deletes a workflow instance and its stored state.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/{instanceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdEventsEventType*(client: CloudflareClient,
                                                                                   workflowName: string,
                                                                                   instanceId: string,
                                                                                   eventType: string,
                                                                                   accountId: string): Future[PostAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdEventsEventTypeResponse] {.async.} =
  ## Sends an event to a running workflow instance to trigger state transitions.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/{instanceId}/events/{eventType}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdEventsEventTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStatus*(client: CloudflareClient,
                                                                           workflowName: string,
                                                                           instanceId: string,
                                                                           accountId: string): Future[PatchAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStatusResponse] {.async.} =
  ## Changes the execution status of a workflow instance (e.g., pause, resume,
  ## terminate).

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/{instanceId}/status", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStatusResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStep*(client: CloudflareClient,
                                                                       workflowName: string,
                                                                       instanceId: string,
                                                                       name: string,
                                                                       `type`: WorkflowTypeOption,
                                                                       attempt: int64 = default(int64),
                                                                       accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStepResponse] {.async.} =
  ## Retrieves the full, untruncated output for a specific step on a workflow
  ## instance. Returns a flat status-shaped JSON body with step `status` ('running' |
  ## 'waiting' | 'complete' | 'errored'), `error` (nullable), and `output` (the step
  ## value, or null while running/waiting/errored). When the step returned a
  ## ReadableStream from step.do, the response is served as
  ## 'application/octet-stream' with the raw bytes as the body instead of JSON. A
  ## `status='running'` response with non-null `error` indicates the step is
  ## currently retrying after a prior attempt failed.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["type"] = $`type`
  q["attempt"] = $attempt
  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/{instanceId}/step", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdStepResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdSubscribe*(client: CloudflareClient,
                                                                            workflowName: string,
                                                                            instanceId: string,
                                                                            cursor: int64 = default(int64),
                                                                            filter: string = default(string),
                                                                            accountId: string): Future[AsyncResponse] {.async.} =
  ## Opens a WebSocket that streams workflow instance events.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["filter"] = $filter
  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/{instanceId}/subscribe", q)
  return res

proc getAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdSubscribeToken*(client: CloudflareClient,
                                                                                 workflowName: string,
                                                                                 instanceId: string,
                                                                                 accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdSubscribeTokenResponse] {.async.} =
  ## Creates a short-lived token for connecting to the workflow instance event
  ## WebSocket.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/instances/{instanceId}/subscribe/token")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameInstancesInstanceIdSubscribeTokenResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameVersions*(client: CloudflareClient,
                                                        workflowName: string,
                                                        perPage: float64 = default(float64),
                                                        page: float64 = default(float64),
                                                        accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameVersionsResponse] {.async.} =
  ## Lists all deployed versions of a workflow.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/versions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameVersionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameVersionsVersionId*(client: CloudflareClient,
                                                                 workflowName: string,
                                                                 versionId: string,
                                                                 accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdResponse] {.async.} =
  ## Retrieves details for a specific deployed workflow version.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/versions/{versionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdDag*(client: CloudflareClient,
                                                                    workflowName: string,
                                                                    versionId: string,
                                                                    accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdDagResponse] {.async.} =
  ## Retrieves the directed acyclic graph (DAG) representation of a workflow version.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/versions/{versionId}/dag")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdDagResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdGraph*(client: CloudflareClient,
                                                                      workflowName: string,
                                                                      versionId: string,
                                                                      accountId: string): Future[GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdGraphResponse] {.async.} =
  ## Retrieves the graph visualization of a workflow version.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workflows/{workflowName}/versions/{versionId}/graph")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkflowsWorkflowNameVersionsVersionIdGraphResponse)
  else:
    raise newException(CloudflareClientError, body)
