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
  PatchUserInvitesInviteIdRequest = object
    status: string

proc getUserInvites*(client: CloudflareClient): Future[types.IamSchemasCollectionInviteResponse] {.async.} =
  ## Lists all invitations associated with my user.

  let res = await client.httpGET("/user/invites")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSchemasCollectionInviteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getUserInvitesInviteId*(client: CloudflareClient,
                             inviteId: types.IamInviteComponentsSchemasIdentifier): Future[types.IamSingleInviteResponse] {.async.} =
  ## Gets the details of an invitation.

  let res = await client.httpGET(fmt"/user/invites/{inviteId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleInviteResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchUserInvitesInviteId*(client: CloudflareClient,
                               inviteId: types.IamInviteComponentsSchemasIdentifier,
                               body: PatchUserInvitesInviteIdRequest): Future[types.IamSingleInviteResponse] {.async.} =
  ## Responds to an invitation.

  let res = await client.httpPATCH(fmt"/user/invites/{inviteId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.IamSingleInviteResponse)
  else:
    raise newException(CloudflareClientError, body)
