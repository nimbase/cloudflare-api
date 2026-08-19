# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdSsoConnectorsRequest = object
    begin_verification: Option[bool]
    email_domain: string
    use_fedramp_language: Option[types.IamUseFedrampLanguage]
  PatchAccountsAccountIdSsoConnectorsSsoConnectorIdRequest = object
    enabled: Option[bool]
    use_fedramp_language: Option[types.IamUseFedrampLanguage]

proc getAccountsAccountIdSsoConnectors*(client: CloudflareClient,
                                        accountId: types.IamAccountIdentifier): Future[types.IamSsoConnectorCollectionResponse] {.async.} =
  ## Lists all SSO connectors configured for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/sso_connectors")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSsoConnectorCollectionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSsoConnectors*(client: CloudflareClient,
                                         accountId: types.IamAccountIdentifier,
                                         body: PostAccountsAccountIdSsoConnectorsRequest): Future[types.IamSsoConnectorResponse] {.async.} =
  ## Creates a new SSO connector for logging into Cloudflare through an identity
  ## provider.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/sso_connectors", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSsoConnectorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSsoConnectorsSsoConnectorId*(client: CloudflareClient,
                                                      accountId: types.IamAccountIdentifier,
                                                      ssoConnectorId: types.IamSsoConnectorIdentifier): Future[types.IamSsoConnectorResponse] {.async.} =
  ## Retrieves details for a specific SSO connector.

  let res = await client.httpGET(fmt"/accounts/{accountId}/sso_connectors/{ssoConnectorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSsoConnectorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSsoConnectorsSsoConnectorId*(client: CloudflareClient,
                                                         accountId: types.IamAccountIdentifier,
                                                         ssoConnectorId: types.IamSsoConnectorIdentifier): Future[types.IamApiResponseSingleId] {.async.} =
  ## Deletes an SSO connector from the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/sso_connectors/{ssoConnectorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingleId)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdSsoConnectorsSsoConnectorId*(client: CloudflareClient,
                                                        accountId: types.IamAccountIdentifier,
                                                        ssoConnectorId: types.IamSsoConnectorIdentifier,
                                                        body: PatchAccountsAccountIdSsoConnectorsSsoConnectorIdRequest): Future[types.IamSsoConnectorResponse] {.async.} =
  ## Updates the state or configuration of an SSO connector.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/sso_connectors/{ssoConnectorId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSsoConnectorResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSsoConnectorsSsoConnectorIdBeginVerification*(client: CloudflareClient,
                                                                        accountId: types.IamAccountIdentifier,
                                                                        ssoConnectorId: types.IamSsoConnectorIdentifier): Future[types.IamApiResponseSingle] {.async.} =
  ## Validates the user has added the DNS TXT record required for validating
  ## ownership of the domain they are trying to set up a connector for.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/sso_connectors/{ssoConnectorId}/begin_verification")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamApiResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
