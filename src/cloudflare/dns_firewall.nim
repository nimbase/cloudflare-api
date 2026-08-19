# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDnsFirewall*(client: CloudflareClient,
                                      accountId: types.DnsFirewallIdentifier,
                                      page: float64 = default(float64),
                                      perPage: float64 = default(float64)): Future[types.DnsFirewallDnsFirewallResponseCollection] {.async.} =
  ## List DNS Firewall clusters for an account

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_firewall", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsFirewallDnsFirewallResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDnsFirewall*(client: CloudflareClient,
                                       accountId: types.DnsFirewallIdentifier,
                                       body: types.DnsFirewallDnsFirewallClusterPost): Future[types.DnsFirewallDnsFirewallSingleResponse] {.async.} =
  ## Create a DNS Firewall cluster

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dns_firewall", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsFirewallDnsFirewallSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDnsFirewallDnsFirewallId*(client: CloudflareClient,
                                                   dnsFirewallId: types.DnsFirewallIdentifier,
                                                   accountId: types.DnsFirewallIdentifier): Future[types.DnsFirewallDnsFirewallSingleResponse] {.async.} =
  ## Show a single DNS Firewall cluster for an account

  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_firewall/{dnsFirewallId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsFirewallDnsFirewallSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDnsFirewallDnsFirewallId*(client: CloudflareClient,
                                                      dnsFirewallId: types.DnsFirewallIdentifier,
                                                      accountId: types.DnsFirewallIdentifier): Future[JsonNode] {.async.} =
  ## Delete a DNS Firewall cluster

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dns_firewall/{dnsFirewallId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDnsFirewallDnsFirewallId*(client: CloudflareClient,
                                                     dnsFirewallId: types.DnsFirewallIdentifier,
                                                     accountId: types.DnsFirewallIdentifier,
                                                     body: types.DnsFirewallDnsFirewallClusterPatch): Future[types.DnsFirewallDnsFirewallSingleResponse] {.async.} =
  ## Modify the configuration of a DNS Firewall cluster

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/dns_firewall/{dnsFirewallId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsFirewallDnsFirewallSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDnsFirewallDnsFirewallIdReverseDns*(client: CloudflareClient,
                                                             dnsFirewallId: types.DnsFirewallIdentifier,
                                                             accountId: types.DnsFirewallIdentifier): Future[types.DnsFirewallDnsFirewallReverseDnsResponse2] {.async.} =
  ## Show reverse DNS configuration (PTR records) for a DNS Firewall cluster

  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_firewall/{dnsFirewallId}/reverse_dns")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsFirewallDnsFirewallReverseDnsResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDnsFirewallDnsFirewallIdReverseDns*(client: CloudflareClient,
                                                               dnsFirewallId: types.DnsFirewallIdentifier,
                                                               accountId: types.DnsFirewallIdentifier,
                                                               body: types.DnsFirewallDnsFirewallReverseDnsPatch): Future[types.DnsFirewallDnsFirewallReverseDnsResponse2] {.async.} =
  ## Update reverse DNS configuration (PTR records) for a DNS Firewall cluster

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/dns_firewall/{dnsFirewallId}/reverse_dns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsFirewallDnsFirewallReverseDnsResponse2)
  else:
    raise newException(CloudflareClientError, body)
