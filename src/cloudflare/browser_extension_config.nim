# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBrowserExtensionConfig*(client: CloudflareClient): Future[types.BrexConfigResponse] {.async.} =
  ## Returns the browser extension configuration for an account.

  let res = await client.httpGET("/accounts/{account_id}/browser-extension/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrexConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBrowserExtensionConfig*(client: CloudflareClient,
                                                  body: types.BrexCreateConfigRequest): Future[types.BrexConfigResponse] {.async.} =
  ## Creates the browser extension configuration for an account.

  let res = await client.httpPOST("/accounts/{account_id}/browser-extension/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrexConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdBrowserExtensionConfig*(client: CloudflareClient,
                                                 body: types.BrexUpdateConfigRequest): Future[types.BrexConfigResponse] {.async.} =
  ## Replaces the browser extension configuration for an account.
  ## The configuration must already exist. The shard mapping is immutable.

  let res = await client.httpPUT("/accounts/{account_id}/browser-extension/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrexConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBrowserExtensionConfig*(client: CloudflareClient): Future[types.BrexDeleteResponse] {.async.} =
  ## Deletes the browser extension configuration for an account.
  ## The shard mapping is preserved and not deleted.

  let res = await client.httpDELETE("/accounts/{account_id}/browser-extension/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrexDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)
