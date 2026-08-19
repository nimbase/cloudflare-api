# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdWeb3Hostnames*(client: CloudflareClient,
                                  zoneId: types.Web3Identifier): Future[types.Web3CollectionResponse] {.async.} =
  ## List Web3 Hostnames

  let res = await client.httpGET(fmt"/zones/{zoneId}/web3/hostnames")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3CollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdWeb3Hostnames*(client: CloudflareClient,
                                   zoneId: types.Web3Identifier,
                                   body: types.Web3CreateRequest): Future[types.Web3SingleResponse] {.async.} =
  ## Create Web3 Hostname

  let res = await client.httpPOST(fmt"/zones/{zoneId}/web3/hostnames", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3SingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWeb3HostnamesIdentifier*(client: CloudflareClient,
                                            identifier: types.Web3Identifier,
                                            zoneId: types.Web3Identifier): Future[types.Web3SingleResponse] {.async.} =
  ## Web3 Hostname Details

  let res = await client.httpGET(fmt"/zones/{zoneId}/web3/hostnames/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3SingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdWeb3HostnamesIdentifier*(client: CloudflareClient,
                                               identifier: types.Web3Identifier,
                                               zoneId: types.Web3Identifier): Future[types.Web3ApiResponseSingleId] {.async.} =
  ## Delete Web3 Hostname

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/web3/hostnames/{identifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdWeb3HostnamesIdentifier*(client: CloudflareClient,
                                              identifier: types.Web3Identifier,
                                              zoneId: types.Web3Identifier,
                                              body: types.Web3ModifyRequest): Future[types.Web3SingleResponse] {.async.} =
  ## Edit Web3 Hostname

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/web3/hostnames/{identifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3SingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentList*(client: CloudflareClient,
                                                                        identifier: types.Web3Identifier,
                                                                        zoneId: types.Web3Identifier): Future[types.Web3ContentListDetailsResponse] {.async.} =
  ## IPFS Universal Path Gateway Content List Details

  let res = await client.httpGET(fmt"/zones/{zoneId}/web3/hostnames/{identifier}/ipfs_universal_path/content_list")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ContentListDetailsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentList*(client: CloudflareClient,
                                                                        identifier: types.Web3Identifier,
                                                                        zoneId: types.Web3Identifier,
                                                                        body: types.Web3ContentListUpdateRequest): Future[types.Web3ContentListDetailsResponse] {.async.} =
  ## Update IPFS Universal Path Gateway Content List

  let res = await client.httpPUT(fmt"/zones/{zoneId}/web3/hostnames/{identifier}/ipfs_universal_path/content_list", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ContentListDetailsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntries*(client: CloudflareClient,
                                                                               identifier: types.Web3Identifier,
                                                                               zoneId: types.Web3Identifier): Future[types.Web3ContentListEntryCollectionResponse] {.async.} =
  ## List IPFS Universal Path Gateway Content List Entries

  let res = await client.httpGET(fmt"/zones/{zoneId}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ContentListEntryCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntries*(client: CloudflareClient,
                                                                                identifier: types.Web3Identifier,
                                                                                zoneId: types.Web3Identifier,
                                                                                body: types.Web3ContentListEntryCreateRequest): Future[types.Web3ContentListEntrySingleResponse] {.async.} =
  ## Create IPFS Universal Path Gateway Content List Entry

  let res = await client.httpPOST(fmt"/zones/{zoneId}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ContentListEntrySingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntriesContentListEntryIdentifier*(client: CloudflareClient,
                                                                                                         contentListEntryIdentifier: types.Web3Identifier,
                                                                                                         identifier: types.Web3Identifier,
                                                                                                         zoneId: types.Web3Identifier): Future[types.Web3ContentListEntrySingleResponse] {.async.} =
  ## IPFS Universal Path Gateway Content List Entry Details

  let res = await client.httpGET(fmt"/zones/{zoneId}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries/{contentListEntryIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ContentListEntrySingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntriesContentListEntryIdentifier*(client: CloudflareClient,
                                                                                                         contentListEntryIdentifier: types.Web3Identifier,
                                                                                                         identifier: types.Web3Identifier,
                                                                                                         zoneId: types.Web3Identifier,
                                                                                                         body: types.Web3ContentListEntryCreateRequest): Future[types.Web3ContentListEntrySingleResponse] {.async.} =
  ## Edit IPFS Universal Path Gateway Content List Entry

  let res = await client.httpPUT(fmt"/zones/{zoneId}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries/{contentListEntryIdentifier}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ContentListEntrySingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdWeb3HostnamesIdentifierIpfsUniversalPathContentListEntriesContentListEntryIdentifier*(client: CloudflareClient,
                                                                                                            contentListEntryIdentifier: types.Web3Identifier,
                                                                                                            identifier: types.Web3Identifier,
                                                                                                            zoneId: types.Web3Identifier): Future[types.Web3ApiResponseSingleId] {.async.} =
  ## Delete IPFS Universal Path Gateway Content List Entry

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries/{contentListEntryIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
