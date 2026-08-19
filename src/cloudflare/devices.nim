# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdDevicesPolicyRequest = object
    allow_mode_switch: Option[types.TeamsDevicesAllowModeSwitch]
    allow_updates: Option[types.TeamsDevicesAllowUpdates]
    allowed_to_leave: Option[types.TeamsDevicesAllowedToLeave]
    auto_connect: Option[types.TeamsDevicesAutoConnect]
    captive_portal: Option[types.TeamsDevicesCaptivePortal]
    description: Option[JsonNode]
    disable_auto_fallback: Option[types.TeamsDevicesDisableAutoFallback]
    dns_search_suffixes: Option[types.TeamsDevicesDnsSearchSuffixes]
    enabled: Option[bool]
    exclude: Option[types.TeamsDevicesExcludeRequest]
    exclude_office_ips: Option[types.TeamsDevicesExcludeOfficeIps]
    global_acceleration: Option[types.TeamsDevicesGlobalAcceleration]
    `include`: Option[types.TeamsDevicesIncludeRequest]
    lan_allow_minutes: Option[types.TeamsDevicesLanAllowMinutes]
    lan_allow_subnet_size: Option[types.TeamsDevicesLanAllowSubnetSize]
    match: types.TeamsDevicesSchemasMatch
    name: string
    precedence: types.TeamsDevicesPrecedence
    register_interface_ip_with_dns: Option[types.TeamsDevicesRegisterInterfaceIpWithDns]
    sccm_vpn_boundary_support: Option[types.TeamsDevicesSccmVpnBoundarySupport]
    service_mode_v2: Option[types.TeamsDevicesServiceModeV2]
    support_url: Option[types.TeamsDevicesSupportUrl]
    switch_locked: Option[types.TeamsDevicesSwitchLocked]
    tunnel_protocol: Option[types.TeamsDevicesTunnelProtocol]
    virtual_networks: Option[types.TeamsDevicesVirtualNetworks]
  PatchAccountsAccountIdDevicesPolicyRequest = object
    allow_mode_switch: Option[types.TeamsDevicesAllowModeSwitch]
    allow_updates: Option[types.TeamsDevicesAllowUpdates]
    allowed_to_leave: Option[types.TeamsDevicesAllowedToLeave]
    auto_connect: Option[types.TeamsDevicesAutoConnect]
    captive_portal: Option[types.TeamsDevicesCaptivePortal]
    disable_auto_fallback: Option[types.TeamsDevicesDisableAutoFallback]
    dns_search_suffixes: Option[types.TeamsDevicesDnsSearchSuffixes]
    exclude: Option[types.TeamsDevicesExcludeRequest]
    exclude_office_ips: Option[types.TeamsDevicesExcludeOfficeIps]
    global_acceleration: Option[types.TeamsDevicesGlobalAcceleration]
    `include`: Option[types.TeamsDevicesIncludeRequest]
    lan_allow_minutes: Option[types.TeamsDevicesLanAllowMinutes]
    lan_allow_subnet_size: Option[types.TeamsDevicesLanAllowSubnetSize]
    register_interface_ip_with_dns: Option[types.TeamsDevicesRegisterInterfaceIpWithDns]
    sccm_vpn_boundary_support: Option[types.TeamsDevicesSccmVpnBoundarySupport]
    service_mode_v2: Option[types.TeamsDevicesServiceModeV2]
    support_url: Option[types.TeamsDevicesSupportUrl]
    switch_locked: Option[types.TeamsDevicesSwitchLocked]
    tunnel_protocol: Option[types.TeamsDevicesTunnelProtocol]
    virtual_networks: Option[types.TeamsDevicesVirtualNetworks]
  PatchAccountsAccountIdDevicesPolicyPolicyIdRequest = object
    allow_mode_switch: Option[types.TeamsDevicesAllowModeSwitch]
    allow_updates: Option[types.TeamsDevicesAllowUpdates]
    allowed_to_leave: Option[types.TeamsDevicesAllowedToLeave]
    auto_connect: Option[types.TeamsDevicesAutoConnect]
    captive_portal: Option[types.TeamsDevicesCaptivePortal]
    description: Option[types.TeamsDevicesSchemasDescription]
    disable_auto_fallback: Option[types.TeamsDevicesDisableAutoFallback]
    dns_search_suffixes: Option[types.TeamsDevicesDnsSearchSuffixes]
    enabled: Option[bool]
    exclude: Option[types.TeamsDevicesExcludeRequest]
    exclude_office_ips: Option[types.TeamsDevicesExcludeOfficeIps]
    global_acceleration: Option[types.TeamsDevicesGlobalAcceleration]
    `include`: Option[types.TeamsDevicesIncludeRequest]
    lan_allow_minutes: Option[types.TeamsDevicesLanAllowMinutes]
    lan_allow_subnet_size: Option[types.TeamsDevicesLanAllowSubnetSize]
    match: Option[types.TeamsDevicesSchemasMatch]
    name: Option[string]
    precedence: Option[types.TeamsDevicesPrecedence]
    register_interface_ip_with_dns: Option[types.TeamsDevicesRegisterInterfaceIpWithDns]
    sccm_vpn_boundary_support: Option[types.TeamsDevicesSccmVpnBoundarySupport]
    service_mode_v2: Option[types.TeamsDevicesServiceModeV2]
    support_url: Option[types.TeamsDevicesSupportUrl]
    switch_locked: Option[types.TeamsDevicesSwitchLocked]
    tunnel_protocol: Option[types.TeamsDevicesTunnelProtocol]
    virtual_networks: Option[types.TeamsDevicesVirtualNetworks]

