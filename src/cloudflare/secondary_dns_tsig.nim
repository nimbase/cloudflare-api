# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdSecondaryDnsTsigs*(client: CloudflareClient,
                                            accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsResponseCollection] {.async.} =
  ## List TSIGs.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secondary_dns/tsigs")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSecondaryDnsTsigs*(client: CloudflareClient,
                                             accountId: types.SecondaryDnsAccountIdentifier,
                                             body: types.SecondaryDnsTsig): Future[types.SecondaryDnsSingleResponse] {.async.} =
  ## Create TSIG.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/secondary_dns/tsigs", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecondaryDnsTsigsTsigId*(client: CloudflareClient,
                                                  tsigId: types.SecondaryDnsIdentifier2,
                                                  accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsSingleResponse] {.async.} =
  ## Get TSIG.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secondary_dns/tsigs/{tsigId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSecondaryDnsTsigsTsigId*(client: CloudflareClient,
                                                  tsigId: types.SecondaryDnsIdentifier2,
                                                  accountId: types.SecondaryDnsAccountIdentifier,
                                                  body: types.SecondaryDnsTsig): Future[types.SecondaryDnsSingleResponse] {.async.} =
  ## Modify TSIG.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/secondary_dns/tsigs/{tsigId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSecondaryDnsTsigsTsigId*(client: CloudflareClient,
                                                     tsigId: types.SecondaryDnsIdentifier2,
                                                     accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsIdResponse2] {.async.} =
  ## Delete TSIG.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/secondary_dns/tsigs/{tsigId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsIdResponse2)
  else:
    raise newException(CloudflareClientError, body)
