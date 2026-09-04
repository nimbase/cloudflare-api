# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient

type
  GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: seq[JsonNode]
    result_info: JsonNode
    success: string
      ## Always true for a successful response.
  DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngestRequest = object
    messages: seq[JsonNode]
    session_id: Option[string]
  PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngestResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: seq[JsonNode]
    result_info: JsonNode
    success: string
      ## Always true for a successful response.
  GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecallRequest = object
    query: string
    reference_date: Option[string]
    response_length: Option[string]
    thinking_level: Option[string]
  PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecallResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRememberRequest = object
    content: string
    session_id: Option[string]
  PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRememberResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSessionsSessionIdResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummaryRequest = object
    session_id: Option[string]
  PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummaryResponse* = object
    errors: seq[JsonNode]
      ## Always empty for a successful response.
    messages: seq[JsonNode]
      ## Informational, non-error messages, if any.
    result: JsonNode
    success: string
      ## Always true for a successful response.
  MemoryTypeOption* = enum
    typeFact = "fact"
    typeEvent = "event"
    typeInstruction = "instruction"
    typeTask = "task"


proc getAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfiles*(client: CloudflareClient,
                                                                     namespaceName: string,
                                                                     perPage: int64 = default(int64),
                                                                     cursor: string = default(string)): Future[GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesResponse] {.async.} =
  ## Lists the profiles of a namespace, ordered by name. A profile appears once it
  ## has been used.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  let res = await client.httpGET(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileName*(client: CloudflareClient,
                                                                                   namespaceName: string,
                                                                                   profileName: string): Future[DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameResponse] {.async.} =
  ## Marks a profile for deletion.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngest*(client: CloudflareClient,
                                                                                       namespaceName: string,
                                                                                       profileName: string,
                                                                                       body: PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngestRequest): Future[PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngestResponse] {.async.} =
  ## Processes a conversation and extracts structured memories from it. Agent Memory
  ## identifies facts, events, instructions, and tasks automatically.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}/ingest", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameIngestResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemories*(client: CloudflareClient,
                                                                                        namespaceName: string,
                                                                                        profileName: string,
                                                                                        perPage: int64 = default(int64),
                                                                                        cursor: string = default(string),
                                                                                        sessionId: string = default(string),
                                                                                        `type`: MemoryTypeOption): Future[GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesResponse] {.async.} =
  ## List memories stored in a profile.

  var q = initOrderedTable[string, string]()
  q["per_page"] = $perPage
  q["cursor"] = $cursor
  q["session_id"] = $sessionId
  q["type"] = $`type`
  let res = await client.httpGET(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}/memories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryId*(client: CloudflareClient,
                                                                                                namespaceName: string,
                                                                                                profileName: string,
                                                                                                memoryId: string): Future[GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse] {.async.} =
  ## Retrieves a memory by ID.

  let res = await client.httpGET(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}/memories/{memoryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryId*(client: CloudflareClient,
                                                                                                   namespaceName: string,
                                                                                                   profileName: string,
                                                                                                   memoryId: string): Future[DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse] {.async.} =
  ## Deletes a memory by ID. Removes the memory and any source messages linked to it.
  ## Returns the deleted memory.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}/memories/{memoryId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameMemoriesMemoryIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecall*(client: CloudflareClient,
                                                                                       namespaceName: string,
                                                                                       profileName: string,
                                                                                       body: PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecallRequest): Future[PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecallResponse] {.async.} =
  ## Retrieves memories relevant to the query and returns a synthesized answer.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}/recall", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRecallResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRemember*(client: CloudflareClient,
                                                                                         namespaceName: string,
                                                                                         profileName: string,
                                                                                         body: PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRememberRequest): Future[PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRememberResponse] {.async.} =
  ## Stores a single memory explicitly.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}/remember", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameRememberResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSessionsSessionId*(client: CloudflareClient,
                                                                                                    namespaceName: string,
                                                                                                    profileName: string,
                                                                                                    sessionId: string): Future[DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSessionsSessionIdResponse] {.async.} =
  ## Marks all memories and messages in a profile that are tagged with the given
  ## session ID for deletion.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}/sessions/{sessionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSessionsSessionIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummary*(client: CloudflareClient,
                                                                                        namespaceName: string,
                                                                                        profileName: string,
                                                                                        body: PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummaryRequest): Future[PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummaryResponse] {.async.} =
  ## Generates a paste-ready prompt block summarizing everything stored in a memory
  ## profile.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/agent-memory/namespaces/{namespaceName}/profiles/{profileName}/summary", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAgentMemoryNamespacesNamespaceNameProfilesProfileNameSummaryResponse)
  else:
    raise newException(CloudflareClientError, body)
