# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdBrowserRenderingAccessibilityTreeRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    emulate_media_type: Option[string]
    goto_options: Option[JsonNode]
    html: Option[string]
    interesting_only: Option[bool]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    root: Option[string]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingAccessibilityTreeResponse* = object
    errors: seq[JsonNode]
    meta: JsonNode
    result: JsonNode
    success: bool
      ## Response status.
  PostAccountsAccountIdBrowserRenderingContentRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    emulate_media_type: Option[string]
    goto_options: Option[JsonNode]
    html: Option[string]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingContentResponse* = object
    errors: seq[JsonNode]
    meta: JsonNode
    result: string
      ## HTML content.
    success: bool
      ## Response status.
  PostAccountsAccountIdBrowserRenderingCrawlResponse* = object
    errors: seq[JsonNode]
    result: string
      ## Crawl job ID.
    success: bool
      ## Response status.
  GetAccountsAccountIdBrowserRenderingCrawlJobIdResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
      ## Response status.
  DeleteAccountsAccountIdBrowserRenderingCrawlJobIdResponse* = object
    errors: seq[JsonNode]
    result: JsonNode
    success: bool
      ## Response status.
  PostAccountsAccountIdBrowserRenderingDevtoolsBrowserRequest = object
    guardrails: Option[JsonNode]
  PostAccountsAccountIdBrowserRenderingDevtoolsBrowserResponse* = object
    session_id: string
      ## Browser session ID.
    web_socket_debugger_url: string
      ## WebSocket URL for the session.
  DeleteAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdResponse* = object
    status: string
  GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonActivateTargetIdResponse* = object
    message: string
      ## Target activated.
  GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonCloseTargetIdResponse* = object
    message: string
      ## Target is closing.
  GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonListTargetIdResponse* = object
    description: string
      ## Target description.
    devtools_frontend_url: string
      ## DevTools frontend URL.
    id: string
      ## Target ID.
    title: string
      ## Title of the target.
    `type`: string
      ## Target type (page, background_page, worker, etc.).
    url: string
      ## URL of the target.
    web_socket_debugger_url: string
      ## WebSocket URL for debugging this target.
  PutAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonNewResponse* = object
    description: string
      ## Target description.
    devtools_frontend_url: string
      ## DevTools frontend URL.
    id: string
      ## Target ID.
    title: string
      ## Title of the target.
    `type`: string
      ## Target type (page, background_page, worker, etc.).
    url: string
      ## URL of the target.
    web_socket_debugger_url: string
      ## WebSocket URL for debugging this target.
  GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonProtocolResponse* = object
    domains: seq[JsonNode]
      ## List of protocol domains.
    version: JsonNode
      ## Protocol version.
  GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonVersionResponse* = object
    browser: string
      ## Browser name and version.
    protocol_version: string
      ## Chrome DevTools Protocol version.
    user_agent: string
      ## User agent string.
    v8_version: string
      ## V8 JavaScript engine version.
    web_kit_version: string
      ## WebKit version.
    web_socket_debugger_url: string
      ## WebSocket URL for debugging the browser.
  GetAccountsAccountIdBrowserRenderingDevtoolsSessionSessionIdResponse* = object
    close_reason: string
      ## Reason for session closure.
    close_reason_text: string
      ## Human-readable close reason.
    connection_end_time: float64
      ## Connection end time.
    connection_id: string
      ## Connection ID.
    connection_start_time: float64
      ## Connection start time.
    devtools_frontend_url: string
      ## DevTools frontend URL.
    end_time: float64
      ## Session end time.
    last_updated: float64
      ## Last updated timestamp.
    session_id: string
      ## Session ID.
    start_time: float64
      ## Session start time.
    web_socket_debugger_url: string
      ## WebSocket URL for debugging this target.
  PostAccountsAccountIdBrowserRenderingJsonRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    custom_ai: Option[seq[JsonNode]]
    emulate_media_type: Option[string]
    goto_options: Option[JsonNode]
    html: Option[string]
    prompt: Option[string]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    response_format: Option[JsonNode]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingJsonResponse* = object
    errors: seq[JsonNode]
    meta: JsonNode
    result: JsonNode
    success: bool
      ## Response status.
  PostAccountsAccountIdBrowserRenderingLinksRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    emulate_media_type: Option[string]
    exclude_external_links: Option[bool]
    goto_options: Option[JsonNode]
    html: Option[string]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    visible_links_only: Option[bool]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingLinksResponse* = object
    errors: seq[JsonNode]
    meta: JsonNode
    result: seq[string]
    success: bool
      ## Response status.
  PostAccountsAccountIdBrowserRenderingMarkdownRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    emulate_media_type: Option[string]
    goto_options: Option[JsonNode]
    html: Option[string]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingMarkdownResponse* = object
    errors: seq[JsonNode]
    meta: JsonNode
    result: string
      ## Markdown content. Prefixed with YAML frontmatter (e.g. `title`) when the page
      ## provides that metadata.
    success: bool
      ## Response status.
  PostAccountsAccountIdBrowserRenderingPdfRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    emulate_media_type: Option[string]
    goto_options: Option[JsonNode]
    html: Option[string]
    pdf_options: Option[JsonNode]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingScrapeRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    elements: seq[JsonNode]
    emulate_media_type: Option[string]
    goto_options: Option[JsonNode]
    html: Option[string]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingScrapeResponse* = object
    errors: seq[JsonNode]
    meta: JsonNode
    result: seq[JsonNode]
    success: bool
      ## Response status.
  PostAccountsAccountIdBrowserRenderingScreenshotRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    emulate_media_type: Option[string]
    goto_options: Option[JsonNode]
    html: Option[string]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    screenshot_options: Option[JsonNode]
    scroll_page: Option[bool]
    selector: Option[string]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingScreenshotResponse* = object
    errors: seq[JsonNode]
    success: bool
      ## Response status.
  PostAccountsAccountIdBrowserRenderingSnapshotRequest = object
    action_timeout: Option[float64]
    add_script_tag: Option[seq[JsonNode]]
    add_style_tag: Option[seq[JsonNode]]
    allow_request_pattern: Option[seq[string]]
    allow_resource_types: Option[seq[JsonNode]]
    authenticate: Option[JsonNode]
    best_attempt: Option[bool]
    cookies: Option[seq[JsonNode]]
    emulate_media_type: Option[string]
    formats: Option[seq[string]]
    goto_options: Option[JsonNode]
    html: Option[string]
    reject_request_pattern: Option[seq[string]]
    reject_resource_types: Option[seq[JsonNode]]
    screenshot_options: Option[JsonNode]
    set_extra_h_t_t_p_headers: Option[JsonNode]
    set_java_script_enabled: Option[bool]
    url: Option[string]
    user_agent: Option[string]
    viewport: Option[JsonNode]
    wait_for_selector: Option[JsonNode]
    wait_for_timeout: Option[float64]
  PostAccountsAccountIdBrowserRenderingSnapshotResponse* = object
    errors: seq[JsonNode]
    meta: JsonNode
    result: JsonNode
    success: bool
      ## Response status.
  BrapiStatusOption* = enum
    statusQueued = "queued"
    statusErrored = "errored"
    statusCompleted = "completed"
    statusDisallowed = "disallowed"
    statusSkipped = "skipped"
    statusCancelled = "cancelled"


