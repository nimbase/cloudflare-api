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
  AccessAuthenticationLogDirectionOption* = enum
    directionDesc = "desc"
    directionAsc = "asc"

  AccessAuthenticationLogAllowedOpOption* = enum
    allowedOpEq = "eq"
    allowedOpNeq = "neq"

  AccessAuthenticationLogCountryCodeOpOption* = enum
    countryCodeOpEq = "eq"
    countryCodeOpNeq = "neq"

  AccessAuthenticationLogAppTypeOpOption* = enum
    appTypeOpEq = "eq"
    appTypeOpNeq = "neq"

  AccessAuthenticationLogAppUidOpOption* = enum
    appUidOpEq = "eq"
    appUidOpNeq = "neq"

  AccessAuthenticationLogRayIdOpOption* = enum
    rayIdOpEq = "eq"
    rayIdOpNeq = "neq"

  AccessAuthenticationLogEmailOpOption* = enum
    emailOpEq = "eq"
    emailOpNeq = "neq"
    emailOpContains = "contains"

  AccessAuthenticationLogIdpOpOption* = enum
    idpOpEq = "eq"
    idpOpNeq = "neq"

  AccessAuthenticationLogNonIdentityOpOption* = enum
    nonIdentityOpEq = "eq"
    nonIdentityOpNeq = "neq"

  AccessAuthenticationLogUserIdOpOption* = enum
    userIdOpEq = "eq"
    userIdOpNeq = "neq"


proc getAccountsAccountIdAccessLogsAccessRequests*(client: CloudflareClient,
                                                   accountId: types.AccessIdentifier,
                                                   limit: int64 = 25,
                                                   direction: string = "desc",
                                                   since: string = default(string),
                                                   until: string = default(string),
                                                   page: int64 = 1,
                                                   perPage: int64 = 25,
                                                   email: types.AccessEmail3 = default(types.AccessEmail3),
                                                   emailExact: bool = false,
                                                   userId: types.AccessUserId = default(types.AccessUserId),
                                                   allowedOp: string = "eq",
                                                   countryCodeOp: string = "eq",
                                                   appTypeOp: string = "eq",
                                                   appUidOp: string = "eq",
                                                   rayIdOp: string = "eq",
                                                   emailOp: string = "eq",
                                                   idpOp: string = "eq",
                                                   nonIdentityOp: string = "eq",
                                                   userIdOp: string = "eq",
                                                   fields: string = default(string)): Future[types.AccessResponseCollection11] {.async.} =
  ## Gets a list of Access authentication audit logs for an account.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  for v in direction: q["direction"] = $v
  q["since"] = $since
  q["until"] = $until
  q["page"] = $page
  q["per_page"] = $perPage
  q["email"] = $email
  q["email_exact"] = $emailExact
  q["user_id"] = $userId
  for v in allowedOp: q["allowedOp"] = $v
  for v in countryCodeOp: q["country_codeOp"] = $v
  for v in appTypeOp: q["app_typeOp"] = $v
  for v in appUidOp: q["app_uidOp"] = $v
  for v in rayIdOp: q["ray_idOp"] = $v
  for v in emailOp: q["emailOp"] = $v
  for v in idpOp: q["idpOp"] = $v
  for v in nonIdentityOp: q["non_identityOp"] = $v
  for v in userIdOp: q["user_idOp"] = $v
  q["fields"] = $fields
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/logs/access_requests", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection11)
  else:
    raise newException(CloudflareClientError, body)
