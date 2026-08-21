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
  EmailRoutingDestinationAddresseDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  EmailRoutingDestinationAddresseVerifiedOption* = enum
    verifiedTrue = "true"
    verifiedFalse = "false"


proc getAccountsAccountIdEmailRoutingAddresses*(client: CloudflareClient,
                                                accountId: types.EmailIdentifier,
                                                page: float64 = default(float64),
                                                perPage: float64 = default(float64),
                                                direction: EmailRoutingDestinationAddresseDirectionOption = directionAsc,
                                                verified: EmailRoutingDestinationAddresseVerifiedOption = verified): Future[types.EmailDestinationAddressesResponseCollection] {.async.} =
  ## Lists existing destination addresses.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["direction"] = $direction
  q["verified"] = $verified
  let res = await client.httpGET(fmt"/accounts/{accountId}/email/routing/addresses", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailDestinationAddressesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailRoutingAddresses*(client: CloudflareClient,
                                                 accountId: types.EmailIdentifier,
                                                 body: types.EmailCreateDestinationAddressProperties): Future[types.EmailDestinationAddressResponseSingle] {.async.} =
  ## Create a destination address to forward your emails to. Destination addresses
  ## need to be verified before they can be used.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/email/routing/addresses", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailDestinationAddressResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailRoutingAddressesDestinationAddressIdentifier*(client: CloudflareClient,
                                                                            destinationAddressIdentifier: types.EmailDestinationAddressIdentifier,
                                                                            accountId: types.EmailIdentifier): Future[types.EmailDestinationAddressResponseSingle] {.async.} =
  ## Gets information for a specific destination email already created.

  let res = await client.httpGET(fmt"/accounts/{accountId}/email/routing/addresses/{destinationAddressIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailDestinationAddressResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailRoutingAddressesDestinationAddressIdentifier*(client: CloudflareClient,
                                                                               destinationAddressIdentifier: types.EmailDestinationAddressIdentifier,
                                                                               accountId: types.EmailIdentifier): Future[types.EmailDestinationAddressResponseSingle] {.async.} =
  ## Deletes a specific destination address.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/email/routing/addresses/{destinationAddressIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailDestinationAddressResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailRoutingAddressesDestinationAddressIdentifier*(client: CloudflareClient,
                                                                              destinationAddressIdentifier: types.EmailDestinationAddressIdentifier,
                                                                              accountId: types.EmailIdentifier,
                                                                              body: types.EmailUpdateDestinationAddressProperties): Future[types.EmailDestinationAddressResponseSingle] {.async.} =
  ## Updates the status of a specific destination address.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/email/routing/addresses/{destinationAddressIdentifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailDestinationAddressResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
