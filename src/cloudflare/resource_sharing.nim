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
  ResourceSharingOrderOption* = enum
    orderName = "name"
    orderCreated = "created"

  ResourceSharingDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdShares*(client: CloudflareClient,
                                 accountId: types.ResourceSharingAccountId,
                                 status: types.ResourceSharingShareStatus = default(types.ResourceSharingShareStatus),
                                 kind: types.ResourceSharingShareKind = default(types.ResourceSharingShareKind),
                                 targetType: types.ResourceSharingShareTargetType = default(types.ResourceSharingShareTargetType),
                                 resourceTypes: seq[string] = @[],
                                 order: string = "created",
                                 direction: string = "asc", page: int64 = 1,
                                 perPage: int64 = 20,
                                 includeResources: bool = default(bool),
                                 includeRecipientCounts: bool = default(bool),
                                 tag: seq[string] = @[]): Future[types.ResourceSharingShareResponseCollection] {.async.} =
  ## Lists all account shares.

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  q["kind"] = $kind
  q["target_type"] = $targetType
  for v in resourceTypes: q["resource_types"] = $v
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  q["include_resources"] = $includeResources
  q["include_recipient_counts"] = $includeRecipientCounts
  for v in tag: q["tag"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/shares", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdShares*(client: CloudflareClient,
                                  accountId: types.ResourceSharingAccountId,
                                  body: types.ResourceSharingCreateShareRequest): Future[types.ResourceSharingShareResponseSingle] {.async.} =
  ## Creates a new resource share for sharing Cloudflare resources with other
  ## accounts or organizations.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/shares", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.ResourceSharingShareResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSharesShareId*(client: CloudflareClient,
                                        accountId: types.ResourceSharingAccountId,
                                        shareId: types.ResourceSharingShareId,
                                        includeResources: bool = default(bool),
                                        includeRecipientCounts: bool = default(bool)): Future[types.ResourceSharingShareResponseSingle] {.async.} =
  ## Fetches share by ID.

  var q = initOrderedTable[string, string]()
  q["include_resources"] = $includeResources
  q["include_recipient_counts"] = $includeRecipientCounts
  let res = await client.httpGET(fmt"/accounts/{accountId}/shares/{shareId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSharesShareId*(client: CloudflareClient,
                                        accountId: types.ResourceSharingAccountId,
                                        shareId: types.ResourceSharingShareId,
                                        body: types.ResourceSharingUpdateShareRequest): Future[types.ResourceSharingShareResponseSingle] {.async.} =
  ## Updates the share's display name and tags. This endpoint does **not**
  ## modify recipients or resources — those are managed via dedicated
  ## subresource endpoints:
  ##
  ## - **Recipients**: Use `POST /accounts/{account_id}/shares/{share_id}/recipients`
  ## to add a single recipient, `PUT
  ## /accounts/{account_id}/shares/{share_id}/recipients`
  ## to replace the full recipient list, or
  ## `DELETE /accounts/{account_id}/shares/{share_id}/recipients/{recipient_id}`
  ## to remove a recipient.
  ## - **Resources**: Use the share's resource subresource endpoints.
  ##
  ## Updating is not immediate; an updated share object with a new status
  ## will be returned.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/shares/{shareId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSharesShareId*(client: CloudflareClient,
                                           accountId: types.ResourceSharingAccountId,
                                           shareId: types.ResourceSharingShareId): Future[types.ResourceSharingShareResponseSingle] {.async.} =
  ## Deletion is not immediate, an updated share object with a new status will be
  ## returned.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/shares/{shareId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSharesShareIdExcludedRecipients*(client: CloudflareClient,
                                                          accountId: types.ResourceSharingAccountId,
                                                          shareId: types.ResourceSharingShareId,
                                                          page: int64 = 1,
                                                          perPage: int64 = 20): Future[types.ResourceSharingShareExcludedRecipientResponseCollection] {.async.} =
  ## Lists the accounts excluded from an organization-targeted share. Only valid for
  ## shares with `target_type=organization`.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/shares/{shareId}/excluded-recipients", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareExcludedRecipientResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSharesShareIdExcludedRecipients*(client: CloudflareClient,
                                                           accountId: types.ResourceSharingAccountId,
                                                           shareId: types.ResourceSharingShareId,
                                                           body: types.ResourceSharingCreateShareExcludedRecipientRequest): Future[types.ResourceSharingShareExcludedRecipientResponseSingle] {.async.} =
  ## Excludes a single account from an organization-targeted share. The share
  ## continues to target the entire organization, but the excluded account is skipped
  ## during reconciliation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/shares/{shareId}/excluded-recipients", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.ResourceSharingShareExcludedRecipientResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSharesShareIdExcludedRecipients*(client: CloudflareClient,
                                                          accountId: types.ResourceSharingAccountId,
                                                          shareId: types.ResourceSharingShareId,
                                                          body: types.ResourceSharingUpdateShareExcludedRecipientsRequest): Future[AsyncResponse] {.async.} =
  ## Reconciles a share's excluded recipients to match the given list. Only valid for
  ## shares with `target_type=organization`.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/shares/{shareId}/excluded-recipients", body)
  return res

