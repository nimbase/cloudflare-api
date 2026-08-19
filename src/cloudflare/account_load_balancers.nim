# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdLoadBalancers*(client: CloudflareClient,
                                        accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingLoadBalancerComponentsSchemasResponseCollection] {.async.} =
  ## List configured account-scoped load balancers.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdLoadBalancers*(client: CloudflareClient,
                                         accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse] {.async.} =
  ## Create a new account-scoped load balancer.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/load_balancers", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLoadBalancersUsage*(client: CloudflareClient,
                                             accountId: types.LoadBalancingComponentsSchemasIdentifier): Future[types.LoadBalancingLoadBalancerComponentsSchemasUsageResponse] {.async.} =
  ## Get current load balancer resource usage counts for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/usage")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasUsageResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdLoadBalancersLoadBalancerId*(client: CloudflareClient,
                                                      accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                                      loadBalancerId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier): Future[types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse] {.async.} =
  ## Fetch a single configured account-scoped load balancer.

  let res = await client.httpGET(fmt"/accounts/{accountId}/load_balancers/{loadBalancerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdLoadBalancersLoadBalancerId*(client: CloudflareClient,
                                                      accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                                      loadBalancerId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier): Future[types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse] {.async.} =
  ## Update a configured account-scoped load balancer.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/load_balancers/{loadBalancerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdLoadBalancersLoadBalancerId*(client: CloudflareClient,
                                                         accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                                         loadBalancerId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier): Future[types.LoadBalancingComponentsSchemasIdResponse] {.async.} =
  ## Delete a configured account-scoped load balancer.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/load_balancers/{loadBalancerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingComponentsSchemasIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdLoadBalancersLoadBalancerId*(client: CloudflareClient,
                                                        accountId: types.LoadBalancingComponentsSchemasIdentifier,
                                                        loadBalancerId: types.LoadBalancingLoadBalancerComponentsSchemasIdentifier): Future[types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse] {.async.} =
  ## Apply changes to an existing account-scoped load balancer, overwriting the
  ## supplied properties.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/load_balancers/{loadBalancerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingLoadBalancerComponentsSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
