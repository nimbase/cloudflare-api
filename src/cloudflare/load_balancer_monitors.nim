# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getUserLoadBalancersMonitors*(client: CloudflareClient): Future[types.LoadBalancingMonitorResponseCollection] {.async.} =
  ## List configured monitors for a user.

  let res = await client.httpGET("/user/load_balancers/monitors")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postUserLoadBalancersMonitors*(client: CloudflareClient): Future[types.LoadBalancingMonitorResponseSingle] {.async.} =
  ## Create a configured monitor.

  let res = await client.httpPOST("/user/load_balancers/monitors", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getUserLoadBalancersMonitorsMonitorId*(client: CloudflareClient,
                                            monitorId: types.LoadBalancingIdentifier): Future[types.LoadBalancingMonitorResponseSingle] {.async.} =
  ## List a single configured monitor for a user.

  let res = await client.httpGET(fmt"/user/load_balancers/monitors/{monitorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putUserLoadBalancersMonitorsMonitorId*(client: CloudflareClient,
                                            monitorId: types.LoadBalancingIdentifier): Future[types.LoadBalancingMonitorResponseSingle] {.async.} =
  ## Modify a configured monitor.

  let res = await client.httpPUT(fmt"/user/load_balancers/monitors/{monitorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteUserLoadBalancersMonitorsMonitorId*(client: CloudflareClient,
                                               monitorId: types.LoadBalancingIdentifier): Future[types.LoadBalancingIdResponse] {.async.} =
  ## Delete a configured monitor.

  let res = await client.httpDELETE(fmt"/user/load_balancers/monitors/{monitorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchUserLoadBalancersMonitorsMonitorId*(client: CloudflareClient,
                                              monitorId: types.LoadBalancingIdentifier): Future[types.LoadBalancingMonitorResponseSingle] {.async.} =
  ## Apply changes to an existing monitor, overwriting the supplied properties.

  let res = await client.httpPATCH(fmt"/user/load_balancers/monitors/{monitorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postUserLoadBalancersMonitorsMonitorIdPreview*(client: CloudflareClient,
                                                    monitorId: types.LoadBalancingIdentifier): Future[types.LoadBalancingPreviewResponse] {.async.} =
  ## Preview pools using the specified monitor with provided monitor details. The
  ## returned preview_id can be used in the preview endpoint to retrieve the results.

  let res = await client.httpPOST(fmt"/user/load_balancers/monitors/{monitorId}/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingPreviewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserLoadBalancersMonitorsMonitorIdReferences*(client: CloudflareClient,
                                                      monitorId: types.LoadBalancingIdentifier): Future[types.LoadBalancingMonitorReferencesResponse] {.async.} =
  ## Get the list of resources that reference the provided monitor.

  let res = await client.httpGET(fmt"/user/load_balancers/monitors/{monitorId}/references")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorReferencesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserLoadBalancersPreviewPreviewId*(client: CloudflareClient,
                                           previewId: types.LoadBalancingPreviewId): Future[types.LoadBalancingPreviewResultResponse] {.async.} =
  ## Get the result of a previous preview operation using the provided preview_id.

  let res = await client.httpGET(fmt"/user/load_balancers/preview/{previewId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingPreviewResultResponse)
  else:
    raise newException(CloudflareClientError, body)
