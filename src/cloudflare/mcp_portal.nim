# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAccessAiControlsMcpPortalsResponse* = object
    result: seq[JsonNode]
    success: bool
  PostAccountsAccountIdAccessAiControlsMcpPortalsRequest = object
    allow_code_mode: Option[bool]
    code_mode: Option[string]
    description: Option[string]
    hostname: string
    id: string
    name: string
    secure_web_gateway: Option[bool]
    servers: Option[seq[JsonNode]]
  PostAccountsAccountIdAccessAiControlsMcpPortalsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAccessAiControlsMcpPortalsIdResponse* = object
    result: JsonNode
    success: bool
  PutAccountsAccountIdAccessAiControlsMcpPortalsIdRequest = object
    allow_code_mode: Option[bool]
    code_mode: Option[string]
    description: Option[string]
    hostname: Option[string]
    name: Option[string]
    secure_web_gateway: Option[bool]
    servers: Option[seq[JsonNode]]
  PutAccountsAccountIdAccessAiControlsMcpPortalsIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAccessAiControlsMcpPortalsIdResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAccessAiControlsMcpPortalsPortalIdServersServerIdEffectiveRedirectUriResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAccessAiControlsMcpPortals*(client: CloudflareClient,
                                                     accountId: string,
                                                     page: int64 = 1,
                                                     perPage: int64 = 20,
                                                     search: string = default(string)): Future[GetAccountsAccountIdAccessAiControlsMcpPortalsResponse] {.async.} =
  ## Lists all MCP portals configured for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/ai-controls/mcp/portals", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAccessAiControlsMcpPortalsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessAiControlsMcpPortals*(client: CloudflareClient,
                                                      accountId: string,
                                                      body: PostAccountsAccountIdAccessAiControlsMcpPortalsRequest): Future[PostAccountsAccountIdAccessAiControlsMcpPortalsResponse] {.async.} =
  ## Creates a new MCP portal for managing AI tool access through Cloudflare Access.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/ai-controls/mcp/portals", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdAccessAiControlsMcpPortalsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAiControlsMcpPortalsId*(client: CloudflareClient,
                                                       id: string,
                                                       accountId: string): Future[GetAccountsAccountIdAccessAiControlsMcpPortalsIdResponse] {.async.} =
  ## Read the details of a single MCP Portal, including its configured servers.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/ai-controls/mcp/portals/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAccessAiControlsMcpPortalsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessAiControlsMcpPortalsId*(client: CloudflareClient,
                                                       id: string,
                                                       accountId: string,
                                                       body: PutAccountsAccountIdAccessAiControlsMcpPortalsIdRequest): Future[PutAccountsAccountIdAccessAiControlsMcpPortalsIdResponse] {.async.} =
  ## Updates an MCP portal configuration.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/ai-controls/mcp/portals/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PutAccountsAccountIdAccessAiControlsMcpPortalsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessAiControlsMcpPortalsId*(client: CloudflareClient,
                                                          accountId: string,
                                                          id: string): Future[DeleteAccountsAccountIdAccessAiControlsMcpPortalsIdResponse] {.async.} =
  ## Deletes an MCP portal from the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/ai-controls/mcp/portals/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAccessAiControlsMcpPortalsIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessAiControlsMcpPortalsPortalIdServersServerIdEffectiveRedirectUri*(client: CloudflareClient,
                                                                                                portalId: string,
                                                                                                serverId: string,
                                                                                                accountId: string): Future[GetAccountsAccountIdAccessAiControlsMcpPortalsPortalIdServersServerIdEffectiveRedirectUriResponse] {.async.} =
  ## Resolves the OAuth redirect URI to register for a portal and server based on the
  ## server's current shared callback setting. Use the returned value when setting up
  ## a new manual OAuth registration. This value is for display only: existing manual
  ## OAuth registrations continue using their stored redirect URI, so changing
  ## callback settings can make this result differ from the URI used at runtime.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/ai-controls/mcp/portals/{portalId}/servers/{serverId}/effective-redirect-uri")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAccessAiControlsMcpPortalsPortalIdServersServerIdEffectiveRedirectUriResponse)
  else:
    raise newException(CloudflareClientError, body)
