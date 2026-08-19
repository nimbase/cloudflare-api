# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessIdentityProviders*(client: CloudflareClient,
                                                  accountId: types.AccessIdentifier,
                                                  scimEnabled: string = default(string),
                                                  page: int64 = 1,
                                                  perPage: int64 = 200): Future[types.AccessResponseCollection] {.async.} =
  ## Lists all configured identity providers.

  var q = initOrderedTable[string, string]()
  q["scim_enabled"] = $scimEnabled
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/identity_providers", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessIdentityProviders*(client: CloudflareClient,
                                                   accountId: types.AccessIdentifier,
                                                   body: types.AccessIdentityProviders): Future[types.AccessSingleResponse3] {.async.} =
  ## Adds a new identity provider to Access.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/identity_providers", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessIdentityProvidersIdentityProviderId*(client: CloudflareClient,
                                                                    identityProviderId: types.AccessUuid,
                                                                    accountId: types.AccessIdentifier): Future[types.AccessSingleResponse3] {.async.} =
  ## Fetches a configured identity provider.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/identity_providers/{identityProviderId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessIdentityProvidersIdentityProviderId*(client: CloudflareClient,
                                                                    identityProviderId: types.AccessUuid,
                                                                    accountId: types.AccessIdentifier,
                                                                    body: types.AccessIdentityProviders): Future[types.AccessSingleResponse3] {.async.} =
  ## Updates a configured identity provider.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/identity_providers/{identityProviderId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessIdentityProvidersIdentityProviderId*(client: CloudflareClient,
                                                                       identityProviderId: types.AccessUuid,
                                                                       accountId: types.AccessIdentifier): Future[types.AccessIdResponse] {.async.} =
  ## Deletes an identity provider from Access.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/identity_providers/{identityProviderId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessIdentityProvidersIdentityProviderIdSamlCertificate*(client: CloudflareClient,
                                                                                    accountId: types.AccessIdentifier,
                                                                                    identityProviderId: types.AccessUuid): Future[types.AccessSamlCertificateSetResponse] {.async.} =
  ## Creates a new SAML encryption certificate set and assigns it to the specified
  ## SAML Identity Provider. This endpoint is idempotent - if the IdP already has
  ## a certificate set assigned, the existing certificate set is returned with a 200
  ## status.
  ##
  ## **Workflow for enabling SAML encryption:**
  ## 1. Call this endpoint to create and assign a certificate set to the IdP
  ## 2. Update the IdP configuration (PUT `/identity_providers/{id}`) with:
  ## - `config.enable_encryption: true`
  ## - `saml_certificate_set_id: <uid from step 1>`
  ## 3. Configure the certificate's public key in your external SAML Identity
  ## Provider

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/identity_providers/{identityProviderId}/saml_certificate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSamlCertificateSetResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessIdentityProvidersIdentityProviderIdScimGroups*(client: CloudflareClient,
                                                                              identityProviderId: types.AccessUuid,
                                                                              accountId: types.AccessIdentifier,
                                                                              cfResourceId: types.AccessCfResourceId = default(types.AccessCfResourceId),
                                                                              idpResourceId: types.AccessIdpResourceId = default(types.AccessIdpResourceId),
                                                                              name: types.AccessName4 = default(types.AccessName4),
                                                                              page: int64 = 1,
                                                                              perPage: int64 = 100): Future[types.AccessScimGroupsResponse] {.async.} =
  ## Lists SCIM Group resources synced to Cloudflare via the System for Cross-domain
  ## Identity Management (SCIM).

  var q = initOrderedTable[string, string]()
  q["cf_resource_id"] = $cfResourceId
  q["idp_resource_id"] = $idpResourceId
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/identity_providers/{identityProviderId}/scim/groups", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessScimGroupsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessIdentityProvidersIdentityProviderIdScimUsers*(client: CloudflareClient,
                                                                             identityProviderId: types.AccessUuid,
                                                                             accountId: types.AccessIdentifier,
                                                                             cfResourceId: types.AccessCfResourceId2 = default(types.AccessCfResourceId2),
                                                                             idpResourceId: types.AccessIdpResourceId2 = default(types.AccessIdpResourceId2),
                                                                             username: types.AccessUsername = default(types.AccessUsername),
                                                                             email: types.AccessEmail = default(types.AccessEmail),
                                                                             name: types.AccessName5 = default(types.AccessName5),
                                                                             page: int64 = 1,
                                                                             perPage: int64 = 100): Future[types.AccessScimUsersResponse] {.async.} =
  ## Lists SCIM User resources synced to Cloudflare via the System for Cross-domain
  ## Identity Management (SCIM).

  var q = initOrderedTable[string, string]()
  q["cf_resource_id"] = $cfResourceId
  q["idp_resource_id"] = $idpResourceId
  q["username"] = $username
  q["email"] = $email
  q["name"] = $name
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/identity_providers/{identityProviderId}/scim/users", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessScimUsersResponse)
  else:
    raise newException(CloudflareClientError, body)
