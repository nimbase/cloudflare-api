# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[options, json]
import ./private/metaclient
import ./private/types

type
  PatchUserRequest = object
    country: Option[types.IamCountry]
    first_name: Option[types.IamFirstName]
    last_name: Option[types.IamLastName]
    telephone: Option[types.IamTelephone]
    zipcode: Option[types.IamZipcode]
  GetUserTenantsResponse* = object
    errors: seq[JsonNode]
    messages: seq[types.OrganizationsApiV4Message]
    result: seq[types.OrganizationsApiOrganization]
    success: bool

proc getUser*(client: CloudflareClient): Future[types.IamSingleUserResponse] {.async.} =
  ## Retrieves detailed information about the currently authenticated user, including
  ## email, name, and account memberships.

  let res = await client.httpGET("/user")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleUserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchUser*(client: CloudflareClient, body: PatchUserRequest): Future[types.IamSingleUserResponse] {.async.} =
  ## Edit part of your user details.

  let res = await client.httpPATCH("/user", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleUserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserTenants*(client: CloudflareClient): Future[GetUserTenantsResponse] {.async.} =
  ## Retrieves list of tenants the authenticated user / method has access to.

  let res = await client.httpGET("/user/tenants")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, GetUserTenantsResponse)
  else:
    raise newException(CloudflareClientError, body)
