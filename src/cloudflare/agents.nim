# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  GetAccountsAccountIdWorkersObservabilityAgentsSessionsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[types.WorkersObservabilityAgentSession]
    result_info: JsonNode
    success: bool
  GetAccountsAccountIdWorkersObservabilityAgentsSessionsConversationIdRunsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[types.WorkersObservabilityAgentSessionRun]
    result_info: JsonNode
    success: bool

proc getAccountsAccountIdWorkersObservabilityAgentsSessions*(client: CloudflareClient,
                                                             service: string,
                                                             agent: string,
                                                             `from`: int64,
                                                             to: int64,
                                                             cursor: string = default(string),
                                                             perPage: int64 = default(int64)): Future[GetAccountsAccountIdWorkersObservabilityAgentsSessionsResponse] {.async.} =
  ## List the Sessions of one Agent in one Worker service observed in the window,
  ## most recently active first. A Session groups the Traces containing an invocation
  ## of the Agent with the same gen_ai.conversation.id. Results describe observed
  ## activity in the window, not complete history.

  var q = initOrderedTable[string, string]()
  q["service"] = $service
  q["agent"] = $agent
  q["from"] = $`from`
  q["to"] = $to
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET("/accounts/{account_id}/workers/observability/agents/sessions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityAgentsSessionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityAgentsSessionsConversationIdRuns*(client: CloudflareClient,
                                                                               conversationId: string,
                                                                               service: string,
                                                                               agent: string,
                                                                               `from`: int64,
                                                                               to: int64,
                                                                               cursor: string = default(string),
                                                                               perPage: int64 = default(int64)): Future[GetAccountsAccountIdWorkersObservabilityAgentsSessionsConversationIdRunsResponse] {.async.} =
  ## List the Trace-level runs of one Session, newest invocation first. A run is a
  ## Trace containing an invocation of the Agent in the Conversation; the Agent need
  ## not own the Trace.

  var q = initOrderedTable[string, string]()
  q["service"] = $service
  q["agent"] = $agent
  q["from"] = $`from`
  q["to"] = $to
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/agents/sessions/{conversationId}/runs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityAgentsSessionsConversationIdRunsResponse)
  else:
    raise newException(CloudflareClientError, body)
