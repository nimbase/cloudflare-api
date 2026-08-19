# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWorkersServicesServiceNameEnvironmentsEnvironmentNameContent*(client: CloudflareClient,
                                                                                       accountId: types.WorkersIdentifier,
                                                                                       serviceName: types.WorkersService,
                                                                                       environmentName: types.WorkersEnvironment): Future[AsyncResponse] {.async.} =
  ## Get script content from a worker with an environment.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/services/{serviceName}/environments/{environmentName}/content")
  return res

proc putAccountsAccountIdWorkersServicesServiceNameEnvironmentsEnvironmentNameContent*(client: CloudflareClient,
                                                                                       accountId: types.WorkersIdentifier,
                                                                                       serviceName: types.WorkersService,
                                                                                       environmentName: types.WorkersEnvironment): Future[types.WorkersScriptResponseSingle] {.async.} =
  ## Put script content from a worker with an environment.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/workers/services/{serviceName}/environments/{environmentName}/content")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdWorkersServicesServiceNameEnvironmentsEnvironmentNameSettings*(client: CloudflareClient,
                                                                                        accountId: types.WorkersIdentifier,
                                                                                        serviceName: types.WorkersService,
                                                                                        environmentName: types.WorkersEnvironment): Future[types.WorkersScriptSettingsResponse] {.async.} =
  ## Get script settings from a worker with an environment.

  let res = await client.httpGET(fmt"/accounts/{accountId}/workers/services/{serviceName}/environments/{environmentName}/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdWorkersServicesServiceNameEnvironmentsEnvironmentNameSettings*(client: CloudflareClient,
                                                                                          accountId: types.WorkersIdentifier,
                                                                                          serviceName: types.WorkersService,
                                                                                          environmentName: types.WorkersEnvironment,
                                                                                          body: types.WorkersScriptSettingsResponse): Future[types.WorkersScriptSettingsResponse] {.async.} =
  ## Patch script metadata, such as bindings.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/workers/services/{serviceName}/environments/{environmentName}/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WorkersScriptSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)
