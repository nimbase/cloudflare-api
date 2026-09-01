# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient

type
  PostAccountsAccountIdCloudforceOneBinaryResponse* = object
    content_type: string
    md5: string
    sha1: string
    sha256: string

proc postAccountsAccountIdCloudforceOneBinary*(client: CloudflareClient,
                                               accountId: string): Future[PostAccountsAccountIdCloudforceOneBinaryResponse] {.async.} =
  ## Uploads a binary file to Cloudforce One's binary database for malware analysis
  ## and threat intelligence correlation.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/cloudforce-one/binary")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, PostAccountsAccountIdCloudforceOneBinaryResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdCloudforceOneBinaryHash*(client: CloudflareClient,
                                                  accountId: string,
                                                  hash: string): Future[AsyncResponse] {.async.} =
  ## Retrieves a binary file from the Cloudforce One binary storage for analysis.

  let res = await client.httpGET(fmt"/accounts/{accountId}/cloudforce-one/binary/{hash}")
  return res
