# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdRegistrarRegistrationsDomainNameTransferIn*(client: CloudflareClient,
                                                                      accountId: types.RegistrarApiIdentifier,
                                                                      domainName: types.RegistrarApiDomainName,
                                                                      body: types.RegistrarApiTransferInCreateRequest): Future[types.RegistrarApiWorkflowStatusResponseSingle] {.async.} =
  ## Starts a domain transfer-in workflow. This is typically a billable
  ## operation — successful transfers charge the account's default payment
  ## method, except for extensions with zero transfer pricing (e.g. UK
  ## extensions). All successful domain transfers are non-refundable.
  ##
  ## ### How transfers work
  ## Domain transfers move a domain from another registrar to Cloudflare.
  ## Transfers typically take 1-10 days due to ICANN-mandated approval windows.
  ##
  ## ### Prerequisites
  ## - The domain must already have a zone in the Cloudflare account (added
  ## through the dashboard or zone API).
  ## - The zone must have DNSSec disabled.
  ## - For billable transfers (i.e. extensions with non-zero transfer pricing), the
  ## account must have a billing profile with a valid default payment method.
  ## Set this up at `https://dash.cloudflare.com/{account_id}/billing/payment-info`.
  ## - The domain must be unlocked at the current registrar.
  ## - An authorization/EPP code from the current registrar is required,
  ## except for UK extensions — see Auth code below.
  ##
  ## ### Auth code
  ## An authorization code (also called EPP code, transfer key, or auth-info code)
  ## is required for most extensions, with the exception of UK extensions. Obtain
  ## this from your current registrar's control panel.
  ##
  ## The auth code in the request body must be base64-encoded per RFC 4648 §4
  ## (standard
  ## alphabet, no line breaks).
  ##
  ## ### Response behavior
  ## Successful transfer initiation returns `202 Accepted`. Validation or
  ## initiation failures return the documented `4XX` responses. Poll
  ## `GET
  ## /accounts/{account_id}/registrar/registrations/{domain_name}/transfer-in-status`
  ## to track progress.
  ##
  ## ### Premium domains
  ## Premium domain transfers are not currently supported by this API. Please use
  ## the [dashboard](https://dash.cloudflare.com/) for now.
  ##
  ## ### Billing
  ## The account's default payment method is charged upon successful transfer
  ## completion, unless the extension has zero transfer pricing (e.g. UK
  ## extensions). The transfer adds time to the domain's existing expiration
  ## date (typically 1 year).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/registrar/registrations/{domainName}/transfer-in", body)
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.RegistrarApiWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarRegistrationsDomainNameTransferInStatus*(client: CloudflareClient,
                                                                           accountId: types.RegistrarApiIdentifier,
                                                                           domainName: types.RegistrarApiDomainName): Future[types.RegistrarApiWorkflowStatusResponseSingle] {.async.} =
  ## Returns the current status of a domain transfer workflow.
  ##
  ## Use this endpoint to poll transfer progress after initiating a transfer
  ## with `POST
  ## /accounts/{account_id}/registrar/registrations/{domain_name}/transfer-in`.
  ## The URL is provided in the `links.self` field of the transfer response.
  ##
  ## ### Transfer timelines
  ## Transfers typically take 1–10 days due to ICANN-mandated approval windows.
  ##
  ## ### Workflow states
  ##
  ## **Terminal states:** `succeeded` and `failed` are terminal and always
  ## have `completed: true`.
  ##
  ## **Non-terminal states:**
  ## - `in_progress`: Transfer has been submitted to the registry and is being
  ## processed. Continue polling.
  ## - `blocked`: The workflow is waiting on the losing registrar or registry
  ## to release the domain. This is the **most common state** for transfers
  ## and is entirely normal — it means the ICANN transfer approval window is
  ## in effect. The losing registrar has up to 5 days to approve or reject.
  ## Continue polling with longer intervals (e.g., every 30–60 minutes).
  ## - `action_required`: The user needs to take action (e.g., the FOA email
  ## needs to be accepted). See `context` for details on what is needed.
  ## - `pending`: Transfer workflow created but not yet started processing.
  ##
  ## ### Polling guidance
  ## Adjust your polling interval based on the current workflow state:
  ## - `pending` or `in_progress`: Poll every 30 seconds.
  ## - `blocked`: The transfer is waiting on a third party (e.g., losing
  ## registrar approval). Poll every 30–60 minutes.
  ## - `action_required`: Stop polling. The workflow will not advance until
  ## the user takes action. Check `context` for details on what is needed.
  ## - `succeeded` or `failed`: Terminal — stop polling.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/registrations/{domainName}/transfer-in-status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
