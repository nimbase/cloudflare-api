# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicSitesSiteIdNetflowConfig*(client: CloudflareClient,
                                                        accountId: types.MagicIdentifier,
                                                        siteId: types.MagicIdentifier): Future[types.MagicNetflowConfigSingleResponse] {.async.} =
  ## Get NetFlow configuration for a site.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}/netflow_config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicNetflowConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicSitesSiteIdNetflowConfig*(client: CloudflareClient,
                                                         accountId: types.MagicIdentifier,
                                                         siteId: types.MagicIdentifier,
                                                         body: types.MagicNetflowConfigRequest): Future[types.MagicNetflowConfigSingleResponse] {.async.} =
  ## Creates a NetFlow configuration for a site.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/sites/{siteId}/netflow_config", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.MagicNetflowConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicSitesSiteIdNetflowConfig*(client: CloudflareClient,
                                                        accountId: types.MagicIdentifier,
                                                        siteId: types.MagicIdentifier,
                                                        body: types.MagicNetflowConfigRequest): Future[types.MagicNetflowConfigSingleResponse] {.async.} =
  ## Updates NetFlow configuration for a site (partial update).

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/sites/{siteId}/netflow_config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicNetflowConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicSitesSiteIdNetflowConfig*(client: CloudflareClient,
                                                           accountId: types.MagicIdentifier,
                                                           siteId: types.MagicIdentifier): Future[types.MagicNetflowConfigSingleResponse] {.async.} =
  ## Remove NetFlow configuration for a site.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/sites/{siteId}/netflow_config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicNetflowConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicSitesSiteIdNetflowConfig*(client: CloudflareClient,
                                                          accountId: types.MagicIdentifier,
                                                          siteId: types.MagicIdentifier,
                                                          body: types.MagicNetflowConfigRequest): Future[types.MagicNetflowConfigSingleResponse] {.async.} =
  ## Updates NetFlow configuration for a site.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/sites/{siteId}/netflow_config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicNetflowConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
