# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdAgentMemoryNamespacesResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: seq[JsonNode]
    result_info: JsonNode
    success: string
      ## Always true for a successful response.
  PostAccountsAccountIdAgentMemoryNamespacesRequest = object
    name: string
  PostAccountsAccountIdAgentMemoryNamespacesResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  NamespaceOrderOption* = enum
    orderId = "id"
    orderName = "name"

  NamespaceDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdAgentMemoryNamespaces*(client: CloudflareClient,
                                                perPage: int64 = default(int64),
                                                order: NamespaceOrderOption,
                                                direction: NamespaceDirectionOption,
                                                cursor: string = default(string)): Future[GetAccountsAccountIdAgentMemoryNamespacesResponse] {.async.} =
  ## Lists all namespaces for the given account. Results are paginated.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["cursor"] = $cursor
  let res = await client.httpGET("/accounts/{account_id}/agent-memory/namespaces", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAgentMemoryNamespacesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAgentMemoryNamespaces*(client: CloudflareClient,
                                                 body: PostAccountsAccountIdAgentMemoryNamespacesRequest): Future[PostAccountsAccountIdAgentMemoryNamespacesResponse] {.async.} =
  ## Creates a new memory namespace owned by the account.

  let res = await client.httpPOST("/accounts/{account_id}/agent-memory/namespaces", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, PostAccountsAccountIdAgentMemoryNamespacesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAgentMemoryNamespacesNamespaceName*(client: CloudflareClient,
                                                             namespaceName: string): Future[GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse] {.async.} =
  ## Gets a namespace by name.

  let res = await client.httpGET(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAgentMemoryNamespacesNamespaceName*(client: CloudflareClient,
                                                                namespaceName: string): Future[DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse] {.async.} =
  ## Deletes a namespace.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameResponse)
  else:
    raise newException(CloudflareClientError, body)
