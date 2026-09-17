# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient

type
  GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeUserMeResponse* = object
    display_name: string
      ## User display name
    id: string
      ## Unique user ID

proc getAccountsAccountIdCloudforceOneV2RequestsProjectTypeUserMe*(client: CloudflareClient,
                                                                   accountId: string,
                                                                   projectType: string): Future[GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeUserMeResponse] {.async.} =
  ## Get the current user's profile in a specific RFI project.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/v2/requests/{projectType}/user/me")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneV2RequestsProjectTypeUserMeResponse)
  else:
    raise newException(CloudflareClientError, body)
