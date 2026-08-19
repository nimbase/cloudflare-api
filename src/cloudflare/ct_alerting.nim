# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getZonesZoneIdCtAlerting*(client: CloudflareClient,
                               zoneId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCtAlertingSubscriptionResponseSingle] {.async.} =
  ## Retrieve the Certificate Transparency alerting subscription settings for a zone.
  ## Returns whether CT monitoring is enabled and the list of email addresses that
  ## receive alerts, if any have been configured.

  let res = await client.httpGET(fmt"/zones/{zoneId}/ct/alerting")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCtAlertingSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdCtAlerting*(client: CloudflareClient,
                                 zoneId: types.TlsCertificatesAndHostnamesIdentifier,
                                 body: types.TlsCertificatesAndHostnamesCtAlertingSubscriptionUpdate): Future[types.TlsCertificatesAndHostnamesCtAlertingSubscriptionResponseSingle] {.async.} =
  ## Create or update the Certificate Transparency alerting subscription for a zone.
  ## Enables or disables email notifications when certificates are issued for the
  ## zone's domains.
  ## The `enabled` field is required on every request and controls whether the
  ## subscription is active. The `emails` field is optional and, when provided,
  ## replaces the stored recipient list for the zone. When `emails` is omitted, the
  ## stored recipient list is preserved and only the enabled state is toggled. A
  ## maximum of 100 email addresses may be configured per zone.
  ## Requests that omit `enabled` are rejected with error code 1008.
  ## Subscribe and unsubscribe notification emails are only sent for recipients whose
  ## effective subscription state changes. Idempotent requests (no state change) send
  ## no notification email.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/ct/alerting", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCtAlertingSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
