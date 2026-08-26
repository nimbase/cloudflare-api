# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdContainersRegistries*(client: CloudflareClient): Future[JsonNode] {.async.} =
  ## Get the list of configured registries in the account.

  let res = await client.httpGET("/accounts/{account_id}/containers/registries")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdContainersRegistries*(client: CloudflareClient,
                                                body: types.CcContainersCreateImageRegistryRequestBody): Future[JsonNode] {.async.} =
  ## Registers credentials for a supported private external image registry so
  ## Containers can pull images from it. This endpoint does not create a registry
  ## or upload an image. Public Docker Hub images and images in the Cloudflare
  ## managed registry do not require this configuration.
  ##
  ## Refer to [Imagemanagement](https://developers.cloudflare.com/containers/platfor
  ## m-details/image-management/)
  ## for supported registries and instructions for storing registry credentials.

  let res = await client.httpPOST("/accounts/{account_id}/containers/registries", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdContainersRegistriesDomain*(client: CloudflareClient,
                                                        domain: string): Future[JsonNode] {.async.} =
  ## Delete a registry from the account, this will prevent Containers from pulling
  ## images from the registry.

  let res = await client.httpDELETE(fmt"/accounts/{account_id}/containers/registries/{domain}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdContainersRegistriesDomainCredentials*(client: CloudflareClient,
                                                                 domain: string,
                                                                 body: types.CcImageRegistryCredentialsConfiguration): Future[JsonNode] {.async.} =
  ## Generates credentials for accessing a configured container image registry.

  let res = await client.httpPOST(fmt"/accounts/{account_id}/containers/registries/{domain}/credentials", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
