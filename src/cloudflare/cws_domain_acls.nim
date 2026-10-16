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
  CwsDomainAclOrderOption* = enum
    orderName = "name"
    orderCreatedAt = "created_at"
    orderUpdatedAt = "updated_at"

  CwsDomainAclDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCwsDomainAcls*(client: CloudflareClient,
                                        accountId: string,
                                        cursor: string = default(string),
                                        perPage: int64 = 20,
                                        order: CwsDomainAclOrderOption = orderCreatedAt,
                                        direction: CwsDomainAclDirectionOption = directionAsc,
                                        name: string = default(string),
                                        deploymentId: string = default(string)): Future[types.CwsPageResponseDomainACL] {.async.} =
  ## Returns a paginated list of domain access control lists in the account.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["name"] = $name
  q["deployment_id"] = $deploymentId
  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/domain-acls", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsPageResponseDomainACL)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCwsDomainAcls*(client: CloudflareClient,
                                         accountId: string,
                                         body: types.CwsCreateDomainACLInputBody): Future[types.CwsResponseDomainACL] {.async.} =
  ## Creates a domain access control list with its default action and entries.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cws/domain-acls", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CwsResponseDomainACL)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCwsDomainAclsDomainAclId*(client: CloudflareClient,
                                                   accountId: string,
                                                   domainAclId: string): Future[types.CwsResponseDomainACL] {.async.} =
  ## Returns the domain access control list with the specified ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cws/domain-acls/{domainAclId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDomainACL)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCwsDomainAclsDomainAclId*(client: CloudflareClient,
                                                   accountId: string,
                                                   domainAclId: string,
                                                   body: types.CwsUpdateDomainACLInputBody): Future[types.CwsResponseDomainACL] {.async.} =
  ## Replaces the domain access control list's name, default action, and entries.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cws/domain-acls/{domainAclId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDomainACL)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCwsDomainAclsDomainAclId*(client: CloudflareClient,
                                                      accountId: string,
                                                      domainAclId: string): Future[types.CwsResponseDeletedResult] {.async.} =
  ## Deletes the domain ACL if it is not attached to a deployment.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cws/domain-acls/{domainAclId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CwsResponseDeletedResult)
  else:
    raise newException(CloudflareClientError, body)
