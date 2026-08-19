# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdEmailSendingSubdomains*(client: CloudflareClient,
                                           zoneId: types.EmailIdentifier): Future[types.EmailSendingSubdomainsResponseCollection] {.async.} =
  ## Lists all sending-enabled subdomains for the zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/sending/subdomains")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingSubdomainsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailSendingSubdomains*(client: CloudflareClient,
                                            zoneId: types.EmailIdentifier,
                                            body: types.EmailCreateSendingSubdomainProperties): Future[types.EmailSendingSubdomainResponseSingle] {.async.} =
  ## Creates a new sending subdomain or re-enables sending on an existing subdomain
  ## that had it disabled. If zone-level Email Sending has not been enabled yet, the
  ## zone flag is automatically set when the entitlement is present. A leftmost
  ## wildcard such as `*.example.com` is accepted only for accounts with wildcard
  ## Email Sending enabled. Wildcard senders share the base domain's DKIM signing
  ## identity and `cf-bounce.<base>` return path.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/sending/subdomains", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingSubdomainResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailSendingSubdomainsPreview*(client: CloudflareClient,
                                                   zoneId: types.EmailIdentifier,
                                                   body: types.EmailCreateSendingSubdomainProperties): Future[types.EmailSendingSubdomainPreviewResponse] {.async.} =
  ## Returns the DNS records that would be created for a sending subdomain, flags
  ## which records are missing, and reports any conflicts with existing DNS records.
  ## This is a read-only dry-run — no records are created or modified. Use before or
  ## after creating a subdomain to check DNS status. A leftmost wildcard requires
  ## wildcard Email Sending to be enabled for the account and previews base-scoped
  ## DKIM and return-path records.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/sending/subdomains/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingSubdomainPreviewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailSendingSubdomainsSubdomainId*(client: CloudflareClient,
                                                      subdomainId: types.EmailSendingSubdomainIdentifier,
                                                      zoneId: types.EmailIdentifier): Future[types.EmailSendingSubdomainResponseSingle] {.async.} =
  ## Gets information for a specific sending subdomain.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/sending/subdomains/{subdomainId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingSubdomainResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdEmailSendingSubdomainsSubdomainId*(client: CloudflareClient,
                                                         subdomainId: types.EmailSendingSubdomainIdentifier,
                                                         zoneId: types.EmailIdentifier): Future[types.EmailApiResponseSingle] {.async.} =
  ## Disables sending on a subdomain and removes its DNS records. If routing is still
  ## active on the subdomain, only sending is disabled.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/email/sending/subdomains/{subdomainId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdEmailSendingSubdomainsSubdomainId*(client: CloudflareClient,
                                                        subdomainId: types.EmailSendingSubdomainIdentifier,
                                                        zoneId: types.EmailIdentifier,
                                                        body: types.EmailUpdateSendingSubdomainProperties): Future[types.EmailSendingSubdomainResponseSingle] {.async.} =
  ## Updates the activity-log preview preference for a sending subdomain.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/email/sending/subdomains/{subdomainId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingSubdomainResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailSendingSubdomainsSubdomainIdDns*(client: CloudflareClient,
                                                         subdomainId: types.EmailSendingSubdomainIdentifier,
                                                         zoneId: types.EmailIdentifier): Future[types.EmailDnsSettingsResponseCollection] {.async.} =
  ## Returns the expected DNS records for a sending subdomain.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/sending/subdomains/{subdomainId}/dns")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailDnsSettingsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdEmailSendingSubdomainsSubdomainIdDns*(client: CloudflareClient,
                                                          subdomainId: types.EmailSendingSubdomainIdentifier,
                                                          zoneId: types.EmailIdentifier): Future[types.EmailSendingSubdomainDnsStatusResponse] {.async.} =
  ## Idempotently re-applies the sending DNS records (creates missing records,
  ## re-applies the email_routing lock on records whose lock has been cleared).
  ## Refuses with a 409 if foreign MX, multiple SPF, multiple DMARC, or multiple DKIM
  ## records exist at the relevant DNS names — those require manual cleanup.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/email/sending/subdomains/{subdomainId}/dns")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingSubdomainDnsStatusResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailSendingSubdomainsSubdomainIdDnsStatus*(client: CloudflareClient,
                                                               subdomainId: types.EmailSendingSubdomainIdentifier,
                                                               zoneId: types.EmailIdentifier): Future[types.EmailSendingSubdomainDnsStatusResponse] {.async.} =
  ## Returns the desired DNS records for a sending subdomain along with a live diff
  ## against actual DNS state. Use this to detect missing, unlocked, foreign, or
  ## multi-record conflicts before deciding whether to call the fix endpoint. For
  ## wildcard sending rows, each call also rechecks the governing
  ## organizational-domain DMARC policy and reports policy drift that DNS Fix cannot
  ## repair.

  let res = await client.httpGET(fmt"/zones/{zoneId}/email/sending/subdomains/{subdomainId}/dns/status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingSubdomainDnsStatusResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdEmailSendingSubdomainsSubdomainIdReputationComplaints*(client: CloudflareClient,
                                                                          subdomainId: types.EmailSendingSubdomainIdentifier,
                                                                          zoneId: types.EmailIdentifier,
                                                                          startAt: string,
                                                                          endAt: string): Future[types.EmailSendingSubdomainReputationComplaintsResponse] {.async.} =
  ## Returns the matched complaint count for a sending subdomain in a half-open time
  ## window of up to seven days.

  var q = initOrderedTable[string, string]()
  q["start_at"] = $startAt
  q["end_at"] = $endAt
  let res = await client.httpGET(fmt"/zones/{zoneId}/email/sending/subdomains/{subdomainId}/reputation/complaints", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.EmailSendingSubdomainReputationComplaintsResponse)
  else:
    raise newException(CloudflareClientError, body)
