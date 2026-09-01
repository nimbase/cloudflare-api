# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdEmailSecurityInvestigateMoveRequest = object
    destination: types.EmailSecurityMailboxDestination
    expected_disposition: Option[types.EmailSecurityDispositionLabel]
    ids: Option[seq[types.EmailSecurityInvestigateId]]
    postfix_ids: Option[seq[types.EmailSecurityPostfixId]]
  PostAccountsAccountIdEmailSecurityInvestigatePreviewRequest = object
    postfix_id: types.EmailSecurityPostfixId
  PostAccountsAccountIdEmailSecurityInvestigateInvestigateIdMoveRequest = object
    destination: types.EmailSecurityMailboxDestination
    expected_disposition: Option[types.EmailSecurityDispositionLabel]
  EmailSecurityFinalDispositionOption* = enum
    finalDispositionMALICIOUS = "MALICIOUS"
    finalDispositionSUSPICIOUS = "SUSPICIOUS"
    finalDispositionSPOOF = "SPOOF"
    finalDispositionSPAM = "SPAM"
    finalDispositionBULK = "BULK"
    finalDispositionNONE = "NONE"

  EmailSecurityMessageActionOption* = enum
    messageActionPREVIEW = "PREVIEW"
    messageActionQUARANTINERELEASED = "QUARANTINE_RELEASED"
    messageActionMOVED = "MOVED"

  EmailSecurityActionTypeOption* = enum
    actionTypeMOVE = "MOVE"
    actionTypeRELEASE = "RELEASE"

  EmailSecurityStatusOption* = enum
    statusPENDING = "PENDING"
    statusDISCOVERING = "DISCOVERING"
    statusPROCESSING = "PROCESSING"
    statusCOMPLETED = "COMPLETED"
    statusFAILED = "FAILED"
    statusCANCELLED = "CANCELLED"
    statusSKIPPED = "SKIPPED"

  EmailSecurityTypeOption* = enum
    typeTEAM = "TEAM"
    typeUSER = "USER"

  EmailSecurityOrderOption* = enum
    orderSubmissionId = "submission_id"
    orderSubject = "subject"
    orderOriginalDisposition = "original_disposition"
    orderRequestedDisposition = "requested_disposition"
    orderOutcomeDisposition = "outcome_disposition"
    orderRequestedAt = "requested_at"

  EmailSecurityDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdEmailSecurityInvestigate*(client: CloudflareClient,
                                                   start: string = default(string),
                                                   `end`: string = default(string),
                                                   query: string = default(string),
                                                   detectionsOnly: bool = true,
                                                   finalDisposition: EmailSecurityFinalDispositionOption,
                                                   metric: string = default(string),
                                                   messageAction: EmailSecurityMessageActionOption,
                                                   recipient: string = default(string),
                                                   sender: string = default(string),
                                                   smtpHeloIp: string = default(string),
                                                   alertId: string = default(string),
                                                   domain: string = default(string),
                                                   messageId: string = default(string),
                                                   subject: string = default(string),
                                                   deliveryStatus: types.EmailSecurityMessageDeliveryStatus = default(types.EmailSecurityMessageDeliveryStatus),
                                                   cursor: string = default(string),
                                                   perPage: int64 = 20,
                                                   page: int64 = 1): Future[JsonNode] {.async.} =
  ## Returns information for each email that matches the search parameter(s).

  var q = initOrderedTable[string, string]()
  q["start"] = $start
  q["end"] = $`end`
  q["query"] = $query
  q["detections_only"] = $detectionsOnly
  q["final_disposition"] = $finalDisposition
  q["metric"] = $metric
  q["message_action"] = $messageAction
  q["recipient"] = $recipient
  q["sender"] = $sender
  q["smtp_helo_ip"] = $smtpHeloIp
  q["alert_id"] = $alertId
  q["domain"] = $domain
  q["message_id"] = $messageId
  q["subject"] = $subject
  q["delivery_status"] = $deliveryStatus
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateBulk*(client: CloudflareClient,
                                                       page: int64 = 1,
                                                       perPage: int64 = 20,
                                                       actionType: EmailSecurityActionTypeOption,
                                                       status: EmailSecurityStatusOption): Future[JsonNode] {.async.} =
  ## Returns a paginated list of bulk action jobs for the account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["action_type"] = $actionType
  q["status"] = $status
  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/bulk", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecurityInvestigateBulk*(client: CloudflareClient,
                                                        body: types.EmailSecurityBulkActionRequest): Future[JsonNode] {.async.} =
  ## Creates a new bulk action job to move or release messages that match the
  ## provided search parameters.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/investigate/bulk", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateBulkJobId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns the status and details of a specific bulk action job.

  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/bulk/{job_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdEmailSecurityInvestigateBulkJobId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Deletes the job, removing it from all list and detail endpoints. Only jobs in a
  ## terminal state (`COMPLETED`, `CANCELLED`, `FAILED`, or `SKIPPED`) can be
  ## deleted. To stop an in-progress job without removing it, use the cancel endpoint
  ## instead.

  let res = await client.httpDELETE("/accounts/{account_id}/email-security/investigate/bulk/{job_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecurityInvestigateBulkJobIdCancel*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Cancels the job, marking it as cancelled and stopping any pending message
  ## processing. The job record remains visible in list and detail endpoints.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/investigate/bulk/{job_id}/cancel")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateBulkJobIdMessages*(client: CloudflareClient,
                                                                    page: int64 = 1,
                                                                    perPage: int64 = 20,
                                                                    status: EmailSecurityStatusOption): Future[JsonNode] {.async.} =
  ## Returns the individual messages associated with a bulk action job, including
  ## their processing status.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  q["status"] = $status
  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/bulk/{job_id}/messages", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecurityInvestigateMove*(client: CloudflareClient,
                                                        body: PostAccountsAccountIdEmailSecurityInvestigateMoveRequest): Future[JsonNode] {.async.} =
  ## Moves multiple messages to a specified mailbox folder (Inbox, JunkEmail,
  ## DeletedItems, RecoverableItemsDeletions, or RecoverableItemsPurges). Requires
  ## active integration.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/investigate/move", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecurityInvestigatePreview*(client: CloudflareClient,
                                                           body: PostAccountsAccountIdEmailSecurityInvestigatePreviewRequest): Future[JsonNode] {.async.} =
  ## Generates a preview image for a message that was not flagged as a detection.
  ## Useful for investigating benign messages. Returns a base64-encoded PNG
  ## screenshot of the email body.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/investigate/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecurityInvestigateRelease*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Delivers one or more quarantined messages to their intended recipients, for
  ## cases where a message was incorrectly quarantined. The response includes
  ## delivery status for each recipient.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/investigate/release", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateInvestigateId*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves comprehensive details for a specific email message including headers,
  ## recipients, sender information, and current quarantine status. Use the
  ## investigate_id from search results to fetch detailed information.

  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/{investigate_id}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateInvestigateIdActionLog*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns the list of post-delivery actions (moves, quarantine releases, previews,
  ## etc.) that have been applied to a specific email message.

  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/{investigate_id}/action_log")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateInvestigateIdDetections*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns detection details such as threat categories and sender information for
  ## non-benign messages.

  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/{investigate_id}/detections")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecurityInvestigateInvestigateIdMove*(client: CloudflareClient,
                                                                     body: PostAccountsAccountIdEmailSecurityInvestigateInvestigateIdMoveRequest): Future[JsonNode] {.async.} =
  ## Moves a single message to a specified mailbox folder (Inbox, JunkEmail,
  ## DeletedItems, RecoverableItemsDeletions, or RecoverableItemsPurges). Requires
  ## active integration.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/investigate/{investigate_id}/move", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateInvestigateIdPreview*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns a preview of the message body as a base64 encoded PNG image for
  ## non-benign messages.

  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/{investigate_id}/preview")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateInvestigateIdRaw*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Returns the raw eml of any non-benign message.

  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/{investigate_id}/raw")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdEmailSecurityInvestigateInvestigateIdReclassify*(client: CloudflareClient,
                                                                           body: types.EmailSecurityReclassifyRequest): Future[JsonNode] {.async.} =
  ## Submits a request to reclassify an email's disposition. Use for reporting false
  ## positives or false negatives. Optionally provide the raw EML content for
  ## reanalysis. The reclassification is processed asynchronously.

  let res = await client.httpPOST("/accounts/{account_id}/email-security/investigate/{investigate_id}/reclassify", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityInvestigateInvestigateIdTrace*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Retrieves delivery and processing trace information for an email message. Shows
  ## the delivery path, retraction history, and move operations performed on the
  ## message. Useful for debugging delivery issues.

  let res = await client.httpGET("/accounts/{account_id}/email-security/investigate/{investigate_id}/trace")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecurityPhishguardReports*(client: CloudflareClient,
                                                         start: string = default(string),
                                                         `end`: string = default(string),
                                                         fromDate: string = default(string),
                                                         toDate: string = default(string)): Future[JsonNode] {.async.} =
  ## Retrieves PhishGuard security alert reports for a specified date range. Reports
  ## include detected threats, dispositions, and contextual information. Use for
  ## security monitoring and threat analysis.

  var q = initOrderedTable[string, string]()
  q["start"] = $start
  q["end"] = $`end`
  q["from_date"] = $fromDate
  q["to_date"] = $toDate
  let res = await client.httpGET("/accounts/{account_id}/email-security/phishguard/reports", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdEmailSecuritySubmissions*(client: CloudflareClient,
                                                   start: string = default(string),
                                                   `end`: string = default(string),
                                                   `type`: EmailSecurityTypeOption,
                                                   submissionId: string = default(string),
                                                   originalDisposition: types.EmailSecuritySubmissionDisposition = default(types.EmailSecuritySubmissionDisposition),
                                                   requestedDisposition: types.EmailSecuritySubmissionDisposition = default(types.EmailSecuritySubmissionDisposition),
                                                   outcomeDisposition: types.EmailSecuritySubmissionDisposition = default(types.EmailSecuritySubmissionDisposition),
                                                   status: string = default(string),
                                                   query: string = default(string),
                                                   escalatedFromUser: bool = default(bool),
                                                   order: EmailSecurityOrderOption = orderRequestedAt,
                                                   direction: EmailSecurityDirectionOption,
                                                   page: int64 = 1,
                                                   perPage: int64 = 20): Future[JsonNode] {.async.} =
  ## Returns information for submissions made to reclassify emails. Shows the status,
  ## outcome, and disposition changes for reclassification requests made by users or
  ## the security team. Useful for tracking false positive/negative reports.

  var q = initOrderedTable[string, string]()
  q["start"] = $start
  q["end"] = $`end`
  q["type"] = $`type`
  q["submission_id"] = $submissionId
  q["original_disposition"] = $originalDisposition
  q["requested_disposition"] = $requestedDisposition
  q["outcome_disposition"] = $outcomeDisposition
  q["status"] = $status
  q["query"] = $query
  q["escalated_from_user"] = $escalatedFromUser
  q["order"] = $order
  q["direction"] = $direction
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET("/accounts/{account_id}/email-security/submissions", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
