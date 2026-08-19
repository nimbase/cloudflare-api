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
  PostZonesZoneIdAccessAppsAppIdPoliciesRequest = object
    approval_groups: Option[types.AccessApprovalGroups2]
    approval_required: Option[types.AccessApprovalRequired2]
    decision: types.AccessDecision2
    exclude: Option[types.AccessExclude3]
    `include`: types.AccessInclude
    isolation_required: Option[types.AccessIsolationRequired2]
    name: types.AccessName9
    precedence: Option[types.AccessPrecedence2]
    purpose_justification_prompt: Option[types.AccessPurposeJustificationPrompt]
    purpose_justification_required: Option[types.AccessPurposeJustificationRequired2]
    require: Option[types.AccessRequire3]
  PutZonesZoneIdAccessAppsAppIdPoliciesPolicyIdRequest = object
    approval_groups: Option[types.AccessApprovalGroups2]
    approval_required: Option[types.AccessApprovalRequired2]
    decision: types.AccessDecision2
    exclude: Option[types.AccessExclude3]
    `include`: types.AccessInclude
    isolation_required: Option[types.AccessIsolationRequired2]
    name: types.AccessName9
    precedence: Option[types.AccessPrecedence2]
    purpose_justification_prompt: Option[types.AccessPurposeJustificationPrompt]
    purpose_justification_required: Option[types.AccessPurposeJustificationRequired2]
    require: Option[types.AccessRequire3]

proc getZonesZoneIdAccessAppsAppIdPolicies*(client: CloudflareClient,
                                            appId: types.AccessUuid,
                                            zoneId: types.AccessIdentifier): Future[types.AccessResponseCollection23] {.async.} =
  ## Lists Access policies configured for an application.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/apps/{appId}/policies")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection23)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdAccessAppsAppIdPolicies*(client: CloudflareClient,
                                             appId: types.AccessUuid,
                                             zoneId: types.AccessIdentifier,
                                             body: PostZonesZoneIdAccessAppsAppIdPoliciesRequest): Future[types.AccessSingleResponse22] {.async.} =
  ## Create a new Access policy for an application.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/access/apps/{appId}/policies", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleResponse22)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdAccessAppsAppIdPoliciesPolicyId*(client: CloudflareClient,
                                                    policyId: types.AccessUuid,
                                                    appId: types.AccessUuid,
                                                    zoneId: types.AccessIdentifier): Future[types.AccessSingleResponse22] {.async.} =
  ## Fetches a single Access policy.

  let res = await client.httpGET(fmt"/zones/{zoneId}/access/apps/{appId}/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse22)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdAccessAppsAppIdPoliciesPolicyId*(client: CloudflareClient,
                                                    policyId: types.AccessUuid,
                                                    appId: types.AccessUuid,
                                                    zoneId: types.AccessIdentifier,
                                                    body: PutZonesZoneIdAccessAppsAppIdPoliciesPolicyIdRequest): Future[types.AccessSingleResponse22] {.async.} =
  ## Update a configured Access policy.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/access/apps/{appId}/policies/{policyId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleResponse22)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdAccessAppsAppIdPoliciesPolicyId*(client: CloudflareClient,
                                                       policyId: types.AccessUuid,
                                                       appId: types.AccessUuid,
                                                       zoneId: types.AccessIdentifier): Future[types.AccessIdResponse] {.async.} =
  ## Delete an Access policy.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/access/apps/{appId}/policies/{policyId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessIdResponse)
  else:
    raise newException(CloudflareClientError, body)
