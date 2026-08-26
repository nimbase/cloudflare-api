# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPaymentMethods*(client: CloudflareClient,
                                         accountId: types.BillSubsApiIdentifier,
                                         page: int64 = 1, perPage: int64 = 20): Future[types.BillSubsApiPaymentMethodResponseCollection] {.async.} =
  ## Lists all payment methods for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/payment-methods", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiPaymentMethodResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPaymentMethods*(client: CloudflareClient,
                                          accountId: types.BillSubsApiIdentifier,
                                          body: types.BillSubsApiPaymentMethod): Future[types.BillSubsApiPaymentMethodResponseSingle] {.async.} =
  ## Creates a new payment method for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/payment-methods", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiPaymentMethodResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPaymentMethodsPaymentMethodId*(client: CloudflareClient,
                                                        accountId: types.BillSubsApiIdentifier,
                                                        paymentMethodId: types.BillSubsApiIdentifier): Future[types.BillSubsApiPaymentMethodResponseSingle] {.async.} =
  ## Gets a specific payment method for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/payment-methods/{paymentMethodId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiPaymentMethodResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdPaymentMethodsPaymentMethodId*(client: CloudflareClient,
                                                        accountId: types.BillSubsApiIdentifier,
                                                        paymentMethodId: types.BillSubsApiIdentifier,
                                                        body: types.BillSubsApiPaymentMethod): Future[types.BillSubsApiPaymentMethodResponseSingle] {.async.} =
  ## Updates a payment method for an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/payment-methods/{paymentMethodId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiPaymentMethodResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPaymentMethodsPaymentMethodId*(client: CloudflareClient,
                                                           accountId: types.BillSubsApiIdentifier,
                                                           paymentMethodId: types.BillSubsApiIdentifier): Future[types.BillSubsApiApiResponseSingle] {.async.} =
  ## Deletes a payment method from an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/payment-methods/{paymentMethodId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPaymentMethodsPaymentMethodIdSetAsDefault*(client: CloudflareClient,
                                                                     accountId: types.BillSubsApiIdentifier,
                                                                     paymentMethodId: types.BillSubsApiIdentifier): Future[types.BillSubsApiApiResponseSingle] {.async.} =
  ## Sets a payment method as the default for an account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/payment-methods/{paymentMethodId}/set-as-default")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
