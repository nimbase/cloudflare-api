# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types

type
  RegistrarRegistrationDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"

  RegistrarRegistrationSortByOption* = enum
    sortByRegistryCreatedAt = "registry_created_at"
    sortByRegistryExpiresAt = "registry_expires_at"
    sortByName = "name"


proc getAccountsAccountIdRegistrarSandboxRegistrations*(client: CloudflareClient,
                                                        accountId: types.RegistrarApiSandboxIdentifier,
                                                        cursor: string = default(string),
                                                        perPage: int64 = 20,
                                                        direction: string = "asc",
                                                        sortBy: string = "registry_created_at"): Future[types.RegistrarApiSandboxRegistrationResponseCollection] {.async.} =
  ## Returns a paginated list of domain registrations owned by the account.
  ##
  ## This endpoint uses cursor-based pagination. Results are ordered by registration
  ## date by default. To fetch the next page, pass the `cursor` value from the
  ## `result_info` object in the response as the `cursor` query parameter in
  ## your next request. An empty `cursor` string indicates there are no more
  ## pages.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  for v in direction: q["direction"] = $v
  for v in sortBy: q["sort_by"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar-sandbox/registrations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxRegistrationResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRegistrarSandboxRegistrations*(client: CloudflareClient,
                                                         accountId: types.RegistrarApiSandboxIdentifier,
                                                         body: types.RegistrarApiSandboxRegistrationCreateRequest): Future[types.RegistrarApiSandboxWorkflowStatusResponseSingle] {.async.} =
  ## Starts a domain registration workflow.
  ##
  ## ### Prerequisites
  ## - The account must not already be at the maximum supported domain limit.
  ## A single account may own up to 100 domains in total across registrations
  ## created through either the dashboard or this API.
  ## - The domain must be on a supported extension for programmatic registration.
  ## - Use `POST /domain-check` immediately before calling this endpoint to confirm
  ## real-time availability and pricing.
  ##
  ## ### Defaults
  ## - `years`: defaults to the extension's minimum registration period (1 year for
  ## most extensions, but varies — for example, `.ai` (if supported) requires a
  ## minimum of 2 years).
  ## - `auto_renew`: defaults to `false`. Setting it to `true` is an explicit
  ## opt-in authorizing Cloudflare to charge the account's default payment
  ## method up to 30 days before domain expiry to renew the registration.
  ## Renewal pricing may change over time based on registry pricing.
  ## - `privacy_mode`: defaults to `redaction`.
  ##
  ## ### Premium domains
  ## Premium domain registration is not currently supported by this API.
  ## If `POST /domain-check` returns `tier: premium`, do not call this
  ## endpoint for that domain.
  ##
  ## ### Response behavior
  ## By default, the server holds the connection for a bounded, server-defined
  ## amount of time while the registration completes. Most registrations finish
  ## within this window and return `201 Created` with a completed workflow status.
  ##
  ## If the registration is still processing after this synchronous wait window,
  ## the server returns `202 Accepted`. Poll the URL in `links.self` to track
  ## progress.
  ##
  ## To skip the wait and receive an immediate `202`, send `Prefer: respond-async`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/registrar-sandbox/registrations", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.RegistrarApiSandboxWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarSandboxRegistrationsDomainName*(client: CloudflareClient,
                                                                  accountId: types.RegistrarApiSandboxIdentifier,
                                                                  domainName: types.RegistrarApiSandboxDomainName): Future[types.RegistrarApiSandboxRegistrationResponseSingle] {.async.} =
  ## Returns the current state of a domain registration.
  ##
  ## This is the canonical read endpoint for a domain you own. It returns
  ## the full registration resource including current settings and expiration.
  ## When the registration resource is ready, both `created_at` and `expires_at`
  ## are present in the response.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar-sandbox/registrations/{domainName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxRegistrationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdRegistrarSandboxRegistrationsDomainName*(client: CloudflareClient,
                                                                    accountId: types.RegistrarApiSandboxIdentifier,
                                                                    domainName: types.RegistrarApiSandboxDomainName,
                                                                    body: types.RegistrarApiSandboxRegistrationUpdateRequest): Future[types.RegistrarApiSandboxWorkflowStatusResponseSingle] {.async.} =
  ## Updates an existing domain registration.
  ##
  ## By default, the server holds the connection for a bounded, server-defined
  ## amount of time while the update completes. Most updates finish within this
  ## window and return `200 OK` with a completed workflow status.
  ##
  ## If the update is still processing after this synchronous wait window, the
  ## server returns `202 Accepted`. Poll the URL in `links.self` to track progress.
  ##
  ## To skip the wait and receive an immediate `202`, send `Prefer: respond-async`.
  ##
  ## This endpoint currently supports updating `auto_renew` only.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/registrar-sandbox/registrations/{domainName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarSandboxRegistrationsDomainNameRegistrationStatus*(client: CloudflareClient,
                                                                                    accountId: types.RegistrarApiSandboxIdentifier,
                                                                                    domainName: types.RegistrarApiSandboxDomainName): Future[types.RegistrarApiSandboxWorkflowStatusResponseSingle] {.async.} =
  ## Returns the current status of a domain registration workflow.
  ##
  ## Use this endpoint to poll for completion when the POST response
  ## returned `202 Accepted`. The URL is provided in the `links.self`
  ## field of the workflow status response.
  ##
  ## Poll this endpoint until the workflow reaches a terminal state or a
  ## state that requires user attention.
  ##
  ## **Terminal states:** `succeeded` and `failed` are terminal and always
  ## have `completed: true`.
  ##
  ## **Non-terminal states:**
  ## - `action_required` has `completed: false` and will not resolve on its
  ## own. The workflow is paused pending user intervention.
  ## - `blocked` has `completed: false` and indicates the workflow is waiting
  ## on a third party such as the extension registry or losing registrar.
  ## Continue polling while informing the user of the delay.
  ##
  ## Use increasing backoff between polls. When `state: blocked`, use a
  ## longer polling interval and do not poll indefinitely.
  ##
  ## A naive polling loop that only checks `completed` can run indefinitely
  ## when `state: action_required`. Break explicitly on `action_required`:
  ##
  ## ```js
  ## let status;
  ## do {
  ## await new Promise(r => setTimeout(r, 2000));
  ## status = await cloudflare.request({
  ## method: 'GET',
  ## path: reg.result.links.self,
  ## });
  ## } while (
  ## !status.result.completed &&
  ## status.result.state !== 'action_required'
  ## );
  ##
  ## if (status.result.state === 'action_required') {
  ## // Surface context.action and context.confirmation_sent_to to the user.
  ## // Do not re-submit the registration request.
  ## }
  ## ```

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar-sandbox/registrations/{domainName}/registration-status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarSandboxRegistrationsDomainNameUpdateStatus*(client: CloudflareClient,
                                                                              accountId: types.RegistrarApiSandboxIdentifier,
                                                                              domainName: types.RegistrarApiSandboxDomainName): Future[types.RegistrarApiSandboxWorkflowStatusResponseSingle] {.async.} =
  ## Returns the current status of a domain update workflow.
  ##
  ## Use this endpoint to poll for completion when the PATCH response
  ## returned `202 Accepted`. The URL is provided in the `links.self`
  ## field of the workflow status response.
  ##
  ## Poll this endpoint until the workflow reaches a terminal state or a
  ## state that requires user attention.
  ##
  ## Use increasing backoff between polls. When the workflow remains blocked
  ## on a third party, use a longer polling interval and do not poll indefinitely.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar-sandbox/registrations/{domainName}/update-status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarRegistrations*(client: CloudflareClient,
                                                 accountId: types.RegistrarApiIdentifier,
                                                 cursor: string = default(string),
                                                 perPage: int64 = 20,
                                                 direction: string = "asc",
                                                 sortBy: string = "registry_created_at"): Future[types.RegistrarApiRegistrationResponseCollection] {.async.} =
  ## Returns a paginated list of domain registrations owned by the account.
  ##
  ## This endpoint uses cursor-based pagination. Results are ordered by registration
  ## date by default. To fetch the next page, pass the `cursor` value from the
  ## `result_info` object in the response as the `cursor` query parameter in
  ## your next request. An empty `cursor` string indicates there are no more
  ## pages.

  var q = initOrderedTable[string, string]()
  q["cursor"] = $cursor
  q["per_page"] = $perPage
  for v in direction: q["direction"] = $v
  for v in sortBy: q["sort_by"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/registrations", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiRegistrationResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRegistrarRegistrations*(client: CloudflareClient,
                                                  accountId: types.RegistrarApiIdentifier,
                                                  body: types.RegistrarApiRegistrationCreateRequest): Future[types.RegistrarApiWorkflowStatusResponseSingle] {.async.} =
  ## Starts a domain registration workflow. This is a billable operation — successful
  ## registration charges the account's default payment method. All successful
  ## domain registrations are non-refundable — once the workflow completes with
  ## `state: succeeded`, the charge cannot be reversed.
  ##
  ## ### Prerequisites
  ## - The account must have a billing profile with a valid default payment method.
  ## Set this up at `https://dash.cloudflare.com/{account_id}/billing/payment-info`.
  ## - The account must not already be at the maximum supported domain limit.
  ## A single account may own up to 100 domains in total across registrations
  ## created through either the dashboard or this API.
  ## - The domain must be on a supported extension for programmatic registration.
  ## - Use `POST /domain-check` immediately before calling this endpoint to confirm
  ## real-time availability and pricing.
  ##
  ## ### Express mode
  ## The only required field is `domain_name`. If `contacts` is omitted, the system
  ## uses the account's default address book entry as the registrant. If no default
  ## exists and no contact is provided, the request fails. Set up a default address
  ## book entry and accept the required agreement at
  ## `https://dash.cloudflare.com/{account_id}/domains/registrations`.
  ##
  ## ### Defaults
  ## - `years`: defaults to the extension's minimum registration period (1 year for
  ## most extensions, but varies — for example, `.ai` (if supported) requires a
  ## minimum of 2 years).
  ## - `auto_renew`: defaults to `false`. Setting it to `true` is an explicit
  ## opt-in authorizing Cloudflare to charge the account's default payment
  ## method up to 30 days before domain expiry to renew the registration.
  ## Renewal pricing may change over time based on registry pricing.
  ## - `privacy_mode`: defaults to `redaction`.
  ##
  ## ### Premium domains
  ## Premium domain registration is not currently supported by this API.
  ## If `POST /domain-check` returns `tier: premium`, do not call this
  ## endpoint for that domain.
  ##
  ## ### Response behavior
  ## By default, the server holds the connection for a bounded, server-defined
  ## amount of time while the registration completes. Most registrations finish
  ## within this window and return `201 Created` with a completed workflow status.
  ##
  ## If the registration is still processing after this synchronous wait window,
  ## the server returns `202 Accepted`. Poll the URL in `links.self` to track
  ## progress.
  ##
  ## To skip the wait and receive an immediate `202`, send `Prefer: respond-async`.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/registrar/registrations", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.RegistrarApiWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarRegistrationsDomainName*(client: CloudflareClient,
                                                           accountId: types.RegistrarApiIdentifier,
                                                           domainName: types.RegistrarApiDomainName): Future[types.RegistrarApiRegistrationResponseSingle] {.async.} =
  ## Returns the current state of a domain registration.
  ##
  ## This is the canonical read endpoint for a domain you own. It returns
  ## the full registration resource including current settings and expiration.
  ## When the registration resource is ready, both `created_at` and `expires_at`
  ## are present in the response.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/registrations/{domainName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiRegistrationResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdRegistrarRegistrationsDomainName*(client: CloudflareClient,
                                                             accountId: types.RegistrarApiIdentifier,
                                                             domainName: types.RegistrarApiDomainName,
                                                             body: types.RegistrarApiRegistrationUpdateRequest): Future[types.RegistrarApiWorkflowStatusResponseSingle] {.async.} =
  ## Updates an existing domain registration.
  ##
  ## By default, the server holds the connection for a bounded, server-defined
  ## amount of time while the update completes. Most updates finish within this
  ## window and return `200 OK` with a completed workflow status.
  ##
  ## If the update is still processing after this synchronous wait window, the
  ## server returns `202 Accepted`. Poll the URL in `links.self` to track progress.
  ##
  ## To skip the wait and receive an immediate `202`, send `Prefer: respond-async`.
  ##
  ## This endpoint currently supports updating `auto_renew` only.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/registrar/registrations/{domainName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarRegistrationsDomainNameRegistrationStatus*(client: CloudflareClient,
                                                                             accountId: types.RegistrarApiIdentifier,
                                                                             domainName: types.RegistrarApiDomainName): Future[types.RegistrarApiWorkflowStatusResponseSingle] {.async.} =
  ## Returns the current status of a domain registration workflow.
  ##
  ## Use this endpoint to poll for completion when the POST response
  ## returned `202 Accepted`. The URL is provided in the `links.self`
  ## field of the workflow status response.
  ##
  ## Poll this endpoint until the workflow reaches a terminal state or a
  ## state that requires user attention.
  ##
  ## **Terminal states:** `succeeded` and `failed` are terminal and always
  ## have `completed: true`.
  ##
  ## **Non-terminal states:**
  ## - `action_required` has `completed: false` and will not resolve on its
  ## own. The workflow is paused pending user intervention.
  ## - `blocked` has `completed: false` and indicates the workflow is waiting
  ## on a third party such as the extension registry or losing registrar.
  ## Continue polling while informing the user of the delay.
  ##
  ## Use increasing backoff between polls. When `state: blocked`, use a
  ## longer polling interval and do not poll indefinitely.
  ##
  ## A naive polling loop that only checks `completed` can run indefinitely
  ## when `state: action_required`. Break explicitly on `action_required`:
  ##
  ## ```js
  ## let status;
  ## do {
  ## await new Promise(r => setTimeout(r, 2000));
  ## status = await cloudflare.request({
  ## method: 'GET',
  ## path: reg.result.links.self,
  ## });
  ## } while (
  ## !status.result.completed &&
  ## status.result.state !== 'action_required'
  ## );
  ##
  ## if (status.result.state === 'action_required') {
  ## // Surface context.action and context.confirmation_sent_to to the user.
  ## // Do not re-submit the registration request.
  ## }
  ## ```

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/registrations/{domainName}/registration-status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarRegistrationsDomainNameUpdateStatus*(client: CloudflareClient,
                                                                       accountId: types.RegistrarApiIdentifier,
                                                                       domainName: types.RegistrarApiDomainName): Future[types.RegistrarApiWorkflowStatusResponseSingle] {.async.} =
  ## Returns the current status of a domain update workflow.
  ##
  ## Use this endpoint to poll for completion when the PATCH response
  ## returned `202 Accepted`. The URL is provided in the `links.self`
  ## field of the workflow status response.
  ##
  ## Poll this endpoint until the workflow reaches a terminal state or a
  ## state that requires user attention.
  ##
  ## Use increasing backoff between polls. When the workflow remains blocked
  ## on a third party, use a longer polling interval and do not poll indefinitely.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/registrations/{domainName}/update-status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiWorkflowStatusResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
