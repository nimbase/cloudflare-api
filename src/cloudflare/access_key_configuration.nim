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
  PutAccountsAccountIdAccessKeysRequest = object
    key_rotation_interval_days: types.AccessKeyRotationIntervalDays

proc getAccountsAccountIdAccessKeys*(client: CloudflareClient,
                                     accountId: types.AccessIdentifier): Future[types.AccessSingleResponse12] {.async.} =
  ## Gets the Access key rotation settings for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/keys")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse12)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessKeys*(client: CloudflareClient,
                                     accountId: types.AccessIdentifier,
                                     body: PutAccountsAccountIdAccessKeysRequest): Future[types.AccessSingleResponse12] {.async.} =
  ## Updates the Access key rotation settings for an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/keys", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse12)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessKeysRotate*(client: CloudflareClient,
                                            accountId: types.AccessIdentifier): Future[types.AccessSingleResponse12] {.async.} =
  ## Perfoms a key rotation for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/keys/rotate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse12)
  else:
    raise newException(CloudflareClientError, body)
