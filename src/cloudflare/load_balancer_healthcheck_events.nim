# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import ./private/metaclient
import ./private/types


proc getUserLoadBalancingAnalyticsEvents*(client: CloudflareClient,
                                          until: types.LoadBalancingUntil = default(types.LoadBalancingUntil),
                                          poolName: types.LoadBalancingPoolName = default(types.LoadBalancingPoolName),
                                          originHealthy: types.LoadBalancingOriginHealthy2 = default(types.LoadBalancingOriginHealthy2),
                                          poolId: types.LoadBalancingSchemasIdentifier = default(types.LoadBalancingSchemasIdentifier),
                                          since: string = default(string),
                                          originName: string = default(string),
                                          poolHealthy: bool = true): Future[types.LoadBalancingComponentsSchemasResponseCollection] {.async.} =
  ## List origin health changes.

  var q = initOrderedTable[string, string]()
  q["until"] = $until
  q["pool_name"] = $poolName
  q["origin_healthy"] = $originHealthy
  q["pool_id"] = $poolId
  q["since"] = $since
  q["origin_name"] = $originName
  q["pool_healthy"] = $poolHealthy
  let res = await client.httpGET("/user/load_balancing_analytics/events", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.LoadBalancingComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
