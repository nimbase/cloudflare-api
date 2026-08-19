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
  PostAccountsAccountIdMoqRelaysRequest = object
    name: string
  PutAccountsAccountIdMoqRelaysRelayIdRequest = object
    config: Option[types.MoqRelayConfig]
    name: Option[string]
  PostAccountsAccountIdMoqRelaysRelayIdTokensRequest = object
    expires: Option[string]
    label: Option[string]
    operations: seq[string]

proc getAccountsAccountIdMoqRelays*(client: CloudflareClient,
                                    accountId: types.MoqAccountIdentifier,
                                    createdBefore: string = default(string),
                                    createdAfter: string = default(string),
                                    perPage: int64 = 1000, asc: bool = false): Future[JsonNode] {.async.} =
  ## Lists all MoQ relays for the account. Returns only metadata.
  ## Config, status, and tokens are omitted.
  ##
  ## Results are cursor-paginated (keyset on the `created` timestamp).
  ## Use `created_before` / `created_after` with the `created` value of the
  ## first/last item in a page to fetch the adjacent page. `result_info`
  ## reports the page `count` and the `total` matching the cursor filters.

  var q = initOrderedTable[string, string]()
  q["created_before"] = $createdBefore
  q["created_after"] = $createdAfter
  q["per_page"] = $perPage
  q["asc"] = $asc
  let res = await client.httpGET(fmt"/accounts/{accountId}/moq/relays", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMoqRelays*(client: CloudflareClient,
                                     accountId: types.MoqAccountIdentifier,
                                     body: PostAccountsAccountIdMoqRelaysRequest): Future[JsonNode] {.async.} =
  ## Provisions a new MoQ relay instance. Auto-creates a publish+subscribe
  ## token and a subscribe-only token. Token values are included in the
  ## response (shown once). Config is always set to defaults (upstreams
  ## off) and cannot be supplied here — sending a non-empty `config` is
  ## rejected (21014); `null` or `{}` is accepted as absent. Use PUT to
  ## configure the relay after it exists.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/moq/relays", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMoqRelaysRelayId*(client: CloudflareClient,
                                           accountId: types.MoqAccountIdentifier,
                                           relayId: string): Future[JsonNode] {.async.} =
  ## Retrieves a single MoQ relay including config and status.
  ## Tokens are NOT included.

  let res = await client.httpGET(fmt"/accounts/{accountId}/moq/relays/{relayId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdMoqRelaysRelayId*(client: CloudflareClient,
                                           accountId: types.MoqAccountIdentifier,
                                           relayId: string,
                                           body: PutAccountsAccountIdMoqRelaysRelayIdRequest): Future[JsonNode] {.async.} =
  ## Updates a relay's name and/or configuration. The relay ID goes in
  ## the URL path — `PUT /accounts/{account_id}/moq/relays/{relay_id}` —
  ## not the request body; there is no collection-level update endpoint.
  ## This is also the only way to set a relay's config (config cannot be
  ## set at create time). Partial updates: omitted fields are preserved;
  ## config sub-objects replace as whole objects when present.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/moq/relays/{relayId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMoqRelaysRelayId*(client: CloudflareClient,
                                              accountId: types.MoqAccountIdentifier,
                                              relayId: string): Future[JsonNode] {.async.} =
  ## Soft-deletes a MoQ relay. The relay ID goes in the URL path —
  ## `DELETE /accounts/{account_id}/moq/relays/{relay_id}` — not the
  ## request body; there is no collection-level delete endpoint.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/moq/relays/{relayId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMoqRelaysRelayIdTokens*(client: CloudflareClient,
                                                 accountId: types.MoqAccountIdentifier,
                                                 relayId: string): Future[JsonNode] {.async.} =
  ## Returns metadata for every token the relay accepts. Secrets are never
  ## returned, so a token that has been lost cannot be recovered here. There
  ## is no expiry filter: compare each token's `expires` to the current time
  ## to tell which ones have lapsed.

  let res = await client.httpGET(fmt"/accounts/{accountId}/moq/relays/{relayId}/tokens")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMoqRelaysRelayIdTokens*(client: CloudflareClient,
                                                  accountId: types.MoqAccountIdentifier,
                                                  relayId: string,
                                                  body: PostAccountsAccountIdMoqRelaysRelayIdTokensRequest): Future[JsonNode] {.async.} =
  ## Mints a new relay-scoped token and adds it to the relay's accepted-auth
  ## registry. The token value (secret) is shown once in the response. A relay
  ## may hold up to 10 tokens; creating an 11th is rejected.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/moq/relays/{relayId}/tokens", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMoqRelaysRelayIdTokensJti*(client: CloudflareClient,
                                                       accountId: types.MoqAccountIdentifier,
                                                       relayId: string,
                                                       jti: string): Future[types.MoqApiResponseCommon] {.async.} =
  ## Revokes a token by removing it from the set the relay accepts. Relays
  ## cache that set, so revocation takes effect within seconds rather than
  ## instantly, and connections already established with the token are not
  ## closed. Revoking an unknown token succeeds, so the call is idempotent.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/moq/relays/{relayId}/tokens/{jti}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MoqApiResponseCommon)
  else:
    raise newException(CloudflareClientError, body)
