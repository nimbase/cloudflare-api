# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat, json]
import ./private/metaclient
import ./private/types

type
  PutZonesZoneIdCacheOriginPostQuantumEncryptionRequest = object
    value: types.CacheRulesOriginPostQuantumEncryptionValue

proc getZonesZoneIdCacheOriginPostQuantumEncryption*(client: CloudflareClient,
                                                     zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Instructs Cloudflare to use Post-Quantum (PQ) key agreement algorithms when
  ## connecting to your origin. Preferred instructs Cloudflare to opportunistically
  ## send a Post-Quantum keyshare in the first message to the origin (for fastest
  ## connections when the origin supports and prefers PQ), supported means that PQ
  ## algorithms are advertised but only used when requested by the origin, and off
  ## means that PQ algorithms are not advertised.

  let res = await client.httpGET(fmt"/zones/{zoneId}/cache/origin_post_quantum_encryption")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdCacheOriginPostQuantumEncryption*(client: CloudflareClient,
                                                     zoneId: types.CacheRulesIdentifier,
                                                     body: PutZonesZoneIdCacheOriginPostQuantumEncryptionRequest): Future[JsonNode] {.async.} =
  ## Instructs Cloudflare to use Post-Quantum (PQ) key agreement algorithms when
  ## connecting to your origin. Preferred instructs Cloudflare to opportunistically
  ## send a Post-Quantum keyshare in the first message to the origin (for fastest
  ## connections when the origin supports and prefers PQ), supported means that PQ
  ## algorithms are advertised but only used when requested by the origin, and off
  ## means that PQ algorithms are not advertised.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/cache/origin_post_quantum_encryption", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
