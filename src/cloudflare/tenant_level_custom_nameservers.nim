# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getTenantsTenantTagCustomNs*(client: CloudflareClient,
                                  tenantTag: types.DnsCustomNameserversIdentifier3): Future[types.DnsCustomNameserversTcnsResponseCollection] {.async.} =
  ## List a tenant's custom nameservers.

  let res = await client.httpGET(fmt"/tenants/{tenantTag}/custom_ns")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsCustomNameserversTcnsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postTenantsTenantTagCustomNs*(client: CloudflareClient,
                                   tenantTag: types.DnsCustomNameserversIdentifier3,
                                   body: types.DnsCustomNameserversCustomNSInput): Future[types.DnsCustomNameserversTcnsResponseSingle] {.async.} =
  ## Add Tenant Custom Nameserver

  let res = await client.httpPOST(fmt"/tenants/{tenantTag}/custom_ns", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsCustomNameserversTcnsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteTenantsTenantTagCustomNsCustomNsId*(client: CloudflareClient,
                                               customNsId: types.DnsCustomNameserversNsName,
                                               tenantTag: types.DnsCustomNameserversIdentifier3): Future[types.DnsCustomNameserversEmptyResponse] {.async.} =
  ## Delete Tenant Custom Nameserver

  let res = await client.httpDELETE(fmt"/tenants/{tenantTag}/custom_ns/{customNsId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsCustomNameserversEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)