proc getAccountsAccountIdDevices*(client: CloudflareClient,
                                  accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesDevicesResponse] {.async.} =
  ## List WARP devices. Not supported when [multi-usermode](https://developers.cloud
  ## flare.com/cloudflare-one/connections/connect-devices/warp/deployment/mdm-deploym
  ## ent/windows-multiuser/) is enabled for the account.
  ##
  ## **Deprecated**: please use one of the following endpoints instead:
  ## - GET /accounts/{account_id}/devices/physical-devices
  ## - GET /accounts/{account_id}/devices/registrations

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDevicesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicies*(client: CloudflareClient,
                                          accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesDeviceSettingsResponseCollection] {.async.} =
  ## Fetches a list of the device settings profiles for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policies")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDeviceSettingsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicy*(client: CloudflareClient,
                                        accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesDefaultDeviceSettingsResponse] {.async.} =
  ## Fetches the default device settings profile for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policy")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDefaultDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesPolicy*(client: CloudflareClient,
                                         accountId: types.TeamsDevicesIdentifier,
                                         body: PostAccountsAccountIdDevicesPolicyRequest): Future[types.TeamsDevicesDeviceSettingsResponse] {.async.} =
  ## Creates a device settings profile to be applied to certain devices matching the
  ## criteria.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/policy", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDevicesPolicy*(client: CloudflareClient,
                                          accountId: types.TeamsDevicesIdentifier,
                                          body: PatchAccountsAccountIdDevicesPolicyRequest): Future[types.TeamsDevicesDefaultDeviceSettingsResponse] {.async.} =
  ## Updates the default device settings profile for an account.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/devices/policy", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDefaultDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicyExclude*(client: CloudflareClient,
                                               accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSplitTunnelResponseCollection] {.async.} =
  ## Fetches the list of routes excluded from the WARP client's tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policy/exclude")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSplitTunnelResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesPolicyExclude*(client: CloudflareClient,
                                               accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSplitTunnelResponseCollection] {.async.} =
  ## Sets the list of routes excluded from the WARP client's tunnel.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/policy/exclude", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSplitTunnelResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicyFallbackDomains*(client: CloudflareClient,
                                                       accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesFallbackDomainResponseCollection] {.async.} =
  ## Fetches a list of domains to bypass Gateway DNS resolution. These domains will
  ## use the specified local DNS resolver instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policy/fallback_domains")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesFallbackDomainResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesPolicyFallbackDomains*(client: CloudflareClient,
                                                       accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesFallbackDomainResponseCollection] {.async.} =
  ## Sets the list of domains to bypass Gateway DNS resolution. These domains will
  ## use the specified local DNS resolver instead.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/policy/fallback_domains", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesFallbackDomainResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicyInclude*(client: CloudflareClient,
                                               accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSplitTunnelIncludeResponseCollection] {.async.} =
  ## Fetches the list of routes included in the WARP client's tunnel.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policy/include")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSplitTunnelIncludeResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesPolicyInclude*(client: CloudflareClient,
                                               accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSplitTunnelIncludeResponseCollection] {.async.} =
  ## Sets the list of routes included in the WARP client's tunnel.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/policy/include", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSplitTunnelIncludeResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicyPolicyId*(client: CloudflareClient,
                                                policyId: types.TeamsDevicesSchemasUuid,
                                                accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesDeviceSettingsResponse] {.async.} =
  ## Fetches a device settings profile by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policy/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDevicesPolicyPolicyId*(client: CloudflareClient,
                                                   policyId: types.TeamsDevicesSchemasUuid,
                                                   accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesDeviceSettingsResponseCollection] {.async.} =
  ## Deletes a device settings profile and fetches a list of the remaining profiles
  ## for an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/devices/policy/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDeviceSettingsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDevicesPolicyPolicyId*(client: CloudflareClient,
                                                  policyId: types.TeamsDevicesSchemasUuid,
                                                  accountId: types.TeamsDevicesIdentifier,
                                                  body: PatchAccountsAccountIdDevicesPolicyPolicyIdRequest): Future[types.TeamsDevicesDeviceSettingsResponse] {.async.} =
  ## Updates a configured device settings profile.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/devices/policy/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDeviceSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicyPolicyIdExclude*(client: CloudflareClient,
                                                       policyId: types.TeamsDevicesSchemasUuid,
                                                       accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSplitTunnelResponseCollection] {.async.} =
  ## Fetches the list of routes excluded from the WARP client's tunnel for a specific
  ## device settings profile.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policy/{policyId}/exclude")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSplitTunnelResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesPolicyPolicyIdExclude*(client: CloudflareClient,
                                                       policyId: types.TeamsDevicesSchemasUuid,
                                                       accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSplitTunnelResponseCollection] {.async.} =
  ## Sets the list of routes excluded from the WARP client's tunnel for a specific
  ## device settings profile.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/policy/{policyId}/exclude", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSplitTunnelResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicyPolicyIdFallbackDomains*(client: CloudflareClient,
                                                               policyId: types.TeamsDevicesSchemasUuid,
                                                               accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesFallbackDomainResponseCollection] {.async.} =
  ## Fetches the list of domains to bypass Gateway DNS resolution from a specified
  ## device settings profile. These domains will use the specified local DNS resolver
  ## instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policy/{policyId}/fallback_domains")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesFallbackDomainResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesPolicyPolicyIdFallbackDomains*(client: CloudflareClient,
                                                               policyId: types.TeamsDevicesSchemasUuid,
                                                               accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesFallbackDomainResponseCollection] {.async.} =
  ## Sets the list of domains to bypass Gateway DNS resolution. These domains will
  ## use the specified local DNS resolver instead. This will only apply to the
  ## specified device settings profile.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/policy/{policyId}/fallback_domains", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesFallbackDomainResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesPolicyPolicyIdInclude*(client: CloudflareClient,
                                                       policyId: types.TeamsDevicesSchemasUuid,
                                                       accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSplitTunnelIncludeResponseCollection] {.async.} =
  ## Fetches the list of routes included in the WARP client's tunnel for a specific
  ## device settings profile.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/policy/{policyId}/include")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSplitTunnelIncludeResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDevicesPolicyPolicyIdInclude*(client: CloudflareClient,
                                                       policyId: types.TeamsDevicesSchemasUuid,
                                                       accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesSplitTunnelIncludeResponseCollection] {.async.} =
  ## Sets the list of routes included in the WARP client's tunnel for a specific
  ## device settings profile.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/devices/policy/{policyId}/include", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesSplitTunnelIncludeResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesRevoke*(client: CloudflareClient,
                                         accountId: types.TeamsDevicesIdentifier,
                                         body: types.TeamsDevicesRevokeDevicesRequest): Future[types.TeamsDevicesApiResponseSingle] {.async.} =
  ## Revokes a list of devices. Not supported when [multi-usermode](https://develope
  ## rs.cloudflare.com/cloudflare-one/connections/connect-devices/warp/deployment/mdm
  ## -deployment/windows-multiuser/) is enabled.
  ##
  ## **Deprecated**: please use POST
  ## /accounts/{account_id}/devices/registrations/revoke instead.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/revoke", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDevicesUnrevoke*(client: CloudflareClient,
                                           accountId: types.TeamsDevicesIdentifier,
                                           body: types.TeamsDevicesUnrevokeDevicesRequest): Future[types.TeamsDevicesApiResponseSingle] {.async.} =
  ## Unrevokes a list of devices. Not supported when [multi-usermode](https://develo
  ## pers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/deployment/m
  ## dm-deployment/windows-multiuser/) is enabled.
  ##
  ## **Deprecated**: please use POST
  ## /accounts/{account_id}/devices/registrations/unrevoke instead.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/devices/unrevoke", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesDeviceId*(client: CloudflareClient,
                                          deviceId: types.TeamsDevicesRegistrationId,
                                          accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesDeviceResponse] {.async.} =
  ## Fetches a single WARP device. Not supported when [multi-usermode](https://devel
  ## opers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/deployment/
  ## mdm-deployment/windows-multiuser/) is enabled for the account.
  ##
  ## **Deprecated**: please use one of the following endpoints instead:
  ## - GET /accounts/{account_id}/devices/physical-devices/{device_id}
  ## - GET /accounts/{account_id}/devices/registrations/{registration_id}

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/{deviceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDeviceResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDevicesDeviceIdOverrideCodes*(client: CloudflareClient,
                                                       deviceId: types.TeamsDevicesRegistrationId,
                                                       accountId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesOverrideCodesResponse] {.async.} =
  ## Fetches a one-time use admin override code for a device. This relies on the
  ## **Admin Override** setting being enabled in your device configuration. Not
  ## supported when [multi-usermode](https://developers.cloudflare.com/cloudflare-on
  ## e/connections/connect-devices/warp/deployment/mdm-deployment/windows-multiuser/)
  ## is enabled for the account.
  ## **Deprecated:** please use GET
  ## /accounts/{account_id}/devices/registrations/{registration_id}/override_codes
  ## instead.

  let res = await client.httpGET(fmt"/accounts/{accountId}/devices/{deviceId}/override_codes")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesOverrideCodesResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdDevicesPolicyCertificates*(client: CloudflareClient,
                                              zoneId: types.TeamsDevicesIdentifier): Future[types.TeamsDevicesDevicesPolicyCertificatesSingle] {.async.} =
  ## Fetches device certificate provisioning.

  let res = await client.httpGET(fmt"/zones/{zoneId}/devices/policy/certificates")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDevicesPolicyCertificatesSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdDevicesPolicyCertificates*(client: CloudflareClient,
                                                zoneId: types.TeamsDevicesIdentifier,
                                                body: types.TeamsDevicesDevicesPolicyCertificates): Future[types.TeamsDevicesDevicesPolicyCertificatesSingle] {.async.} =
  ## Enable Zero Trust Clients to provision a certificate, containing a x509 subject,
  ## and referenced by Access device posture policies when the client visits MTLS
  ## protected domains. This facilitates device posture without a WARP session.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/devices/policy/certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TeamsDevicesDevicesPolicyCertificatesSingle)
  else:
    raise newException(CloudflareClientError, body)
