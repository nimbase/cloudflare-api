# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdDnsRecordsUsage*(client: CloudflareClient,
                                          accountId: types.DnsRecordsIdentifier): Future[types.DnsRecordsDnsResponseAccountUsage] {.async.} =
  ## Get the current DNS record usage and quota for an account. May include internal
  ## DNS usage and quota.

  let res = await client.httpGET(fmt"/accounts/{accountId}/dns_records/usage")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.DnsRecordsDnsResponseAccountUsage)
  else:
    raise newException(CloudflareClientError, body)
