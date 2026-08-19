# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdImagesV1Variants*(client: CloudflareClient,
                                           accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageVariantListResponse] {.async.} =
  ## List existing CF Images variants.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1/variants")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageVariantListResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdImagesV1Variants*(client: CloudflareClient,
                                            accountId: types.ImagesAccountIdentifier,
                                            body: types.ImagesImageVariantDefinition): Future[types.ImagesImageVariantSimpleResponse] {.async.} =
  ## Create a CF Images variant that allows you to resize images for different use
  ## cases.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/images/v1/variants", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageVariantSimpleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV1VariantsVariantId*(client: CloudflareClient,
                                                    variantId: types.ImagesImageVariantIdentifier,
                                                    accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageVariantSimpleResponse] {.async.} =
  ## Fetch details for a CF Images variant.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1/variants/{variantId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageVariantSimpleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdImagesV1VariantsVariantId*(client: CloudflareClient,
                                                       variantId: types.ImagesImageVariantIdentifier,
                                                       accountId: types.ImagesAccountIdentifier): Future[types.ImagesDeletedResponse] {.async.} =
  ## Delete a CF Images variant. This will purge the cache for all images associated
  ## with the variant.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/images/v1/variants/{variantId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesDeletedResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdImagesV1VariantsVariantId*(client: CloudflareClient,
                                                      variantId: types.ImagesImageVariantIdentifier,
                                                      accountId: types.ImagesAccountIdentifier,
                                                      body: types.ImagesImageVariantPatchRequest): Future[types.ImagesImageVariantSimpleResponse] {.async.} =
  ## Update a CF Images variant. This will purge the cache for all images associated
  ## with the variant.

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/images/v1/variants/{variantId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageVariantSimpleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdImagesV1VariantsVariantIdFlat*(client: CloudflareClient,
                                                        variantId: types.ImagesImageVariantIdentifier,
                                                        accountId: types.ImagesAccountIdentifier): Future[types.ImagesImageVariantFlatResponse] {.async.} =
  ## Fetch details for a single variant with properties at the top level of the
  ## result.

  let res = await client.httpGET(fmt"/accounts/{accountId}/images/v1/variants/{variantId}/flat")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ImagesImageVariantFlatResponse)
  else:
    raise newException(CloudflareClientError, body)
