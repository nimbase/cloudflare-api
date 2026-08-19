# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient

type
  GetAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsFileNameResponse* = object
    result: JsonNode
    success: bool

proc getAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsFileName*(client: CloudflareClient,
                                                                      accountId: string,
                                                                      finetuneId: string,
                                                                      fileName: string): Future[GetAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsFileNameResponse] {.async.} =
  ## Returns a pre-signed R2 URL for downloading a finetune asset file.

  let res = await client.httpGET(fmt"/accounts/{accountId}/ai/finetunes/{finetuneId}/finetune-assets/{fileName}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetAccountsAccountIdAiFinetunesFinetuneIdFinetuneAssetsFileNameResponse)
  else:
    raise newException(CloudflareClientError, body)
