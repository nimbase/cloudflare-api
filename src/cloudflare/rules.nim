# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  GetAccountsAccountIdCloudforceOneRulesManagedResponse* = object
    metadata: JsonNode
    rules: seq[JsonNode]
  PostAccountsAccountIdCloudforceOneRulesStructuredRequest = object
    condition: types.CloudforceOneEmailRuleConditionGroup
    description: Option[string]
    enabled: Option[bool]
    meta: Option[seq[types.CloudforceOneMetaInputEntry]]
    name: string
    strings: Option[seq[JsonNode]]
  PostAccountsAccountIdCloudforceOneRulesStructuredApprovalsIdResubmitRequest = object
    condition: types.CloudforceOneEmailRuleConditionGroup
    description: Option[string]
    enabled: Option[bool]
    meta: Option[seq[types.CloudforceOneMetaInputEntry]]
    name: string
    strings: Option[seq[JsonNode]]
  PostAccountsAccountIdCloudforceOneRulesStructuredValidateRequest = object
    condition: types.CloudforceOneEmailRuleConditionGroup
    description: Option[string]
    enabled: Option[bool]
    meta: Option[seq[types.CloudforceOneMetaInputEntry]]
    name: string
    strings: Option[seq[JsonNode]]
  PutAccountsAccountIdCloudforceOneRulesStructuredIdRequest = object
    condition: Option[types.CloudforceOneEmailRuleConditionGroup]
    description: Option[string]
    enabled: Option[bool]
    meta: Option[seq[types.CloudforceOneMetaInputEntry]]
    name: Option[string]
    strings: Option[seq[JsonNode]]
  PostAccountsAccountIdCloudforceOneRulesStructuredIdTestRequest = object
    sample_json: string
  PostAccountsAccountIdCloudforceOneRulesStructuredIdTestResponse* = object
    error: string
    matched: bool
    rules: seq[string]
  PostAccountsAccountIdCloudforceOneRulesValidateRequest = object
    content: string
    exclude_rule_id: Option[string]
    name: string
    namespaces: Option[seq[string]]
    path: Option[string]
  RuleRecursiveOption* = enum
    recursiveTrue = "true"
    recursiveFalse = "false"

  RuleIsPublicOption* = enum
    isPublicTrue = "true"
    isPublicFalse = "false"

  RuleModeOption* = enum
    modeExact = "exact"
    modeHybrid = "hybrid"
    modeVector = "vector"
    modeKeyword = "keyword"

  RuleLanguageOption* = enum
    languageYara = "yara"
    languageJs = "js"

  RuleModuleOption* = enum
    moduleEml = "eml"


