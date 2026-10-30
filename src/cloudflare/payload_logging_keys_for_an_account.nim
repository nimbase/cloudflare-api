# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdFirewallPayloadLoggingKey*(client: CloudflareClient,
                                                    accountId: types.FirewallAccountIdentifier): Future[types.FirewallPayloadLoggingKeyResponseSingle] {.async.} =
  ## Fetches the public key that payload logging uses to encrypt matched payloads for
  ## the account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/firewall/payload_logging/key")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallPayloadLoggingKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdFirewallPayloadLoggingKey*(client: CloudflareClient,
                                                    accountId: types.FirewallAccountIdentifier,
                                                    body: types.FirewallPayloadLoggingKey): Future[types.FirewallPayloadLoggingKeyResponseSingle] {.async.} =
  ## Creates or replaces the public key that payload logging uses to encrypt matched
  ## payloads for the account. It applies to every zone in the account that has no
  ## zone key. Requires a plan that includes payload logging (Enterprise); otherwise
  ## it returns 403.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/firewall/payload_logging/key", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallPayloadLoggingKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdFirewallPayloadLoggingKey*(client: CloudflareClient,
                                                       accountId: types.FirewallAccountIdentifier): Future[types.FirewallPayloadLoggingKeyResponseSingle] {.async.} =
  ## Deletes the payload logging public key of the account.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/firewall/payload_logging/key")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.FirewallPayloadLoggingKeyResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
