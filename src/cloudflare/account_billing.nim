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
  PostAccountsAccountIdPayInvoiceRequest = object
    invoice_id: Option[string]
    payment_method_id: Option[string]
    validate_payment_method: Option[bool]

proc getAccountsAccountIdBillingBadDebt*(client: CloudflareClient,
                                         accountId: types.BillSubsIdentifier): Future[types.BillSubsBadDebtResponseSingle] {.async.} =
  ## Gets bad debt information for an account, including outstanding invoices and
  ## total debt amount.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/bad-debt")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsBadDebtResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillingCredits*(client: CloudflareClient,
                                         accountId: types.BillSubsIdentifier): Future[types.BillSubsAccountCreditsResponse] {.async.} =
  ## Gets the credit balance and eligibility for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/credits")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAccountCreditsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBillingProfilePaymentMethod*(client: CloudflareClient,
                                                       accountId: types.BillSubsIdentifier): Future[types.BillSubsPaymentIntentResponseSingle] {.async.} =
  ## Creates a Stripe payment intent for adding or updating a payment method on the
  ## account's billing profile. Returns a client secret for frontend payment method
  ## collection.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/billing/profile/payment-method")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsPaymentIntentResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillingUnpaidInvoice*(client: CloudflareClient,
                                               accountId: types.BillSubsIdentifier): Future[types.BillSubsUnpaidInvoicesResponseSingle] {.async.} =
  ## Gets unpaid invoice information for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/billing/unpaid-invoice")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsUnpaidInvoicesResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdClientSecret*(client: CloudflareClient,
                                        accountId: types.BillSubsIdentifier): Future[types.BillSubsClientSecretResponseSingle] {.async.} =
  ## Creates a Stripe setup intent for adding a payment method to an account. Returns
  ## a client secret for frontend payment method collection.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/client-secret")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsClientSecretResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdInvoices*(client: CloudflareClient,
                                     accountId: types.BillSubsIdentifier,
                                     body: PatchAccountsAccountIdInvoicesRequest): Future[types.BillSubsApiResponseSingle] {.async.} =
  ## Toggles PDF invoice generation for an account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/invoices", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPayInvoice*(client: CloudflareClient,
                                      accountId: types.BillSubsIdentifier,
                                      body: PostAccountsAccountIdPayInvoiceRequest): Future[types.BillSubsClientSecretResponseSingle] {.async.} =
  ## Pays an outstanding invoice for an account. Returns a Stripe client secret when
  ## Strong Customer Authentication (SCA) is required to complete the payment.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pay-invoice", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsClientSecretResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdReceiptsReceiptIdPdf*(client: CloudflareClient,
                                               accountId: types.BillSubsIdentifier,
                                               receiptId: types.BillSubsIdentifier,
                                               doctype: string = default(string)): Future[AsyncResponse] {.async.} =
  ## Downloads a receipt as a PDF document.

  var q = initOrderedTable[string, string]()
  q["doctype"] = $doctype
  let res = await client.httpGET(fmt"/accounts/{accountId}/receipts/{receiptId}/pdf", q)
  return res

proc postBillingAddressValidation*(client: CloudflareClient,
                                   body: types.BillSubsAddressValidationRequest): Future[types.BillSubsAddressValidationResponseSingle] {.async.} =
  ## Validates a billing address and returns validated address suggestions.
  ## Authentication is not enforced to support pre-signup address validation flows,
  ## so credentials are accepted but not required.

  let res = await client.httpPOST("/billing/address-validation", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillSubsAddressValidationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
