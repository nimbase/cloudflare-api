# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesRequest = object
    elements: seq[JsonNode]
    name: string
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse* = object
    result: JsonNode
    success: bool
  DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse* = object
    result: JsonNode
    success: bool
  PatchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdRequest = object
    name: string
  PatchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse* = object
    route: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsRequest = object
    version_id: string
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse* = object
    data: JsonNode
    success: bool
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsRequest = object
    elements: seq[JsonNode]
  PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse* = object
    result: JsonNode
    success: bool
  GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsVersionIdResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutes*(client: CloudflareClient,
                                                           accountId: string,
                                                           gatewayId: string,
                                                           page: int64 = default(int64),
                                                           perPage: int64 = default(int64)): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse] {.async.} =
  ## Lists the dynamic routes configured on an AI Gateway.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGatewaysGatewayIdRoutes*(client: CloudflareClient,
                                                            accountId: string,
                                                            gatewayId: string,
                                                            body: PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesRequest): Future[PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse] {.async.} =
  ## Creates a dynamic route on an AI Gateway from the specified routing elements.
  ## Clients call the route by using `dynamic/{name}` as the model name.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesId*(client: CloudflareClient,
                                                             accountId: string,
                                                             gatewayId: string,
                                                             id: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse] {.async.} =
  ## Retrieves a dynamic route with its routing elements, active version, and current
  ## deployment.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesId*(client: CloudflareClient,
                                                                accountId: string,
                                                                gatewayId: string,
                                                                id: string): Future[DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse] {.async.} =
  ## Deletes a dynamic route from an AI Gateway.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesId*(client: CloudflareClient,
                                                               accountId: string,
                                                               gatewayId: string,
                                                               id: string,
                                                               body: PatchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdRequest): Future[PatchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse] {.async.} =
  ## Updates the name of a dynamic route. To change routing behaviour, create and
  ## deploy a new version.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PatchAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeployments*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        gatewayId: string,
                                                                        id: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse] {.async.} =
  ## Lists the deployment history of a dynamic route.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes/{id}/deployments")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeployments*(client: CloudflareClient,
                                                                         accountId: string,
                                                                         gatewayId: string,
                                                                         id: string,
                                                                         body: PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsRequest): Future[PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse] {.async.} =
  ## Deploys the specified version of a dynamic route so that it serves traffic.
  ## Deploy an earlier version to roll back.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes/{id}/deployments", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdDeploymentsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersions*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     gatewayId: string,
                                                                     id: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse] {.async.} =
  ## Lists the saved versions of a dynamic route.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes/{id}/versions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersions*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      gatewayId: string,
                                                                      id: string,
                                                                      body: PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsRequest): Future[PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse] {.async.} =
  ## Creates a new version of a dynamic route from the specified routing elements.
  ## The version does not serve traffic until you deploy it.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes/{id}/versions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsVersionId*(client: CloudflareClient,
                                                                              accountId: string,
                                                                              gatewayId: string,
                                                                              id: string,
                                                                              versionId: string): Future[GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsVersionIdResponse] {.async.} =
  ## Retrieves a saved version of a dynamic route, including its routing elements.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/gateways/{gatewayId}/routes/{id}/versions/{versionId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiGatewayGatewaysGatewayIdRoutesIdVersionsVersionIdResponse)
  else:
    raise newException(CloudflareClientError, body)
