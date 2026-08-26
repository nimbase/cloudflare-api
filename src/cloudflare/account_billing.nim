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
  PatchAccountsAccountIdInvoicesRequest = object
    toggle: Option[bool]
  PostAccountsAccountIdPayBadDebtRequest = object
    payment_method_id: Option[string]
  PostAccountsAccountIdPayInvoiceRequest = object
    invoice_id: Option[string]
    payment_method_id: Option[string]
    validate_payment_method: Option[bool]

proc getAccountsAccountIdBillingBadDebt*(client: CloudflareClient,
                                         accountId: types.BillSubsApiIdentifier): Future[types.BillSubsApiBadDebtResponseSingle] {.async.} =
  ## Gets bad debt information for an account, including outstanding invoices and
  ## total debt amount.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/bad-debt")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiBadDebtResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillingCredits*(client: CloudflareClient,
                                         accountId: types.BillSubsApiIdentifier): Future[types.BillSubsApiAccountCreditsResponse] {.async.} =
  ## Gets the credit balance and eligibility for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/credits")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiAccountCreditsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBillingProfilePaymentMethod*(client: CloudflareClient,
                                                       accountId: types.BillSubsApiIdentifier): Future[types.BillSubsApiPaymentIntentResponseSingle] {.async.} =
  ## Creates a Stripe payment intent for adding or updating a payment method on the
  ## account's billing profile. Returns a client secret for frontend payment method
  ## collection.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/billing/profile/payment-method")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiPaymentIntentResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillingUnpaidInvoice*(client: CloudflareClient,
                                               accountId: types.BillSubsApiIdentifier): Future[types.BillSubsApiUnpaidInvoicesResponseSingle] {.async.} =
  ## Gets unpaid invoice information for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/unpaid-invoice")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiUnpaidInvoicesResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdClientSecret*(client: CloudflareClient,
                                        accountId: types.BillSubsApiIdentifier): Future[types.BillSubsApiClientSecretResponseSingle] {.async.} =
  ## Creates a Stripe setup intent for adding a payment method to an account. Returns
  ## a client secret for frontend payment method collection.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/client-secret")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiClientSecretResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdInvoices*(client: CloudflareClient,
                                     accountId: types.BillSubsApiIdentifier,
                                     body: PatchAccountsAccountIdInvoicesRequest): Future[types.BillSubsApiApiResponseSingle] {.async.} =
  ## Toggles PDF invoice generation for an account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/invoices", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayBadDebt*(client: CloudflareClient,
                                      accountId: types.BillSubsApiIdentifier,
                                      body: PostAccountsAccountIdPayBadDebtRequest): Future[types.BillSubsApiClientSecretResponseSingle] {.async.} =
  ## Pays outstanding bad debt for an account. Discovers all debt automatically and
  ## handles invoice deduplication.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-bad-debt", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiClientSecretResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayInvoice*(client: CloudflareClient,
                                      accountId: types.BillSubsApiIdentifier,
                                      body: PostAccountsAccountIdPayInvoiceRequest): Future[types.BillSubsApiClientSecretResponseSingle] {.async.} =
  ## Pays an outstanding invoice for an account. Returns a Stripe client secret when
  ## Strong Customer Authentication (SCA) is required to complete the payment.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-invoice", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiClientSecretResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdReceiptsReceiptIdPdf*(client: CloudflareClient,
                                               accountId: types.BillSubsApiIdentifier,
                                               receiptId: types.BillSubsApiIdentifier,
                                               doctype: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Downloads a receipt as a PDF document.

  var q = initOrderedTable[string, string]()
  q["doctype"] = $doctype
  let res = await client.httpGET(fmt"/accounts/{accountId}/receipts/{receiptId}/pdf", q)
  return res

proc postBillingAddressValidation*(client: CloudflareClient,
                                   body: types.BillSubsApiAddressValidationRequest): Future[types.BillSubsApiAddressValidationResponseSingle] {.async.} =
  ## Validates a billing address and returns validated address suggestions. This
  ## endpoint is intentionally unauthenticated to support pre-signup address
  ## validation flows.

  let res = await client.httpPOST("/billing/address-validation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiAddressValidationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