proc getAccountsAccountIdSharesShareIdExcludedRecipientsExcludedRecipientId*(client: CloudflareClient,
                                                                             accountId: types.ResourceSharingAccountId,
                                                                             shareId: types.ResourceSharingShareId,
                                                                             excludedRecipientId: types.ResourceSharingExcludedRecipientId): Future[types.ResourceSharingShareExcludedRecipientResponseSingle] {.async.} =
  ## Gets a single excluded recipient of a share by its identifier tag.

  let res = await client.httpGET(fmt"/accounts/{accountId}/shares/{shareId}/excluded-recipients/{excludedRecipientId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareExcludedRecipientResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSharesShareIdExcludedRecipientsExcludedRecipientId*(client: CloudflareClient,
                                                                                accountId: types.ResourceSharingAccountId,
                                                                                shareId: types.ResourceSharingShareId,
                                                                                excludedRecipientId: types.ResourceSharingExcludedRecipientId): Future[types.ResourceSharingShareExcludedRecipientResponseSingle] {.async.} =
  ## Removes a single account from a share's excluded-recipient list. The account
  ## becomes eligible to receive the share again on the next reconciliation cycle.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/shares/{shareId}/excluded-recipients/{excludedRecipientId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareExcludedRecipientResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSharesShareIdRecipients*(client: CloudflareClient,
                                                  accountId: types.ResourceSharingAccountId,
                                                  shareId: types.ResourceSharingShareId,
                                                  includeResources: bool = default(bool),
                                                  page: int64 = 1,
                                                  perPage: int64 = 20): Future[types.ResourceSharingShareRecipientResponseCollection] {.async.} =
  ## List share recipients by share ID. Returns **all** recipients
  ## regardless of their `association_status` (associating, associated,
  ## disassociating, disassociated). Callers that want only "active"
  ## recipients must filter client-side on the `association_status` field.

  var q = initOrderedTable[string, string]()
  q["include_resources"] = $includeResources
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/shares/{shareId}/recipients", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareRecipientResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSharesShareIdRecipients*(client: CloudflareClient,
                                                   accountId: types.ResourceSharingAccountId,
                                                   shareId: types.ResourceSharingShareId,
                                                   body: types.ResourceSharingCreateShareRecipientRequest): Future[types.ResourceSharingShareRecipientResponseSingle] {.async.} =
  ## Adds a single recipient to an account-targeted resource share, granting
  ## them access to the shared resources. The recipient account must belong
  ## to the same organization as the share owner.
  ##
  ## To replace the entire recipient list in one call, use
  ## `PUT /accounts/{account_id}/shares/{share_id}/recipients` instead.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/shares/{shareId}/recipients", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.ResourceSharingShareRecipientResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSharesShareIdRecipients*(client: CloudflareClient,
                                                  accountId: types.ResourceSharingAccountId,
                                                  shareId: types.ResourceSharingShareId,
                                                  body: types.ResourceSharingUpdateShareRecipientsRequest): Future[AsyncResponse] {.async.} =
  ## Replaces the full recipient list for an account-targeted share. The
  ## server computes the diff between the current and desired recipients:
  ## new accounts are added, accounts no longer in the list are marked for
  ## disassociation, and unchanged accounts are left as-is.
  ##
  ## Returns an error if the share targets an organization
  ## (`target_type=organization`); org-targeted shares derive their
  ## recipients dynamically from org membership and cannot be modified
  ## through this endpoint.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/shares/{shareId}/recipients", body)
  return res

