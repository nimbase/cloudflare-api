# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicSitesSiteIdAcls*(client: CloudflareClient,
                                               accountId: types.MagicIdentifier,
                                               siteId: types.MagicIdentifier): Future[types.MagicAclsCollectionResponse] {.async.} =
  ## Lists Site ACLs associated with an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}/acls")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAclsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicSitesSiteIdAcls*(client: CloudflareClient,
                                                accountId: types.MagicIdentifier,
                                                siteId: types.MagicIdentifier,
                                                body: types.MagicAclsAddSingleRequest): Future[types.MagicAclSingleResponse] {.async.} =
  ## Creates a new Site ACL.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/sites/{siteId}/acls", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAclSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMagicSitesSiteIdAclsAclId*(client: CloudflareClient,
                                                    siteId: types.MagicIdentifier,
                                                    accountId: types.MagicIdentifier,
                                                    aclId: types.MagicIdentifier): Future[types.MagicAclSingleResponse] {.async.} =
  ## Get a specific Site ACL.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}/acls/{aclId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAclSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicSitesSiteIdAclsAclId*(client: CloudflareClient,
                                                    siteId: types.MagicIdentifier,
                                                    accountId: types.MagicIdentifier,
                                                    aclId: types.MagicIdentifier,
                                                    body: types.MagicAclUpdateRequest): Future[types.MagicAclModifiedResponse] {.async.} =
  ## Update a specific Site ACL.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/sites/{siteId}/acls/{aclId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAclModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicSitesSiteIdAclsAclId*(client: CloudflareClient,
                                                       siteId: types.MagicIdentifier,
                                                       accountId: types.MagicIdentifier,
                                                       aclId: types.MagicIdentifier): Future[types.MagicAclDeletedResponse] {.async.} =
  ## Remove a specific Site ACL.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/sites/{siteId}/acls/{aclId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAclDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicSitesSiteIdAclsAclId*(client: CloudflareClient,
                                                      siteId: types.MagicIdentifier,
                                                      accountId: types.MagicIdentifier,
                                                      aclId: types.MagicIdentifier,
                                                      body: types.MagicAclUpdateRequest): Future[types.MagicAclModifiedResponse] {.async.} =
  ## Patch a specific Site ACL.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/sites/{siteId}/acls/{aclId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAclModifiedResponse)
  else:
    raise newException(CloudflareClientError, body)
