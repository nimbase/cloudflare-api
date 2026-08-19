# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc postAccountsAccountIdMnmVpcFlowsToken*(client: CloudflareClient,
                                            accountId: types.MagicVisibilityMnmAccountIdentifier): Future[types.MagicVisibilityMnmMnmVpcFlowsSingleResponse] {.async.} =
  ## Generate authentication token for VPC flow logs export.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/mnm/vpc-flows/token")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.MagicVisibilityMnmMnmVpcFlowsSingleResponse)
  else:
    raise newException(CloudflareClientError, body)
