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
  PostAccountsAccountIdAddressingPrefixesPrefixIdDelegationsRequest = object
    cidr: types.AddressingCidr
    delegated_account_id: types.AddressingDelegatedAccountIdentifier

proc getAccountsAccountIdAddressingPrefixesPrefixIdDelegations*(client: CloudflareClient,
                                                                prefixId: types.AddressingPrefixIdentifier,
                                                                accountId: types.AddressingAccountIdentifier): Future[types.AddressingResponseCollection2] {.async.} =
  ## List all delegations for a given account IP prefix.

  let res = await client.httpGET(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/delegations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAddressingPrefixesPrefixIdDelegations*(client: CloudflareClient,
                                                                 prefixId: types.AddressingPrefixIdentifier,
                                                                 accountId: types.AddressingAccountIdentifier,
                                                                 body: PostAccountsAccountIdAddressingPrefixesPrefixIdDelegationsRequest): Future[types.AddressingSingleResponse2] {.async.} =
  ## Create a new account delegation for a given IP prefix.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/delegations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingSingleResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAddressingPrefixesPrefixIdDelegationsDelegationId*(client: CloudflareClient,
                                                                               delegationId: types.AddressingDelegationIdentifier,
                                                                               prefixId: types.AddressingPrefixIdentifier,
                                                                               accountId: types.AddressingAccountIdentifier): Future[types.AddressingIdResponse] {.async.} =
  ## Delete an account delegation for a given IP prefix.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/addressing/prefixes/{prefixId}/delegations/{delegationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AddressingIdResponse)
  else:
    raise newException(CloudflareClientError, body)
