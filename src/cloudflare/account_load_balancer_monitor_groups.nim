# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdLoadBalancersMonitorGroups*(client: CloudflareClient,
                                                     accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorGroupResponseCollection] {.async.} =
  ## List configured monitor groups.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/monitor_groups")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorGroupResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLoadBalancersMonitorGroups*(client: CloudflareClient,
                                                      accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                                      body: types.LoadBalancingMonitorGroup): Future[types.LoadBalancingMonitorGroupSingleResponse] {.async.} =
  ## Create a new monitor group.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/load_balancers/monitor_groups", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorGroupSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupId*(client: CloudflareClient,
                                                                   monitorGroupId: types.LoadBalancingSchemasIdentifier,
                                                                   accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorGroupSingleResponse] {.async.} =
  ## Fetch a single configured monitor group.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/monitor_groups/{monitorGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorGroupSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupId*(client: CloudflareClient,
                                                                   monitorGroupId: types.LoadBalancingSchemasIdentifier,
                                                                   accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                                                   body: types.LoadBalancingMonitorGroup): Future[types.LoadBalancingMonitorGroupSingleResponse] {.async.} =
  ## Modify a configured monitor group.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/load_balancers/monitor_groups/{monitorGroupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorGroupSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupId*(client: CloudflareClient,
                                                                      monitorGroupId: types.LoadBalancingSchemasIdentifier,
                                                                      accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorGroupSingleResponse] {.async.} =
  ## Delete a configured monitor group.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/load_balancers/monitor_groups/{monitorGroupId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorGroupSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupId*(client: CloudflareClient,
                                                                     monitorGroupId: types.LoadBalancingSchemasIdentifier,
                                                                     accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                                                     body: types.LoadBalancingMonitorGroup): Future[types.LoadBalancingMonitorGroupSingleResponse] {.async.} =
  ## Apply changes to an existing monitor group, overwriting the supplied properties.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/load_balancers/monitor_groups/{monitorGroupId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorGroupSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLoadBalancersMonitorGroupsMonitorGroupIdReferences*(client: CloudflareClient,
                                                                             monitorGroupId: types.LoadBalancingIdentifier,
                                                                             accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingMonitorGroupReferencesResponse] {.async.} =
  ## Get the list of resources that reference the provided monitor group.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/monitor_groups/{monitorGroupId}/references")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingMonitorGroupReferencesResponse)
  else:
    raise newException(CloudflareClientError, body)
