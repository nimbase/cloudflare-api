# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse* = object
    pagination: JsonNode
    result: seq[JsonNode]
    success: string
  PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequest = object
    description: Option[string]
    event_id: Option[string]
    metadata: Option[JsonNode]
    priority: Option[string]
    request_type: Option[string]
    subtype_id: Option[string]
    title: Option[string]
    tlp: Option[string]
  PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse* = object
    account: JsonNode
    assignee: string
      ## Assignee email
    completed: string
      ## Completion timestamp
    created: string
      ## Creation timestamp
    id: string
      ## RFI UUID
    investigation_id: string
      ## Investigation UUID
    is_free_request: bool
      ## Whether this is a free request
    message_tokens: float64
      ## Total message tokens
    priority: string
      ## Request priority
    readable_id: string
      ## Human-readable ID
    release_entitlements: string
      ## Release entitlements
    report_id: string
      ## Report UUID
    request: JsonNode
    status: string
      ## RFI status
    summary: string
      ## RFI summary
    tlp: string
      ## TLP classification
    tokens: float64
      ## Total tokens used
    updated: string
      ## Last update timestamp
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse* = object
    account: JsonNode
    assignee: string
      ## Assignee email
    completed: string
      ## Completion timestamp
    created: string
      ## Creation timestamp
    id: string
      ## RFI UUID
    investigation_id: string
      ## Investigation UUID
    is_free_request: bool
      ## Whether this is a free request
    message_tokens: float64
      ## Total message tokens
    priority: string
      ## Request priority
    readable_id: string
      ## Human-readable ID
    release_entitlements: string
      ## Release entitlements
    report_id: string
      ## Report UUID
    request: JsonNode
    status: string
      ## RFI status
    summary: string
      ## RFI summary
    tlp: string
      ## TLP classification
    tokens: float64
      ## Total tokens used
    updated: string
      ## Last update timestamp
  PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdRequest = object
    description: Option[string]
    event_id: Option[string]
    priority: Option[string]
    request_type: Option[string]
    subtype_id: Option[string]
    summary: Option[string]
    title: Option[string]
    tlp: Option[string]
  PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse* = object
    account: JsonNode
    assignee: string
      ## Assignee email
    completed: string
      ## Completion timestamp
    created: string
      ## Creation timestamp
    id: string
      ## RFI UUID
    investigation_id: string
      ## Investigation UUID
    is_free_request: bool
      ## Whether this is a free request
    message_tokens: float64
      ## Total message tokens
    priority: string
      ## Request priority
    readable_id: string
      ## Human-readable ID
    release_entitlements: string
      ## Release entitlements
    report_id: string
      ## Report UUID
    request: JsonNode
    status: string
      ## RFI status
    summary: string
      ## RFI summary
    tlp: string
      ## TLP classification
    tokens: float64
      ## Total tokens used
    updated: string
      ## Last update timestamp

proc getAccountsAccountIdCloudforceOneV2RequestsProjectType*(client: CloudflareClient,
                                                             accountId: string,
                                                             projectType: ProjectType,
                                                             page: float64 = default(float64),
                                                             pageSize: float64 = default(float64),
                                                             status: string = default(string),
                                                             search: string = default(string),
                                                             createdBy: string = default(string),
                                                             assignee: string = default(string),
                                                             requestType: string = default(string),
                                                             priority: string = default(string),
                                                             tlp: string = default(string),
                                                             id: string = default(string),
                                                             readableId: string = default(string),
                                                             summary: string = default(string),
                                                             accountId: string = default(string),
                                                             metadata: string = default(string),
                                                             orderBy: string = default(string),
                                                             order: string = default(string)): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse] {.async.} =
  ## Retrieves a paginated list of RFIs with filtering and sorting options.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["pageSize"] = $pageSize
  q["status"] = $status
  q["search"] = $search
  q["createdBy"] = $createdBy
  q["assignee"] = $assignee
  q["requestType"] = $requestType
  q["priority"] = $priority
  q["tlp"] = $tlp
  q["id"] = $id
  q["readableId"] = $readableId
  q["summary"] = $summary
  q["accountId"] = $accountId
  q["metadata"] = $metadata
  q["orderBy"] = $orderBy
  q["order"] = $order
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2RequestsProjectType*(client: CloudflareClient,
                                                              accountId: string,
                                                              projectType: ProjectType,
                                                              body: PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequest): Future[PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse] {.async.} =
  ## Creates a new Request for Information with the specified project type and
  ## details.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      projectType: ProjectType,
                                                                      requestId: string): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse] {.async.} =
  ## Retrieves a specific RFI by its UUID with related data.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      projectType: ProjectType,
                                                                      requestId: string,
                                                                      body: PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdRequest): Future[PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse] {.async.} =
  ## Updates an existing RFI with the provided fields. Only provided fields will be
  ## updated.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdResponse)
  else:
    raise newException(CloudflareClientError, body)
