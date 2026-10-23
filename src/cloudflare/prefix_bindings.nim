# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlsRegionalServicesPrefixBindings*(client: CloudflareClient,
                                                            accountId: types.DlsAccountIdentifier,
                                                            cursor: string = default(string),
                                                            perPage: int64 = 25): Future[types.DlsPrefixBindingPaginatedListResponse] {.async.} =
  ## List the BYOIP prefix bindings configured for an account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/dls/regional_services/prefix_bindings", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DlsPrefixBindingPaginatedListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlsRegionalServicesPrefixBindings*(client: CloudflareClient,
                                                             accountId: types.DlsAccountIdentifier,
                                                             body: types.DlsCreatePrefixBindingInput): Future[types.DlsPrefixBindingResponse] {.async.} =
  ## Bind a CIDR from a BYOIP prefix to a region.
  ##
  ## This requires the **IP Prefixes Write** permission in addition to **DLS Write**,
  ## because the binding is created against a BYOIP prefix in Addressing.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dls/regional_services/prefix_bindings", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.DlsPrefixBindingResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlsRegionalServicesPrefixBindingsBindingId*(client: CloudflareClient,
                                                                     accountId: types.DlsAccountIdentifier,
                                                                     bindingId: string): Future[types.DlsPrefixBindingResponse] {.async.} =
  ## Retrieve a single BYOIP prefix binding by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dls/regional_services/prefix_bindings/{bindingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DlsPrefixBindingResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlsRegionalServicesPrefixBindingsBindingId*(client: CloudflareClient,
                                                                        accountId: types.DlsAccountIdentifier,
                                                                        bindingId: string): Future[types.DlsGoodResponse] {.async.} =
  ## Delete a BYOIP prefix binding.
  ##
  ## Like creating a binding, this requires **IP Prefixes Write** in addition to
  ## **DLS Write**.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dls/regional_services/prefix_bindings/{bindingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DlsGoodResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDlsRegionalServicesPrefixBindingsBindingId*(client: CloudflareClient,
                                                                       accountId: types.DlsAccountIdentifier,
                                                                       bindingId: string,
                                                                       body: types.DlsUpdatePrefixBindingInput): Future[types.DlsPrefixBindingResponse] {.async.} =
  ## Update the region of an existing BYOIP prefix binding.
  ##
  ## Like creating a binding, this requires **IP Prefixes Write** in addition to
  ## **DLS Write**.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/dls/regional_services/prefix_bindings/{bindingId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DlsPrefixBindingResponse)
  else:
    raise newException(CloudflareClientError, body)