proc getAccountsAccountIdSharesShareIdRecipientsRecipientId*(client: CloudflareClient,
                                                             accountId: types.ResourceSharingAccountId,
                                                             shareId: types.ResourceSharingShareId,
                                                             recipientId: types.ResourceSharingRecipientId,
                                                             includeResources: bool = default(bool)): Future[types.ResourceSharingShareRecipientResponseSingle] {.async.} =
  ## Get share recipient by ID.

  var q = initOrderedTable[string, string]()
  q["include_resources"] = $includeResources
  let res = await client.httpGET(fmt"/accounts/{accountId}/shares/{shareId}/recipients/{recipientId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareRecipientResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSharesShareIdRecipientsRecipientId*(client: CloudflareClient,
                                                                accountId: types.ResourceSharingAccountId,
                                                                shareId: types.ResourceSharingShareId,
                                                                recipientId: types.ResourceSharingRecipientId): Future[types.ResourceSharingShareRecipientResponseSingle] {.async.} =
  ## Performs a **soft delete**: sets the recipient's
  ## `desired_association_status` to `disassociated`, which signals the
  ## background reconciliation workflow (Temporal) to remove the shared
  ## resources from the recipient account. The recipient record remains in
  ## the database for audit purposes and is still returned by
  ## `GET /accounts/{account_id}/shares/{share_id}/recipients` with its
  ## updated status.
  ##
  ## Resource access is not fully removed until the workflow completes and
  ## `current_association_status` transitions to `disassociated`. The
  ## recipient record itself is never physically deleted.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/shares/{shareId}/recipients/{recipientId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareRecipientResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSharesShareIdResources*(client: CloudflareClient,
                                                 accountId: types.ResourceSharingAccountId,
                                                 shareId: types.ResourceSharingShareId,
                                                 status: types.ResourceSharingResourceStatus = default(types.ResourceSharingResourceStatus),
                                                 resourceType: types.ResourceSharingResourceType = default(types.ResourceSharingResourceType),
                                                 page: int64 = 1,
                                                 perPage: int64 = 20): Future[types.ResourceSharingShareResourceResponseCollection] {.async.} =
  ## List share resources by share ID.

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  q["resource_type"] = $resourceType
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/shares/{shareId}/resources", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResourceResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSharesShareIdResources*(client: CloudflareClient,
                                                  accountId: types.ResourceSharingAccountId,
                                                  shareId: types.ResourceSharingShareId,
                                                  body: types.ResourceSharingCreateShareResourceRequest): Future[types.ResourceSharingShareResourceResponseSingle] {.async.} =
  ## Adds a resource to an existing share, making it available to share recipients.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/shares/{shareId}/resources", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.ResourceSharingShareResourceResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSharesShareIdResourcesShareResourceId*(client: CloudflareClient,
                                                                accountId: types.ResourceSharingAccountId,
                                                                shareId: types.ResourceSharingShareId,
                                                                shareResourceId: types.ResourceSharingResourceId): Future[types.ResourceSharingShareResourceResponseSingle] {.async.} =
  ## Get share resource by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/shares/{shareId}/resources/{shareResourceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResourceResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSharesShareIdResourcesShareResourceId*(client: CloudflareClient,
                                                                accountId: types.ResourceSharingAccountId,
                                                                shareId: types.ResourceSharingShareId,
                                                                shareResourceId: types.ResourceSharingResourceId,
                                                                body: types.ResourceSharingUpdateShareResourceRequest): Future[types.ResourceSharingShareResourceResponseSingle] {.async.} =
  ## Update is not immediate, an updated share resource object with a new status will
  ## be returned.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/shares/{shareId}/resources/{shareResourceId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResourceResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSharesShareIdResourcesShareResourceId*(client: CloudflareClient,
                                                                   accountId: types.ResourceSharingAccountId,
                                                                   shareId: types.ResourceSharingShareId,
                                                                   shareResourceId: types.ResourceSharingResourceId): Future[types.ResourceSharingShareResourceResponseSingle] {.async.} =
  ## Deletion is not immediate, an updated share resource object with a new status
  ## will be returned.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/shares/{shareId}/resources/{shareResourceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResourceResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getOrganizationsOrganizationIdShares*(client: CloudflareClient,
                                           organizationId: types.ResourceSharingOrganizationId,
                                           status: types.ResourceSharingShareStatus = default(types.ResourceSharingShareStatus),
                                           kind: types.ResourceSharingShareKind = default(types.ResourceSharingShareKind),
                                           targetType: types.ResourceSharingShareTargetType = default(types.ResourceSharingShareTargetType),
                                           resourceTypes: seq[string] = @[],
                                           order: string = "created",
                                           direction: string = "asc",
                                           page: int64 = 1, perPage: int64 = 20): Future[types.ResourceSharingShareResponseCollection] {.async.} =
  ## Lists all organization shares.

  var q = initOrderedTable[string, string]()
  q["status"] = $status
  q["kind"] = $kind
  q["target_type"] = $targetType
  for v in resourceTypes: q["resource_types"] = $v
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/organizations/{organizationId}/shares", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ResourceSharingShareResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
