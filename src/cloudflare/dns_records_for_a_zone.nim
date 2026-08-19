# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  DeleteZonesZoneIdDnsRecordsDnsRecordIdResponse* = object
    result: JsonNode

proc getZonesZoneIdDnsRecords*(client: CloudflareClient,
                               zoneId: types.DnsRecordsIdentifier,
                               name: string = default(string),
                               nameExact: string = default(string),
                               nameContains: string = default(string),
                               nameStartswith: string = default(string),
                               nameEndswith: string = default(string),
                               `type`: types.DnsRecordsType = default(types.DnsRecordsType),
                               content: string = default(string),
                               contentExact: string = default(string),
                               contentContains: string = default(string),
                               contentStartswith: string = default(string),
                               contentEndswith: string = default(string),
                               proxied: types.DnsRecordsProxied = default(types.DnsRecordsProxied),
                               match: types.DnsRecordsMatch = default(types.DnsRecordsMatch),
                               comment: string = default(string),
                               commentPresent: string = default(string),
                               commentAbsent: string = default(string),
                               commentExact: string = default(string),
                               commentContains: string = default(string),
                               commentStartswith: string = default(string),
                               commentEndswith: string = default(string),
                               tag: string = default(string),
                               tagPresent: string = default(string),
                               tagAbsent: string = default(string),
                               tagExact: string = default(string),
                               tagContains: string = default(string),
                               tagStartswith: string = default(string),
                               tagEndswith: string = default(string),
                               search: types.DnsRecordsSearch = default(types.DnsRecordsSearch),
                               tagMatch: types.DnsRecordsTagMatch = default(types.DnsRecordsTagMatch),
                               page: types.DnsRecordsPage = default(types.DnsRecordsPage),
                               perPage: types.DnsRecordsPerPage = default(types.DnsRecordsPerPage),
                               order: types.DnsRecordsOrder = default(types.DnsRecordsOrder),
                               direction: types.DnsRecordsDirection = default(types.DnsRecordsDirection),
                               includeShadowMetadata: bool = false,
                               shadowedByName: string = default(string),
                               shadowingName: string = default(string)): Future[types.DnsRecordsDnsResponseCollection] {.async.} =
  ## List, search, sort, and filter a zones' DNS records.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["name.exact"] = $nameExact
  q["name.contains"] = $nameContains
  q["name.startswith"] = $nameStartswith
  q["name.endswith"] = $nameEndswith
  q["type"] = $`type`
  q["content"] = $content
  q["content.exact"] = $contentExact
  q["content.contains"] = $contentContains
  q["content.startswith"] = $contentStartswith
  q["content.endswith"] = $contentEndswith
  q["proxied"] = $proxied
  q["match"] = $match
  q["comment"] = $comment
  q["comment.present"] = $commentPresent
  q["comment.absent"] = $commentAbsent
  q["comment.exact"] = $commentExact
  q["comment.contains"] = $commentContains
  q["comment.startswith"] = $commentStartswith
  q["comment.endswith"] = $commentEndswith
  q["tag"] = $tag
  q["tag.present"] = $tagPresent
  q["tag.absent"] = $tagAbsent
  q["tag.exact"] = $tagExact
  q["tag.contains"] = $tagContains
  q["tag.startswith"] = $tagStartswith
  q["tag.endswith"] = $tagEndswith
  q["search"] = $search
  q["tag_match"] = $tagMatch
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["include_shadow_metadata"] = $includeShadowMetadata
  q["shadowed_by_name"] = $shadowedByName
  q["shadowing_name"] = $shadowingName
  let res = await client.httpGET(fmt"/zones/{zoneId}/dns_records", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdDnsRecords*(client: CloudflareClient,
                                zoneId: types.DnsRecordsIdentifier,
                                includeShadowMetadata: bool = false,
                                body: types.DnsRecordsDnsRecordPost): Future[types.DnsRecordsDnsResponseSingle] {.async.} =
  ## Create a new DNS record for a zone.
  ##
  ## Notes:
  ## - A/AAAA records cannot exist on the same name as CNAME records.
  ## - NS records cannot exist on the same name as any other record type.
  ## - Domain names are always represented in Punycode, even if Unicode
  ## characters were used when creating the record.

  var q = initOrderedTable[string, string]()
  q["include_shadow_metadata"] = $includeShadowMetadata
  let res = await client.httpPOST(fmt"/zones/{zoneId}/dns_records", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdDnsRecordsBatch*(client: CloudflareClient,
                                     zoneId: types.DnsRecordsIdentifier,
                                     includeShadowMetadata: bool = false,
                                     body: types.DnsRecordsDnsRequestBatchObject): Future[types.DnsRecordsDnsResponseBatch] {.async.} =
  ## Send a Batch of DNS Record API calls to be executed together.
  ##
  ## Notes:
  ## - Although Cloudflare will execute the batched operations in a single database
  ## transaction, Cloudflare's distributed KV store must treat each record change as
  ## a single key-value pair. This means that the propagation of changes is not
  ## atomic. See [thedocumentation](https://developers.cloudflare.com/dns/manage-dns
  ## -records/how-to/batch-record-changes/ "Batch DNS records") for more information.
  ## - The operations you specify within the /batch request body are always executed
  ## in the following order:
  ##
  ## - Deletes
  ## - Patches
  ## - Puts
  ## - Posts

  var q = initOrderedTable[string, string]()
  q["include_shadow_metadata"] = $includeShadowMetadata
  let res = await client.httpPOST(fmt"/zones/{zoneId}/dns_records/batch", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseBatch)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdDnsRecordsExport*(client: CloudflareClient,
                                     zoneId: types.DnsRecordsIdentifier): Future[AsyncResponse] {.async.} =
  ## You can export your [BIND config](https://en.wikipedia.org/wiki/Zone_file "Zone
  ## file") through this endpoint.
  ##
  ## See [thedocumentation](https://developers.cloudflare.com/dns/manage-dns-records
  ## /how-to/import-and-export/ "Import and export records") for more information.

  let res = await client.httpGET(fmt"/zones/{zoneId}/dns_records/export")
  return res

proc postZonesZoneIdDnsRecordsImport*(client: CloudflareClient,
                                      zoneId: types.DnsRecordsIdentifier): Future[types.DnsRecordsDnsResponseImportScan] {.async.} =
  ## You can upload your [BIND config](https://en.wikipedia.org/wiki/Zone_file "Zone
  ## file") through this endpoint. It assumes that cURL is called from a location
  ## with bind_config.txt (valid BIND config) present.
  ##
  ## See [thedocumentation](https://developers.cloudflare.com/dns/manage-dns-records
  ## /how-to/import-and-export/ "Import and export records") for more information.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/dns_records/import")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseImportScan)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdDnsRecordsScan*(client: CloudflareClient,
                                    zoneId: types.DnsRecordsIdentifier): Future[types.DnsRecordsDnsResponseImportScan] {.async.} =
  ## Scan for common DNS records on your domain and automatically add them to your
  ## zone. Useful if you haven't updated your nameservers yet.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/dns_records/scan")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseImportScan)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdDnsRecordsScanReview*(client: CloudflareClient,
                                         zoneId: types.DnsRecordsIdentifier): Future[types.DnsRecordsDnsResponseCollection] {.async.} =
  ## Retrieves the list of DNS records discovered up to this point by the
  ## asynchronous scan. These records are temporary until explicitly accepted or
  ## rejected via `POST /scan/review`. Additional records may be discovered by the
  ## scan later.

  let res = await client.httpGET(fmt"/zones/{zoneId}/dns_records/scan/review")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdDnsRecordsScanReview*(client: CloudflareClient,
                                          zoneId: types.DnsRecordsIdentifier,
                                          body: types.DnsRecordsDnsRequestReviewScanObject): Future[types.DnsRecordsDnsResponseReviewScan] {.async.} =
  ## Accept or reject DNS records found by the DNS records scan. Accepted records
  ## will be permanently added to the zone, while rejected records will be
  ## permanently deleted.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/dns_records/scan/review", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseReviewScan)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdDnsRecordsScanTrigger*(client: CloudflareClient,
                                           zoneId: types.DnsRecordsIdentifier): Future[types.DnsRecordsDnsResponseTriggerScan] {.async.} =
  ## Initiates an asynchronous scan for common DNS records on your domain. Note that
  ## this **does not** automatically add records to your zone. The scan runs in the
  ## background, and results can be reviewed later using the `/scan/review`
  ## endpoints. Useful if you haven't updated your nameservers yet.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/dns_records/scan/trigger")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseTriggerScan)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdDnsRecordsUsage*(client: CloudflareClient,
                                    zoneId: types.DnsRecordsIdentifier): Future[types.DnsRecordsDnsResponseZoneUsage] {.async.} =
  ## Get the current DNS record usage for a zone, including the number of records and
  ## the quota limit.

  let res = await client.httpGET(fmt"/zones/{zoneId}/dns_records/usage")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseZoneUsage)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdDnsRecordsDnsRecordId*(client: CloudflareClient,
                                          dnsRecordId: types.DnsRecordsIdentifier,
                                          zoneId: types.DnsRecordsIdentifier,
                                          includeShadowMetadata: bool = false): Future[types.DnsRecordsDnsResponseSingle] {.async.} =
  ## Retrieves details for a specific DNS record in the zone.

  var q = initOrderedTable[string, string]()
  q["include_shadow_metadata"] = $includeShadowMetadata
  let res = await client.httpGET(fmt"/zones/{zoneId}/dns_records/{dnsRecordId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdDnsRecordsDnsRecordId*(client: CloudflareClient,
                                          dnsRecordId: types.DnsRecordsIdentifier,
                                          zoneId: types.DnsRecordsIdentifier,
                                          includeShadowMetadata: bool = false,
                                          body: types.DnsRecordsDnsRecordPost): Future[types.DnsRecordsDnsResponseSingle] {.async.} =
  ## Overwrite an existing DNS record.
  ##
  ## Notes:
  ## - A/AAAA records cannot exist on the same name as CNAME records.
  ## - NS records cannot exist on the same name as any other record type.
  ## - Domain names are always represented in Punycode, even if Unicode
  ## characters were used when creating the record.

  var q = initOrderedTable[string, string]()
  q["include_shadow_metadata"] = $includeShadowMetadata
  let res = await client.httpPUT(fmt"/zones/{zoneId}/dns_records/{dnsRecordId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdDnsRecordsDnsRecordId*(client: CloudflareClient,
                                             dnsRecordId: types.DnsRecordsIdentifier,
                                             zoneId: types.DnsRecordsIdentifier): Future[DeleteZonesZoneIdDnsRecordsDnsRecordIdResponse] {.async.} =
  ## Permanently removes a DNS record from the zone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/dns_records/{dnsRecordId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteZonesZoneIdDnsRecordsDnsRecordIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdDnsRecordsDnsRecordId*(client: CloudflareClient,
                                            dnsRecordId: types.DnsRecordsIdentifier,
                                            zoneId: types.DnsRecordsIdentifier,
                                            includeShadowMetadata: bool = false,
                                            body: types.DnsRecordsDnsRecordPatch): Future[types.DnsRecordsDnsResponseSingle] {.async.} =
  ## Update an existing DNS record.
  ##
  ## Notes:
  ## - A/AAAA records cannot exist on the same name as CNAME records.
  ## - NS records cannot exist on the same name as any other record type.
  ## - Domain names are always represented in Punycode, even if Unicode
  ## characters were used when creating the record.

  var q = initOrderedTable[string, string]()
  q["include_shadow_metadata"] = $includeShadowMetadata
  let res = await client.httpPATCH(fmt"/zones/{zoneId}/dns_records/{dnsRecordId}", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
