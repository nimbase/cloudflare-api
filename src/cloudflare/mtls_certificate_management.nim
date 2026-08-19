# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options]
import ./private/metaclient
import ./private/types

type
  PostAccountsAccountIdMtlsCertificatesRequest = object
    ca: types.TlsCertificatesAndHostnamesCa
    certificates: types.TlsCertificatesAndHostnamesCertificates2
    name: Option[types.TlsCertificatesAndHostnamesName2]
    private_key: Option[types.TlsCertificatesAndHostnamesPrivateKey4]

proc getAccountsAccountIdMtlsCertificates*(client: CloudflareClient,
                                           accountId: types.TlsCertificatesAndHostnamesIdentifier,
                                           `type`: seq[string] = default(seq[string])): Future[types.TlsCertificatesAndHostnamesCertificateResponseCollection5] {.async.} =
  ## Lists all mTLS certificates uploaded to your account, such as Bring Your Own CA
  ## (BYO-CA) for mTLS. To list certificates issued by the Cloudflare managed CA, use
  ## the [List Client Certificates
  ## endpoint](/api/resources/client_certificates/methods/list/).

  var q = initOrderedTable[string, string]()
  q["type"] = $`type`
  let res = await client.httpGET(fmt"/accounts/{accountId}/mtls_certificates", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseCollection5)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdMtlsCertificates*(client: CloudflareClient,
                                            accountId: types.TlsCertificatesAndHostnamesIdentifier,
                                            body: PostAccountsAccountIdMtlsCertificatesRequest): Future[types.TlsCertificatesAndHostnamesCertificateResponseSinglePost] {.async.} =
  ## Upload a certificate that you want to use with mTLS-enabled Cloudflare services,
  ## such as Bring Your Own CA (BYO-CA) for mTLS. To create certificates issued by
  ## the Cloudflare managed CA, use the [Create Client Certificate
  ## endpoint](/api/resources/client_certificates/methods/create/).

  let res = await client.httpPOST(fmt"/accounts/{accountId}/mtls_certificates", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSinglePost)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMtlsCertificatesMtlsCertificateId*(client: CloudflareClient,
                                                            mtlsCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                            accountId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle5] {.async.} =
  ## Fetches a single mTLS certificate uploaded to your account. To get a certificate
  ## issued by the Cloudflare managed CA, use the [Client Certificate Details
  ## endpoint](/api/resources/client_certificates/methods/get/).

  let res = await client.httpGET(fmt"/accounts/{accountId}/mtls_certificates/{mtlsCertificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle5)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdMtlsCertificatesMtlsCertificateId*(client: CloudflareClient,
                                                               mtlsCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                               accountId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesCertificateResponseSingle5] {.async.} =
  ## Deletes the mTLS certificate unless the certificate is in use by one or more
  ## Cloudflare services.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/mtls_certificates/{mtlsCertificateId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesCertificateResponseSingle5)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdMtlsCertificatesMtlsCertificateIdAssociations*(client: CloudflareClient,
                                                                        mtlsCertificateId: types.TlsCertificatesAndHostnamesIdentifier,
                                                                        accountId: types.TlsCertificatesAndHostnamesIdentifier): Future[types.TlsCertificatesAndHostnamesAssociationResponseCollection] {.async.} =
  ## Lists all active associations between the certificate and Cloudflare services.

  let res = await client.httpGET(fmt"/accounts/{accountId}/mtls_certificates/{mtlsCertificateId}/associations")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TlsCertificatesAndHostnamesAssociationResponseCollection)
  else:
    raise newException(CloudflareClientError, body)
