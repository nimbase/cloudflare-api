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
  ## Lists Traces with a named Agent invocation in the window, ordered by
  ## lastActivityMs, newest first, including work without a Conversation ID. The
  ## window defaults to the last 24 hours. Summaries include the Agent names and
  ## Conversation IDs seen, authorized Trace duration, chat input/output/total
  ## tokens, models, providers, LLM/tool call counts and span-error counts within the
  ## effective window.

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
  ## Returns the summary of one Trace containing named Agent activity, with the same
  ## fields as the Trace list. Searches the full 7-day retention unless from or to
  ## narrow it. List the Trace's events with /agents/traces/{traceId}/events.

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
  ## Returns a page of authorized canonical otel events for a Trace containing named
  ## Agent activity, using the existing events-query flow. Searches the full 7-day
  ## retention unless from or to narrow it. Events are ordered by event timestamp and
  ## ID, newest first. Continue with result_info.cursors.after; one page is not a
  ## complete span tree.

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
