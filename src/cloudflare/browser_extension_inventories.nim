# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBrowserExtensionConfigInventories*(client: CloudflareClient,
                                                            cursor: string = default(string),
                                                            perPage: int64 = 50): Future[types.BrexInventoriesResponse] {.async.} =
  ## Returns the installed extension inventory for each registered browser
  ## extension device in the account. Each device reports its inventory
  ## periodically; this endpoint returns the latest known snapshot per device.
  ##
  ## Results are paginated by cursor. Pass the `cursor` from a previous
  ## response to fetch the next page. `per_page` controls page size
  ## (default 50, max 200).

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET("/accounts/{account_id}/browser-extension/config/inventories", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrexInventoriesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBrowserExtensionConfigInventoriesRegistrationId*(client: CloudflareClient): Future[types.BrexInventoryResponse] {.async.} =
  ## Returns the installed extension inventory for a single registered browser
  ## extension device.

  let res = await client.httpGET("/accounts/{account_id}/browser-extension/config/inventories/{registration_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BrexInventoryResponse)
  else:
    raise newException(CloudflareClientError, body)
