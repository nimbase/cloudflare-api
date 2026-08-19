# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdStreamKeys*(client: CloudflareClient,
                                     accountId: types.StreamIdentifier2): Future[types.StreamKeyResponseCollection] {.async.} =
  ## Lists the video ID and creation date and time when a signing key was created.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/keys")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamKeyResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamKeys*(client: CloudflareClient,
                                      accountId: types.StreamIdentifier2): Future[types.StreamKeyGenerationResponse] {.async.} =
  ## Creates an RSA private key in PEM and JWK formats. Key files are only displayed
  ## once after creation. Keys are created, used, and deleted independently of
  ## videos, and every key can sign any video.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/keys")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamKeyGenerationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamKeysIdentifier*(client: CloudflareClient,
                                                  identifier: types.StreamIdentifier2,
                                                  accountId: types.StreamIdentifier2): Future[types.StreamDeletedResponse] {.async.} =
  ## Deletes signing keys and revokes all signed URLs generated with the key.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/keys/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)
