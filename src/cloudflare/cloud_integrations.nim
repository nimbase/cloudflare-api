# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicCloudProviders*(client: CloudflareClient,
                                              accountId: types.McnAccountId,
                                              status: bool = default(bool),
                                              orderBy: string = default(string),
                                              desc: bool = default(bool),
                                              cloudflare: bool = default(bool)): Future[types.McnReadAccountProvidersResponse] {.async.} =
  ## List Cloud Integrations (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  q["order_by"] = $orderBy
  q["desc"] = $desc
  q["cloudflare"] = $cloudflare
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/providers", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnReadAccountProvidersResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCloudProviders*(client: CloudflareClient,
                                               accountId: types.McnAccountId,
                                               body: types.McnCreateProviderRequest): Future[types.McnCreateProviderResponse] {.async.} =
  ## Create a new Cloud Integration (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/providers", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.McnCreateProviderResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCloudProvidersDiscover*(client: CloudflareClient,
                                                       accountId: types.McnAccountId): Future[types.McnGoodResponse] {.async.} =
  ## Run discovery for all Cloud Integrations in an account (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/providers/discover")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.McnGoodResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCloudProvidersProviderId*(client: CloudflareClient,
                                                        accountId: types.McnAccountId,
                                                        providerId: types.McnProviderId,
                                                        status: bool = default(bool)): Future[types.McnReadAccountProviderResponse] {.async.} =
  ## Read a Cloud Integration (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/providers/{providerId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnReadAccountProviderResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicCloudProvidersProviderId*(client: CloudflareClient,
                                                        accountId: types.McnAccountId,
                                                        providerId: types.McnProviderId,
                                                        body: types.McnUpdateProviderRequest): Future[types.McnUpdateProviderResponse] {.async.} =
  ## Update a Cloud Integration (Closed Beta).

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/cloud/providers/{providerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnUpdateProviderResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicCloudProvidersProviderId*(client: CloudflareClient,
                                                           accountId: types.McnAccountId,
                                                           providerId: types.McnProviderId): Future[types.McnDeleteProviderResponse] {.async.} =
  ## Delete a Cloud Integration (Closed Beta).

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/cloud/providers/{providerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnDeleteProviderResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicCloudProvidersProviderId*(client: CloudflareClient,
                                                          accountId: types.McnAccountId,
                                                          providerId: types.McnProviderId,
                                                          body: types.McnUpdateProviderRequest): Future[types.McnUpdateProviderResponse] {.async.} =
  ## Update a Cloud Integration (Closed Beta).

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/cloud/providers/{providerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnUpdateProviderResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCloudProvidersProviderIdDiscover*(client: CloudflareClient,
                                                                 accountId: types.McnAccountId,
                                                                 providerId: types.McnProviderId,
                                                                 v2: bool = default(bool)): Future[types.McnGoodResponse] {.async.} =
  ## Run discovery for a Cloud Integration (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["v2"] = $v2
  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/providers/{providerId}/discover", q)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.McnGoodResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCloudProvidersProviderIdInitialSetup*(client: CloudflareClient,
                                                                    accountId: types.McnAccountId,
                                                                    providerId: types.McnProviderId): Future[types.McnProviderInitialSetupResponse] {.async.} =
  ## Get initial configuration to complete Cloud Integration setup (Closed Beta).

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/providers/{providerId}/initial_setup")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnProviderInitialSetupResponse)
  else:
    raise newException(CloudflareClientError, body)
