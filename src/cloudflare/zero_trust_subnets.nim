# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, options, json]
import ./private/metaclient
import ./private/types

type
  PatchAccountsAccountIdZerotrustSubnetsCloudflareSourceAddressFamilyRequest = object
    comment: Option[types.TunnelSubnetComment]
    name: Option[types.TunnelSubnetName]
    network: Option[types.TunnelSubnetIpNetwork]
  PutAccountsAccountIdZerotrustSubnetsInitialResolvedIpAddressFamilyRequest = object
    comment: Option[types.TunnelSubnetComment]
    name: Option[types.TunnelSubnetName]
    network: Option[types.TunnelSubnetIpNetwork]
  PostAccountsAccountIdZerotrustSubnetsWarpRequest = object
    comment: Option[types.TunnelSubnetComment]
    is_default_network: Option[types.TunnelSubnetIsDefaultNetwork]
    name: types.TunnelSubnetName
    network: types.TunnelSubnetIpNetwork
  PatchAccountsAccountIdZerotrustSubnetsWarpSubnetIdRequest = object
    comment: Option[types.TunnelSubnetComment]
    is_default_network: Option[types.TunnelSubnetIsDefaultNetwork]
    name: Option[types.TunnelSubnetName]
    network: Option[types.TunnelSubnetIpNetwork]
  ZeroTrustSubnetSortOrderOption* = enum
    sortOrderAsc = "asc"
    sortOrderDesc = "desc"

  ZeroTrustSubnetSubnetTypesOption* = enum
    subnetTypesCloudflareSource = "cloudflare_source"
    subnetTypesInitialResolvedIp = "initial_resolved_ip"
    subnetTypesWarp = "warp"


