# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdMagicSitesSiteIdAppConfigs*(client: CloudflareClient,
                                                     accountId: types.MagicIdentifier,
                                                     siteId: types.MagicIdentifier): Future[types.MagicAppConfigsCollectionResponse] {.async.} =
  ## Lists App Configs associated with a site.

  let res = await client.httpGET(fmt"/accounts/{accountId}/magic/sites/{siteId}/app_configs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAppConfigsCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMagicSitesSiteIdAppConfigs*(client: CloudflareClient,
                                                      accountId: types.MagicIdentifier,
                                                      siteId: types.MagicIdentifier,
                                                      body: types.MagicAppConfigAddSingleRequest): Future[types.MagicAppConfigSingleResponse] {.async.} =
  ## Creates a new App Config for a site

  let res = await client.httpPOST(fmt"/accounts/{accountId}/magic/sites/{siteId}/app_configs", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.MagicAppConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMagicSitesSiteIdAppConfigsAppConfigId*(client: CloudflareClient,
                                                                accountId: types.MagicIdentifier,
                                                                siteId: types.MagicIdentifier,
                                                                appConfigId: types.MagicIdentifier,
                                                                body: types.MagicAppConfigUpdateRequest): Future[types.MagicAppConfigSingleResponse] {.async.} =
  ## Updates an App Config for a site

  let res = await client.httpPUT(fmt"/accounts/{accountId}/magic/sites/{siteId}/app_configs/{appConfigId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAppConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMagicSitesSiteIdAppConfigsAppConfigId*(client: CloudflareClient,
                                                                   accountId: types.MagicIdentifier,
                                                                   siteId: types.MagicIdentifier,
                                                                   appConfigId: types.MagicIdentifier): Future[types.MagicAppConfigSingleResponse] {.async.} =
  ## Deletes specific App Config associated with a site.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/magic/sites/{siteId}/app_configs/{appConfigId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAppConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdMagicSitesSiteIdAppConfigsAppConfigId*(client: CloudflareClient,
                                                                  accountId: types.MagicIdentifier,
                                                                  siteId: types.MagicIdentifier,
                                                                  appConfigId: types.MagicIdentifier,
                                                                  body: types.MagicAppConfigUpdateRequest): Future[types.MagicAppConfigSingleResponse] {.async.} =
  ## Updates an App Config for a site

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/magic/sites/{siteId}/app_configs/{appConfigId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicAppConfigSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
