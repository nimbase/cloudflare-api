# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDlpProfiles*(client: CloudflareClient,
                                      all: bool = default(bool),
                                      accountId: string): Future[JsonNode] {.async.} =
  ## Lists all DLP profiles in an account.

  var q = initOrderedTable[string, string]()
  q["all"] = $all
  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/profiles", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpProfilesCustom*(client: CloudflareClient,
                                            accountId: string): Future[JsonNode] {.async.} =
  ## Lists all DLP custom profiles in an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/profiles/custom")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpProfilesCustom*(client: CloudflareClient,
                                             accountId: string,
                                             body: types.DlpNewCustomProfile): Future[JsonNode] {.async.} =
  ## Creates a DLP custom profile.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/profiles/custom", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpProfilesCustomProfileId*(client: CloudflareClient,
                                                     accountId: string,
                                                     profileId: string): Future[JsonNode] {.async.} =
  ## Fetches a custom DLP profile by id.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/profiles/custom/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpProfilesCustomProfileId*(client: CloudflareClient,
                                                     accountId: string,
                                                     profileId: string,
                                                     body: types.DlpCustomProfileUpdate): Future[JsonNode] {.async.} =
  ## Updates a DLP custom profile.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/profiles/custom/{profileId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpProfilesCustomProfileId*(client: CloudflareClient,
                                                        accountId: string,
                                                        profileId: string): Future[JsonNode] {.async.} =
  ## Deletes a DLP custom profile.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/profiles/custom/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpProfilesPredefined*(client: CloudflareClient,
                                                 accountId: string,
                                                 body: types.DlpNewPredefinedProfile): Future[JsonNode] {.async.} =
  ## Creates a DLP predefined profile. Only supports enabling/disabling entries.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/profiles/predefined", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpProfilesPredefinedProfileId*(client: CloudflareClient,
                                                         accountId: string,
                                                         profileId: string): Future[JsonNode] {.async.} =
  ## Fetches a predefined DLP profile by id.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/profiles/predefined/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpProfilesPredefinedProfileId*(client: CloudflareClient,
                                                         accountId: string,
                                                         profileId: string,
                                                         body: types.DlpPredefinedProfileUpdate): Future[JsonNode] {.async.} =
  ## Updates a DLP predefined profile. Only supports enabling/disabling entries.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/profiles/predefined/{profileId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDlpProfilesPredefinedProfileId*(client: CloudflareClient,
                                                            accountId: string,
                                                            profileId: string): Future[JsonNode] {.async.} =
  ## This is a no-op as predefined profiles can't be deleted but is needed for our
  ## generated terraform API.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/dlp/profiles/predefined/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpProfilesPredefinedProfileIdConfig*(client: CloudflareClient,
                                                               accountId: string,
                                                               profileId: string): Future[JsonNode] {.async.} =
  ## This is similar to `get_predefined` but only returns entries that are enabled.
  ## This is needed for our terraform API
  ## Fetches a predefined DLP profile by id.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/profiles/predefined/{profileId}/config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDlpProfilesPredefinedProfileIdConfig*(client: CloudflareClient,
                                                                accountId: string,
                                                                profileId: string,
                                                                body: types.DlpPredefinedProfileConfigUpdate): Future[JsonNode] {.async.} =
  ## This is similar to `update_predefined` but only returns entries that are
  ## enabled.
  ## This is needed for our terraform API
  ## Creates a DLP predefined profile. Only supports enabling/disabling entries.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/dlp/profiles/predefined/{profileId}/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDlpProfilesPredefinedProfileIdConfig*(client: CloudflareClient,
                                                               accountId: string,
                                                               profileId: string,
                                                               body: types.DlpPredefinedProfileConfigUpdate): Future[JsonNode] {.async.} =
  ## This is similar to `update_predefined` but only returns entries that are
  ## enabled.
  ## This is needed for our terraform API
  ## Updates a DLP predefined profile. Only supports enabling/disabling entries.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/dlp/profiles/predefined/{profileId}/config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDlpProfilesProfileId*(client: CloudflareClient,
                                               accountId: string,
                                               profileId: string): Future[JsonNode] {.async.} =
  ## Fetches a DLP profile by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dlp/profiles/{profileId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
