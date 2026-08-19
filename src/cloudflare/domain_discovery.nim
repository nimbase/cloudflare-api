# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdRegistrarSandboxDomainCheck*(client: CloudflareClient,
                                                       accountId: types.RegistrarApiSandboxIdentifier,
                                                       body: types.RegistrarApiSandboxDomainCheckRequest): Future[types.RegistrarApiSandboxDomainCheckResponse] {.async.} =
  ## Performs real-time, authoritative availability checks directly against domain
  ## registries. Use this endpoint to verify a domain is available before attempting
  ## registration via `POST /registrations`.
  ##
  ## **Important:** Unlike the Search endpoint, these results are authoritative and
  ## reflect current registry status. Always check availability immediately before
  ## registration as domain status can change rapidly.
  ##
  ## **Note:** This endpoint uses POST to accept a list of domains in the request
  ## body. It is a read-only operation — it does not create, modify, or reserve
  ## any domains.
  ##
  ## ### Extension support
  ##
  ## Only domains on extensions supported for programmatic registration by this API
  ## can be registered. If you check a domain on an unsupported extension, the
  ## response
  ## will include `registrable: false` with a `reason` field explaining why:
  ##
  ## - `extension_not_supported_via_api` — Cloudflare Registrar supports this
  ## extension
  ## in the dashboard, but it is not yet available for programmatic registration via
  ## this API. Register via
  ## `https://dash.cloudflare.com/{account_id}/domains/registrations` instead.
  ## - `extension_not_supported` — This extension is not supported by Cloudflare
  ## Registrar.
  ## - `extension_disallows_registration` — The extension's registry has temporarily
  ## or permanently frozen new registrations. No registrar can register domains on
  ## this extension at this time.
  ## - `domain_premium` — The domain is premium priced. Premium registration is not
  ## currently supported by this API.
  ## - `domain_unavailable` — The domain is already registered, reserved, or
  ## otherwise
  ## not available for registration on a supported extension.
  ##
  ## The `reason` field is only present when `registrable` is `false`.
  ##
  ## ### Behavior
  ## - Maximum 20 domains per request
  ## - Pricing is only returned for domains where `registrable: true`
  ## - Results are not cached; each request queries the registry
  ##
  ## ### Workflow
  ## 1. Call this endpoint with domains the user wants to register.
  ## 2. For each domain where `registrable: true`, present pricing to the user.
  ## 3. If `tier: premium`, note that premium registration is not currently
  ## supported by this API and do not proceed to `POST /registrations`.
  ## 4. Proceed to `POST /registrations` only for supported non-premium domains.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/registrar-sandbox/domain-check", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxDomainCheckResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarSandboxDomainSearch*(client: CloudflareClient,
                                                       accountId: types.RegistrarApiSandboxIdentifier,
                                                       q: string,
                                                       extensions: seq[string] = @[],
                                                       limit: int64 = 20): Future[types.RegistrarApiSandboxDomainSearchResponse] {.async.} =
  ## Searches for domain name suggestions based on a keyword, phrase, or partial
  ## domain name.
  ## Returns a list of potentially available domains with pricing information.
  ##
  ## **Important:** Results are non-authoritative and based on cached data. Always
  ## use the
  ## `/domain-check` endpoint to verify real-time availability before attempting
  ## registration.
  ##
  ## Suggestions are scoped to extensions supported for programmatic registration
  ## via this API (`POST /registrations`). Domains on unsupported extensions will
  ## not appear in results, even if they are available at the registry level.
  ##
  ## ### Use cases
  ## - Brand name discovery (e.g., "acme corp" → acmecorp.com, acmecorp.dev)
  ## - Keyword-based suggestions (e.g., "coffee shop" → coffeeshop.com,
  ## mycoffeeshop.net)
  ## - Alternative extension discovery (e.g., "example.com" → example.com,
  ## example.app, example.xyz)
  ##
  ## ### Workflow
  ## 1. Call this endpoint with a keyword or domain name.
  ## 2. Present suggestions to the user.
  ## 3. Call `/domain-check` with the user's chosen domains to confirm real-time
  ## availability and pricing.
  ## 4. Proceed to `POST /registrations` only for supported non-premium domains
  ## where the Check response returns `registrable: true`.
  ##
  ## **Note:** Searching with just a domain extension (e.g., "com" or ".app") is not
  ## supported. Provide a keyword or domain name.

  var q = initOrderedTable[string, string]()
  q["q"] = $q
  for v in extensions: q["extensions"] = $v
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar-sandbox/domain-search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiSandboxDomainSearchResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdRegistrarDomainCheck*(client: CloudflareClient,
                                                accountId: types.RegistrarApiIdentifier,
                                                body: types.RegistrarApiDomainCheckRequest): Future[types.RegistrarApiDomainCheckResponse] {.async.} =
  ## Performs real-time, authoritative availability checks directly against domain
  ## registries. Use this endpoint to verify a domain is available before attempting
  ## registration via `POST /registrations`.
  ##
  ## **Important:** Unlike the Search endpoint, these results are authoritative and
  ## reflect current registry status. Always check availability immediately before
  ## registration as domain status can change rapidly.
  ##
  ## **Note:** This endpoint uses POST to accept a list of domains in the request
  ## body. It is a read-only operation — it does not create, modify, or reserve
  ## any domains.
  ##
  ## ### Extension support
  ##
  ## Only domains on extensions supported for programmatic registration by this API
  ## can be registered. If you check a domain on an unsupported extension, the
  ## response
  ## will include `registrable: false` with a `reason` field explaining why:
  ##
  ## - `extension_not_supported_via_api` — Cloudflare Registrar supports this
  ## extension
  ## in the dashboard, but it is not yet available for programmatic registration via
  ## this API. Register via
  ## `https://dash.cloudflare.com/{account_id}/domains/registrations` instead.
  ## - `extension_not_supported` — This extension is not supported by Cloudflare
  ## Registrar.
  ## - `extension_disallows_registration` — The extension's registry has temporarily
  ## or permanently frozen new registrations. No registrar can register domains on
  ## this extension at this time.
  ## - `domain_premium` — The domain is premium priced. Premium registration is not
  ## currently supported by this API.
  ## - `domain_unavailable` — The domain is already registered, reserved, or
  ## otherwise
  ## not available for registration on a supported extension.
  ##
  ## The `reason` field is only present when `registrable` is `false`.
  ##
  ## ### Behavior
  ## - Maximum 20 domains per request
  ## - Pricing is only returned for domains where `registrable: true`
  ## - Results are not cached; each request queries the registry
  ##
  ## ### Workflow
  ## 1. Call this endpoint with domains the user wants to register.
  ## 2. For each domain where `registrable: true`, present pricing to the user.
  ## 3. If `tier: premium`, note that premium registration is not currently
  ## supported by this API and do not proceed to `POST /registrations`.
  ## 4. Proceed to `POST /registrations` only for supported non-premium domains.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/registrar/domain-check", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiDomainCheckResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarDomainSearch*(client: CloudflareClient,
                                                accountId: types.RegistrarApiIdentifier,
                                                q: string,
                                                extensions: seq[string] = @[],
                                                limit: int64 = 20): Future[types.RegistrarApiDomainSearchResponse] {.async.} =
  ## Searches for domain name suggestions based on a keyword, phrase, or partial
  ## domain name.
  ## Returns a list of potentially available domains with pricing information.
  ##
  ## **Important:** Results are non-authoritative and based on cached data. Always
  ## use the
  ## `/domain-check` endpoint to verify real-time availability before attempting
  ## registration.
  ##
  ## Suggestions are scoped to extensions supported for programmatic registration
  ## via this API (`POST /registrations`). Domains on unsupported extensions will
  ## not appear in results, even if they are available at the registry level.
  ##
  ## ### Use cases
  ## - Brand name discovery (e.g., "acme corp" → acmecorp.com, acmecorp.dev)
  ## - Keyword-based suggestions (e.g., "coffee shop" → coffeeshop.com,
  ## mycoffeeshop.net)
  ## - Alternative extension discovery (e.g., "example.com" → example.com,
  ## example.app, example.xyz)
  ##
  ## ### Workflow
  ## 1. Call this endpoint with a keyword or domain name.
  ## 2. Present suggestions to the user.
  ## 3. Call `/domain-check` with the user's chosen domains to confirm real-time
  ## availability and pricing.
  ## 4. Proceed to `POST /registrations` only for supported non-premium domains
  ## where the Check response returns `registrable: true`.
  ##
  ## **Note:** Searching with just a domain extension (e.g., "com" or ".app") is not
  ## supported. Provide a keyword or domain name.

  var q = initOrderedTable[string, string]()
  q["q"] = $q
  for v in extensions: q["extensions"] = $v
  q["limit"] = $limit
  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/domain-search", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiDomainSearchResponse)
  else:
    raise newException(CloudflareClientError, body)