proc getAccountsAccountIdZerotrustSubnets*(client: CloudflareClient,
                                           accountId: types.TunnelAccountId,
                                           name: types.TunnelSubnetQueryName = default(types.TunnelSubnetQueryName),
                                           comment: types.TunnelSubnetQueryComment = default(types.TunnelSubnetQueryComment),
                                           network: JsonNode = default(JsonNode),
                                           existedAt: types.TunnelExistedAt = default(types.TunnelExistedAt),
                                           addressFamily: types.TunnelAddressFamily = default(types.TunnelAddressFamily),
                                           isDefaultNetwork: bool = default(bool),
                                           isDeleted: bool = default(bool),
                                           sortOrder: ZeroTrustSubnetSortOrderOption,
                                           subnetTypes: ZeroTrustSubnetSubnetTypesOption,
                                           perPage: types.TunnelPerPage = default(types.TunnelPerPage),
                                           page: types.TunnelPageNumber = default(types.TunnelPageNumber)): Future[types.TunnelSubnetResponseCollection] {.async.} =
  ## Lists and filters subnets in an account.

  var q = initOrderedTable[string, string]()
  q["name"] = $name
  q["comment"] = $comment
  q["network"] = $network
  q["existed_at"] = $existedAt
  q["address_family"] = $addressFamily
  q["is_default_network"] = $isDefaultNetwork
  q["is_deleted"] = $isDeleted
  q["sort_order"] = $sortOrder
  q["subnet_types"] = $subnetTypes
  q["per_page"] = $perPage
  q["page"] = $page
  let res = await client.httpGET(fmt"/accounts/{accountId}/zerotrust/subnets", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelSubnetResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdZerotrustSubnetsCloudflareSourceAddressFamily*(client: CloudflareClient,
                                                                          accountId: types.TunnelAccountId,
                                                                          addressFamily: types.TunnelAddressFamily,
                                                                          body: PatchAccountsAccountIdZerotrustSubnetsCloudflareSourceAddressFamilyRequest): Future[types.TunnelSubnetResponseSingle] {.async.} =
  ## Updates the Cloudflare Source subnet of the given address family

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/zerotrust/subnets/cloudflare_source/{addressFamily}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelSubnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZerotrustSubnetsInitialResolvedIpAddressFamily*(client: CloudflareClient,
                                                                         accountId: types.TunnelAccountId,
                                                                         addressFamily: types.TunnelAddressFamily): Future[types.TunnelSubnetResponseSingle] {.async.} =
  ## Returns the account's default Initial Resolved IP Subnet for the given address
  ## family.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zerotrust/subnets/initial_resolved_ip/{addressFamily}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelSubnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc putAccountsAccountIdZerotrustSubnetsInitialResolvedIpAddressFamily*(client: CloudflareClient,
                                                                         accountId: types.TunnelAccountId,
                                                                         addressFamily: types.TunnelAddressFamily,
                                                                         body: PutAccountsAccountIdZerotrustSubnetsInitialResolvedIpAddressFamilyRequest): Future[types.TunnelSubnetResponseSingle] {.async.} =
  ## Updates the CIDR for the account's default Initial Resolved IP Subnet of the
  ## given address
  ## family. The new CIDR must not conflict with existing private routes in the
  ## account.

  let res = await client.httpPUT(fmt"/accounts/{accountId}/zerotrust/subnets/initial_resolved_ip/{addressFamily}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelSubnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc postAccountsAccountIdZerotrustSubnetsWarp*(client: CloudflareClient,
                                                accountId: types.TunnelAccountId,
                                                body: PostAccountsAccountIdZerotrustSubnetsWarpRequest): Future[types.TunnelSubnetResponseSingle] {.async.} =
  ## Create a WARP IP assignment subnet. Currently, only IPv4 subnets can be created.
  ##
  ## **Network constraints:**
  ## - The network must be within one of the following private IP ranges:
  ## - `10.0.0.0/8` (RFC 1918)
  ## - `172.16.0.0/12` (RFC 1918)
  ## - `192.168.0.0/16` (RFC 1918)
  ## - `100.64.0.0/10` (RFC 6598 - CGNAT)
  ## - The subnet must have a prefix length of `/24` or larger (e.g., `/16`, `/20`,
  ## `/24` are valid; `/25`, `/28` are not)

  let res = await client.httpPOST(fmt"/accounts/{accountId}/zerotrust/subnets/warp", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelSubnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc getAccountsAccountIdZerotrustSubnetsWarpSubnetId*(client: CloudflareClient,
                                                       accountId: types.TunnelAccountId,
                                                       subnetId: types.TunnelSubnetId): Future[types.TunnelSubnetResponseSingle] {.async.} =
  ## Get a WARP IP assignment subnet.

  let res = await client.httpGET(fmt"/accounts/{accountId}/zerotrust/subnets/warp/{subnetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelSubnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)

proc deleteAccountsAccountIdZerotrustSubnetsWarpSubnetId*(client: CloudflareClient,
                                                          accountId: types.TunnelAccountId,
                                                          subnetId: types.TunnelSubnetId): Future[types.TunnelSubnetResponseSingleNullable] {.async.} =
  ## Delete a WARP IP assignment subnet. This operation is idempotent - deleting an
  ## already-deleted or non-existent subnet will return success with a null result.

  let res = await client.httpDELETE(fmt"/accounts/{accountId}/zerotrust/subnets/warp/{subnetId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelSubnetResponseSingleNullable)
  else:
    raise newException(CloudflareClientError, body)

proc patchAccountsAccountIdZerotrustSubnetsWarpSubnetId*(client: CloudflareClient,
                                                         accountId: types.TunnelAccountId,
                                                         subnetId: types.TunnelSubnetId,
                                                         body: PatchAccountsAccountIdZerotrustSubnetsWarpSubnetIdRequest): Future[types.TunnelSubnetResponseSingle] {.async.} =
  ## Updates a WARP IP assignment subnet.
  ##
  ## **Update constraints:**
  ## - The `network` field cannot be modified for WARP subnets. Only `name`,
  ## `comment`, and `is_default_network` can be updated.
  ## - IPv6 subnets cannot be updated

  let res = await client.httpPATCH(fmt"/accounts/{accountId}/zerotrust/subnets/warp/{subnetId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.TunnelSubnetResponseSingle)
  else:
    raise newException(CloudflareClientError, body)
