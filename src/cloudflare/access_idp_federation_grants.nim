# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdAccessIdpFederationGrants*(client: CloudflareClient,
                                                    accountId: types.AccessIdentifier): Future[types.AccessIdpFederationGrantListResponse] {.async.} =
  ## Lists the IdP federation grants owned by the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/idp_federation_grants")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessIdpFederationGrantListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessIdpFederationGrants*(client: CloudflareClient,
                                                     accountId: types.AccessIdentifier,
                                                     body: types.AccessIdpFederationGrantCreateRequest): Future[types.AccessIdpFederationGrantResponse] {.async.} =
  ## Creates an IdP federation grant for the specified identity provider, making it
  ## available for federation to other accounts in the same Cloudflare organization.
  ##
  ## The account must belong to a Cloudflare organization. One-time pin and
  ## Cloudflare-managed identity providers cannot be federated. An account
  ## can federate at most five identity providers at a time.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/idp_federation_grants", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessIdpFederationGrantResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessIdpFederationGrantsGrantId*(client: CloudflareClient,
                                                           accountId: types.AccessIdentifier,
                                                           grantId: types.AccessIdentifier): Future[types.AccessIdpFederationGrantResponse] {.async.} =
  ## Retrieves a single IdP federation grant by its UID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/idp_federation_grants/{grantId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessIdpFederationGrantResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessIdpFederationGrantsGrantId*(client: CloudflareClient,
                                                              accountId: types.AccessIdentifier,
                                                              grantId: types.AccessIdentifier): Future[types.AccessIdpFederationGrantIdResponse] {.async.} =
  ## Deletes an IdP federation grant. The identity provider remains in the account,
  ## but it is no longer available for federation to other accounts.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/idp_federation_grants/{grantId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdpFederationGrantIdResponse)
  else:
    raise newException(CloudflareClientError, body)
