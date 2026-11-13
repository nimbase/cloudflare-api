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
  GetAccountsAccountIdWorkersObservabilityAgentsTracesResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[types.WorkersObservabilityAgentTraceSummary]
    result_info: types.WorkersObservabilityAgentResultInfo
    success: bool
  GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: types.WorkersObservabilityAgentTraceSummary
    result_info: types.WorkersObservabilityAgentWindowInfo
    success: bool
  GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdEventsResponse* = object
    errors: seq[JsonNode]
    messages: seq[JsonNode]
    result: seq[types.WorkersObservabilityTelemetryEvent]
    result_info: types.WorkersObservabilityAgentResultInfo
    success: bool

proc getAccountsAccountIdWorkersObservabilityAgentsTraces*(client: CloudflareClient,
                                                           service: string = default(string),
                                                           agent: string = default(string),
                                                           `from`: int64 = default(int64),
                                                           to: int64 = default(int64),
                                                           perPage: int64 = default(int64),
                                                           cursor: string = default(string)): Future[GetAccountsAccountIdWorkersObservabilityAgentsTracesResponse] {.async.} =
  ## Lists Traces with Agent activity in the window, newest activity first, including
  ## work without a Conversation ID. The window defaults to the last 24 hours. Each
  ## summary covers the Trace's Agent spans (invoke_agent, chat, execute_tool): the
  ## Agents and Conversation IDs seen, duration, token usage, models, providers, and
  ## LLM call, tool call and error counts.

  var q = initOrderedTable[string, string]()
  q["service"] = $service
  q["agent"] = $agent
  q["from"] = $`from`
  q["to"] = $to
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  let res = await client.httpGET("/accounts/{account_id}/workers/observability/agents/traces", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityAgentsTracesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityAgentsTracesTraceId*(client: CloudflareClient,
                                                                  traceId: string,
                                                                  `from`: int64 = default(int64),
                                                                  to: int64 = default(int64)): Future[GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdResponse] {.async.} =
  ## Returns the summary of one Trace with Agent activity, with the same fields as
  ## the Trace list. Searches the full 7-day retention unless from or to narrow it.
  ## List the Trace's Agent spans with /agents/traces/{traceId}/events.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/agents/traces/{traceId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdEvents*(client: CloudflareClient,
                                                                        traceId: string,
                                                                        `from`: int64 = default(int64),
                                                                        to: int64 = default(int64),
                                                                        perPage: int64 = default(int64),
                                                                        cursor: string = default(string)): Future[GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdEventsResponse] {.async.} =
  ## Returns a page of a Trace's Agent spans (invoke_agent, chat, execute_tool) and
  ## their events, newest first. Trace and span IDs are the same as in the Worker's
  ## trace, and each span's parentSpanId links it into the Agent tree. Searches the
  ## full 7-day retention unless from or to narrow it. Continue with
  ## result_info.cursors.after; one page may not hold the whole tree.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{account_id}/workers/observability/agents/traces/{traceId}/events", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdWorkersObservabilityAgentsTracesTraceIdEventsResponse)
  else:
    raise newException(CloudflareClientError, body)
