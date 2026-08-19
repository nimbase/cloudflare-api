# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdCustomNs*(client: CloudflareClient,
                                   accountId: types.DnsCustomNameserversIdentifier): Future[types.DnsCustomNameserversAcnsResponseCollection] {.async.} =
  ## List an account's custom nameservers.

  let res = await client.httpGET(fmt"/accounts/{accountId}/custom_ns")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsCustomNameserversAcnsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCustomNs*(client: CloudflareClient,
                                    accountId: types.DnsCustomNameserversIdentifier,
                                    body: types.DnsCustomNameserversCustomNSInput): Future[types.DnsCustomNameserversAcnsResponseSingle] {.async.} =
  ## Adds a custom nameserver to the account for use as a vanity nameserver on zones.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/custom_ns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsCustomNameserversAcnsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCustomNsCustomNsId*(client: CloudflareClient,
                                                customNsId: types.DnsCustomNameserversNsName,
                                                accountId: types.DnsCustomNameserversIdentifier): Future[types.DnsCustomNameserversEmptyResponse] {.async.} =
  ## Removes a custom nameserver from the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/custom_ns/{customNsId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsCustomNameserversEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)