proc postAccountsAccountIdBrowserRenderingAccessibilityTree*(client: CloudflareClient,
                                                             accountId: string,
                                                             cacheTTL: float64 = default(float64),
                                                             body: PostAccountsAccountIdBrowserRenderingAccessibilityTreeRequest): Future[PostAccountsAccountIdBrowserRenderingAccessibilityTreeResponse] {.async.} =
  ## Returns the page's accessibility tree. Use `interestingOnly` to only return
  ## semantically meaningful nodes; use `root` to scope the tree to a
  ## CSS-selector-anchored subtree. Control page loading with `gotoOptions` and
  ## `waitFor*` options.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/accessibilityTree", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingAccessibilityTreeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserRenderingContent*(client: CloudflareClient,
                                                   accountId: string,
                                                   cacheTTL: float64 = default(float64),
                                                   body: PostAccountsAccountIdBrowserRenderingContentRequest): Future[PostAccountsAccountIdBrowserRenderingContentResponse] {.async.} =
  ## Fetches rendered HTML content from provided URL or HTML. Check available options
  ## like `gotoOptions` and `waitFor*` to control page load behaviour.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/content", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingContentResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserRenderingCrawl*(client: CloudflareClient,
                                                 accountId: string,
                                                 cacheTTL: float64 = default(float64)): Future[PostAccountsAccountIdBrowserRenderingCrawlResponse] {.async.} =
  ## Starts a crawl job for the provided URL and its children. Check available
  ## options like `gotoOptions` and `waitFor*` to control page load behaviour.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/crawl", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingCrawlResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingCrawlJobId*(client: CloudflareClient,
                                                     accountId: string,
                                                     jobId: string,
                                                     cacheTTL: float64 = default(float64),
                                                     status: BrapiStatusOption,
                                                     cursor: float64 = default(float64),
                                                     limit: float64 = default(float64)): Future[GetAccountsAccountIdBrowserRenderingCrawlJobIdResponse] {.async.} =
  ## Returns the result of a crawl job.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  q["status"] = $status
  q["cursor"] = $cursor
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/crawl/{jobId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdBrowserRenderingCrawlJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBrowserRenderingCrawlJobId*(client: CloudflareClient,
                                                        accountId: string,
                                                        jobId: string): Future[DeleteAccountsAccountIdBrowserRenderingCrawlJobIdResponse] {.async.} =
  ## Cancels an ongoing crawl job by setting its status to cancelled and stopping all
  ## queued URLs.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/browser-rendering/crawl/{jobId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdBrowserRenderingCrawlJobIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowser*(client: CloudflareClient,
                                                          accountId: string,
                                                          keepAlive: float64 = default(float64),
                                                          lab: bool = false,
                                                          recording: bool = false): Future[AsyncResponse] {.async.} =
  ## Acquires and establishes a WebSocket connection to a browser session. Session
  ## guardrails may be supplied in the `cf-brapi-guardrails` header as
  ## base64url-encoded JSON of the same `guardrails` object the POST body accepts
  ## (for example `{"allowedDomains":["*.example.com"]}`).

  var q = initOrderedTable[string, string]()
  q["keep_alive"] = $keepAlive
  q["lab"] = $lab
  q["recording"] = $recording
  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser", q)
  return res

