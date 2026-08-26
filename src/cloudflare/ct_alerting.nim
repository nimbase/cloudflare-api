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
  ## Returns whether CT monitoring is enabled and, for Business and Enterprise zones,
  ## the list of email addresses that receive alerts.

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
  ## For Free and Pro zones, the subscription is toggled on or off using the enabled
  ## field. Notification emails are sent to all users with SSL permissions on the
  ## zone.
  ## For Business and Enterprise zones, the emails field is required and controls
  ## which addresses receive alerts. Setting emails to an empty list disables the
  ## subscription regardless of the enabled field. A maximum of 10 email addresses
  ## may be configured.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/ct/alerting", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCtAlertingSubscriptionResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
