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
  ## Lists sessions in which the specified agent participated, ordered by most recent
  ## activity. A session is identified by gen_ai.conversation.id and includes
  ## authorized activity from every agent in that conversation during the requested
  ## time range. Agent invocation and chat spans without a conversation ID are
  ## attributed only when their trace is associated with exactly one observed
  ## conversation.

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
  ## Lists the traces associated with a session, ordered by most recent activity. The
  ## service and agent parameters must identify an agent that participated in the
  ## conversation. Results include every authorized trace containing an agent
  ## invocation in that conversation during the requested time range.

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
