# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDevicesSettings*(client: CloudflareClient,
                                          accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesZeroTrustAccountDeviceSettingsResponse] {.async.} =
  ## Describes the current device settings for a Zero Trust account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesZeroTrustAccountDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesSettings*(client: CloudflareClient,
                                          accountId: types.TeamsDevicesIdentifier,
                                          body: types.TeamsDevicesZeroTrustAccountDeviceSettings): Future[types.TeamsDevicesZeroTrustAccountDeviceSettingsResponse] {.async.} =
  ## Updates the current device settings for a Zero Trust account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesZeroTrustAccountDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesSettings*(client: CloudflareClient,
                                             accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesZeroTrustAccountDeviceSettingsResponse] {.async.} =
  ## Resets the current device settings for a Zero Trust account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesZeroTrustAccountDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDevicesSettings*(client: CloudflareClient,
                                            accountId: types.TeamsDevicesIdentifier,
                                            body: types.TeamsDevicesZeroTrustAccountDeviceSettings): Future[types.TeamsDevicesZeroTrustAccountDeviceSettingsResponse] {.async.} =
  ## Patches the current device settings for a Zero Trust account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/devices/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesZeroTrustAccountDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGateway*(client: CloudflareClient,
                                  accountId: types.ZeroTrustGatewayIdentifier): Future[types.ZeroTrustGatewayGatewayAccount] {.async.} =
  ## Retrieve information about the current Zero Trust account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayGatewayAccount)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGateway*(client: CloudflareClient,
                                   accountId: types.ZeroTrustGatewayIdentifier): Future[types.ZeroTrustGatewayGatewayAccount] {.async.} =
  ## Create a Zero Trust account for an existing Cloudflare account.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayGatewayAccount)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayConfiguration*(client: CloudflareClient,
                                               accountId: types.ZeroTrustGatewayIdentifier): Future[types.ZeroTrustGatewayGatewayAccountConfig] {.async.} =
  ## Retrieve the current Zero Trust account configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/configuration")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayGatewayAccountConfig)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdGatewayConfiguration*(client: CloudflareClient,
                                               accountId: types.ZeroTrustGatewayIdentifier,
                                               body: types.ZeroTrustGatewayGatewayAccountSettings): Future[types.ZeroTrustGatewayGatewayAccountConfig] {.async.} =
  ## Update the current Zero Trust account configuration.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/gateway/configuration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayGatewayAccountConfig)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdGatewayConfiguration*(client: CloudflareClient,
                                                 accountId: types.ZeroTrustGatewayIdentifier,
                                                 body: types.ZeroTrustGatewayGatewayAccountSettings): Future[types.ZeroTrustGatewayGatewayAccountConfig] {.async.} =
  ## Update (PATCH) a single subcollection of settings such as `antivirus`,
  ## `tls_decrypt`, `activity_log`, `block_page`, `browser_isolation`, `fips`,
  ## `body_scanning`, `certificate`, or `max_ttl_secs` without updating the entire
  ## configuration object. This endpoint returns an error if any settings collection
  ## lacks proper configuration.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/gateway/configuration", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayGatewayAccountConfig)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayConfigurationCustomCertificate*(client: CloudflareClient,
                                                                accountId: types.ZeroTrustGatewayIdentifier): Future[types.ZeroTrustGatewayCustomCertificateSettings] {.async.} =
  ## Retrieve the current Zero Trust certificate configuration.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/configuration/custom_certificate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayCustomCertificateSettings)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayEgressCidrPairs*(client: CloudflareClient,
                                                 accountId: types.ZeroTrustGatewayIdentifier): Future[types.ZeroTrustGatewayGatewayAccountEgressCidrPairListResponse] {.async.} =
  ## Retrieve the list of egress CIDRs allocated to this Zero Trust account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/egress_cidr_pairs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayGatewayAccountEgressCidrPairListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdGatewayLogging*(client: CloudflareClient,
                                         accountId: types.ZeroTrustGatewayIdentifier): Future[types.ZeroTrustGatewayGatewayAccountLoggingSettingsResponse] {.async.} =
  ## Retrieve the current logging settings for the Zero Trust account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/logging")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayGatewayAccountLoggingSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdGatewayLogging*(client: CloudflareClient,
                                         accountId: types.ZeroTrustGatewayIdentifier,
                                         body: types.ZeroTrustGatewayGatewayAccountLoggingSettings): Future[types.ZeroTrustGatewayGatewayAccountLoggingSettingsResponse] {.async.} =
  ## Update logging settings for the current Zero Trust account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/gateway/logging", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewayGatewayAccountLoggingSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)
