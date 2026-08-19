# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  GetTenantsTenantIdResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiTenant
    success: bool
  GetTenantsTenantIdAccountTypesResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[string]
    success: bool
  GetTenantsTenantIdAccountsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiAccount]
    success: bool
  GetTenantsTenantIdEntitlementsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: types.OrganizationsApiInnateEntitlements
    success: bool
  GetTenantsTenantIdMembershipsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiTenantMembership]
    success: bool

proc getTenantsTenantId*(client: CloudflareClient, tenantId: string): Future[GetTenantsTenantIdResponse] {.async.} =
  ## Retrieves a Tenant by Tenant ID.

  let res = await client.httpGET(fmt"/tenants/{tenantId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetTenantsTenantIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getTenantsTenantIdAccountTypes*(client: CloudflareClient, tenantId: string): Future[GetTenantsTenantIdAccountTypesResponse] {.async.} =
  ## List of account types available for the Tenant to provision accounts.

  let res = await client.httpGET(fmt"/tenants/{tenantId}/account_types")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetTenantsTenantIdAccountTypesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getTenantsTenantIdAccounts*(client: CloudflareClient, tenantId: string): Future[GetTenantsTenantIdAccountsResponse] {.async.} =
  ## List of accounts for the Tenant.

  let res = await client.httpGET(fmt"/tenants/{tenantId}/accounts")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetTenantsTenantIdAccountsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getTenantsTenantIdEntitlements*(client: CloudflareClient, tenantId: string): Future[GetTenantsTenantIdEntitlementsResponse] {.async.} =
  ## List of innate entitlements available for the Tenant.

  let res = await client.httpGET(fmt"/tenants/{tenantId}/entitlements")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetTenantsTenantIdEntitlementsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getTenantsTenantIdMemberships*(client: CloudflareClient, tenantId: string): Future[GetTenantsTenantIdMembershipsResponse] {.async.} =
  ## List of active members (Cloudflare users) for the Tenant.

  let res = await client.httpGET(fmt"/tenants/{tenantId}/memberships")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetTenantsTenantIdMembershipsResponse)
  else:
    raise newException(CloudflareClientError, body)
