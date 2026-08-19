# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAddressingPrefixesPrefixIdBindings*(client: CloudflareClient,
                                                             accountId: types.AddressingAccountIdentifier,
                                                             prefixId: types.AddressingPrefixIdentifier): Future[JsonNode] {.async.} =
  ## List the Cloudflare services this prefix is currently bound to. Traffic sent to
  ## an address within an IP prefix will be routed to the Cloudflare service of the
  ## most-specific Service Binding matching the address.
  ## **Example:** binding `192.0.2.0/24` to Cloudflare Magic Transit and
  ## `192.0.2.1/32` to the Cloudflare CDN would route traffic for `192.0.2.1` to the
  ## CDN, and traffic for all other IPs in the prefix to Cloudflare Magic Transit.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bindings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAddressingPrefixesPrefixIdBindings*(client: CloudflareClient,
                                                              accountId: types.AddressingAccountIdentifier,
                                                              prefixId: types.AddressingPrefixIdentifier,
                                                              body: types.AddressingCreateBindingRequest): Future[JsonNode] {.async.} =
  ## Creates a new Service Binding, routing traffic to IPs within the given CIDR to a
  ## service running on Cloudflare's network.
  ## **NOTE:** The first Service Binding created for an IP Prefix must exactly match
  ## the IP Prefix's CIDR. Subsequent Service Bindings may be created with a
  ## more-specific CIDR. Refer to the  [Service Bindings
  ## Documentation](https://developers.cloudflare.com/byoip/service-bindings/) for
  ## compatibility details.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bindings", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAddressingPrefixesPrefixIdBindingsBindingId*(client: CloudflareClient,
                                                                      accountId: types.AddressingAccountIdentifier,
                                                                      prefixId: types.AddressingPrefixIdentifier,
                                                                      bindingId: types.AddressingServiceBindingIdentifier): Future[JsonNode] {.async.} =
  ## Fetch a single Service Binding

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bindings/{bindingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAddressingPrefixesPrefixIdBindingsBindingId*(client: CloudflareClient,
                                                                         accountId: types.AddressingAccountIdentifier,
                                                                         prefixId: types.AddressingPrefixIdentifier,
                                                                         bindingId: types.AddressingServiceBindingIdentifier): Future[types.AddressingApiResponseCommon] {.async.} =
  ## Delete a Service Binding

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/bindings/{bindingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAddressingServices*(client: CloudflareClient,
                                             accountId: types.AddressingAccountIdentifier): Future[JsonNode] {.async.} =
  ## Bring-Your-Own IP (BYOIP) prefixes onboarded to Cloudflare must be bound to a
  ## service running on the Cloudflare network to enable a Cloudflare product on the
  ## IP addresses. This endpoint can be used as a reference of available services on
  ## the Cloudflare network, and their service IDs.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/services")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
