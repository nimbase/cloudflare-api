# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdAccessServiceTokensRequest = object
    client_secret_version: Option[types.AccessClientSecretVersion]
    duration: Option[types.AccessDuration]
    enabled: Option[types.AccessEnabled]
    name: types.AccessName2
    previous_client_secret_expires_at: Option[types.AccessPreviousClientSecretExpiresAt]
  PutAccountsAccountIdAccessServiceTokensServiceTokenIdRequest = object
    client_secret_version: Option[types.AccessClientSecretVersion]
    duration: Option[types.AccessDuration]
    enabled: Option[types.AccessEnabled]
    name: Option[types.AccessName2]
    previous_client_secret_expires_at: Option[types.AccessPreviousClientSecretExpiresAt]
  PostAccountsAccountIdAccessServiceTokensServiceTokenIdRotateRequest = object
    previous_client_secret_expires_at: Option[string]

proc getAccountsAccountIdAccessServiceTokens*(client: CloudflareClient,
                                              accountId: types.AccessIdentifier,
                                              name: string = default(string),
                                              search: string = default(string),
                                              page: int64 = 1,
                                              perPage: int64 = 1000): Future[types.AccessResponseCollection3] {.async.} =
  ## Lists all service tokens.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["search"] = $search
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/service_tokens", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection3)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessServiceTokens*(client: CloudflareClient,
                                               accountId: types.AccessIdentifier,
                                               body: PostAccountsAccountIdAccessServiceTokensRequest): Future[types.AccessCreateResponse] {.async.} =
  ## Generates a new service token. **Note:** This is the only time you can get the
  ## Client Secret. If you lose the Client Secret, you will have to rotate the Client
  ## Secret or create a new service token.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/service_tokens", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessServiceTokensServiceTokenId*(client: CloudflareClient,
                                                            serviceTokenId: types.AccessUuid,
                                                            accountId: types.AccessIdentifier): Future[types.AccessSingleResponse2] {.async.} =
  ## Fetches a single service token.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/service_tokens/{serviceTokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessServiceTokensServiceTokenId*(client: CloudflareClient,
                                                            serviceTokenId: types.AccessUuid,
                                                            accountId: types.AccessIdentifier,
                                                            body: PutAccountsAccountIdAccessServiceTokensServiceTokenIdRequest): Future[types.AccessSingleResponse2] {.async.} =
  ## Updates a configured service token.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/service_tokens/{serviceTokenId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessServiceTokensServiceTokenId*(client: CloudflareClient,
                                                               serviceTokenId: types.AccessUuid,
                                                               accountId: types.AccessIdentifier): Future[types.AccessSingleResponse2] {.async.} =
  ## Deletes a service token.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/service_tokens/{serviceTokenId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessServiceTokensServiceTokenIdRefresh*(client: CloudflareClient,
                                                                    serviceTokenId: types.AccessUuid,
                                                                    accountId: types.AccessIdentifier): Future[types.AccessSingleResponse2] {.async.} =
  ## Refreshes the expiration of a service token.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/service_tokens/{serviceTokenId}/refresh")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessServiceTokensServiceTokenIdRotate*(client: CloudflareClient,
                                                                   serviceTokenId: types.AccessUuid,
                                                                   accountId: types.AccessIdentifier,
                                                                   body: PostAccountsAccountIdAccessServiceTokensServiceTokenIdRotateRequest): Future[types.AccessCreateResponse] {.async.} =
  ## Generates a new Client Secret for a service token and revokes the old one.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/service_tokens/{serviceTokenId}/rotate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessCreateResponse)
  else:
    raise newException(CloudflareClientError, body)
