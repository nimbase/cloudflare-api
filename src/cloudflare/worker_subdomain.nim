# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersSubdomain*(client: CloudflareClient,
                                           accountId: types.WorkersIdentifier): Future[JsonNode] {.async.} =
  ## Returns a Workers subdomain for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/subdomain")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersSubdomain*(client: CloudflareClient,
                                           accountId: types.WorkersIdentifier,
                                           body: types.WorkersSubdomain2): Future[JsonNode] {.async.} =
  ## Creates a Workers subdomain for an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/subdomain", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersSubdomain*(client: CloudflareClient,
                                              accountId: types.WorkersIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes a Workers subdomain for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/subdomain")
  return res
