# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdStreamLiveInputs*(client: CloudflareClient,
                                           accountId: types.StreamIdentifier2,
                                           includeCounts: types.StreamIncludeCounts = default(types.StreamIncludeCounts)): Future[types.StreamLiveInputResponseCollection] {.async.} =
  ## Lists the live inputs created for an account. To get the credentials needed to
  ## stream to a specific live input, request a single live input.

  var q = initOrderedTable[string, string]()
  q["include_counts"] = $includeCounts
  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/live_inputs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLiveInputResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamLiveInputs*(client: CloudflareClient,
                                            accountId: types.StreamIdentifier2,
                                            body: types.StreamCreateInputRequest): Future[types.StreamLiveInputResponseSingle] {.async.} =
  ## Creates a live input, and returns credentials that you or your users can use to
  ## stream live video to Cloudflare Stream.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/live_inputs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLiveInputResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStreamLiveInputsLiveInputIdentifier*(client: CloudflareClient,
                                                              liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                              accountId: types.StreamIdentifier2): Future[types.StreamLiveInputResponseSingle] {.async.} =
  ## Retrieves details of an existing live input.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLiveInputResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdStreamLiveInputsLiveInputIdentifier*(client: CloudflareClient,
                                                              liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                              accountId: types.StreamIdentifier2,
                                                              body: types.StreamUpdateInputRequest): Future[types.StreamLiveInputResponseSingle] {.async.} =
  ## Updates a specified live input.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLiveInputResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamLiveInputsLiveInputIdentifier*(client: CloudflareClient,
                                                                 liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                                 accountId: types.StreamIdentifier2): Future[AsyncResponse] {.async.} =
  ## Prevents a live input from being streamed to and makes the live input
  ## inaccessible to any future API calls.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}")
  return res

proc postAccountsAccountIdStreamLiveInputsLiveInputIdentifierDisable*(client: CloudflareClient,
                                                                      liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                                      accountId: types.StreamIdentifier2): Future[types.StreamLiveInputResponseSingle] {.async.} =
  ## Prevents a live input from being streamed to and makes the live input
  ## inaccessible to any future API calls until enabled.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}/disable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLiveInputResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamLiveInputsLiveInputIdentifierEnable*(client: CloudflareClient,
                                                                     liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                                     accountId: types.StreamIdentifier2): Future[types.StreamLiveInputResponseSingle] {.async.} =
  ## Allows a live input to be streamed to and makes the live input accessible to any
  ## future API calls.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}/enable")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLiveInputResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdStreamLiveInputsLiveInputIdentifierOutputs*(client: CloudflareClient,
                                                                     liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                                     accountId: types.StreamIdentifier2): Future[types.StreamOutputResponseCollection] {.async.} =
  ## Retrieves all outputs associated with a specified live input.

  let res = await client.httpGET(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}/outputs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamOutputResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdStreamLiveInputsLiveInputIdentifierOutputs*(client: CloudflareClient,
                                                                      liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                                      accountId: types.StreamIdentifier2,
                                                                      body: types.StreamCreateOutputRequest): Future[types.StreamOutputResponseSingle] {.async.} =
  ## Creates a new output that can be used to simulcast or restream live video to
  ## other RTMP or SRT destinations. Outputs are always linked to a specific live
  ## input — one live input can have many outputs.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}/outputs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamOutputResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdStreamLiveInputsLiveInputIdentifierOutputsOutputIdentifier*(client: CloudflareClient,
                                                                                     outputIdentifier: types.StreamOutputIdentifier,
                                                                                     liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                                                     accountId: types.StreamIdentifier2,
                                                                                     body: types.StreamUpdateOutputRequest): Future[types.StreamOutputResponseSingle] {.async.} =
  ## Updates the state of an output.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}/outputs/{outputIdentifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamOutputResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdStreamLiveInputsLiveInputIdentifierOutputsOutputIdentifier*(client: CloudflareClient,
                                                                                        outputIdentifier: types.StreamOutputIdentifier,
                                                                                        liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                                                        accountId: types.StreamIdentifier2): Future[AsyncResponse] {.async.} =
  ## Deletes an output and removes it from the associated live input.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}/outputs/{outputIdentifier}")
  return res

proc postAccountsAccountIdStreamLiveInputsLiveInputIdentifierRotateKeys*(client: CloudflareClient,
                                                                         liveInputIdentifier: types.StreamLiveInputIdentifier,
                                                                         accountId: types.StreamIdentifier2): Future[types.StreamLiveInputResponseSingle] {.async.} =
  ## Rotates the credentials for a live input without changing its identifier. Old
  ## credentials are revoked, broadcasts using stale credentials are automatically
  ## disconnected shortly after rotation, and the response returns refreshed
  ## credentials.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/stream/live_inputs/{liveInputIdentifier}/rotate_keys")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.StreamLiveInputResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
