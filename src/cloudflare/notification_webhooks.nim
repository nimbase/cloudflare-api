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
  PostAccountsAccountIdAlertingV3DestinationsWebhooksRequest = object
    name: types.AaaComponentsSchemasName
    secret: Option[types.AaaSecret]
    url: types.AaaUrl
  PutAccountsAccountIdAlertingV3DestinationsWebhooksWebhookIdRequest = object
    name: types.AaaComponentsSchemasName
    secret: Option[types.AaaSecret]
    url: types.AaaUrl

proc getAccountsAccountIdAlertingV3DestinationsWebhooks*(client: CloudflareClient,
                                                         accountId: types.AaaAccountId): Future[types.AaaWebhooksComponentsSchemasResponseCollection] {.async.} =
  ## Gets a list of all configured webhook destinations.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/destinations/webhooks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaWebhooksComponentsSchemasResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAlertingV3DestinationsWebhooks*(client: CloudflareClient,
                                                          accountId: types.AaaAccountId,
                                                          body: PostAccountsAccountIdAlertingV3DestinationsWebhooksRequest): Future[types.AaaIdResponse] {.async.} =
  ## Creates a new webhook destination.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/alerting/v3/destinations/webhooks", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AaaIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAlertingV3DestinationsWebhooksWebhookId*(client: CloudflareClient,
                                                                  accountId: types.AaaAccountId,
                                                                  webhookId: types.AaaWebhookId): Future[types.AaaSchemasSingleResponse] {.async.} =
  ## Get details for a single webhooks destination.

  let res = await client.httpGET(fmt"/accounts/{accountId}/alerting/v3/destinations/webhooks/{webhookId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaSchemasSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAlertingV3DestinationsWebhooksWebhookId*(client: CloudflareClient,
                                                                  webhookId: types.AaaWebhookId,
                                                                  accountId: types.AaaAccountId,
                                                                  body: PutAccountsAccountIdAlertingV3DestinationsWebhooksWebhookIdRequest): Future[types.AaaIdResponse] {.async.} =
  ## Update a webhook destination.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/alerting/v3/destinations/webhooks/{webhookId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAlertingV3DestinationsWebhooksWebhookId*(client: CloudflareClient,
                                                                     webhookId: types.AaaWebhookId,
                                                                     accountId: types.AaaAccountId): Future[types.AaaApiResponseCommon2] {.async.} =
  ## Delete a configured webhook destination.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/alerting/v3/destinations/webhooks/{webhookId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AaaApiResponseCommon2)
  else:
    raise newException(CloudflareClientError, body)
