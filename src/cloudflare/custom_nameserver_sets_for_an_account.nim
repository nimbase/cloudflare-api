# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDnsSettingsNameserverSets*(client: CloudflareClient,
                                                    accountId: types.DnsSettingsIdentifier,
                                                    page: types.DnsSettingsPage = default(types.DnsSettingsPage),
                                                    perPage: types.DnsSettingsPerPage = default(types.DnsSettingsPerPage)): Future[types.DnsSettingsNameserverSetResponseCollection] {.async.} =
  ## Lists an account's Custom Nameserver Sets.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_settings/nameserver_sets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsNameserverSetResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDnsSettingsNameserverSets*(client: CloudflareClient,
                                                     accountId: types.DnsSettingsIdentifier,
                                                     body: types.DnsSettingsNameserverSetCreate): Future[types.DnsSettingsNameserverSetResponseSingle] {.async.} =
  ## Creates an immutable Custom Nameserver Set. To change a set, create a new one,
  ## move any zone assignments, and delete the old set.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dns_settings/nameserver_sets", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsNameserverSetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDnsSettingsNameserverSetsNameserverSetId*(client: CloudflareClient,
                                                                   accountId: types.DnsSettingsIdentifier,
                                                                   nameserverSetId: types.DnsSettingsNameserverSetId): Future[types.DnsSettingsNameserverSetResponseSingle] {.async.} =
  ## Gets a Custom Nameserver Set owned by an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_settings/nameserver_sets/{nameserverSetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsNameserverSetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDnsSettingsNameserverSetsNameserverSetId*(client: CloudflareClient,
                                                                      accountId: types.DnsSettingsIdentifier,
                                                                      nameserverSetId: types.DnsSettingsNameserverSetId): Future[types.DnsSettingsNameserverSetDeleteResponse] {.async.} =
  ## Deletes an unassigned Custom Nameserver Set.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dns_settings/nameserver_sets/{nameserverSetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsNameserverSetDeleteResponse)
  else:
    raise newException(CloudflareClientError, body)
