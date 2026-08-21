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
                                                   direction: AccessAuthenticationLogDirectionOption = directionDesc,
                                                   since: string = default(string),
                                                   until: string = default(string),
                                                   page: int64 = 1,
                                                   perPage: int64 = 25,
                                                   email: types.AccessEmail3 = default(types.AccessEmail3),
                                                   emailExact: bool = false,
                                                   userId: types.AccessUserId = default(types.AccessUserId),
                                                   allowedOp: AccessAuthenticationLogAllowedOpOption = allowedOpEq,
                                                   countryCodeOp: AccessAuthenticationLogCountryCodeOpOption = countryCodeOpEq,
                                                   appTypeOp: AccessAuthenticationLogAppTypeOpOption = appTypeOpEq,
                                                   appUidOp: AccessAuthenticationLogAppUidOpOption = appUidOpEq,
                                                   rayIdOp: AccessAuthenticationLogRayIdOpOption = rayIdOpEq,
                                                   emailOp: AccessAuthenticationLogEmailOpOption = emailOpEq,
                                                   idpOp: AccessAuthenticationLogIdpOpOption = idpOpEq,
                                                   nonIdentityOp: AccessAuthenticationLogNonIdentityOpOption = nonIdentityOpEq,
                                                   userIdOp: AccessAuthenticationLogUserIdOpOption = userIdOpEq,
                                                   fields: string = default(string)): Future[types.AccessResponseCollection11] {.async.} =
  ## Gets a list of Access authentication audit logs for an account.

  var q = initOrderedTable[string, string]()
  q["limit"] = $limit
  q["direction"] = $direction
  q["since"] = $since
  q["until"] = $until
  q["page"] = $page
  q["per_page"] = $perPage
  q["email"] = $email
  q["email_exact"] = $emailExact
  q["user_id"] = $userId
  q["allowedOp"] = $allowedOp
  q["country_codeOp"] = $countryCodeOp
  q["app_typeOp"] = $appTypeOp
  q["app_uidOp"] = $appUidOp
  q["ray_idOp"] = $rayIdOp
  q["emailOp"] = $emailOp
  q["idpOp"] = $idpOp
  q["non_identityOp"] = $nonIdentityOp
  q["user_idOp"] = $userIdOp
  q["fields"] = $fields
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/logs/access_requests", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection11)
  else:
    raise newException(CloudflareClientError, body)
