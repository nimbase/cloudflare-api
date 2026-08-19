# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdRulesListsRequest = object
    description: Option[types.ListsDescription]
    kind: types.ListsKind
    name: types.ListsName
  PutAccountsAccountIdRulesListsListIdRequest = object
    description: Option[types.ListsDescription]
  DeleteAccountsAccountIdRulesListsListIdItemsRequest = object
    items: Option[seq[JsonNode]]

proc getAccountsAccountIdRulesLists*(client: CloudflareClient,
                                     accountId: types.ListsAccountId): Future[types.ListsListsResponseCollection] {.async.} =
  ## Fetches all lists in the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rules/lists")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsListsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRulesLists*(client: CloudflareClient,
                                      accountId: types.ListsAccountId,
                                      body: PostAccountsAccountIdRulesListsRequest): Future[types.ListsListResponseCollection] {.async.} =
  ## Creates a new list of the specified kind.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/rules/lists", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsListResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesListsBulkOperationsOperationId*(client: CloudflareClient,
                                                              operationId: types.ListsOperationId,
                                                              accountId: types.ListsAccountId): Future[types.ListsBulkOperationResponseSingle] {.async.} =
  ## Gets the current status of an asynchronous operation on a list.
  ##
  ## The `status` property can have one of the following values: `pending`,
  ## `running`, `completed`, or `failed`. If the status is `failed`, the `error`
  ## property will contain a message describing the error.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rules/lists/bulk_operations/{operationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsBulkOperationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesListsListId*(client: CloudflareClient,
                                           listId: types.ListsListId,
                                           accountId: types.ListsAccountId): Future[types.ListsListResponseCollection] {.async.} =
  ## Fetches the details of a list.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rules/lists/{listId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsListResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRulesListsListId*(client: CloudflareClient,
                                           listId: types.ListsListId,
                                           accountId: types.ListsAccountId,
                                           body: PutAccountsAccountIdRulesListsListIdRequest): Future[types.ListsListResponseCollection] {.async.} =
  ## Updates the description of a list.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/rules/lists/{listId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsListResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRulesListsListId*(client: CloudflareClient,
                                              listId: types.ListsListId,
                                              accountId: types.ListsAccountId): Future[types.ListsListDeleteResponseCollection] {.async.} =
  ## Deletes a specific list and all its items.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/rules/lists/{listId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsListDeleteResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesListsListIdItems*(client: CloudflareClient,
                                                listId: types.ListsListId,
                                                accountId: types.ListsAccountId,
                                                cursor: string = default(string),
                                                perPage: int64 = default(int64),
                                                search: string = default(string)): Future[types.ListsItemsListResponseCollection] {.async.} =
  ## Fetches all the items in the list.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/rules/lists/{listId}/items", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsItemsListResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRulesListsListIdItems*(client: CloudflareClient,
                                                 listId: types.ListsListId,
                                                 accountId: types.ListsAccountId,
                                                 body: types.ListsItemsUpdateRequestCollection): Future[types.ListsListsAsyncResponse] {.async.} =
  ## Appends new items to the list.
  ##
  ## This operation is asynchronous. To get current the operation status, invoke the
  ## `Get bulk operation status` endpoint with the returned `operation_id`.
  ##
  ## There is a limit of 1 pending bulk operation per account. If an outstanding bulk
  ## operation is in progress, the request will be rejected.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/rules/lists/{listId}/items", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsListsAsyncResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRulesListsListIdItems*(client: CloudflareClient,
                                                listId: types.ListsListId,
                                                accountId: types.ListsAccountId,
                                                body: types.ListsItemsUpdateRequestCollection): Future[types.ListsListsAsyncResponse] {.async.} =
  ## Removes all existing items from the list and adds the provided items to the
  ## list.
  ##
  ## This operation is asynchronous. To get current the operation status, invoke the
  ## `Get bulk operation status` endpoint with the returned `operation_id`.
  ##
  ## There is a limit of 1 pending bulk operation per account. If an outstanding bulk
  ## operation is in progress, the request will be rejected.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/rules/lists/{listId}/items", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsListsAsyncResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRulesListsListIdItems*(client: CloudflareClient,
                                                   listId: types.ListsListId,
                                                   accountId: types.ListsAccountId,
                                                   body: DeleteAccountsAccountIdRulesListsListIdItemsRequest): Future[types.ListsListsAsyncResponse] {.async.} =
  ## Removes one or more items from a list.
  ##
  ## This operation is asynchronous. To get current the operation status, invoke the
  ## `Get bulk operation status` endpoint with the returned `operation_id`.
  ##
  ## There is a limit of 1 pending bulk operation per account. If an outstanding bulk
  ## operation is in progress, the request will be rejected.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/rules/lists/{listId}/items", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsListsAsyncResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRulesListsListIdItemsItemId*(client: CloudflareClient,
                                                      itemId: types.ListsItemId,
                                                      listId: types.ListsListId,
                                                      accountId: types.ListsAccountId): Future[types.ListsItemResponseSingle] {.async.} =
  ## Fetches a list item in the list.

  let res = await client.httpGET(fmt"/accounts/{accountId}/rules/lists/{listId}/items/{itemId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ListsItemResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
