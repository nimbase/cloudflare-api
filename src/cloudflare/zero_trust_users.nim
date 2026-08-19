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
  PostAccountsAccountIdAccessUsersRequest = object
    email: types.AccessEmail2
    name: Option[types.AccessName10]
  PutAccountsAccountIdAccessUsersUserIdRequest = object
    email: types.AccessEmail2
    name: types.AccessName10

proc getAccountsAccountIdAccessUsers*(client: CloudflareClient,
                                      accountId: types.AccessIdentifier,
                                      name: string = default(string),
                                      email: string = default(string),
                                      search: string = default(string),
                                      page: int64 = 1, perPage: int64 = 1000): Future[types.AccessResponseCollection24] {.async.} =
  ## Gets a list of users for an account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["email"] = $email
  q["search"] = $search
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/access/users", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessResponseCollection24)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdAccessUsers*(client: CloudflareClient,
                                       accountId: types.AccessIdentifier,
                                       body: PostAccountsAccountIdAccessUsersRequest): Future[types.AccessSingleUserResponse] {.async.} =
  ## Creates a new user.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/access/users", body)
  let body = await res.body
  case res.code
  of Http201:
    result = fromJson(body, types.AccessSingleUserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessUsersUserId*(client: CloudflareClient,
                                            userId: types.AccessUuid,
                                            accountId: types.AccessIdentifier): Future[types.AccessSingleUserResponse] {.async.} =
  ## Gets a specific user for an account.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/users/{userId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleUserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdAccessUsersUserId*(client: CloudflareClient,
                                            userId: types.AccessUuid,
                                            accountId: types.AccessIdentifier,
                                            body: PutAccountsAccountIdAccessUsersUserIdRequest): Future[types.AccessSingleUserResponse] {.async.} =
  ## Updates a specific user's name for an account. Requires the user's current email
  ## as confirmation (email cannot be changed).

  let res = await client.httpPUT(fmt"/accounts/{accountId}/access/users/{userId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessSingleUserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessUsersUserId*(client: CloudflareClient,
                                               userId: types.AccessUuid,
                                               accountId: types.AccessIdentifier): Future[types.AccessDeleteUserResponse] {.async.} =
  ## Deletes a specific user for an account. This will also revoke any active seats
  ## and tokens for the user.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/users/{userId}")
  let body = await res.body
  case res.code
  of Http202:
    result = fromJson(body, types.AccessDeleteUserResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessUsersUserIdActiveSessions*(client: CloudflareClient,
                                                          userId: types.AccessUuid,
                                                          accountId: types.AccessIdentifier): Future[types.AccessActiveSessionsResponse] {.async.} =
  ## Get active sessions for a single user.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/users/{userId}/active_sessions")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessActiveSessionsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessUsersUserIdActiveSessionsNonce*(client: CloudflareClient,
                                                               userId: types.AccessUuid,
                                                               accountId: types.AccessIdentifier,
                                                               nonce: types.AccessNonce): Future[types.AccessActiveSessionResponse] {.async.} =
  ## Get an active session for a single user.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/users/{userId}/active_sessions/{nonce}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessActiveSessionResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessUsersUserIdFailedLogins*(client: CloudflareClient,
                                                        userId: types.AccessUuid,
                                                        accountId: types.AccessIdentifier): Future[types.AccessFailedLoginResponse] {.async.} =
  ## Get all failed login attempts for a single user.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/users/{userId}/failed_logins")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessFailedLoginResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdAccessUsersUserIdLastSeenIdentity*(client: CloudflareClient,
                                                            userId: types.AccessUuid,
                                                            accountId: types.AccessIdentifier): Future[types.AccessLastSeenIdentityResponse] {.async.} =
  ## Get last seen identity for a single user.

  let res = await client.httpGET(fmt"/accounts/{accountId}/access/users/{userId}/last_seen_identity")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessLastSeenIdentityResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdAccessUsersUserIdMfaAuthenticatorsAuthenticatorId*(client: CloudflareClient,
                                                                               userId: types.AccessUuid,
                                                                               accountId: types.AccessIdentifier,
                                                                               authenticatorId: types.AccessAuthenticatorId): Future[types.AccessDeleteAuthenticatorResponse] {.async.} =
  ## Deletes a specific MFA device, including a PIV key or FIDO2 key enrollment, for
  ## a user. This action is only available if MFA is turned on for the organization.
  ## Successful deletion revokes the enrollment and returns a null result.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/access/users/{userId}/mfa_authenticators/{authenticatorId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.AccessDeleteAuthenticatorResponse)
  else:
    raise newException(CloudflareClientError, body)
