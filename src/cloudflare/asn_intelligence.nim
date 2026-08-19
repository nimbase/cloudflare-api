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
  GetAccountsAccountIdIntelAsnAsnSubnetsResponse* = object
    asn: types.IntelAsn
    count: types.IntelCount
    ip_count_total: int64
    page: types.IntelPage
    per_page: types.IntelPerPage
    subnets: seq[string]

proc getAccountsAccountIdIntelAsnAsn*(client: CloudflareClient,
                                      asn: types.IntelAsn,
                                      accountId: types.IntelIdentifier): Future[types.IntelAsnComponentsSchemasResponse] {.async.} =
  ## Gets an overview of the Autonomous System Number (ASN) and a list of subnets for
  ## it.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/asn/{asn}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IntelAsnComponentsSchemasResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdIntelAsnAsnSubnets*(client: CloudflareClient,
                                             asn: types.IntelAsn,
                                             accountId: types.IntelIdentifier): Future[GetAccountsAccountIdIntelAsnAsnSubnetsResponse] {.async.} =
  ## Get ASN Subnets.

  let res = await client.httpGET(fmt"/accounts/{accountId}/intel/asn/{asn}/subnets")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdIntelAsnAsnSubnetsResponse)
  else:
    raise newException(CloudflareClientError, body)
