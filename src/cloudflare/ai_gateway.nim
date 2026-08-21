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
  PostAccountsAccountIdAiGatewayBillingSpendingLimitRequest = object
    amount: int64
    duration: string
    strategy: string
  PostAccountsAccountIdAiGatewayBillingTopupRequest = object
    amount: int64
  PostAccountsAccountIdAiGatewayBillingTopupConfigRequest = object
    amount: int64
    threshold: int64
  PostAccountsAccountIdAiGatewayBillingTopupStatusRequest = object
    payment_intent_id: string
  AiGatewayTypeOption* = enum
    typeAuto = "auto"
    typeAll = "all"
    typeManual = "manual"

  AiGatewayValueGroupingWindowOption* = enum
    valueGroupingWindowDay = "day"
    valueGroupingWindowHour = "hour"


proc getAccountsAccountIdAiGatewayBillingCreditBalance*(client: CloudflareClient,
                                                        accountId: string): Future[types.AigBillingGetCreditBalanceResponse] {.async.} =
  ## Retrieve the current credit balance, payment method info, and top-up
  ## configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/billing/credit-balance")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingGetCreditBalanceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayBillingInvoiceHistory*(client: CloudflareClient,
                                                         accountId: string,
                                                         `type`: AiGatewayTypeOption = typeAll): Future[types.AigBillingGetInvoiceHistoryResponse] {.async.} =
  ## Retrieve a list of past invoices with pagination, optionally filtered by type.

  var q = initOrderedTable[string, string]()
  q["type"] = $`type`
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/billing/invoice-history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingGetInvoiceHistoryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayBillingInvoicePreview*(client: CloudflareClient,
                                                         accountId: string): Future[types.AigBillingGetInvoicePreviewResponse] {.async.} =
  ## Retrieve a preview of the upcoming invoice including line items and tax.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/billing/invoice-preview")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingGetInvoicePreviewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayBillingSpendingLimit*(client: CloudflareClient,
                                                        accountId: string): Future[types.AigBillingGetSpendingLimitResponse] {.async.} =
  ## Retrieve the current spending limit configuration for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/billing/spending-limit")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingGetSpendingLimitResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayBillingSpendingLimit*(client: CloudflareClient,
                                                         accountId: string,
                                                         body: PostAccountsAccountIdAiGatewayBillingSpendingLimitRequest): Future[types.AigBillingSetSpendingLimitResponse] {.async.} =
  ## Deprecated: spending limits can no longer be created, enabled, or modified and
  ## this endpoint always responds 403. Use the new AI Gateway spend limits instead:
  ## https://developers.cloudflare.com/ai-gateway/features/spend-limits/. Existing
  ## limits can be removed via DELETE /spending-limit.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/billing/spending-limit", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AigBillingSetSpendingLimitResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayBillingSpendingLimit*(client: CloudflareClient,
                                                           accountId: string): Future[types.AigBillingDeleteSpendingLimitResponse] {.async.} =
  ## Remove the spending limit for the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/billing/spending-limit")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingDeleteSpendingLimitResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayBillingTopup*(client: CloudflareClient,
                                                 accountId: string,
                                                 body: PostAccountsAccountIdAiGatewayBillingTopupRequest): Future[types.AigBillingCreateTopupResponse] {.async.} =
  ## Create a credit top-up for the given account, charged to the account's default
  ## payment method.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/billing/topup", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingCreateTopupResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayBillingTopupConfig*(client: CloudflareClient,
                                                      accountId: string): Future[types.AigBillingGetTopupConfigResponse] {.async.} =
  ## Retrieve the current auto top-up threshold, amount, and any error state.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/billing/topup/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingGetTopupConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayBillingTopupConfig*(client: CloudflareClient,
                                                       accountId: string,
                                                       body: PostAccountsAccountIdAiGatewayBillingTopupConfigRequest): Future[types.AigBillingSetTopupConfigResponse] {.async.} =
  ## Configure auto top-up with a balance threshold and top-up amount.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/billing/topup/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingSetTopupConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAiGatewayBillingTopupConfig*(client: CloudflareClient,
                                                         accountId: string): Future[types.AigBillingDeleteTopupConfigResponse] {.async.} =
  ## Remove the auto top-up configuration for the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/ai-gateway/billing/topup/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingDeleteTopupConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayBillingTopupLimits*(client: CloudflareClient,
                                                      accountId: string): Future[types.AigBillingGetTopupLimitsResponse] {.async.} =
  ## Retrieve the minimum and maximum allowed top-up amounts (in cents) for this
  ## account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/billing/topup/limits")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingGetTopupLimitsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAiGatewayBillingTopupStatus*(client: CloudflareClient,
                                                       accountId: string,
                                                       body: PostAccountsAccountIdAiGatewayBillingTopupStatusRequest): Future[types.AigBillingTopupStatusResponse] {.async.} =
  ## Get the payment processing status of a top-up by its invoice ID.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/ai-gateway/billing/topup/status", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingTopupStatusResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAiGatewayBillingUsageHistory*(client: CloudflareClient,
                                                       accountId: string,
                                                       valueGroupingWindow: AiGatewayValueGroupingWindowOption,
                                                       startTime: float64 = default(float64),
                                                       endTime: float64 = default(float64)): Future[types.AigBillingGetUsageHistoryResponse] {.async.} =
  ## Retrieve aggregated usage meter event summaries for the given time range.

  var q = initOrderedTable[string, string]()
  q["value_grouping_window"] = $valueGroupingWindow
  q["start_time"] = $startTime
  q["end_time"] = $endTime
  let res = await client.httpGET(fmt"/accounts/{accountId}/ai-gateway/billing/usage-history", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AigBillingGetUsageHistoryResponse)
  else:
    raise newException(CloudflareClientError, body)
