# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdImagesV1Config*(client: CloudflareClient,
                                         accountId: types.ImagesAccountIdentifier): Future[types.ImagesImagesConfigResponse] {.async.} =
  ## Get account-level Cloudflare Images settings, such as flexible variants and
  ## Content Credentials preservation. Settings that are disabled may be omitted from
  ## the response.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImagesConfigResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdImagesV1Config*(client: CloudflareClient,
                                           accountId: types.ImagesAccountIdentifier,
                                           body: types.ImagesImagesConfigEditRequest): Future[types.ImagesImagesConfigResponse] {.async.} =
  ## Update account-level Cloudflare Images settings. Only the settings included in
  ## the request are changed.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/images/v1/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImagesConfigResponse)
  else:
    raise newException(CloudflareClientError, body)
