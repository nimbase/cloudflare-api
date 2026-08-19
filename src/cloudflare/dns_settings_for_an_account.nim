# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDnsSettings*(client: CloudflareClient,
                                      accountId: types.DnsSettingsIdentifier): Future[types.DnsSettingsDnsResponseSingle] {.async.} =
  ## Show DNS settings for an account

  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsDnsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdDnsSettings*(client: CloudflareClient,
                                        accountId: types.DnsSettingsIdentifier,
                                        body: types.DnsSettingsAccountSettingsPatch): Future[types.DnsSettingsDnsResponseSingle] {.async.} =
  ## Update DNS settings for an account

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/dns_settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsSettingsDnsResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
