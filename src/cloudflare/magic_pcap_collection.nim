# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdPcaps*(client: CloudflareClient,
                                accountId: types.MagicVisibilityPcapsIdentifier): Future[types.MagicVisibilityPcapsPcapsCollectionResponse] {.async.} =
  ## Lists all packet capture requests for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pcaps")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityPcapsPcapsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPcaps*(client: CloudflareClient,
                                 accountId: types.MagicVisibilityPcapsIdentifier,
                                 body: types.MagicVisibilityPcapsPcapsRequestPcap): Future[types.MagicVisibilityPcapsPcapsSingleResponse] {.async.} =
  ## Create new PCAP request for account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pcaps", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityPcapsPcapsSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPcapsOwnership*(client: CloudflareClient,
                                         accountId: types.MagicVisibilityPcapsIdentifier): Future[types.MagicVisibilityPcapsPcapsOwnershipCollection] {.async.} =
  ## List all buckets configured for use with PCAPs API.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pcaps/ownership")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityPcapsPcapsOwnershipCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPcapsOwnership*(client: CloudflareClient,
                                          accountId: types.MagicVisibilityPcapsIdentifier,
                                          body: types.MagicVisibilityPcapsPcapsOwnershipRequest): Future[types.MagicVisibilityPcapsPcapsOwnershipSingleResponse] {.async.} =
  ## Adds an AWS or GCP bucket to use with full packet captures.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pcaps/ownership", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityPcapsPcapsOwnershipSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdPcapsOwnershipValidate*(client: CloudflareClient,
                                                  accountId: types.MagicVisibilityPcapsIdentifier,
                                                  body: types.MagicVisibilityPcapsPcapsOwnershipValidateRequest): Future[types.MagicVisibilityPcapsPcapsOwnershipSingleResponse] {.async.} =
  ## Validates buckets added to the packet captures API.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/pcaps/ownership/validate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityPcapsPcapsOwnershipSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdPcapsOwnershipOwnershipId*(client: CloudflareClient,
                                                       ownershipId: types.MagicVisibilityPcapsIdentifier,
                                                       accountId: types.MagicVisibilityPcapsIdentifier): Future[AsyncResponse] {.async.} =
  ## Deletes buckets added to the packet captures API.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/pcaps/ownership/{ownershipId}")
  return res

proc getAccountsAccountIdPcapsPcapId*(client: CloudflareClient,
                                      pcapId: types.MagicVisibilityPcapsIdentifier,
                                      accountId: types.MagicVisibilityPcapsIdentifier): Future[types.MagicVisibilityPcapsPcapsSingleResponse] {.async.} =
  ## Get information for a PCAP request by id.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pcaps/{pcapId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityPcapsPcapsSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdPcapsPcapIdDownload*(client: CloudflareClient,
                                              pcapId: types.MagicVisibilityPcapsIdentifier,
                                              accountId: types.MagicVisibilityPcapsIdentifier): Future[AsyncResponse] {.async.} =
  ## Download PCAP information into a file. Response is a binary PCAP file.

  let res = await client.httpGET(fmt"/accounts/{accountId}/pcaps/{pcapId}/download")
  return res

proc putAccountsAccountIdPcapsPcapIdStop*(client: CloudflareClient,
                                          pcapId: types.MagicVisibilityPcapsIdentifier,
                                          accountId: types.MagicVisibilityPcapsIdentifier): Future[AsyncResponse] {.async.} =
  ## Stop full PCAP.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/pcaps/{pcapId}/stop")
  return res
