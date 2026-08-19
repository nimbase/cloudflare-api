# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdZtRiskScoringIntegrations*(client: CloudflareClient,
                                                    accountId: string): Future[JsonNode] {.async.} =
  ## Lists all configured Zero Trust risk score integrations for the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/integrations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdZtRiskScoringIntegrations*(client: CloudflareClient,
                                                     accountId: string,
                                                     body: types.DlpCreateIntegrationBody): Future[JsonNode] {.async.} =
  ## Creates a new Zero Trust risk score integration, connecting external risk
  ## signals to Cloudflare's risk scoring system.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/zt_risk_scoring/integrations", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringIntegrationsReferenceIdReferenceId*(client: CloudflareClient,
                                                                          accountId: string,
                                                                          referenceId: string): Future[JsonNode] {.async.} =
  ## Retrieves a Zero Trust risk score integration using its external reference ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/integrations/reference_id/{referenceId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZtRiskScoringIntegrationsIntegrationId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 integrationId: string): Future[JsonNode] {.async.} =
  ## Gets a Zero Trust risk score integration by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zt_risk_scoring/integrations/{integrationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdZtRiskScoringIntegrationsIntegrationId*(client: CloudflareClient,
                                                                 accountId: string,
                                                                 integrationId: string,
                                                                 body: types.DlpUpdateIntegrationBody): Future[JsonNode] {.async.} =
  ## Overwrite the reference_id, tenant_url, and active values with the ones
  ## provided.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/zt_risk_scoring/integrations/{integrationId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdZtRiskScoringIntegrationsIntegrationId*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    integrationId: string): Future[JsonNode] {.async.} =
  ## Removes a Zero Trust risk score integration, disconnecting the external risk
  ## signal source.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/zt_risk_scoring/integrations/{integrationId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
