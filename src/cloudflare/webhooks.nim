# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDataSecurityPostureWebhooks*(client: CloudflareClient,
                                                      accountId: string): Future[types.PostureApiWebhookListResponse] {.async.} =
  ## Retrieves all webhook configurations for the authenticated account.
  ## Returns an array of webhook configurations that can be used to send finding
  ## notifications.

  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/webhooks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiWebhookListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureWebhooks*(client: CloudflareClient,
                                                       accountId: string,
                                                       body: types.PostureApiCreateWebhookRequest): Future[JsonNode] {.async.} =
  ## Creates a new webhook configuration for sending finding notifications to
  ## external endpoints.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/webhooks", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureWebhooksEvaluate*(client: CloudflareClient,
                                                               accountId: string,
                                                               body: types.PostureApiEvaluateNewWebhookRequest): Future[JsonNode] {.async.} =
  ## Sends a test webhook event to the specified destination URL to verify the
  ## webhook endpoint
  ## is reachable and properly configured. This allows customers to validate their
  ## webhook
  ## configuration before creating the actual webhook resource.
  ##
  ## The test payload includes:
  ## - event_type: "webhook.test"
  ## - timestamp: Current UTC timestamp
  ## - message: Test message indicating this is from Cloudflare CASB
  ## - data: Object with test: true

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/webhooks/evaluate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureWebhooksJobs*(client: CloudflareClient,
                                                           accountId: string,
                                                           body: types.PostureApiCreateWebhookJobsRequest): Future[types.PostureApiCreateWebhookJobsResponse] {.async.} =
  ## Creates webhook jobs to send a finding instance to one or more configured
  ## webhooks.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/webhooks/jobs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiCreateWebhookJobsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureWebhooksWebhookId*(client: CloudflareClient,
                                                               accountId: string,
                                                               webhookId: string): Future[types.PostureApiWebhookResponse] {.async.} =
  ## Retrieves a specific webhook configuration by its unique identifier.

  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/webhooks/{webhookId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiWebhookResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdDataSecurityPostureWebhooksWebhookId*(client: CloudflareClient,
                                                               accountId: string,
                                                               webhookId: string,
                                                               body: types.PostureApiUpdateWebhookRequest): Future[JsonNode] {.async.} =
  ## Updates an existing webhook configuration with new settings.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/data-security/posture/webhooks/{webhookId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdDataSecurityPostureWebhooksWebhookId*(client: CloudflareClient,
                                                                  accountId: string,
                                                                  webhookId: string): Future[types.PostureApiApiResponseCommon] {.async.} =
  ## Soft deletes a webhook configuration by its unique identifier.
  ## The webhook will be marked as deleted and will no longer be available for use.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/data-security/posture/webhooks/{webhookId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdDataSecurityPostureWebhooksWebhookIdEvaluate*(client: CloudflareClient,
                                                                        accountId: string,
                                                                        webhookId: string): Future[JsonNode] {.async.} =
  ## Sends a test webhook event using an existing webhook configuration.
  ## This allows customers to verify their webhook endpoint is still reachable and
  ## properly
  ## configured after creating the webhook resource.
  ##
  ## The test payload includes:
  ## - event_type: "webhook.test"
  ## - timestamp: Current UTC timestamp
  ## - message: Test message indicating this is from Cloudflare CASB
  ## - data: Object with test: true

  let res = await client.httpPOST(fmt"/accounts/{accountId}/data-security/posture/webhooks/{webhookId}/evaluate")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdWebhooks*(client: CloudflareClient,
                                                   accountId: types.RealtimekitAccountIdentifier,
                                                   appId: types.RealtimekitAppId): Future[types.RealtimekitWebhooksListSuccessResponse] {.async.} =
  ## Returns details of all webhooks for an App.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/webhooks")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RealtimekitWebhooksListSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRealtimeKitAppIdWebhooks*(client: CloudflareClient,
                                                    accountId: types.RealtimekitAccountIdentifier,
                                                    appId: types.RealtimekitAppId,
                                                    body: types.RealtimekitWebhookRequest): Future[types.RealtimekitWebhookSuccessResponse] {.async.} =
  ## Adds a new webhook to an App.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/realtime/kit/{appId}/webhooks", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.RealtimekitWebhookSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdWebhooksAll*(client: CloudflareClient,
                                                      accountId: types.RealtimekitAccountIdentifier,
                                                      appId: types.RealtimekitAppId): Future[types.RealtimekitWebhookEventsSuccessResponse] {.async.} =
  ## Returns the list of webhook event names supported by RealtimeKit.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/webhooks/all")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RealtimekitWebhookEventsSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRealtimeKitAppIdWebhooksWebhookId*(client: CloudflareClient,
                                                            accountId: types.RealtimekitAccountIdentifier,
                                                            appId: types.RealtimekitAppId,
                                                            webhookId: string): Future[types.RealtimekitWebhookSuccessResponse] {.async.} =
  ## Returns webhook details for the given webhook ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/realtime/kit/{appId}/webhooks/{webhookId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RealtimekitWebhookSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRealtimeKitAppIdWebhooksWebhookId*(client: CloudflareClient,
                                                            accountId: types.RealtimekitAccountIdentifier,
                                                            appId: types.RealtimekitAppId,
                                                            webhookId: string,
                                                            body: types.RealtimekitWebhookRequest): Future[types.RealtimekitWebhookSuccessResponse] {.async.} =
  ## Replace all details for the given webhook ID.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/realtime/kit/{appId}/webhooks/{webhookId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RealtimekitWebhookSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdRealtimeKitAppIdWebhooksWebhookId*(client: CloudflareClient,
                                                               accountId: types.RealtimekitAccountIdentifier,
                                                               appId: types.RealtimekitAppId,
                                                               webhookId: string): Future[types.RealtimekitWebhookSuccessResponse] {.async.} =
  ## Removes a webhook for the given webhook ID.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/realtime/kit/{appId}/webhooks/{webhookId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RealtimekitWebhookSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdRealtimeKitAppIdWebhooksWebhookId*(client: CloudflareClient,
                                                              accountId: types.RealtimekitAccountIdentifier,
                                                              appId: types.RealtimekitAppId,
                                                              webhookId: string,
                                                              body: types.RealtimekitPatchWebhookRequest): Future[types.RealtimekitWebhookSuccessResponse] {.async.} =
  ## Edits the webhook details for the given webhook ID.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/realtime/kit/{appId}/webhooks/{webhookId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RealtimekitWebhookSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)
