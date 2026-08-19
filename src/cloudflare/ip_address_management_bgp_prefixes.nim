# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixes*(client: CloudflareClient,
                                                                accountId: types.AddressingAccountIdentifier,
                                                                prefixId: types.AddressingPrefixIdentifier): Future[types.AddressingResponseCollectionBgp] {.async.} =
  ## List all BGP Prefixes within the specified IP Prefix. BGP Prefixes are used to
  ## control which specific subnets are advertised to the Internet. It is possible to
  ## advertise subnets more specific than an IP Prefix by creating more specific BGP
  ## Prefixes.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bgp/prefixes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingResponseCollectionBgp)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixes*(client: CloudflareClient,
                                                                 accountId: types.AddressingAccountIdentifier,
                                                                 prefixId: types.AddressingPrefixIdentifier,
                                                                 body: types.AddressingBgpPrefixCreate): Future[types.AddressingSingleResponseBgp] {.async.} =
  ## Create a BGP prefix, controlling the BGP advertisement status of a specific
  ## subnet. When created, BGP prefixes are initially withdrawn, and can be
  ## advertised with the Update BGP Prefix API.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bgp/prefixes", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingSingleResponseBgp)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixesBgpPrefixId*(client: CloudflareClient,
                                                                           accountId: types.AddressingAccountIdentifier,
                                                                           prefixId: types.AddressingPrefixIdentifier,
                                                                           bgpPrefixId: types.AddressingBgpPrefixIdentifier): Future[types.AddressingSingleResponseBgp] {.async.} =
  ## Retrieve a single BGP Prefix according to its identifier

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bgp/prefixes/{bgpPrefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingSingleResponseBgp)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixesBgpPrefixId*(client: CloudflareClient,
                                                                              accountId: types.AddressingAccountIdentifier,
                                                                              prefixId: types.AddressingPrefixIdentifier,
                                                                              bgpPrefixId: types.AddressingBgpPrefixIdentifier): Future[types.AddressingApiResponseCommon] {.async.} =
  ## Delete a BGP Prefix associated with the specified IP Prefix. A BGP Prefix must
  ## be withdrawn before it can be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bgp/prefixes/{bgpPrefixId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAddressingPrefixesPrefixIdBgpPrefixesBgpPrefixId*(client: CloudflareClient,
                                                                             accountId: types.AddressingAccountIdentifier,
                                                                             prefixId: types.AddressingPrefixIdentifier,
                                                                             bgpPrefixId: types.AddressingBgpPrefixIdentifier,
                                                                             body: types.AddressingBgpPrefixUpdateAdvertisement): Future[types.AddressingSingleResponseBgp] {.async.} =
  ## Update the properties of a BGP Prefix, such as the on demand advertisement
  ## status (advertised or withdrawn).

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bgp/prefixes/{bgpPrefixId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingSingleResponseBgp)
  else:
    raise newException(CloudflareClientError, body)
