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
  PostZonesZoneIdCustomHostnamesRequest = object
    custom_metadata: Option[types.TlsCertificatesAndHostnamesCustomMetadata]
    custom_origin_server: Option[types.TlsCertificatesAndHostnamesCustomOriginServer]
    custom_origin_sni: Option[types.TlsCertificatesAndHostnamesCustomOriginSni]
    hostname: types.TlsCertificatesAndHostnamesHostnamePost
    ssl: Option[types.TlsCertificatesAndHostnamesSslpost]
  DeleteZonesZoneIdCustomHostnamesCustomHostnameIdResponse* = object
    id: types.TlsCertificatesAndHostnamesIdentifier
  PatchZonesZoneIdCustomHostnamesCustomHostnameIdRequest = object
    custom_metadata: Option[types.TlsCertificatesAndHostnamesCustomMetadata]
    custom_origin_server: Option[types.TlsCertificatesAndHostnamesCustomOriginServer]
    custom_origin_sni: Option[types.TlsCertificatesAndHostnamesCustomOriginSni]
    ssl: Option[types.TlsCertificatesAndHostnamesSslpost]
  DeleteZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateIdResponse* = object
    id: types.TlsCertificatesAndHostnamesIdentifier
  CustomHostnameForAZoneOrderOption* = enum
    orderSsl = "ssl"
    orderSslStatus = "ssl_status"

  CustomHostnameForAZoneDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  CustomHostnameForAZoneSslStatusOption* = enum
    sslStatusInitializing = "initializing"
    sslStatusPendingValidation = "pending_validation"
    sslStatusDeleted = "deleted"
    sslStatusPendingIssuance = "pending_issuance"
    sslStatusPendingDeployment = "pending_deployment"
    sslStatusPendingDeletion = "pending_deletion"
    sslStatusPendingExpiration = "pending_expiration"
    sslStatusExpired = "expired"
    sslStatusActive = "active"
    sslStatusInitializingTimedOut = "initializing_timed_out"
    sslStatusValidationTimedOut = "validation_timed_out"
    sslStatusIssuanceTimedOut = "issuance_timed_out"
    sslStatusDeploymentTimedOut = "deployment_timed_out"
    sslStatusDeletionTimedOut = "deletion_timed_out"
    sslStatusPendingCleanup = "pending_cleanup"
    sslStatusStagingDeployment = "staging_deployment"
    sslStatusStagingActive = "staging_active"
    sslStatusDeactivating = "deactivating"
    sslStatusInactive = "inactive"
    sslStatusBackupIssued = "backup_issued"
    sslStatusHoldingDeployment = "holding_deployment"

  CustomHostnameForAZoneHostnameStatusOption* = enum
    hostnameStatusActive = "active"
    hostnameStatusPending = "pending"
    hostnameStatusActiveRedeploying = "active_redeploying"
    hostnameStatusMoved = "moved"
    hostnameStatusPendingDeletion = "pending_deletion"
    hostnameStatusDeleted = "deleted"
    hostnameStatusPendingBlocked = "pending_blocked"
    hostnameStatusPendingMigration = "pending_migration"
    hostnameStatusPendingProvisioned = "pending_provisioned"
    hostnameStatusTestPending = "test_pending"
    hostnameStatusTestActive = "test_active"
    hostnameStatusTestActiveApex = "test_active_apex"
    hostnameStatusTestBlocked = "test_blocked"
    hostnameStatusTestFailed = "test_failed"
    hostnameStatusProvisioned = "provisioned"
    hostnameStatusBlocked = "blocked"

  CustomHostnameForAZoneCertificateAuthorityOption* = enum
    certificateAuthorityGoogle = "google"
    certificateAuthorityLetsEncrypt = "lets_encrypt"
    certificateAuthoritySslCom = "ssl_com"

  CustomHostnameForAZoneSslOption* = enum
    ssl0 = "0"
    ssl1 = "1"