proc getAccountsAccountIdCloudforceOneRules*(client: CloudflareClient,
                                             accountId: string,
                                             namespace: JsonNode = default(JsonNode),
                                             path: JsonNode = default(JsonNode),
                                             recursive: RuleRecursiveOption,
                                             search: string = default(string),
                                             isPublic: RuleIsPublicOption,
                                             limit: float64 = default(float64),
                                             offset: float64 = default(float64)): Future[types.CloudforceOneRulesListResponse] {.async.} =
  ## List all rules for an account with optional filtering.

  var q = initOrderedTable[string, string]()
  q["namespace"] = $namespace
  q["path"] = $path
  q["recursive"] = $recursive
  q["search"] = $search
  q["is_public"] = $isPublic
  q["limit"] = $limit
  q["offset"] = $offset
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRulesListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRules*(client: CloudflareClient,
                                              accountId: string,
                                              body: types.CloudforceOneCreateRule): Future[types.CloudforceOneRule] {.async.} =
  ## Create a new detection rule.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/rules", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CloudforceOneRule)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneRules*(client: CloudflareClient,
                                                accountId: string): Future[types.CloudforceOneDeleteAllResponse] {.async.} =
  ## Delete all rules in an account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneDeleteAllResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesExemptions*(client: CloudflareClient,
                                                       accountId: string): Future[types.CloudforceOneAccountExemptions] {.async.} =
  ## Get all exemption rule patterns for the account, grouped by type.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/exemptions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneAccountExemptions)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRulesExemptions*(client: CloudflareClient,
                                                        accountId: string,
                                                        body: types.CloudforceOnePartialAccountExemptions): Future[types.CloudforceOneAccountExemptions] {.async.} =
  ## Add regex patterns to per-account exemption rules (union semantics). Missing
  ## keys leave that type untouched; duplicates are silently deduped.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/rules/exemptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneAccountExemptions)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneRulesExemptions*(client: CloudflareClient,
                                                       accountId: string,
                                                       body: types.CloudforceOneUpdateAccountExemptionsBody): Future[types.CloudforceOneAccountExemptions] {.async.} =
  ## Replace existing exemption patterns with new values. Each key maps to an array
  ## of {old_pattern, new_pattern} entries. Missing keys leave that type untouched.
  ## Fails if any old pattern is not found or any new pattern already exists.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/rules/exemptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneAccountExemptions)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneRulesExemptions*(client: CloudflareClient,
                                                          accountId: string,
                                                          body: types.CloudforceOnePartialAccountExemptions): Future[types.CloudforceOneAccountExemptions] {.async.} =
  ## Remove regex patterns from per-account exemption rules. Missing keys leave that
  ## type untouched; non-existent patterns are silently skipped.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/rules/exemptions", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneAccountExemptions)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesManaged*(client: CloudflareClient,
                                                    accountId: string): Future[GetAccountsAccountIdCloudforceOneRulesManagedResponse] {.async.} =
  ## Get DFP managed rule metadata (name and description) from YARA rules.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/managed")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdCloudforceOneRulesManagedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesSearch*(client: CloudflareClient,
                                                   accountId: string,
                                                   namespace: JsonNode = default(JsonNode),
                                                   path: JsonNode = default(JsonNode),
                                                   recursive: RuleRecursiveOption,
                                                   search: string = default(string),
                                                   isPublic: RuleIsPublicOption,
                                                   limit: float64 = default(float64),
                                                   offset: float64 = default(float64),
                                                   query: string,
                                                   mode: RuleModeOption = modeHybrid,
                                                   language: RuleLanguageOption): Future[types.CloudforceOneRulesSearchResponse] {.async.} =
  ## Search rules using hybrid, vector, keyword, or exact retrieval, backed by AI
  ## Search with a SQL fallback.

  var q = initOrderedTable[string, string]()
  q["namespace"] = $namespace
  q["path"] = $path
  q["recursive"] = $recursive
  q["search"] = $search
  q["is_public"] = $isPublic
  q["limit"] = $limit
  q["offset"] = $offset
  q["query"] = $query
  q["mode"] = $mode
  q["language"] = $language
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRulesSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesStats*(client: CloudflareClient,
                                                  accountId: string): Future[types.CloudforceOneStatsResponse] {.async.} =
  ## Get statistics about rules for the dashboard.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/stats")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneStatsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesStructured*(client: CloudflareClient,
                                                       accountId: string,
                                                       limit: float64 = default(float64),
                                                       offset: float64 = default(float64),
                                                       search: string = default(string)): Future[types.CloudforceOneRulesListResponse] {.async.} =
  ## List structured email rules.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["offset"] = $offset
  q["search"] = $search
  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/structured", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRulesListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRulesStructured*(client: CloudflareClient,
                                                        accountId: string,
                                                        body: PostAccountsAccountIdCloudforceOneRulesStructuredRequest): Future[types.CloudforceOneRule] {.async.} =
  ## Create a structured email rule.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/rules/structured", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.CloudforceOneRule)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRulesStructuredApprovalsIdResubmit*(client: CloudflareClient,
                                                                           accountId: string,
                                                                           id: string,
                                                                           module: RuleModuleOption = moduleEml,
                                                                           body: PostAccountsAccountIdCloudforceOneRulesStructuredApprovalsIdResubmitRequest): Future[types.CloudforceOneResubmitApprovalResponse] {.async.} =
  ## Validate and compile a complete structured email rule, then create an immutable
  ## pending revision of its rejected approval.

  var q = initOrderedTable[string, string]()
  q["module"] = $module
  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/rules/structured/approvals/{id}/resubmit", q)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.CloudforceOneResubmitApprovalResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesStructuredSchema*(client: CloudflareClient,
                                                             accountId: string): Future[JsonNode] {.async.} =
  ## Get the field catalog for structured email rules.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/structured/schema")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRulesStructuredValidate*(client: CloudflareClient,
                                                                accountId: string,
                                                                body: PostAccountsAccountIdCloudforceOneRulesStructuredValidateRequest): Future[types.CloudforceOneEmailRuleValidationResponse] {.async.} =
  ## Validate structured email rule syntax and metadata.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/rules/structured/validate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneEmailRuleValidationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesStructuredId*(client: CloudflareClient,
                                                         accountId: string,
                                                         id: string): Future[types.CloudforceOneRule] {.async.} =
  ## Get a structured email rule by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/structured/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRule)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneRulesStructuredId*(client: CloudflareClient,
                                                         accountId: string,
                                                         id: string,
                                                         body: PutAccountsAccountIdCloudforceOneRulesStructuredIdRequest): Future[types.CloudforceOneRule] {.async.} =
  ## Update an existing structured email rule.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/rules/structured/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRule)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneRulesStructuredId*(client: CloudflareClient,
                                                            accountId: string,
                                                            id: string): Future[types.CloudforceOneSuccessResponse] {.async.} =
  ## Delete an existing structured email rule.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/rules/structured/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRulesStructuredIdTest*(client: CloudflareClient,
                                                              accountId: string,
                                                              id: string,
                                                              body: PostAccountsAccountIdCloudforceOneRulesStructuredIdTestRequest): Future[PostAccountsAccountIdCloudforceOneRulesStructuredIdTestResponse] {.async.} =
  ## Test a structured email rule against sample email JSON.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/rules/structured/{id}/test", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneRulesStructuredIdTestResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesTree*(client: CloudflareClient,
                                                 accountId: string): Future[types.CloudforceOneTreeResponse] {.async.} =
  ## Get the folder tree structure for rules navigation.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/tree")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneTreeResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCloudforceOneRulesValidate*(client: CloudflareClient,
                                                      accountId: string,
                                                      body: PostAccountsAccountIdCloudforceOneRulesValidateRequest): Future[types.CloudforceOneValidationResponse] {.async.} =
  ## Validate rule syntax, name uniqueness, namespace, and meta checks.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/rules/validate", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneValidationResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneRulesId*(client: CloudflareClient,
                                               accountId: string, id: string): Future[types.CloudforceOneRule] {.async.} =
  ## Get a single rule by ID.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/rules/{id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRule)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdCloudforceOneRulesId*(client: CloudflareClient,
                                               accountId: string, id: string,
                                               body: types.CloudforceOneUpdateRule): Future[types.CloudforceOneRule] {.async.} =
  ## Update an existing rule.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/cloudforce-one/rules/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneRule)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCloudforceOneRulesId*(client: CloudflareClient,
                                                  accountId: string, id: string,
                                                  body: types.CloudforceOneDeleteRuleBody): Future[types.CloudforceOneSuccessResponse] {.async.} =
  ## Delete an existing rule.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/cloudforce-one/rules/{id}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CloudforceOneSuccessResponse)
  else:
    raise newException(CloudflareClientError, body)
