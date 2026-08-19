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
  SecretsStoreDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  SecretsStoreOrderOption* = enum
    orderName = "name"
    orderCreated = "created"
    orderModified = "modified"


proc getAccountsAccountIdSecretsStoreQuota*(client: CloudflareClient,
                                            accountId: string): Future[types.SecretsStoreQuotaResponse] {.async.} =
  ## Lists the number of secrets used in the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secrets_store/quota")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreQuotaResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecretsStoreStores*(client: CloudflareClient,
                                             accountId: string,
                                             direction: string = "desc",
                                             page: int64 = default(int64),
                                             perPage: int64 = default(int64),
                                             order: string = "created"): Future[types.SecretsStoreStoresResponseCollection] {.async.} =
  ## Lists all the stores in an account.

  var q = initOrderedTable[string, string]()
  for v in direction: q["direction"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/secrets_store/stores", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreStoresResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSecretsStoreStores*(client: CloudflareClient,
                                              accountId: string,
                                              body: types.SecretsStoreCreateStoreObject): Future[types.SecretsStoreStoreResponse] {.async.} =
  ## Creates a store in the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/secrets_store/stores", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreStoreResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecretsStoreStoresStoreId*(client: CloudflareClient,
                                                    accountId: string,
                                                    storeId: string): Future[types.SecretsStoreStoreResponse] {.async.} =
  ## Returns details of a single store.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreStoreResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSecretsStoreStoresStoreId*(client: CloudflareClient,
                                                       accountId: string,
                                                       storeId: string,
                                                       force: bool = false): Future[types.SecretsStoreDeleteResponse] {.async.} =
  ## Deletes a single store. By default, a store that still contains secrets
  ## cannot be deleted and returns HTTP 409 (Conflict) with the "store_not_empty"
  ## error. Pass `force=true` to cascade-delete all secrets in the store.
  ## Empty stores are always deleted regardless of the force parameter.

  var q = initOrderedTable[string, string]()
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecretsStoreStoresStoreIdSecrets*(client: CloudflareClient,
                                                           accountId: string,
                                                           storeId: string,
                                                           direction: string = "desc",
                                                           page: int64 = default(int64),
                                                           perPage: int64 = default(int64),
                                                           search: string = default(string),
                                                           order: string = "created",
                                                           scopes: seq[string] = default(seq[string])): Future[types.SecretsStoreSecretsResponseCollection] {.async.} =
  ## Lists all store secrets.

  var q = initOrderedTable[string, string]()
  for v in direction: q["direction"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  for v in order: q["order"] = $v
  q["scopes"] = $scopes
  let res = await client.httpGET(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}/secrets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreSecretsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSecretsStoreStoresStoreIdSecrets*(client: CloudflareClient,
                                                            accountId: string,
                                                            storeId: string): Future[types.SecretsStoreSecretsResponseCollection] {.async.} =
  ## Creates a secret in the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}/secrets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreSecretsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSecretsStoreStoresStoreIdSecrets*(client: CloudflareClient,
                                                              accountId: string,
                                                              storeId: string,
                                                              body: types.SecretsStoreDeleteSecretsRequest): Future[types.SecretsStoreDeleteResponse] {.async.} =
  ## Deletes one or more secrets.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}/secrets", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.SecretsStoreDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecretsStoreStoresStoreIdSecretsSecretId*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   storeId: string,
                                                                   secretId: string): Future[types.SecretsStoreSecretResponse] {.async.} =
  ## Returns details of a single secret.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}/secrets/{secretId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreSecretResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSecretsStoreStoresStoreIdSecretsSecretId*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      storeId: string,
                                                                      secretId: string): Future[types.SecretsStoreDeleteResponse] {.async.} =
  ## Deletes a single secret.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}/secrets/{secretId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.SecretsStoreDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdSecretsStoreStoresStoreIdSecretsSecretId*(client: CloudflareClient,
                                                                     accountId: string,
                                                                     storeId: string,
                                                                     secretId: string,
                                                                     body: types.SecretsStorePatchSecretObject): Future[types.SecretsStoreSecretResponse] {.async.} =
  ## Updates a single secret.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}/secrets/{secretId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreSecretResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSecretsStoreStoresStoreIdSecretsSecretIdDuplicate*(client: CloudflareClient,
                                                                             accountId: string,
                                                                             storeId: string,
                                                                             secretId: string,
                                                                             body: types.SecretsStoreDuplicateSecretObject): Future[types.SecretsStoreSecretResponse] {.async.} =
  ## Creates a duplicate of the secret, keeping the value.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/secrets_store/stores/{storeId}/secrets/{secretId}/duplicate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecretsStoreSecretResponse)
  else:
    raise newException(CloudflareClientError, body)
