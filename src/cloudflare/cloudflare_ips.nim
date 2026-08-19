# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[json]
import ./private/metaclient


proc getIps*(client: CloudflareClient, networks: string = default(string)): Future[JsonNode] {.async.} =
  ## Get IPs used on the Cloudflare/JD Cloud network, see
  ## https://www.cloudflare.com/ips for Cloudflare IPs or
  ## https://developers.cloudflare.com/china-network/reference/infrastructure/ for JD
  ## Cloud IPs.

  var q = initOrderedTable[string, string]()
  q["networks"] = $networks
  let res = await client.httpGET("/ips", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
