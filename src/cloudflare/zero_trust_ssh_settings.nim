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
  PutAccountsAccountIdGatewayAuditSshSettingsRequest = object
    public_key: types.ZeroTrustGatewayPublicKey

proc getAccountsAccountIdGatewayAuditSshSettings*(client: CloudflareClient,
                                                  accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse6] {.async.} =
  ## Retrieve all Zero Trust Audit SSH and SSH with Access for Infrastructure
  ## settings for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/gateway/audit_ssh_settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse6)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdGatewayAuditSshSettings*(client: CloudflareClient,
                                                  accountId: types.ZeroTrustGatewayIdentifier2,
                                                  body: PutAccountsAccountIdGatewayAuditSshSettingsRequest): Future[types.ZeroTrustGatewaySingleResponse6] {.async.} =
  ## Update Zero Trust Audit SSH and SSH with Access for Infrastructure settings for
  ## an account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/gateway/audit_ssh_settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse6)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdGatewayAuditSshSettingsRotateSeed*(client: CloudflareClient,
                                                             accountId: types.ZeroTrustGatewayIdentifier2): Future[types.ZeroTrustGatewaySingleResponse6] {.async.} =
  ## Rotate the SSH account seed that generates the host key identity when connecting
  ## through the Cloudflare SSH Proxy.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/gateway/audit_ssh_settings/rotate_seed")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZeroTrustGatewaySingleResponse6)
  else:
    raise newException(CloudflareClientError, body)
