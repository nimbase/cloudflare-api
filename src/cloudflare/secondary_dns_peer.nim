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
  PostAccountsAccountIdSecondaryDnsPeersRequest = object
    name: types.SecondaryDnsName3

proc getAccountsAccountIdSecondaryDnsPeers*(client: CloudflareClient,
                                            accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsResponseCollection2] {.async.} =
  ## List Peers.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secondary_dns/peers")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsResponseCollection2)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdSecondaryDnsPeers*(client: CloudflareClient,
                                             accountId: types.SecondaryDnsAccountIdentifier,
                                             body: PostAccountsAccountIdSecondaryDnsPeersRequest): Future[types.SecondaryDnsSingleResponse2] {.async.} =
  ## Create Peer.

  let res = await client.httpPOST(fmt"/accounts/{accountId}/secondary_dns/peers", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdSecondaryDnsPeersPeerId*(client: CloudflareClient,
                                                  peerId: types.SecondaryDnsIdentifier3,
                                                  accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsSingleResponse2] {.async.} =
  ## Get Peer.

  let res = await client.httpGET(fmt"/accounts/{accountId}/secondary_dns/peers/{peerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdSecondaryDnsPeersPeerId*(client: CloudflareClient,
                                                  peerId: types.SecondaryDnsIdentifier3,
                                                  accountId: types.SecondaryDnsAccountIdentifier,
                                                  body: types.SecondaryDnsPeer): Future[types.SecondaryDnsSingleResponse2] {.async.} =
  ## Modify Peer.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/secondary_dns/peers/{peerId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsSingleResponse2)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdSecondaryDnsPeersPeerId*(client: CloudflareClient,
                                                     peerId: types.SecondaryDnsIdentifier3,
                                                     accountId: types.SecondaryDnsAccountIdentifier): Future[types.SecondaryDnsIdResponse3] {.async.} =
  ## Delete Peer.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/secondary_dns/peers/{peerId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.SecondaryDnsIdResponse3)
  else:
    raise newException(CloudflareClientError, body)