proc postAccountsAccountIdBrowserRenderingDevtoolsBrowser*(client: CloudflareClient,
                                                           accountId: string,
                                                           keepAlive: float64 = default(float64),
                                                           lab: bool = false,
                                                           targets: bool = false,
                                                           liveViewUrlExpiresInMs: float64 = default(float64),
                                                           recording: bool = false,
                                                           body: PostAccountsAccountIdBrowserRenderingDevtoolsBrowserRequest): Future[PostAccountsAccountIdBrowserRenderingDevtoolsBrowserResponse] {.async.} =
  ## Acquires a browser and returns its session ID and websocket URL. Optionally
  ## accepts a JSON body with session guardrails to restrict outbound HTTP/S traffic.

  var q = initOrderedTable[string, string]()
  q["keep_alive"] = $keepAlive
  q["lab"] = $lab
  q["targets"] = $targets
  q["liveViewUrlExpiresInMs"] = $liveViewUrlExpiresInMs
  q["recording"] = $recording
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/devtools/browser", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingDevtoolsBrowserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionId*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   sessionId: string,
                                                                   keepAlive: float64 = default(float64),
                                                                   lab: bool = false,
                                                                   recording: bool = false): Future[AsyncResponse] {.async.} =
  ## Establishes a WebSocket connection to an existing browser session.

  var q = initOrderedTable[string, string]()
  q["keep_alive"] = $keepAlive
  q["lab"] = $lab
  q["recording"] = $recording
  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}", q)
  return res

