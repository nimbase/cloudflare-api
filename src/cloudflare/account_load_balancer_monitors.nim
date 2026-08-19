# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdLoadBalancersMonitors*(client: CloudflareClient,
                                                accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorResponseCollection] {.async.} =
  ## List configured monitors for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/monitors")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLoadBalancersMonitors*(client: CloudflareClient,
                                                 accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorResponseSingle] {.async.} =
  ## Create a configured monitor.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/load_balancers/monitors", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLoadBalancersMonitorsMonitorId*(client: CloudflareClient,
                                                         monitorId: types.LoadBalancingIdentifier,
                                                         accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorResponseSingle] {.async.} =
  ## List a single configured monitor for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/monitors/{monitorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdLoadBalancersMonitorsMonitorId*(client: CloudflareClient,
                                                         monitorId: types.LoadBalancingIdentifier,
                                                         accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorResponseSingle] {.async.} =
  ## Modify a configured monitor.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/load_balancers/monitors/{monitorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdLoadBalancersMonitorsMonitorId*(client: CloudflareClient,
                                                            monitorId: types.LoadBalancingIdentifier,
                                                            accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingIdResponse] {.async.} =
  ## Delete a configured monitor.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/load_balancers/monitors/{monitorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdLoadBalancersMonitorsMonitorId*(client: CloudflareClient,
                                                           monitorId: types.LoadBalancingIdentifier,
                                                           accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorResponseSingle] {.async.} =
  ## Apply changes to an existing monitor, overwriting the supplied properties.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/load_balancers/monitors/{monitorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLoadBalancersMonitorsMonitorIdPreview*(client: CloudflareClient,
                                                                 monitorId: types.LoadBalancingIdentifier,
                                                                 accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingPreviewResponse] {.async.} =
  ## Preview pools using the specified monitor with provided monitor details. The
  ## returned preview_id can be used in the preview endpoint to retrieve the results.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/load_balancers/monitors/{monitorId}/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingPreviewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLoadBalancersMonitorsMonitorIdReferences*(client: CloudflareClient,
                                                                   monitorId: types.LoadBalancingIdentifier,
                                                                   accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorReferencesResponse] {.async.} =
  ## Get the list of resources that reference the provided monitor.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/monitors/{monitorId}/references")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorReferencesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLoadBalancersPreviewPreviewId*(client: CloudflareClient,
                                                        previewId: types.LoadBalancingSchemasPreviewId,
                                                        accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingPreviewResultResponse] {.async.} =
  ## Get the result of a previous preview operation using the provided preview_id.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/preview/{previewId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingPreviewResultResponse)
  else:
    raise newException(CloudflareClientError, body)
