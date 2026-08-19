# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdGatewayListsRequest = object
    description: Option[types.ZeroTrustGatewayDescription]
    items: Option[types.ZeroTrustGatewayItemsInput]
    name: types.ZeroTrustGatewayName
    `type`: types.ZeroTrustGatewayType2
  PutAccountsAccountIdGatewayListsListIdRequest = object
    description: Option[types.ZeroTrustGatewayDescription]
    items: Option[types.ZeroTrustGatewayItemsInput]
    name: types.ZeroTrustGatewayName
  PatchAccountsAccountIdGatewayListsListIdRequest = object
    append: Option[types.ZeroTrustGatewayItemsInput]
    remove: Option[seq[types.ZeroTrustGatewayValue]]

proc getAccountsAccountIdGatewayLists*(client: CloudflareClient,
                                       accountId: types.ZeroTrustGatewayIdentifier2,
                                       `type`: types.ZeroTrustGatewayType2 = default(types.ZeroTrustGatewayType2)): Future[types.ZeroTrustGatewayResponseCollection3] {.async.} =
  ## Fetch all Zero Trust lists for an account.

  var q = initOrderedTable[string, string]()
  q["type"] = $`type`
  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/lists", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayResponseCollection3)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayLists*(client: CloudflareClient,
                                        accountId: types.ZeroTrustGatewayIdentifier2,
                                        body: PostAccountsAccountIdGatewayListsRequest): Future[types.ZeroTrustGatewaySingleResponseWithListItems] {.async.} =
  ## Creates a new Zero Trust list.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/lists", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponseWithListItems)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayListsUpload*(client: CloudflareClient,
                                              accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayCsvOperationSingleResponse] {.async.} =
  ## Create a new Zero Trust list by uploading a CSV file. The file must be
  ## `text/csv` or `text/plain` and cannot exceed 2 MB. The operation is processed
  ## asynchronously. Use the returned operation ID to poll for status.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/lists/upload")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayCsvOperationSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayListsListId*(client: CloudflareClient,
                                             listId: types.ZeroTrustGatewayUuid2,
                                             accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayListSingleResponse] {.async.} =
  ## Fetch a single Zero Trust list.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/lists/{listId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayListSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdGatewayListsListId*(client: CloudflareClient,
                                             listId: types.ZeroTrustGatewayUuid2,
                                             accountId: types.ZeroTrustGatewayIdentifier2,
                                             body: PutAccountsAccountIdGatewayListsListIdRequest): Future[types.ZeroTrustGatewayListSingleResponse] {.async.} =
  ## Updates a configured Zero Trust list. Skips updating list items if not included
  ## in the payload. A non empty list items will overwrite the existing list.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/gateway/lists/{listId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayListSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdGatewayListsListId*(client: CloudflareClient,
                                                listId: types.ZeroTrustGatewayUuid2,
                                                accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayEmptyResponse] {.async.} =
  ## Deletes a Zero Trust list.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/gateway/lists/{listId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayEmptyResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdGatewayListsListId*(client: CloudflareClient,
                                               listId: types.ZeroTrustGatewayUuid2,
                                               accountId: types.ZeroTrustGatewayIdentifier2,
                                               body: PatchAccountsAccountIdGatewayListsListIdRequest): Future[types.ZeroTrustGatewayListSingleResponse] {.async.} =
  ## Appends or removes an item from a configured Zero Trust list.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/gateway/lists/{listId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayListSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayListsListIdItems*(client: CloudflareClient,
                                                  listId: types.ZeroTrustGatewayUuid2,
                                                  accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewayListItemResponseCollection] {.async.} =
  ## Fetch all items in a single Zero Trust list.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/lists/{listId}/items")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayListItemResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
