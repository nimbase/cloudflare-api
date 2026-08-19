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
  PatchAccountsAccountIdAddressingPrefixesPrefixIdBgpStatusRequest = object
    advertised: types.AddressingComponentsSchemasAdvertised

proc getAccountsAccountIdAddressingPrefixesPrefixIdBgpStatus*(client: CloudflareClient,
                                                              prefixId: types.AddressingPrefixIdentifier,
                                                              accountId: types.AddressingAccountIdentifier): Future[types.AddressingAdvertisedResponse] {.async.} =
  ## View the current advertisement state for a prefix.
  ##
  ## **Deprecated:** Prefer the BGP Prefixes endpoints, which additionally allow for
  ## advertising and withdrawing
  ## subnets of an IP prefix.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bgp/status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingAdvertisedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAddressingPrefixesPrefixIdBgpStatus*(client: CloudflareClient,
                                                                prefixId: types.AddressingPrefixIdentifier,
                                                                accountId: types.AddressingAccountIdentifier,
                                                                body: PatchAccountsAccountIdAddressingPrefixesPrefixIdBgpStatusRequest): Future[types.AddressingAdvertisedResponse] {.async.} =
  ## Advertise or withdraw the BGP route for a prefix.
  ##
  ## **Deprecated:** Prefer the BGP Prefixes endpoints, which additionally allow for
  ## advertising and withdrawing
  ## subnets of an IP prefix.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bgp/status", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingAdvertisedResponse)
  else:
    raise newException(CloudflareClientError, body)
