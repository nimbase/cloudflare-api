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
  CustomCsrsForAnAccountOrderOption* = enum
    orderName = "name"
    orderAccountTag = "account_tag"
    orderCreatedAt = "created_at"

  CustomCsrsForAnAccountDirectionOption* = enum
    directionAsc = "asc"
    directionDesc = "desc"


proc getAccountsAccountIdCustomCsrs*(client: CloudflareClient,
                                     accountId: types.TlsCertificatesAndHostnamesIdentifier,
                                     page: float64 = default(float64),
                                     perPage: float64 = default(float64),
                                     order: string = "created_at",
                                     direction: string = "asc"): Future[types.TlsCertificatesAndHostnamesCustomCsrResponseCollection2] {.async.} =
  ## List all custom Certificate Signing Requests (CSRs) for an account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  for v in order: q["order"] = $v
  for v in direction: q["direction"] = $v
  let res = await client.httpGET(fmt"/accounts/{accountId}/custom_csrs", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomCsrResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdCustomCsrs*(client: CloudflareClient,
                                      accountId: types.TlsCertificatesAndHostnamesIdentifier,
                                      body: types.TlsCertificatesAndHostnamesCustomCsrCreateRequest2): Future[types.TlsCertificatesAndHostnamesCustomCsrResponseSingle2] {.async.} =
  ## Generate a new custom Certificate Signing Request (CSR) for an account.
  ## Cloudflare generates and securely stores the private key associated with the
  ## CSR.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/custom_csrs", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomCsrResponseSingle2)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCustomCsrsCustomCsrId*(client: CloudflareClient,
                                                customCsrId: types.TlsCertificatesAndHostnamesCustomCsrIdentifier,
                                                accountId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCustomCsrResponseSingle2] {.async.} =
  ## Retrieve details for a specific custom Certificate Signing Request (CSR).

  let res = await client.httpGET(fmt"/accounts/{accountId}/custom_csrs/{customCsrId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomCsrResponseSingle2)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdCustomCsrsCustomCsrId*(client: CloudflareClient,
                                                   customCsrId: types.TlsCertificatesAndHostnamesCustomCsrIdentifier,
                                                   accountId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCustomCsrResponseIdOnly] {.async.} =
  ## Delete a custom Certificate Signing Request (CSR) and its associated private
  ## key.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/custom_csrs/{customCsrId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCustomCsrResponseIdOnly)
  else:
    raise newException(CloudflareClientError, body)
