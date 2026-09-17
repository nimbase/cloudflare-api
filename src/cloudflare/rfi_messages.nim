# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesResponse* = object
    messages: seq[JsonNode]
    result_info: JsonNode
  PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNewRequest = object
    attachment_asset_ids: Option[seq[string]]
    author_id: Option[string]
    author_name: Option[string]
    content: string
    publish: Option[bool]
    tlp: Option[string]
  PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNewResponse* = object
    attachments: seq[JsonNode]
    content: string
    created: string
    id: int64
    is_cloudflare_team: bool
    is_published: bool
    published: string
    tlp: string
    updated: string
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse* = object
    attachments: seq[JsonNode]
    content: string
    created: string
    id: int64
    is_cloudflare_team: bool
    is_published: bool
    published: string
    tlp: string
    updated: string
  PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdRequest = object
    attachment_asset_ids: Option[seq[string]]
    content: string
    publish: bool
    tlp: string
  PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse* = object
    message: JsonNode

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessages*(client: CloudflareClient,
                                                                              accountId: string,
                                                                              projectType: string,
                                                                              requestId: string,
                                                                              page: string = "1",
                                                                              perPage: string = "10"): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesResponse] {.async.} =
  ## Retrieves the published, non-deleted messages visible to the agent for an RFI
  ## request, with pagination.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}/messages", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNew*(client: CloudflareClient,
                                                                                  accountId: string,
                                                                                  projectType: string,
                                                                                  requestId: string,
                                                                                  body: PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNewRequest): Future[PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNewResponse] {.async.} =
  ## Creates a customer dashboard message on an RFI request. Messages are always
  ## published on send. Workflow-enabled projects require Idempotency-Key and
  ## atomically record message activity and any policy transition. For token-billed
  ## project types, substantive follow-on messages consume message tokens and are
  ## subject to quarterly quota enforcement.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}/messages/new", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesNewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageId*(client: CloudflareClient,
                                                                                       accountId: string,
                                                                                       projectType: string,
                                                                                       requestId: string,
                                                                                       messageId: string): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse] {.async.} =
  ## Returns the details for a specific message belonging to an RFI request.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}/messages/{messageId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageId*(client: CloudflareClient,
                                                                                       accountId: string,
                                                                                       projectType: string,
                                                                                       requestId: string,
                                                                                       messageId: string,
                                                                                       body: PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdRequest): Future[PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse] {.async.} =
  ## Updates an existing message, typically to publish a draft by setting
  ## publish=true. Workflow-enabled publication requires Idempotency-Key and
  ## atomically records message activity and any policy transition.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/{requestId}/messages/{messageId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdCloudforceOneV2RequestsProjectTypeRequestIdMessagesMessageIdResponse)
  else:
    raise newException(CloudflareClientError, body)
