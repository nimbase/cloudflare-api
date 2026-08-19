# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdSecondaryDnsAclsRequest = object
    ip_range: types.SecondaryDnsIpRange
    name: types.SecondaryDnsName4

proc getAccountsAccountIdSecondaryDnsAcls*(client: CloudflareClient,
                                           accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsResponseCollection3] {.async.} =
  ## List ACLs.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secondary_dns/acls")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsResponseCollection3)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSecondaryDnsAcls*(client: CloudflareClient,
                                            accountId: types.SecondaryDnsAccountIdentifier,
                                            body: PostAccountsAccountIdSecondaryDnsAclsRequest): Future[types.SecondaryDnsSingleResponse3] {.async.} =
  ## Create ACL.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/secondary_dns/acls", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecondaryDnsAclsAclId*(client: CloudflareClient,
                                                aclId: types.SecondaryDnsIdentifier3,
                                                accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsSingleResponse3] {.async.} =
  ## Get ACL.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secondary_dns/acls/{aclId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSecondaryDnsAclsAclId*(client: CloudflareClient,
                                                aclId: types.SecondaryDnsIdentifier3,
                                                accountId: types.SecondaryDnsAccountIdentifier,
                                                body: types.SecondaryDnsAcl): Future[types.SecondaryDnsSingleResponse3] {.async.} =
  ## Modify ACL.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/secondary_dns/acls/{aclId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse3)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSecondaryDnsAclsAclId*(client: CloudflareClient,
                                                   aclId: types.SecondaryDnsIdentifier3,
                                                   accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsIdResponse3] {.async.} =
  ## Delete ACL.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/secondary_dns/acls/{aclId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsIdResponse3)
  else:
    raise newException(CloudflareClientError, body)
