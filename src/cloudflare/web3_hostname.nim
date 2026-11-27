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
  ## Lists all Web3 hostnames configured for the zone.

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
  ## Creates a new Web3 hostname for serving decentralized web content.

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
  ## Retrieves details for a specific Web3 hostname, including its target gateway and
  ## DNSLink settings.

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
  ## Deletes a Web3 hostname and its configuration from the zone.

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
  ## Updates a Web3 hostname configuration.

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
  ## Retrieves the IPFS Universal Path Gateway content list configuration for a Web3
  ## hostname.

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
  ## Updates the IPFS Universal Path Gateway content list for a Web3 hostname.

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
  ## Lists entries in an IPFS Universal Path Gateway content list.

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
  ## Creates a new entry in an IPFS Universal Path Gateway content list.

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
  ## Retrieves details for a specific IPFS Universal Path Gateway content list entry.

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
  ## Updates an IPFS Universal Path Gateway content list entry.

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
  ## Deletes an entry from an IPFS Universal Path Gateway content list.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/web3/hostnames/{identifier}/ipfs_universal_path/content_list/entries/{contentListEntryIdentifier}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.Web3ApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)
