# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdScimV2ResourceTypes*(client: CloudflareClient,
                                              accountId: types.IamAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Returns the list of SCIM resource types supported by the Cloudflare SCIM service
  ## (RFC 7643 Section 6, RFC 7644 Section 4). Clients use this to discover available
  ## resource categories (e.g. Users, Groups) and their associated schemas. Query
  ## parameters are not supported on this endpoint.

  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/ResourceTypes")
  return res

proc getAccountsAccountIdScimV2ResourceTypesResourceTypeId*(client: CloudflareClient,
                                                            accountId: types.IamAccountIdentifier,
                                                            resourceTypeId: ResourceTypeId): Future[AsyncResponse] {.async.} =
  ## Returns a single SCIM resource type by ID (RFC 7643 Section 6). Valid IDs are
  ## `User` and `Group`.

  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/ResourceTypes/{resourceTypeId}")
  return res

proc getAccountsAccountIdScimV2Schemas*(client: CloudflareClient,
                                        accountId: types.IamAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Returns the list of SCIM schemas supported by the Cloudflare SCIM service (RFC
  ## 7643 Section 7, RFC 7644 Section 4). Clients use this to introspect the
  ## attributes of each resource type. Query parameters are not supported on this
  ## endpoint.

  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/Schemas")
  return res

proc getAccountsAccountIdScimV2SchemasSchemaId*(client: CloudflareClient,
                                                accountId: types.IamAccountIdentifier,
                                                schemaId: string): Future[AsyncResponse] {.async.} =
  ## Returns a single SCIM schema definition by schema URI ID (RFC 7643 Section 7).
  ## Valid IDs are `urn:ietf:params:scim:schemas:core:2.0:User` and
  ## `urn:ietf:params:scim:schemas:core:2.0:Group`.

  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/Schemas/{schemaId}")
  return res

proc getAccountsAccountIdScimV2ServiceProviderConfig*(client: CloudflareClient,
                                                      accountId: types.IamAccountIdentifier): Future[AsyncResponse] {.async.} =
  ## Returns the SCIM 2.0 Service Provider configuration (RFC 7643 Section 5). IdPs
  ## use this endpoint to auto-configure their SCIM integration with Cloudflare,
  ## discovering which optional features (patch, bulk, filter, etc.) are supported.

  let res = await client.httpGET(fmt"/accounts/{accountId}/scim/v2/ServiceProviderConfig")
  return res