proc deleteAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      sessionId: string): Future[DeleteAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdResponse] {.async.} =
  ## Closes an existing browser session.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJson*(client: CloudflareClient,
                                                                       accountId: string,
                                                                       sessionId: string,
                                                                       liveViewUrlExpiresInMs: float64 = default(float64)): Future[seq[JsonNode]] {.async.} =
  ## Returns a list of all debuggable targets including tabs, pages, service workers,
  ## and other browser contexts.

  var q = initOrderedTable[string, string]()
  q["liveViewUrlExpiresInMs"] = $liveViewUrlExpiresInMs
  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/json", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonActivateTargetId*(client: CloudflareClient,
                                                                                       sessionId: string,
                                                                                       accountId: string,
                                                                                       targetId: string): Future[GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonActivateTargetIdResponse] {.async.} =
  ## Activates (brings to front) a specific browser target by its ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/json/activate/{targetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonActivateTargetIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonCloseTargetId*(client: CloudflareClient,
                                                                                    sessionId: string,
                                                                                    accountId: string,
                                                                                    targetId: string): Future[GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonCloseTargetIdResponse] {.async.} =
  ## Closes a specific browser target (tab, page, etc.) by its ID. Returns 'Target is
  ## closing' on success or an error if the target is not found.

  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/json/close/{targetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonCloseTargetIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonList*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           sessionId: string,
                                                                           liveViewUrlExpiresInMs: float64 = default(float64)): Future[seq[JsonNode]] {.async.} =
  ## Returns a list of all debuggable targets including tabs, pages, service workers,
  ## and other browser contexts.

  var q = initOrderedTable[string, string]()
  q["liveViewUrlExpiresInMs"] = $liveViewUrlExpiresInMs
  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/json/list", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonListTargetId*(client: CloudflareClient,
                                                                                   accountId: string,
                                                                                   sessionId: string,
                                                                                   targetId: string): Future[GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonListTargetIdResponse] {.async.} =
  ## Returns the debuggable target with the given ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/json/list/{targetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonListTargetIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonNew*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          sessionId: string,
                                                                          url: string = default(string),
                                                                          liveViewUrlExpiresInMs: float64 = default(float64)): Future[PutAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonNewResponse] {.async.} =
  ## Opens a new tab in the browser. Optionally specify a URL to navigate to.

  var q = initOrderedTable[string, string]()
  q["url"] = $url
  q["liveViewUrlExpiresInMs"] = $liveViewUrlExpiresInMs
  let res = await client.httpPUT(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/json/new", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonNewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonProtocol*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               sessionId: string): Future[GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonProtocolResponse] {.async.} =
  ## Returns the complete Chrome DevTools Protocol schema including all domains,
  ## commands, events, and types. This schema describes the entire CDP API surface.

  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/json/protocol")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonProtocolResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonVersion*(client: CloudflareClient,
                                                                              accountId: string,
                                                                              sessionId: string): Future[GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonVersionResponse] {.async.} =
  ## Get browser version metadata.

  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/json/version")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdJsonVersionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsBrowserSessionIdPageTargetId*(client: CloudflareClient,
                                                                               accountId: string,
                                                                               sessionId: string,
                                                                               targetId: string): Future[AsyncResponse] {.async.} =
  ## Establishes a WebSocket connection to a specific Chrome DevTools target or page.

  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/browser/{sessionId}/page/{targetId}")
  return res

