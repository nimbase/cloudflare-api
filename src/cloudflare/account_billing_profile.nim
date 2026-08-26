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
  PatchAccountsAccountIdBillingProfileRequest = object
    billing_email: Option[string]
    preferred_locale: Option[string]
    secondary_billing_email: Option[string]

proc getAccountsAccountIdBillingProfile*(client: CloudflareClient,
                                         accountId: types.BillSubsApiIdentifier): Future[types.BillSubsApiBillingResponseSingle] {.async.} =
  ## Gets the current billing profile for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/profile")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBillingResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBillingProfile*(client: CloudflareClient,
                                          accountId: types.BillSubsApiIdentifier,
                                          body: types.BillSubsApiBillingProfileRequest): Future[types.BillSubsApiBillingResponseSingle] {.async.} =
  ## Creates a billing profile for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/billing/profile", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBillingResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdBillingProfile*(client: CloudflareClient,
                                         accountId: types.BillSubsApiIdentifier,
                                         body: types.BillSubsApiBillingProfileRequest): Future[types.BillSubsApiBillingResponseSingle] {.async.} =
  ## Updates the billing profile for an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/billing/profile", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBillingResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdBillingProfile*(client: CloudflareClient,
                                            accountId: types.BillSubsApiIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes the billing profile for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/billing/profile")
  return res

proc patchAccountsAccountIdBillingProfile*(client: CloudflareClient,
                                           accountId: types.BillSubsApiIdentifier,
                                           body: PatchAccountsAccountIdBillingProfileRequest): Future[types.BillSubsApiBillingResponseSingle] {.async.} =
  ## Updates the billing email addresses and preferred locale for an account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/billing/profile", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBillingResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
