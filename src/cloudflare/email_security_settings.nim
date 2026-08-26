# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdEmailSecuritySettingsAllowPoliciesBatchRequest = object
    deletes: seq[JsonNode]
    patches: seq[JsonNode]
    posts: seq[types.EmailSecurityCreateAllowPolicy]
    puts: seq[JsonNode]
  PostAccountsAccountIdEmailSecuritySettingsBlockSendersBatchRequest = object
    deletes: seq[JsonNode]
    patches: seq[JsonNode]
    posts: seq[types.EmailSecurityCreateBlockedSender]
    puts: seq[JsonNode]
  PostAccountsAccountIdEmailSecuritySettingsContentPoliciesBatchRequest = object
    deletes: seq[JsonNode]
    patches: seq[JsonNode]
    posts: seq[types.EmailSecurityCreateContentPolicy]
    puts: seq[JsonNode]
  PostAccountsAccountIdEmailSecuritySettingsDomainsBatchRequest = object
    deletes: seq[JsonNode]
    patches: seq[JsonNode]
    posts: seq[types.EmailSecurityCreateDomain]
    puts: seq[JsonNode]
  PostAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsBatchRequest = object
    deletes: seq[JsonNode]
  PostAccountsAccountIdEmailSecuritySettingsTrustedDomainsBatchRequest = object
    deletes: seq[JsonNode]
    patches: seq[JsonNode]
    posts: seq[types.EmailSecurityCreateTrustedDomain]
    puts: seq[JsonNode]
  PostAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsBatchRequest = object
    deletes: seq[JsonNode]
    patches: seq[JsonNode]
    posts: seq[types.EmailSecurityCreateUrlIgnorePattern]
    puts: seq[JsonNode]
  EmailSecuritySettingOrderOption* = enum
    orderPattern = "pattern"
    orderCreatedAt = "created_at"

  EmailSecuritySettingDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdEmailSecuritySettingsAllowPolicies*(client: CloudflareClient,
                                                             page: int64 = 1,
                                                             perPage: int64 = 20,
                                                             search: string = default(string),
                                                             order: EmailSecuritySettingOrderOption,
                                                             direction: EmailSecuritySettingDirectionOption,
                                                             isExemptRecipient: bool = default(bool),
                                                             isTrustedSender: bool = default(bool),
                                                             isAcceptableSender: bool = default(bool),
                                                             verifySender: bool = default(bool),
                                                             patternType: JsonNode = default(JsonNode),
                                                             pattern: string = default(string)): Future[JsonNode] {.async.} =
  ## Returns a paginated list of email allow policies. These policies exempt matching
  ## emails from security detection, allowing them to bypass disposition actions.
  ## Supports filtering by pattern type and policy attributes.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["order"] = $order
  q["direction"] = $direction
  q["is_exempt_recipient"] = $isExemptRecipient
  q["is_trusted_sender"] = $isTrustedSender
  q["is_acceptable_sender"] = $isAcceptableSender
  q["verify_sender"] = $verifySender
  q["pattern_type"] = $patternType
  q["pattern"] = $pattern
  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/allow_policies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsAllowPolicies*(client: CloudflareClient,
                                                              body: types.EmailSecurityCreateAllowPolicy): Future[JsonNode] {.async.} =
  ## Creates a new allow policy that exempts matching emails from security
  ## detections. Use with caution as this bypasses email security scanning. Policies
  ## can match on sender patterns and apply to specific detections or all detections.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/allow_policies", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsAllowPoliciesBatch*(client: CloudflareClient,
                                                                   body: PostAccountsAccountIdEmailSecuritySettingsAllowPoliciesBatchRequest): Future[JsonNode] {.async.} =
  ## Executes multiple operations atomically. All four operation arrays
  ## (deletes, patches, puts, posts) are required and executed in order.
  ## Send empty arrays for unused operations.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/allow_policies/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsAllowPoliciesPolicyId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves details for a specific allow policy including its pattern,
  ## dispositions that are exempted, and whether it applies to all detections.

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/allow_policies/{policy_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdEmailSecuritySettingsAllowPoliciesPolicyId*(client: CloudflareClient,
                                                                     body: types.EmailSecurityCreateAllowPolicy): Future[JsonNode] {.async.} =
  ## Replaces an existing allow policy in full. Unlike PATCH, every field is taken
  ## from the request body, so optional fields that are omitted are reset rather than
  ## left untouched. Use this when managing policies declaratively.

  let res = await client.httpPUT("/accounts/{account_id}/email-security/settings/allow_policies/{policy_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsAllowPoliciesPolicyId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes an allow policy. After deletion, emails matching this pattern will be
  ## subject to normal security scanning and disposition actions.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/allow_policies/{policy_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSecuritySettingsAllowPoliciesPolicyId*(client: CloudflareClient,
                                                                       body: types.EmailSecurityUpdateAllowPolicy): Future[JsonNode] {.async.} =
  ## Updates an existing allow policy. Only provided fields will be modified. Changes
  ## take effect for new emails matching the pattern.

  let res = await client.httpPATCH("/accounts/{account_id}/email-security/settings/allow_policies/{policy_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsBlockSenders*(client: CloudflareClient,
                                                            page: int64 = 1,
                                                            perPage: int64 = 20,
                                                            search: string = default(string),
                                                            order: EmailSecuritySettingOrderOption,
                                                            direction: EmailSecuritySettingDirectionOption,
                                                            patternType: JsonNode = default(JsonNode),
                                                            pattern: string = default(string)): Future[JsonNode] {.async.} =
  ## Returns a paginated list of blocked email sender patterns. These patterns
  ## prevent emails from matching senders from being delivered. Supports filtering by
  ## pattern type and searching across patterns.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["order"] = $order
  q["direction"] = $direction
  q["pattern_type"] = $patternType
  q["pattern"] = $pattern
  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/block_senders", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsBlockSenders*(client: CloudflareClient,
                                                             body: types.EmailSecurityCreateBlockedSender): Future[JsonNode] {.async.} =
  ## Creates a new blocked sender pattern. Emails matching this pattern will be
  ## blocked from delivery. Patterns can be email addresses, domains, or IP
  ## addresses, and support regular expressions.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/block_senders", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsBlockSendersBatch*(client: CloudflareClient,
                                                                  body: PostAccountsAccountIdEmailSecuritySettingsBlockSendersBatchRequest): Future[JsonNode] {.async.} =
  ## Executes multiple operations atomically. All four operation arrays
  ## (deletes, patches, puts, posts) are required and executed in order.
  ## Send empty arrays for unused operations.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/block_senders/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsBlockSendersPatternId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves details for a specific blocked sender pattern including its pattern
  ## type, value, and metadata.

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/block_senders/{pattern_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdEmailSecuritySettingsBlockSendersPatternId*(client: CloudflareClient,
                                                                     body: types.EmailSecurityCreateBlockedSender): Future[JsonNode] {.async.} =
  ## Replaces an existing blocked sender pattern in full. Unlike PATCH, every field
  ## is taken from the request body, so optional fields that are omitted are reset
  ## rather than left untouched. Use this when managing blocked senders
  ## declaratively.

  let res = await client.httpPUT("/accounts/{account_id}/email-security/settings/block_senders/{pattern_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsBlockSendersPatternId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes a blocked sender pattern. After deletion, emails from this sender will
  ## no longer be automatically blocked based on this rule.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/block_senders/{pattern_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSecuritySettingsBlockSendersPatternId*(client: CloudflareClient,
                                                                       body: types.EmailSecurityUpdateBlockedSender): Future[JsonNode] {.async.} =
  ## Updates an existing blocked sender pattern. Only provided fields will be
  ## modified. The pattern will continue blocking emails until deleted.

  let res = await client.httpPATCH("/accounts/{account_id}/email-security/settings/block_senders/{pattern_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsContentPolicies*(client: CloudflareClient,
                                                               page: int64 = 1,
                                                               perPage: int64 = 20,
                                                               search: string = default(string),
                                                               order: EmailSecuritySettingOrderOption,
                                                               direction: EmailSecuritySettingDirectionOption,
                                                               enabled: bool = default(bool),
                                                               name: string = default(string)): Future[JsonNode] {.async.} =
  ## Returns a paginated list of content policies. These policies match against the
  ## subject or body of emails using a pattern. Supports filtering by name or enabled
  ## status, and searching across name and pattern fields.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["order"] = $order
  q["direction"] = $direction
  q["enabled"] = $enabled
  q["name"] = $name
  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/content_policies", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsContentPolicies*(client: CloudflareClient,
                                                                body: types.EmailSecurityCreateContentPolicy): Future[JsonNode] {.async.} =
  ## Creates a new content policy. Emails whose subject or body matches the pattern
  ## will be subject to the configured action.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/content_policies", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsContentPoliciesBatch*(client: CloudflareClient,
                                                                     body: PostAccountsAccountIdEmailSecuritySettingsContentPoliciesBatchRequest): Future[JsonNode] {.async.} =
  ## Executes multiple operations atomically. All four operation arrays
  ## (deletes, patches, puts, posts) are required and executed in order.
  ## Send empty arrays for unused operations.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/content_policies/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsContentPoliciesPolicyId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves details for a specific content policy including its pattern, targets,
  ## and metadata.

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/content_policies/{policy_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsContentPoliciesPolicyId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes a content policy. After deletion, emails will no longer be evaluated
  ## against this pattern.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/content_policies/{policy_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSecuritySettingsContentPoliciesPolicyId*(client: CloudflareClient,
                                                                         body: types.EmailSecurityUpdateContentPolicy): Future[JsonNode] {.async.} =
  ## Updates an existing content policy. Only provided fields will be modified.

  let res = await client.httpPATCH("/accounts/{account_id}/email-security/settings/content_policies/{policy_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsDomains*(client: CloudflareClient,
                                                       page: int64 = 1,
                                                       perPage: int64 = 20,
                                                       search: string = default(string),
                                                       order: EmailSecuritySettingOrderOption,
                                                       direction: EmailSecuritySettingDirectionOption,
                                                       allowedDeliveryMode: types.EmailSecurityDeliveryMode = default(types.EmailSecurityDeliveryMode),
                                                       domain: seq[string] = @[],
                                                       activeDeliveryMode: types.EmailSecurityDeliveryMode = default(types.EmailSecurityDeliveryMode),
                                                       integrationId: string = default(string),
                                                       status: types.EmailSecurityDomainStatus = default(types.EmailSecurityDomainStatus)): Future[JsonNode] {.async.} =
  ## Returns a paginated list of email domains protected by Email Security. Includes
  ## domain configuration, delivery modes, and authorization status. Supports
  ## filtering by delivery mode and integration ID.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["order"] = $order
  q["direction"] = $direction
  q["allowed_delivery_mode"] = $allowedDeliveryMode
  for v in domain: q["domain"] = $v
  q["active_delivery_mode"] = $activeDeliveryMode
  q["integration_id"] = $integrationId
  q["status"] = $status
  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/domains", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsDomains*(client: CloudflareClient,
                                                        body: types.EmailSecurityCreateDomain): Future[JsonNode] {.async.} =
  ## Protects a new email domain by adding it to Email Security. Accepts a flat
  ## configuration object covering all delivery modes. Returns the newly created
  ## domain configuration.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/domains", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsDomains*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes protection from multiple email domains. Deprecated; use the batch
  ## endpoint instead.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/domains", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsDomainsBatch*(client: CloudflareClient,
                                                             body: PostAccountsAccountIdEmailSecuritySettingsDomainsBatchRequest): Future[JsonNode] {.async.} =
  ## Executes multiple domain operations in a single request. All four operation
  ## arrays
  ## (deletes, patches, puts, posts) are required and executed in order.
  ## Send empty arrays for unused operations.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/domains/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsDomainsDomainId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves detailed information for a specific protected email domain including
  ## its delivery configuration, SPF/DMARC status, and authorization state.

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/domains/{domain_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdEmailSecuritySettingsDomainsDomainId*(client: CloudflareClient,
                                                               body: types.EmailSecurityReplaceDomain): Future[JsonNode] {.async.} =
  ## Replaces all mutable fields of a protected email domain in a single atomic
  ## operation. Unlike PATCH, all non-computed fields are required.

  let res = await client.httpPUT("/accounts/{account_id}/email-security/settings/domains/{domain_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsDomainsDomainId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes email security protection from a domain. After deletion, emails for this
  ## domain will no longer be processed by Email Security. This action cannot be
  ## undone.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/domains/{domain_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSecuritySettingsDomainsDomainId*(client: CloudflareClient,
                                                                 body: types.EmailSecurityUpdateDomain): Future[JsonNode] {.async.} =
  ## Updates configuration for a protected email domain. Only provided fields will be
  ## modified. Changes affect delivery mode, security settings, and regional
  ## processing.

  let res = await client.httpPATCH("/accounts/{account_id}/email-security/settings/domains/{domain_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsDomainsDomainIdVerification*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns DNS TXT verification details for a domain created through the Terraform
  ## API.
  ## Returns `200 OK` with the TXT record name and value when the domain uses
  ## `dns_txt`
  ## verification. Returns `204 No Content` for pre-existing domains or domains
  ## verified
  ## by other means (Cloudflare zone ownership, CASB integration).

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/domains/{domain_id}/verification")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsImpersonationRegistry*(client: CloudflareClient,
                                                                     page: int64 = 1,
                                                                     perPage: int64 = 20,
                                                                     search: string = default(string),
                                                                     order: EmailSecuritySettingOrderOption,
                                                                     direction: EmailSecuritySettingDirectionOption,
                                                                     provenance: types.EmailSecurityProvenance = default(types.EmailSecurityProvenance)): Future[JsonNode] {.async.} =
  ## Returns a paginated list of protected identities in the impersonation registry.
  ## These entries define identities and email addresses to protect from
  ## impersonation attacks. Can be manually added or automatically synced from
  ## directory integrations.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["order"] = $order
  q["direction"] = $direction
  q["provenance"] = $provenance
  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/impersonation_registry", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsImpersonationRegistry*(client: CloudflareClient,
                                                                      body: types.EmailSecurityCreateImpersonationRegistry): Future[JsonNode] {.async.} =
  ## Creates a new entry in the impersonation registry to protect against
  ## impersonation. Emails attempting to impersonate this identity will be flagged.
  ## Supports regex patterns for flexible email matching.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/impersonation_registry", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsImpersonationRegistryImpersonationRegistryId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves details for a specific impersonation registry entry including the
  ## protected identity, email pattern, and synchronization source if
  ## directory-synced.

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/impersonation_registry/{impersonation_registry_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsImpersonationRegistryImpersonationRegistryId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes an entry from the impersonation registry. After deletion, this identity
  ## will no longer be protected from impersonation.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/impersonation_registry/{impersonation_registry_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSecuritySettingsImpersonationRegistryImpersonationRegistryId*(client: CloudflareClient,
                                                                                              body: types.EmailSecurityUpdateImpersonationRegistry): Future[JsonNode] {.async.} =
  ## Updates an existing impersonation registry entry. Only provided fields will be
  ## modified. Directory-synced entries can't be updated.

  let res = await client.httpPATCH("/accounts/{account_id}/email-security/settings/impersonation_registry/{impersonation_registry_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictions*(client: CloudflareClient,
                                                                         page: int64 = 1,
                                                                         perPage: int64 = 20,
                                                                         search: string = default(string),
                                                                         order: EmailSecuritySettingOrderOption,
                                                                         direction: EmailSecuritySettingDirectionOption): Future[JsonNode] {.async.} =
  ## Returns a paginated list of sending domain restrictions. These restrictions
  ## enforce TLS requirements for emails from specific domains. Mail without TLS from
  ## restricted domains will be dropped unless the subdomain is in the exclude list.
  ## Supports sorting and searching.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["order"] = $order
  q["direction"] = $direction
  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/sending_domain_restrictions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictions*(client: CloudflareClient,
                                                                          body: types.EmailSecurityCreateSendingDomainRestriction): Future[JsonNode] {.async.} =
  ## Creates a new sending domain restriction to enforce TLS requirements for a
  ## domain. Emails without TLS from this domain will be dropped unless the subdomain
  ## is in the exclude list.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/sending_domain_restrictions", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsBatch*(client: CloudflareClient,
                                                                               body: PostAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsBatchRequest): Future[JsonNode] {.async.} =
  ## Executes multiple delete operations on sending domain restrictions atomically.
  ## All operations succeed or fail together as a transaction. Currently only
  ## supports batch deletion. Removes TLS enforcement requirements for the specified
  ## domains.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/sending_domain_restrictions/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsSendingDomainRestrictionId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves details for a specific sending domain restriction including the domain
  ## requiring TLS and any excluded subdomains exempt from the TLS requirement.

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/sending_domain_restrictions/{sending_domain_restriction_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsSendingDomainRestrictionId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes a sending domain restriction. After deletion, TLS will no longer be
  ## enforced for emails from this domain.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/sending_domain_restrictions/{sending_domain_restriction_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSecuritySettingsSendingDomainRestrictionsSendingDomainRestrictionId*(client: CloudflareClient,
                                                                                                     body: types.EmailSecurityUpdateSendingDomainRestriction): Future[JsonNode] {.async.} =
  ## Updates an existing sending domain restriction. Only provided fields will be
  ## modified. Changes affect which domains require TLS and which subdomains are
  ## excluded.

  let res = await client.httpPATCH("/accounts/{account_id}/email-security/settings/sending_domain_restrictions/{sending_domain_restriction_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsTrustedDomains*(client: CloudflareClient,
                                                              page: int64 = 1,
                                                              perPage: int64 = 20,
                                                              search: string = default(string),
                                                              order: EmailSecuritySettingOrderOption,
                                                              direction: EmailSecuritySettingDirectionOption,
                                                              isRecent: bool = default(bool),
                                                              isSimilarity: bool = default(bool),
                                                              pattern: string = default(string)): Future[JsonNode] {.async.} =
  ## Returns a paginated list of trusted domain patterns. Trusted domains prevent
  ## false positives for recently registered domains and lookalike domain detections.
  ## Patterns can use regular expressions for flexible matching.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["search"] = $search
  q["order"] = $order
  q["direction"] = $direction
  q["is_recent"] = $isRecent
  q["is_similarity"] = $isSimilarity
  q["pattern"] = $pattern
  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/trusted_domains", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsTrustedDomains*(client: CloudflareClient,
                                                               body: types.EmailSecurityCreateTrustedDomain): Future[JsonNode] {.async.} =
  ## Creates a new trusted domain pattern. Use for partner domains or approved
  ## senders that should bypass recent domain registration and similarity checks.
  ## Configure whether it prevents recent domain or spoof dispositions.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/trusted_domains", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsTrustedDomainsBatch*(client: CloudflareClient,
                                                                    body: PostAccountsAccountIdEmailSecuritySettingsTrustedDomainsBatchRequest): Future[JsonNode] {.async.} =
  ## Executes multiple operations atomically. All four operation arrays
  ## (deletes, patches, puts, posts) are required and executed in order.
  ## Send empty arrays for unused operations.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/trusted_domains/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsTrustedDomainsTrustedDomainId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves details for a specific trusted domain pattern including its pattern
  ## value, whether it uses regex matching, and which detection types it affects.

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/trusted_domains/{trusted_domain_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdEmailSecuritySettingsTrustedDomainsTrustedDomainId*(client: CloudflareClient,
                                                                             body: types.EmailSecurityCreateTrustedDomain): Future[JsonNode] {.async.} =
  ## Replaces an existing trusted domain in full. Unlike PATCH, every field is taken
  ## from the request body, so optional fields that are omitted are reset rather than
  ## left untouched. Use this when managing trusted domains declaratively.

  let res = await client.httpPUT("/accounts/{account_id}/email-security/settings/trusted_domains/{trusted_domain_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsTrustedDomainsTrustedDomainId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes a trusted domain pattern. After deletion, emails from this domain will
  ## be subject to normal recent domain and similarity checks.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/trusted_domains/{trusted_domain_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSecuritySettingsTrustedDomainsTrustedDomainId*(client: CloudflareClient,
                                                                               body: types.EmailSecurityUpdateTrustedDomain): Future[JsonNode] {.async.} =
  ## Updates an existing trusted domain pattern. Only provided fields will be
  ## modified. Changes take effect for new emails matching the pattern.

  let res = await client.httpPATCH("/accounts/{account_id}/email-security/settings/trusted_domains/{trusted_domain_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsUrlIgnorePatterns*(client: CloudflareClient,
                                                                 page: int64 = 1,
                                                                 perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns a paginated list of URL rewrite ignore patterns for the account. URLs
  ## matching these patterns will not be rewritten.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/url_ignore_patterns", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsUrlIgnorePatterns*(client: CloudflareClient,
                                                                  body: types.EmailSecurityCreateUrlIgnorePattern): Future[JsonNode] {.async.} =
  ## Creates a new URL rewrite ignore pattern. URLs matching this pattern will not be
  ## rewritten.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/url_ignore_patterns", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsBatch*(client: CloudflareClient,
                                                                       body: PostAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsBatchRequest): Future[JsonNode] {.async.} =
  ## Sends a batch of URL ignore patterns API calls to execute together.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/settings/url_ignore_patterns/batch", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsPatternId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns a single URL rewrite ignore pattern by its identifier.

  let res = await client.httpGET("/accounts/{account_id}/email-security/settings/url_ignore_patterns/{pattern_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsPatternId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Removes a URL rewrite ignore pattern. After deletion, URLs matching this pattern
  ## will be rewritten again.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/settings/url_ignore_patterns/{pattern_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdEmailSecuritySettingsUrlIgnorePatternsPatternId*(client: CloudflareClient,
                                                                            body: types.EmailSecurityUpdateUrlIgnorePattern): Future[JsonNode] {.async.} =
  ## Updates an existing URL rewrite ignore pattern. Only provided fields will be
  ## modified.

  let res = await client.httpPATCH("/accounts/{account_id}/email-security/settings/url_ignore_patterns/{pattern_id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
