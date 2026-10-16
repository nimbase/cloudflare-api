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
  AssetSchemaVendorOption* = enum
    vendorANTHROPIC = "ANTHROPIC"
    vendorAWS = "AWS"
    vendorBITBUCKET = "BITBUCKET"
    vendorBOX = "BOX"
    vendorCONFLUENCE = "CONFLUENCE"
    vendorDROPBOX = "DROPBOX"
    vendorGITHUB = "GITHUB"
    vendorGOOGLECLOUDPLATFORM = "GOOGLE_CLOUD_PLATFORM"
    vendorGOOGLEWORKSPACE = "GOOGLE_WORKSPACE"
    vendorJIRA = "JIRA"
    vendorMICROSOFT = "MICROSOFT"
    vendorOPENAI = "OPENAI"
    vendorSALESFORCE = "SALESFORCE"
    vendorSERVICENOW = "SERVICENOW"
    vendorSLACK = "SLACK"
    vendorWORKDAY = "WORKDAY"
    vendorZOOM = "ZOOM"


proc getAccountsAccountIdDataSecurityPostureAssetSchemas*(client: CloudflareClient,
                                                          accountId: string,
                                                          vendor: AssetSchemaVendorOption = vendorANTHROPIC): Future[types.PostureApiAssetSchemaListResponse] {.async.} =
  ## Returns the catalog of asset classes available when authoring custom
  ## findings, grouped by vendor. Optionally filter to a single vendor with
  ## the `vendor` query parameter.

  var q = initOrderedTable[string, string]()
  q["vendor"] = $vendor
  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/asset_schemas", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiAssetSchemaListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdDataSecurityPostureAssetSchemasAssetClass*(client: CloudflareClient,
                                                                    accountId: string,
                                                                    assetClass: string): Future[types.PostureApiAssetSchemaResponse] {.async.} =
  ## Returns the fields and related attributes a custom finding type may reference
  ## for the given asset class (JSON Schema). Used by the custom finding types
  ## builder.

  let res = await client.httpGET(fmt"/accounts/{accountId}/data-security/posture/asset_schemas/{assetClass}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.PostureApiAssetSchemaResponse)
  else:
    raise newException(CloudflareClientError, body)
