# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdImagesV1Keys*(client: CloudflareClient,
                                       accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageKeyResponseCollection] {.async.} =
  ## List your CF Images signing keys.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1/keys")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageKeyResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdImagesV1KeysSigningKeyName*(client: CloudflareClient,
                                                     signingKeyName: types.ImagesSigningKeyIdentifier,
                                                     accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageKeyResponseCollection] {.async.} =
  ## Create a new CF Images signing key with specified name. Returns all keys
  ## available.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/images/v1/keys/{signingKeyName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageKeyResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdImagesV1KeysSigningKeyName*(client: CloudflareClient,
                                                        signingKeyName: types.ImagesSigningKeyIdentifier,
                                                        accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageKeyResponseCollection] {.async.} =
  ## Delete a CF Images signing key with specified name. Returns all keys available.
  ## When the last key is removed, a new default signing key will be generated.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/images/v1/keys/{signingKeyName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageKeyResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
