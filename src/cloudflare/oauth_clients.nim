# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdOauthClients*(client: CloudflareClient,
                                       accountId: types.IamAccountIdentifier): Future[types.IamCollectionOauthClientResponse] {.async.} =
  ## List all OAuth clients for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/oauth_clients")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamCollectionOauthClientResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdOauthClients*(client: CloudflareClient,
                                        accountId: types.IamAccountIdentifier,
                                        body: types.IamOauthClientCreateRequest): Future[types.IamSingleOauthClientCreateResponse] {.async.} =
  ## Create a new OAuth client for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/oauth_clients", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleOauthClientCreateResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdOauthClientsOauthClientId*(client: CloudflareClient,
                                                    accountId: types.IamAccountIdentifier,
                                                    oauthClientId: types.IamOauthClientIdentifier): Future[types.IamSingleOauthClientResponse] {.async.} =
  ## Get details of a specific OAuth client.

  let res = await client.httpGET(fmt"/accounts/{accountId}/oauth_clients/{oauthClientId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleOauthClientResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdOauthClientsOauthClientId*(client: CloudflareClient,
                                                       accountId: types.IamAccountIdentifier,
                                                       oauthClientId: types.IamOauthClientIdentifier): Future[types.IamApiResponseSingleId] {.async.} =
  ## Delete an OAuth client.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/oauth_clients/{oauthClientId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdOauthClientsOauthClientId*(client: CloudflareClient,
                                                      accountId: types.IamAccountIdentifier,
                                                      oauthClientId: types.IamOauthClientIdentifier,
                                                      body: types.IamOauthClientUpdateRequest): Future[types.IamSingleOauthClientResponse] {.async.} =
  ## Update an existing OAuth client. Only include fields you want to update.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/oauth_clients/{oauthClientId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleOauthClientResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdOauthClientsOauthClientIdRotateSecret*(client: CloudflareClient,
                                                                 accountId: types.IamAccountIdentifier,
                                                                 oauthClientId: types.IamOauthClientIdentifier): Future[types.IamOauthClientRotateSecretResponse] {.async.} =
  ## Creates a second client secret so you can update your client configuration
  ## before deleting the old one. The `has_rotated_secret` field on the client will
  ## be set to `true`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/oauth_clients/{oauthClientId}/rotate_secret")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamOauthClientRotateSecretResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdOauthClientsOauthClientIdRotateSecret*(client: CloudflareClient,
                                                                   accountId: types.IamAccountIdentifier,
                                                                   oauthClientId: types.IamOauthClientIdentifier): Future[types.IamApiResponseSingleId] {.async.} =
  ## Removes the old client secret after a rotation, keeping only the new one. Use
  ## this after you have updated your client configuration to use the new secret. The
  ## `has_rotated_secret` field on the client indicates whether there is an old
  ## secret to delete.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/oauth_clients/{oauthClientId}/rotate_secret")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc getOauthScopes*(client: CloudflareClient): Future[types.IamCollectionOauthScopesResponse] {.async.} =
  ## List all available OAuth scopes. This endpoint requires authentication but has
  ## no authorization role requirements.

  let res = await client.httpGET("/oauth/scopes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamCollectionOauthScopesResponse)
  else:
    raise newException(CloudflareClientError, body)
