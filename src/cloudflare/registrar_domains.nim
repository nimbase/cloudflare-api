# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdRegistrarDomains*(client: CloudflareClient,
                                           accountId: types.RegistrarApiIdentifier): Future[types.RegistrarApiDomainResponseCollection] {.async.} =
  ## Lists domains handled by Registrar.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/domains")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiDomainResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdRegistrarDomainsDomainName*(client: CloudflareClient,
                                                     domainName: types.RegistrarApiDomainName,
                                                     accountId: types.RegistrarApiIdentifier): Future[types.RegistrarApiDomainResponseSingle] {.async.} =
  ## Show individual domain.

  let res = await client.httpGET(fmt"/accounts/{accountId}/registrar/domains/{domainName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiDomainResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdRegistrarDomainsDomainName*(client: CloudflareClient,
                                                     domainName: types.RegistrarApiDomainName,
                                                     accountId: types.RegistrarApiIdentifier): Future[types.RegistrarApiDomainResponseSingle] {.async.} =
  ## Updates an individual domain.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/registrar/domains/{domainName}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.RegistrarApiDomainResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
