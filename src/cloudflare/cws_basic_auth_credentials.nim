# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  CwsBasicAuthCredentialOrderOption* = enum
    orderUsername = "username"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsBasicAuthCredentialDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsBasicAuthCredentials*(client: CloudflareClient,
                                                  accountId: string,
                                                  cursor: string = default(string),
                                                  perPage: int64 = 20,
                                                  order: CwsBasicAuthCredentialOrderOption = orderCreatedAt,
                                                  direction: CwsBasicAuthCredentialDirectionOption = directionAsc,
                                                  username: string = default(string),
                                                  deploymentId: string = default(string)): Future[types.CwsPageResponseBasicAuthCredential] {.async.} =
  ## Returns a paginated list of basic-auth credentials in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["username"] = $username
  q["deployment_id"] = $deploymentId
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/basic-auth-credentials", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseBasicAuthCredential)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsBasicAuthCredentials*(client: CloudflareClient,
                                                   accountId: string,
                                                   body: types.CwsCreateBasicAuthCredentialInputBody): Future[types.CwsResponseBasicAuthCredential] {.async.} =
  ## Creates a basic-auth credential with the specified username.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/basic-auth-credentials", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseBasicAuthCredential)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsBasicAuthCredentialsCredentialId*(client: CloudflareClient,
                                                              accountId: string,
                                                              credentialId: string): Future[types.CwsResponseBasicAuthCredential] {.async.} =
  ## Returns the basic-auth credential with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/basic-auth-credentials/{credentialId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseBasicAuthCredential)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsBasicAuthCredentialsCredentialId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 credentialId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the credential and its secrets if it is not attached to a deployment.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/basic-auth-credentials/{credentialId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsBasicAuthCredentialsCredentialIdSecrets*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     credentialId: string,
                                                                     cursor: string = default(string),
                                                                     perPage: int64 = 20,
                                                                     order: CwsBasicAuthCredentialOrderOption = orderCreatedAt,
                                                                     direction: CwsBasicAuthCredentialDirectionOption = directionAsc): Future[types.CwsPageResponseBasicAuthSecretResponse] {.async.} =
  ## Returns a paginated list of secrets belonging to the credential.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/basic-auth-credentials/{credentialId}/secrets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseBasicAuthSecretResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsBasicAuthCredentialsCredentialIdSecrets*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      credentialId: string,
                                                                      body: types.CwsCreateBasicAuthSecretBody): Future[types.CwsResponseBasicAuthSecretResponse] {.async.} =
  ## Adds a password secret to the credential.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/basic-auth-credentials/{credentialId}/secrets", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseBasicAuthSecretResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsBasicAuthCredentialsCredentialIdSecretsSecretId*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             credentialId: string,
                                                                             secretId: string): Future[types.CwsResponseBasicAuthSecretResponse] {.async.} =
  ## Returns the specified secret's metadata without exposing its password or hash.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/basic-auth-credentials/{credentialId}/secrets/{secretId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseBasicAuthSecretResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsBasicAuthCredentialsCredentialIdSecretsSecretId*(client: CloudflareClient,
                                                                                accountId: string,
                                                                                credentialId: string,
                                                                                secretId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the specified secret from the credential.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/basic-auth-credentials/{credentialId}/secrets/{secretId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
