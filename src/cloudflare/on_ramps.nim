# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicCloudOnramps*(client: CloudflareClient,
                                            accountId: types.McnAccountId,
                                            orderBy: string = default(string),
                                            desc: bool = default(bool),
                                            status: bool = default(bool),
                                            vpcs: bool = default(bool)): Future[types.McnListOnrampsResponse] {.async.} =
  ## List On-ramps (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["order_by"] = $orderBy
  q["desc"] = $desc
  q["status"] = $status
  q["vpcs"] = $vpcs
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/onramps", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnListOnrampsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCloudOnramps*(client: CloudflareClient,
                                             accountId: types.McnAccountId,
                                             body: types.McnCreateOnrampRequest): Future[types.McnCreateOnrampResponse] {.async.} =
  ## Create a new On-ramp (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/onramps", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.McnCreateOnrampResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCloudOnrampsMagicWanAddressSpace*(client: CloudflareClient,
                                                                accountId: types.McnAccountId): Future[types.McnGetMagicWanAddressSpaceResponse] {.async.} =
  ## Read the Magic WAN Address Space (Closed Beta).

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/onramps/magic_wan_address_space")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnGetMagicWanAddressSpaceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicCloudOnrampsMagicWanAddressSpace*(client: CloudflareClient,
                                                                accountId: types.McnAccountId,
                                                                body: types.McnUpdateMagicWanAddressSpaceRequest): Future[types.McnUpdateMagicWanAddressSpaceResponse] {.async.} =
  ## Update the Magic WAN Address Space (Closed Beta).

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/cloud/onramps/magic_wan_address_space", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnUpdateMagicWanAddressSpaceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicCloudOnrampsMagicWanAddressSpace*(client: CloudflareClient,
                                                                  accountId: types.McnAccountId,
                                                                  body: types.McnUpdateMagicWanAddressSpaceRequest): Future[types.McnUpdateMagicWanAddressSpaceResponse] {.async.} =
  ## Update the Magic WAN Address Space (Closed Beta).

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/cloud/onramps/magic_wan_address_space", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnUpdateMagicWanAddressSpaceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicCloudOnrampsOnrampId*(client: CloudflareClient,
                                                    accountId: types.McnAccountId,
                                                    onrampId: types.McnOnrampId,
                                                    status: bool = default(bool),
                                                    vpcs: bool = default(bool),
                                                    postApplyResources: bool = default(bool),
                                                    plannedResources: bool = default(bool)): Future[types.McnGetOnrampResponse] {.async.} =
  ## Read an On-ramp (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  q["vpcs"] = $vpcs
  q["post_apply_resources"] = $postApplyResources
  q["planned_resources"] = $plannedResources
  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/cloud/onramps/{onrampId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnGetOnrampResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicCloudOnrampsOnrampId*(client: CloudflareClient,
                                                    accountId: types.McnAccountId,
                                                    onrampId: types.McnOnrampId,
                                                    body: types.McnUpdateOnrampRequest): Future[types.McnUpdateOnrampResponse] {.async.} =
  ## Update an On-ramp (Closed Beta).

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/cloud/onramps/{onrampId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnUpdateOnrampResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicCloudOnrampsOnrampId*(client: CloudflareClient,
                                                       accountId: types.McnAccountId,
                                                       onrampId: types.McnOnrampId,
                                                       destroy: bool = default(bool),
                                                       force: bool = default(bool)): Future[types.McnDeleteOnrampResponse] {.async.} =
  ## Delete an On-ramp (Closed Beta).

  var q = initOrderedTable[string, string]()
  q["destroy"] = $destroy
  q["force"] = $force
  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/cloud/onramps/{onrampId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnDeleteOnrampResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicCloudOnrampsOnrampId*(client: CloudflareClient,
                                                      accountId: types.McnAccountId,
                                                      onrampId: types.McnOnrampId,
                                                      body: types.McnUpdateOnrampRequest): Future[types.McnUpdateOnrampResponse] {.async.} =
  ## Update an On-ramp (Closed Beta).

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/cloud/onramps/{onrampId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.McnUpdateOnrampResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCloudOnrampsOnrampIdApply*(client: CloudflareClient,
                                                          accountId: types.McnAccountId,
                                                          onrampId: types.McnOnrampId): Future[types.McnGoodResponse] {.async.} =
  ## Apply an On-ramp (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/onramps/{onrampId}/apply")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.McnGoodResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicCloudOnrampsOnrampIdExport*(client: CloudflareClient,
                                                           accountId: types.McnAccountId,
                                                           onrampId: types.McnOnrampId): Future[AsyncResponse] {.async.} =
  ## Export an On-ramp to terraform ready file(s) (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/onramps/{onrampId}/export")
  return res

proc postAccountsAccountIdMagicCloudOnrampsOnrampIdPlan*(client: CloudflareClient,
                                                         accountId: types.McnAccountId,
                                                         onrampId: types.McnOnrampId): Future[types.McnGoodResponse] {.async.} =
  ## Plan an On-ramp (Closed Beta).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/cloud/onramps/{onrampId}/plan")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.McnGoodResponse)
  else:
    raise newException(CloudflareClientError, body)