proc getZonesZoneIdCustomHostnames*(client: CloudflareClient,
                                    zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                    hostname: string = default(string),
                                    hostnameExact: string = default(string),
                                    hostnameStartsWith: string = default(string),
                                    hostnameContain: string = default(string),
                                    id: string = default(string),
                                    page: float64 = default(float64),
                                    perPage: float64 = default(float64),
                                    order: CustomHostnameForAZoneOrderOption = orderSsl,
                                    direction: CustomHostnameForAZoneDirectionOption,
                                    sslStatus: CustomHostnameForAZoneSslStatusOption,
                                    hostnameStatus: CustomHostnameForAZoneHostnameStatusOption,
                                    certificateAuthority: CustomHostnameForAZoneCertificateAuthorityOption,
                                    wildcard: bool = default(bool),
                                    customOriginServer: string = default(string),
                                    ssl: CustomHostnameForAZoneSslOption = ssl): Future[types.TlsCertificatesAndHostnamesCustomHostnameResponseCollection] {.async.} =
  ## List, search, sort, and filter all of your custom hostnames.

  var q = initOrderedTable[string, string]()
  q["hostname"] = $hostname
  q["hostname.exact"] = $hostnameExact
  q["hostname.startsWith"] = $hostnameStartsWith
  q["hostname.contain"] = $hostnameContain
  q["id"] = $id
  q["page"] = $page
  q["per_page"] = $perPage
  q["order"] = $order
  q["direction"] = $direction
  q["ssl_status"] = $sslStatus
  q["hostname_status"] = $hostnameStatus
  q["certificate_authority"] = $certificateAuthority
  q["wildcard"] = $wildcard
  q["custom_origin_server"] = $customOriginServer
  q["ssl"] = $ssl
  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_hostnames", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomHostnameResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdCustomHostnames*(client: CloudflareClient,
                                     zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                     body: PostZonesZoneIdCustomHostnamesRequest): Future[types.TlsCertificatesAndHostnamesCustomHostnameResponseSingle] {.async.} =
  ## Add a new custom hostname and request that an SSL certificate be issued for it.
  ## One of three validation methods—http, txt, email—should be used, with 'http'
  ## recommended if the CNAME is already in place (or will be soon). Specifying
  ## 'email' will send an email to the WHOIS contacts on file for the base domain
  ## plus hostmaster, postmaster, webmaster, admin, administrator. If http is used
  ## and the domain is not already pointing to the Managed CNAME host, the PATCH
  ## method must be used once it is (to complete validation).  Enable bundling of
  ## certificates using the custom_cert_bundle field. The bundling process requires
  ## the following condition One certificate in the bundle must use an RSA, and the
  ## other must use an ECDSA.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/custom_hostnames", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomHostnameResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCustomHostnamesQuota*(client: CloudflareClient,
                                         zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCustomHostnameQuotaResponse] {.async.} =
  ## Returns custom hostname quota usage for a zone. The allocated quota is a soft
  ## limit; creating custom hostnames after usage exceeds this limit can still
  ## succeed until the hard cap is reached. Use the exceeded and hard_cap fields to
  ## track when usage is above the soft limit and when new custom hostname creation
  ## will be rejected.

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_hostnames/quota")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomHostnameQuotaResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdCustomHostnamesCustomHostnameId*(client: CloudflareClient,
                                                    customHostnameId: types.TlsCertificatesAndHostnamesIdentifier,
                                                    zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCustomHostnameResponseSingle] {.async.} =
  ## Retrieves detailed information about a specific custom hostname, including SSL
  ## certificate status, ownership verification, and origin configuration.

  let res = await client.httpGET(fmt"/zones/{zoneId}/custom_hostnames/{customHostnameId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomHostnameResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCustomHostnamesCustomHostnameId*(client: CloudflareClient,
                                                       customHostnameId: types.TlsCertificatesAndHostnamesIdentifier,
                                                       zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[DeleteZonesZoneIdCustomHostnamesCustomHostnameIdResponse] {.async.} =
  ## Permanently deletes a custom hostname and revokes any SSL certificates that were
  ## issued for it. This action cannot be undone.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/custom_hostnames/{customHostnameId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, DeleteZonesZoneIdCustomHostnamesCustomHostnameIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCustomHostnamesCustomHostnameId*(client: CloudflareClient,
                                                      customHostnameId: types.TlsCertificatesAndHostnamesIdentifier,
                                                      zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                      body: PatchZonesZoneIdCustomHostnamesCustomHostnameIdRequest): Future[types.TlsCertificatesAndHostnamesCustomHostnameResponseSingle] {.async.} =
  ## Modify SSL configuration for a custom hostname. When sent with SSL config that
  ## matches existing config, used to indicate that hostname should pass domain
  ## control validation (DCV). Can also be used to change validation type, e.g., from
  ## 'http' to 'email'. Bundle an existing certificate with another certificate by
  ## using the "custom_cert_bundle" field. The bundling process supports combining
  ## certificates as long as the following condition is met. One certificate must use
  ## the RSA algorithm, and the other must use the ECDSA algorithm.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/custom_hostnames/{customHostnameId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomHostnameResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateId*(client: CloudflareClient,
                                                                                                             customHostnameId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                                                             certificatePackId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                                                             certificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                                                             zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                                                             body: types.TlsCertificatesAndHostnamesCustomCertAndKey): Future[types.TlsCertificatesAndHostnamesCustomHostnameResponseSingle] {.async.} =
  ## Replace a single custom certificate within a certificate pack that contains two
  ## bundled certificates. The replacement must adhere to the following constraints.
  ## You can only replace an RSA certificate with another RSA certificate or an ECDSA
  ## certificate with another ECDSA certificate.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/custom_hostnames/{customHostnameId}/certificate_pack/{certificatePackId}/certificates/{certificateId}", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomHostnameResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateId*(client: CloudflareClient,
                                                                                                                customHostnameId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                                                                certificatePackId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                                                                certificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                                                                zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[DeleteZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateIdResponse] {.async.} =
  ## Delete a single custom certificate from a certificate pack that contains two
  ## bundled certificates. Deletion is subject to the following constraints. You
  ## cannot delete a certificate if it is the only remaining certificate in the pack.
  ## At least one certificate must remain in the pack.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/custom_hostnames/{customHostnameId}/certificate_pack/{certificatePackId}/certificates/{certificateId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, DeleteZonesZoneIdCustomHostnamesCustomHostnameIdCertificatePackCertificatePackIdCertificatesCertificateIdResponse)
  else:
    raise newException(CloudflareClientError, body)
