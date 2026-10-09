# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdBillableUsage*(client: CloudflareClient,
                                        accountId: types.BillableUsageApiIdentifier,
                                        `from`: string = default(string),
                                        to: string = default(string)): Future[types.BillableUsageApiV2UsageResponse] {.async.} =
  ## Returns cost and usage data for a single Cloudflare account, aligned
  ## with the [FinOps FOCUS v1.3](https://focus.finops.org/focus-specification/v1-3/)
  ## Cost and Usage dataset specification.
  ##
  ## Each record represents one billable metric for one account on one day.
  ## This includes all metered usage, including usage that falls within
  ## free-tier allowances and may result in zero cost.
  ##
  ## **Note:** This endpoint serves `usage` records only; cost and pricing
  ## fields are absent from responses. To retrieve rated costs, use `POST`
  ## on the same path with `Metric: cost`.
  ##
  ## When `from` and `to` are omitted, defaults to the start of the current
  ## month through today. The maximum date range is 31 days.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  let res = await client.httpGET(fmt"/accounts/{accountId}/billable/usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillableUsageApiV2UsageResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdBillableUsage*(client: CloudflareClient,
                                         accountId: types.BillableUsageApiIdentifier,
                                         body: types.BillableUsageApiV2UsageQuery): Future[types.BillableUsageApiV2UsageResponse] {.async.} =
  ## Returns cost and usage data for a single Cloudflare account, aligned
  ## with the [FinOps FOCUS v1.3](https://focus.finops.org/focus-specification/v1-3/)
  ## Cost and Usage dataset specification.
  ##
  ## This is the filterable counterpart to `GET` on the same path. It is a
  ## read-only operation and requires only the `#billing:read` permission;
  ## `POST` is used so that filter criteria can be supplied in a request body
  ## rather than in the query string.
  ##
  ## Each record represents one billable metric for one account on one day.
  ## This includes all metered usage, including usage that falls within
  ## free-tier allowances and may result in zero cost.
  ##
  ## **Note:** Cost and pricing fields are populated only when `Metric`
  ## is `cost`; otherwise they are absent from responses.
  ##
  ## The request body is optional. When it is omitted, or when `TimePeriod`
  ## is omitted, the range defaults to the start of the current month through
  ## today. The maximum date range is 31 days.
  ##
  ## Filters of different kinds are combined with AND. Values within one tag
  ## filter are combined with OR. Filter values that do not match usage
  ## produce an empty result set.
  ##
  ## Results can be grouped by up to two groups, in any combination of
  ## dimension keys and resource-tag keys. Tag groups are returned in the
  ## `Tags` field. Usage without a requested tag remains in an untagged
  ## group, with that key omitted from `Tags`.
  ##
  ## Requests that use tag filtering or tag grouping return HTTP 400 when the
  ## underlying usage data source does not support tags.
  ##
  ## Requests that use dimension grouping return HTTP 400 when the
  ## underlying usage data source does not support dimensions.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/billable/usage", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillableUsageApiV2UsageResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdBillableUsageBillableMetrics*(client: CloudflareClient,
                                                       accountId: types.BillableUsageApiIdentifier,
                                                       `from`: string = default(string),
                                                       to: string = default(string)): Future[types.BillableUsageApiV2AccountBillableMetricsResponse] {.async.} =
  ## Lists billable metrics available to the account through contracts and
  ## subscriptions that overlap the requested period. Results are
  ## deduplicated and ordered. If no qualifying contract exists, the
  ## result is an empty array.
  ##
  ## When `from` and `to` are omitted, the period defaults to the start of
  ## the current month through today. The maximum date range is 31 days.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  let res = await client.httpGET(fmt"/accounts/{accountId}/billable/usage/billable-metrics", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillableUsageApiV2AccountBillableMetricsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationIdBillableUsage*(client: CloudflareClient,
                                                  organizationId: types.BillableUsageApiIdentifier,
                                                  `from`: string = default(string),
                                                  to: string = default(string)): Future[types.BillableUsageApiV2UsageResponse] {.async.} =
  ## Returns cost and usage data for all accounts within an organization,
  ## aligned with the [FinOps FOCUS
  ## v1.3](https://focus.finops.org/focus-specification/v1-3/)
  ## Cost and Usage dataset specification.
  ##
  ## Each record represents one billable metric for one account on one day.
  ## This includes all metered usage, including usage that falls within
  ## free-tier allowances and may result in zero cost. The response
  ## includes usage for every account belonging to the specified
  ## organization.
  ##
  ## **Note:** This endpoint serves `usage` records only; cost and pricing
  ## fields are absent from responses. Rated costs are available per
  ## account via `POST /accounts/{account_id}/billable/usage` with
  ## `Metric: cost`.
  ##
  ## When `from` and `to` are omitted, defaults to the start of the current
  ## month through today. The maximum date range is 31 days.
  ##
  ## An organization with no accounts, or an organization ID that does not
  ## exist, returns a successful response with an empty result set rather
  ## than an error.

  var q = initOrderedTable[string, string]()
  q["from"] = $`from`
  q["to"] = $to
  let res = await client.httpGET(fmt"/organizations/{organizationId}/billable/usage", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.BillableUsageApiV2UsageResponse)
  else:
    raise newException(CloudflareClientError, body)
