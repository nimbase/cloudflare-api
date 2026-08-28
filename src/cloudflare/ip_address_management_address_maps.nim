# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdAddressingAddressMapsRequest = object
    description: Option[types.AddressingDescription2]
    enabled: Option[types.AddressingEnabled]
    ips: Option[seq[types.AddressingIpAddress]]
    memberships: Option[types.AddressingMembershipRequests]
  PatchAccountsAccountIdAddressingAddressMapsAddressMapIdRequest = object
    default_sni: Option[types.AddressingDefaultSni]
    description: Option[types.AddressingDescription2]
    enabled: Option[types.AddressingEnabled]

proc getAccountsAccountIdAddressingAddressMaps*(client: CloudflareClient,
                                                accountId: types.AddressingAccountIdentifier): Future[types.AddressingResponseCollection3] {.async.} =
  ## List all address maps owned by the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/address_maps")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingResponseCollection3)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAddressingAddressMaps*(client: CloudflareClient,
                                                 accountId: types.AddressingAccountIdentifier,
                                                 body: PostAccountsAccountIdAddressingAddressMapsRequest): Future[types.AddressingFullResponse] {.async.} =
  ## Create a new address map under the account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/addressing/address_maps", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingFullResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAddressingAddressMapsAddressMapId*(client: CloudflareClient,
                                                            addressMapId: types.AddressingAddressMapIdentifier,
                                                            accountId: types.AddressingAccountIdentifier): Future[types.AddressingFullResponse] {.async.} =
  ## Show a particular address map owned by the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingFullResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAddressingAddressMapsAddressMapId*(client: CloudflareClient,
                                                               addressMapId: types.AddressingAddressMapIdentifier,
                                                               accountId: types.AddressingAccountIdentifier): Future[types.AddressingApiResponseCollection] {.async.} =
  ## Delete a particular address map owned by the account. An Address Map must be
  ## disabled before it can be deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdAddressingAddressMapsAddressMapId*(client: CloudflareClient,
                                                              addressMapId: types.AddressingAddressMapIdentifier,
                                                              accountId: types.AddressingAccountIdentifier,
                                                              body: PatchAccountsAccountIdAddressingAddressMapsAddressMapIdRequest): Future[types.AddressingSingleResponse3] {.async.} =
  ## Modify properties of an address map owned by the account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingSingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAddressingAddressMapsAddressMapIdAccountsAccountId*(client: CloudflareClient,
                                                                             accountId: types.AddressingAccountIdentifier,
                                                                             addressMapId: types.AddressingAddressMapIdentifier): Future[types.AddressingApiResponseCollection] {.async.} =
  ## Add an account as a member of a particular address map.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}/accounts/{accountId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAddressingAddressMapsAddressMapIdAccountsAccountId*(client: CloudflareClient,
                                                                                accountId: types.AddressingAccountIdentifier,
                                                                                addressMapId: types.AddressingAddressMapIdentifier): Future[types.AddressingApiResponseCollection] {.async.} =
  ## Remove an account as a member of a particular address map.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}/accounts/{accountId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAddressingAddressMapsAddressMapIdIpsIpAddress*(client: CloudflareClient,
                                                                        ipAddress: types.AddressingIpAddress,
                                                                        addressMapId: types.AddressingAddressMapIdentifier,
                                                                        accountId: types.AddressingAccountIdentifier): Future[types.AddressingApiResponseCollection] {.async.} =
  ## Add an IP from a prefix owned by the account to a particular address map.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}/ips/{ipAddress}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAddressingAddressMapsAddressMapIdIpsIpAddress*(client: CloudflareClient,
                                                                           ipAddress: types.AddressingIpAddress,
                                                                           addressMapId: types.AddressingAddressMapIdentifier,
                                                                           accountId: types.AddressingAccountIdentifier): Future[types.AddressingApiResponseCollection] {.async.} =
  ## Remove an IP from a particular address map.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}/ips/{ipAddress}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAddressingAddressMapsAddressMapIdZonesZoneId*(client: CloudflareClient,
                                                                       zoneId: types.AddressingZoneIdentifier,
                                                                       addressMapId: types.AddressingAddressMapIdentifier,
                                                                       accountId: types.AddressingAccountIdentifier): Future[types.AddressingApiResponseCollection] {.async.} =
  ## Add a zone as a member of a particular address map.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}/zones/{zoneId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAddressingAddressMapsAddressMapIdZonesZoneId*(client: CloudflareClient,
                                                                          zoneId: types.AddressingZoneIdentifier,
                                                                          addressMapId: types.AddressingAddressMapIdentifier,
                                                                          accountId: types.AddressingAccountIdentifier): Future[types.AddressingApiResponseCollection] {.async.} =
  ## Remove a zone as a member of a particular address map.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/addressing/address_maps/{addressMapId}/zones/{zoneId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingApiResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
