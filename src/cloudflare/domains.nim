# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersDomains*(client: CloudflareClient,
                                         accountId: types.WorkersIdentifier,
                                         zoneId: string = default(string),
                                         zoneName: string = default(string),
                                         service: string = default(string),
                                         hostname: string = default(string),
                                         environment: string = default(string)): Future[JsonNode] {.async.} =
  ## Lists all domains for an account.

  var q = initOrderedTable[string, string]()
  q["zone_id"] = $zoneId
  q["zone_name"] = $zoneName
  q["service"] = $service
  q["hostname"] = $hostname
  q["environment"] = $environment
  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/domains", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdWorkersDomains*(client: CloudflareClient,
                                         accountId: types.WorkersIdentifier): Future[JsonNode] {.async.} =
  ## Attaches a domain that routes traffic to a Worker.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/domains", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersDomainsDomainId*(client: CloudflareClient,
                                                 accountId: types.WorkersIdentifier,
                                                 domainId: string): Future[JsonNode] {.async.} =
  ## Gets information about a domain.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/domains/{domainId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdWorkersDomainsDomainId*(client: CloudflareClient,
                                                    accountId: types.WorkersIdentifier,
                                                    domainId: string): Future[types.WorkersApiResponseCommon] {.async.} =
  ## Detaches a domain from a Worker. Both the Worker and all of its previews are no
  ## longer routable using this domain.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/workers/domains/{domainId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
