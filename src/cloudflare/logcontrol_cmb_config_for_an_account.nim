# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdLogsControlCmbConfig*(client: CloudflareClient,
                                               accountId: types.LogcontrolIdentifier): Future[types.LogcontrolCmbConfigResponseSingle] {.async.} =
  ## Gets CMB config.

  let res = await client.httpGET(fmt"/accounts/{accountId}/logs/control/cmb/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogcontrolCmbConfigResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLogsControlCmbConfig*(client: CloudflareClient,
                                                accountId: types.LogcontrolIdentifier,
                                                body: types.LogcontrolCmbConfig): Future[types.LogcontrolCmbConfigResponseSingle] {.async.} =
  ## Updates CMB config.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/logs/control/cmb/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LogcontrolCmbConfigResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdLogsControlCmbConfig*(client: CloudflareClient,
                                                  accountId: types.LogcontrolIdentifier): Future[JsonNode] {.async.} =
  ## Deletes CMB config.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/logs/control/cmb/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