proc getAccountsAccountIdBrowserRenderingDevtoolsSession*(client: CloudflareClient,
                                                          accountId: string,
                                                          limit: float64 = default(float64),
                                                          offset: float64 = default(float64)): Future[seq[JsonNode]] {.async.} =
  ## List active browser sessions.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/session", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, seq[JsonNode])
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserRenderingDevtoolsSessionSessionId*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   sessionId: string): Future[GetAccountsAccountIdBrowserRenderingDevtoolsSessionSessionIdResponse] {.async.} =
  ## Get details for a specific browser session.

  let res = await client.httpGET(fmt"/accounts/{accountId}/browser-rendering/devtools/session/{sessionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdBrowserRenderingDevtoolsSessionSessionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserRenderingJson*(client: CloudflareClient,
                                                accountId: string,
                                                cacheTTL: float64 = default(float64),
                                                body: PostAccountsAccountIdBrowserRenderingJsonRequest): Future[PostAccountsAccountIdBrowserRenderingJsonResponse] {.async.} =
  ## Gets json from a webpage from a provided URL or HTML. Pass `prompt` or `schema`
  ## in the body. Control page loading with `gotoOptions` and `waitFor*` options.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/json", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingJsonResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserRenderingLinks*(client: CloudflareClient,
                                                 accountId: string,
                                                 cacheTTL: float64 = default(float64),
                                                 body: PostAccountsAccountIdBrowserRenderingLinksRequest): Future[PostAccountsAccountIdBrowserRenderingLinksResponse] {.async.} =
  ## Get links from a web page.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/links", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingLinksResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserRenderingMarkdown*(client: CloudflareClient,
                                                    accountId: string,
                                                    cacheTTL: float64 = default(float64),
                                                    body: PostAccountsAccountIdBrowserRenderingMarkdownRequest): Future[PostAccountsAccountIdBrowserRenderingMarkdownResponse] {.async.} =
  ## Gets markdown of a webpage from provided URL or HTML. Control page loading with
  ## `gotoOptions` and `waitFor*` options.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/markdown", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingMarkdownResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserRenderingPdf*(client: CloudflareClient,
                                               accountId: string,
                                               cacheTTL: float64 = default(float64),
                                               body: PostAccountsAccountIdBrowserRenderingPdfRequest): Future[AsyncResponse] {.async.} =
  ## Fetches rendered PDF from provided URL or HTML. Check available options like
  ## `gotoOptions` and `waitFor*` to control page load behaviour.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/pdf", q)
  return res

proc postAccountsAccountIdBrowserRenderingScrape*(client: CloudflareClient,
                                                  accountId: string,
                                                  cacheTTL: float64 = default(float64),
                                                  body: PostAccountsAccountIdBrowserRenderingScrapeRequest): Future[PostAccountsAccountIdBrowserRenderingScrapeResponse] {.async.} =
  ## Get meta attributes like height, width, text and others of selected elements.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/scrape", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingScrapeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserRenderingScreenshot*(client: CloudflareClient,
                                                      accountId: string,
                                                      cacheTTL: float64 = default(float64),
                                                      body: PostAccountsAccountIdBrowserRenderingScreenshotRequest): Future[PostAccountsAccountIdBrowserRenderingScreenshotResponse] {.async.} =
  ## Takes a screenshot of a webpage from provided URL or HTML. Control page loading
  ## with `gotoOptions` and `waitFor*` options. Customize screenshots with
  ## `viewport`, `fullPage`, `clip` and others.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/screenshot", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingScreenshotResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserRenderingSnapshot*(client: CloudflareClient,
                                                    accountId: string,
                                                    cacheTTL: float64 = default(float64),
                                                    body: PostAccountsAccountIdBrowserRenderingSnapshotRequest): Future[PostAccountsAccountIdBrowserRenderingSnapshotResponse] {.async.} =
  ## Returns the page's HTML content and screenshot. Control page loading with
  ## `gotoOptions` and `waitFor*` options. Customize screenshots with `viewport`,
  ## `fullPage`, `clip` and others.

  var q = initOrderedTable[string, string]()
  q["cacheTTL"] = $cacheTTL
  let res = await client.httpPOST(fmt"/accounts/{accountId}/browser-rendering/snapshot", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdBrowserRenderingSnapshotResponse)
  else:
    raise newException(CloudflareClientError, body)
