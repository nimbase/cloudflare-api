# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAccessAiControlsMcpServersResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAccessAiControlsMcpServersRequest = object
    auth_credentials: Option[string]
    auth_type: string
    client_secret: Option[string]
    description: Option[string]
    hostname: string
    id: string
    is_shared_oauth_callback_enabled: Option[bool]
    name: string
    secure_web_gateway: Option[bool]
    updated_prompts: Option[seq[JsonNode]]
    updated_tools: Option[seq[JsonNode]]
  PostAccountsAccountIdAccessAiControlsMcpServersResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAccessAiControlsMcpServersIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAccessAiControlsMcpServersIdRequest = object
    auth_credentials: Option[string]
    client_secret: Option[string]
    description: Option[string]
    is_shared_oauth_callback_enabled: Option[bool]
    name: Option[string]
    secure_web_gateway: Option[bool]
    updated_prompts: Option[seq[JsonNode]]
    updated_tools: Option[seq[JsonNode]]
  PutAccountsAccountIdAccessAiControlsMcpServersIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAccessAiControlsMcpServersIdResponse* = object
    result: JsonNode
    success: bool
  PostAccountsAccountIdAccessAiControlsMcpServersIdSyncResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAccessAiControlsMcpServers*(client: CloudflareClient,
                                                     accountId: string,
                                                     page: int64 = 1,
                                                     perPage: int64 = 20,
                                                     search: string = default(string)): Future[GetAccountsAccountIdAccessAiControlsMcpServersResponse] {.async.} =
  ## Lists all MCP servers configured for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/ai-controls/mcp/servers", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAccessAiControlsMcpServersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessAiControlsMcpServers*(client: CloudflareClient,
                                                      accountId: string,
                                                      body: PostAccountsAccountIdAccessAiControlsMcpServersRequest): Future[PostAccountsAccountIdAccessAiControlsMcpServersResponse] {.async.} =
  ## Creates a new MCP server for connecting to an upstream MCP endpoint.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/ai-controls/mcp/servers", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdAccessAiControlsMcpServersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAiControlsMcpServersId*(client: CloudflareClient,
                                                       accountId: string,
                                                       id: string): Future[GetAccountsAccountIdAccessAiControlsMcpServersIdResponse] {.async.} =
  ## Retrieves an MCP server's configuration and capability sync state.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/ai-controls/mcp/servers/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAccessAiControlsMcpServersIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessAiControlsMcpServersId*(client: CloudflareClient,
                                                       id: string,
                                                       accountId: string,
                                                       body: PutAccountsAccountIdAccessAiControlsMcpServersIdRequest): Future[PutAccountsAccountIdAccessAiControlsMcpServersIdResponse] {.async.} =
  ## Updates an MCP server's configuration and credentials.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/ai-controls/mcp/servers/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAccessAiControlsMcpServersIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessAiControlsMcpServersId*(client: CloudflareClient,
                                                          accountId: string,
                                                          id: string): Future[DeleteAccountsAccountIdAccessAiControlsMcpServersIdResponse] {.async.} =
  ## Deletes an MCP server from the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/ai-controls/mcp/servers/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAccessAiControlsMcpServersIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessAiControlsMcpServersIdSync*(client: CloudflareClient,
                                                            id: string,
                                                            accountId: string): Future[PostAccountsAccountIdAccessAiControlsMcpServersIdSyncResponse] {.async.} =
  ## Syncs an MCP server's capabilities and returns the updated server state,
  ## including any connection errors.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/ai-controls/mcp/servers/{id}/sync")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAccessAiControlsMcpServersIdSyncResponse)
  else:
    raise newException(CloudflareClientError, body)
