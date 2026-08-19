# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdCallsTurnKeys*(client: CloudflareClient,
                                        accountId: types.CallsAccountIdentifier): Future[types.CallsTurnKeyCollection] {.async.} =
  ## Lists all TURN keys in the Cloudflare account

  let res = await client.httpGET(fmt"/accounts/{accountId}/calls/turn_keys")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CallsTurnKeyCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCallsTurnKeys*(client: CloudflareClient,
                                         accountId: types.CallsAccountIdentifier,
                                         body: types.CallsTurnKeyEditableFields): Future[types.CallsTurnKeySingleWithSecret] {.async.} =
  ## Creates a new Cloudflare Calls TURN key.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/calls/turn_keys", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CallsTurnKeySingleWithSecret)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCallsTurnKeysKeyId*(client: CloudflareClient,
                                             keyId: types.CallsIdentifier,
                                             accountId: types.CallsAccountIdentifier): Future[types.CallsTurnKeyResponseSingle] {.async.} =
  ## Fetches details for a single TURN key.

  let res = await client.httpGET(fmt"/accounts/{accountId}/calls/turn_keys/{keyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CallsTurnKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCallsTurnKeysKeyId*(client: CloudflareClient,
                                             keyId: types.CallsIdentifier,
                                             accountId: types.CallsAccountIdentifier,
                                             body: types.CallsTurnKeyEditableFields): Future[types.CallsTurnKeyResponseSingle] {.async.} =
  ## Edit details for a single TURN key.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/calls/turn_keys/{keyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CallsTurnKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCallsTurnKeysKeyId*(client: CloudflareClient,
                                                keyId: types.CallsIdentifier,
                                                accountId: types.CallsAccountIdentifier): Future[types.CallsTurnKeyResponseSingle] {.async.} =
  ## Deletes a TURN key from Cloudflare Calls

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/calls/turn_keys/{keyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CallsTurnKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
