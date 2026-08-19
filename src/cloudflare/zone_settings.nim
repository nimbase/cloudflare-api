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
  PatchZonesZoneIdSettingsAegisRequest = object
    value: types.CacheRulesAegisValue
  PatchZonesZoneIdSettingsAutomaticPlatformOptimizationRequest = object
    value: types.SpeedAutomaticPlatformOptimizationValue
  PatchZonesZoneIdSettingsBinaryAstRequest = object
    value: types.SpeedBinaryAstValue
  PatchZonesZoneIdSettingsFontsRequest = object
    value: types.SpeedCloudflareFontsValue
  PatchZonesZoneIdSettingsH2PrioritizationRequest = object
    value: types.SpeedH2PrioritizationValue
  PatchZonesZoneIdSettingsImageResizingRequest = object
    value: types.SpeedImageResizingValue
  PatchZonesZoneIdSettingsOriginH2MaxStreamsRequest = object
    value: types.CacheRulesOriginH2MaxStreamsValue
  PatchZonesZoneIdSettingsOriginMaxHttpVersionRequest = object
    value: types.CacheRulesOriginMaxHttpVersionValue
  PatchZonesZoneIdSettingsSpeedBrainRequest = object
    value: string
  PatchZonesZoneIdSettingsTransformationsAllowedOriginsRequest = object
    value: types.SpeedTransformationsAllowedOriginsValue
  PatchZonesZoneIdSettingsTransformationsC2paRequest = object
    value: types.SpeedTransformationsC2paValue
  PatchZonesZoneIdSettingsTransformationsConfigRequest = object
    value: types.SpeedTransformationsConfigValue

proc getZonesZoneIdSettings*(client: CloudflareClient,
                             zoneId: types.ZonesIdentifier): Future[types.ZonesZoneSettingsResponseCollection] {.async.} =
  ## Available settings for your user in relation to a zone.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZonesZoneSettingsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettings*(client: CloudflareClient,
                               zoneId: types.ZonesIdentifier,
                               body: types.ZonesMultipleSettings): Future[types.ZonesZoneSettingsResponseCollection] {.async.} =
  ## Edit settings for a zone.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.ZonesZoneSettingsResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsAegis*(client: CloudflareClient,
                                  zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Aegis provides dedicated egress IPs (from Cloudflare to your origin) for your
  ## layer 7 WAF and CDN services. The egress IPs are reserved exclusively for your
  ## account so that you can increase your origin security by only allowing traffic
  ## from a small list of IP addresses.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/aegis")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsAegis*(client: CloudflareClient,
                                    zoneId: types.CacheRulesIdentifier,
                                    body: PatchZonesZoneIdSettingsAegisRequest): Future[JsonNode] {.async.} =
  ## Aegis provides dedicated egress IPs (from Cloudflare to your origin) for your
  ## layer 7 WAF and CDN services. The egress IPs are reserved exclusively for your
  ## account so that you can increase your origin security by only allowing traffic
  ## from a small list of IP addresses.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/aegis", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsAutomaticPlatformOptimization*(client: CloudflareClient,
                                                          zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Automatic Platform Optimization (APO) for WordPress is a performance feature
  ## that serves your
  ## WordPress site from Cloudflare's edge network, reducing load times for visitors.
  ## Refer to the APO documentation for more information.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/automatic_platform_optimization")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsAutomaticPlatformOptimization*(client: CloudflareClient,
                                                            zoneId: types.SpeedIdentifier,
                                                            body: PatchZonesZoneIdSettingsAutomaticPlatformOptimizationRequest): Future[JsonNode] {.async.} =
  ## Automatic Platform Optimization (APO) for WordPress is a performance feature
  ## that serves your
  ## WordPress site from Cloudflare's edge network, reducing load times for visitors.
  ## Refer to the APO documentation for more information.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/automatic_platform_optimization", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsBinaryAst*(client: CloudflareClient,
                                      zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Binary AST is a new binary encoding for JavaScript that enables faster parsing
  ## of scripts.
  ## When enabled, Cloudflare will serve a binary-encoded version of JavaScript to
  ## compatible browsers.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/binary_ast")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsBinaryAst*(client: CloudflareClient,
                                        zoneId: types.SpeedIdentifier,
                                        body: PatchZonesZoneIdSettingsBinaryAstRequest): Future[JsonNode] {.async.} =
  ## Binary AST is a new binary encoding for JavaScript that enables faster parsing
  ## of scripts.
  ## When enabled, Cloudflare will serve a binary-encoded version of JavaScript to
  ## compatible browsers.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/binary_ast", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsFonts*(client: CloudflareClient,
                                  zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Enhance your website's font delivery with Cloudflare Fonts. Deliver Google
  ## Hosted fonts from your own domain,
  ## boost performance, and enhance user privacy. Refer to the Cloudflare Fonts
  ## documentation for more information.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/fonts")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsFonts*(client: CloudflareClient,
                                    zoneId: types.SpeedIdentifier,
                                    body: PatchZonesZoneIdSettingsFontsRequest): Future[JsonNode] {.async.} =
  ## Enhance your website's font delivery with Cloudflare Fonts. Deliver Google
  ## Hosted fonts from your own domain,
  ## boost performance, and enhance user privacy. Refer to the Cloudflare Fonts
  ## documentation for more information.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/fonts", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsH2Prioritization*(client: CloudflareClient,
                                             zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## HTTP/2 Prioritization controls the order in which assets are delivered to
  ## browsers.
  ## Cloudflare's HTTP/2 Prioritization overrides the default browser prioritization
  ## order,
  ## improving the loading performance of web pages.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/h2_prioritization")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsH2Prioritization*(client: CloudflareClient,
                                               zoneId: types.SpeedIdentifier,
                                               body: PatchZonesZoneIdSettingsH2PrioritizationRequest): Future[JsonNode] {.async.} =
  ## HTTP/2 Prioritization controls the order in which assets are delivered to
  ## browsers.
  ## Cloudflare's HTTP/2 Prioritization overrides the default browser prioritization
  ## order,
  ## improving the loading performance of web pages.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/h2_prioritization", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsImageResizing*(client: CloudflareClient,
                                          zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Gets the Image Transformations setting for a zone. Accepted values are `off`,
  ## `on`, `open`, and `latest`.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/image_resizing")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsImageResizing*(client: CloudflareClient,
                                            zoneId: types.SpeedIdentifier,
                                            body: PatchZonesZoneIdSettingsImageResizingRequest): Future[JsonNode] {.async.} =
  ## Sets the Image Transformations setting for a zone. Accepted values are `off`,
  ## `on`, `open`, and `latest`.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/image_resizing", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsOriginH2MaxStreams*(client: CloudflareClient,
                                               zoneId: types.CacheRulesIdentifier): Future[types.CacheRulesOriginH2MaxStreamsResponseValue] {.async.} =
  ## Origin H2 Max Streams configures the max number of concurrent requests that
  ## Cloudflare will send within the same connection when communicating with the
  ## origin server, if the origin supports it. Note that if your origin does not
  ## support H2 multiplexing, 5xx errors may be observed, particularly 520s. Also
  ## note that the default value is `100` for all plan types except Enterprise where
  ## it is `1`. `1` means that H2 multiplexing is disabled.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/origin_h2_max_streams")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CacheRulesOriginH2MaxStreamsResponseValue)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsOriginH2MaxStreams*(client: CloudflareClient,
                                                 zoneId: types.CacheRulesIdentifier,
                                                 body: PatchZonesZoneIdSettingsOriginH2MaxStreamsRequest): Future[types.CacheRulesOriginH2MaxStreamsResponseValue] {.async.} =
  ## Origin H2 Max Streams configures the max number of concurrent requests that
  ## Cloudflare will send within the same connection when communicating with the
  ## origin server, if the origin supports it. Note that if your origin does not
  ## support H2 multiplexing, 5xx errors may be observed, particularly 520s. Also
  ## note that the default value is `100` for all plan types except Enterprise where
  ## it is `1`. `1` means that H2 multiplexing is disabled.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/origin_h2_max_streams", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.CacheRulesOriginH2MaxStreamsResponseValue)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsOriginMaxHttpVersion*(client: CloudflareClient,
                                                 zoneId: types.CacheRulesIdentifier): Future[JsonNode] {.async.} =
  ## Origin Max HTTP Setting Version sets the highest HTTP version Cloudflare will
  ## attempt to use with your origin. This setting allows Cloudflare to make HTTP/2
  ## requests to your origin. (Refer to [Enable HTTP/2 to
  ## Origin](https://developers.cloudflare.com/cache/how-to/enable-http2-to-origin/),
  ## for more information.). The default value is "2" for all plan types except
  ## Enterprise where it is "1".

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/origin_max_http_version")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsOriginMaxHttpVersion*(client: CloudflareClient,
                                                   zoneId: types.CacheRulesIdentifier,
                                                   body: PatchZonesZoneIdSettingsOriginMaxHttpVersionRequest): Future[JsonNode] {.async.} =
  ## Origin Max HTTP Setting Version sets the highest HTTP version Cloudflare will
  ## attempt to use with your origin. This setting allows Cloudflare to make HTTP/2
  ## requests to your origin. (Refer to [Enable HTTP/2 to
  ## Origin](https://developers.cloudflare.com/cache/how-to/enable-http2-to-origin/),
  ## for more information.). The default value is "2" for all plan types except
  ## Enterprise where it is "1".

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/origin_max_http_version", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsSpeedBrain*(client: CloudflareClient,
                                       zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Speed Brain lets compatible browsers speculate on content which can be
  ## prefetched or preloaded, making website
  ## navigation faster. Refer to the Cloudflare Speed Brain documentation for more
  ## information.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/speed_brain")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsSpeedBrain*(client: CloudflareClient,
                                         zoneId: types.SpeedIdentifier,
                                         body: PatchZonesZoneIdSettingsSpeedBrainRequest): Future[JsonNode] {.async.} =
  ## Speed Brain lets compatible browsers speculate on content which can be
  ## prefetched or preloaded, making website
  ## navigation faster. Refer to the Cloudflare Speed Brain documentation for more
  ## information.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/speed_brain", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsTransformationsAllowedOrigins*(client: CloudflareClient,
                                                          zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Media Transformations Allowed Origins restricts transformations for images and
  ## video served through
  ## Cloudflare's network to requests originating from specified domains. Refer to
  ## the
  ## Image Transformations and Video Transformations documentation for more
  ## information.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/transformations_allowed_origins")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsTransformationsAllowedOrigins*(client: CloudflareClient,
                                                            zoneId: types.SpeedIdentifier,
                                                            body: PatchZonesZoneIdSettingsTransformationsAllowedOriginsRequest): Future[JsonNode] {.async.} =
  ## Media Transformations Allowed Origins restricts transformations for images and
  ## video served through
  ## Cloudflare's network to requests originating from specified domains. Refer to
  ## the
  ## Image Transformations and Video Transformations documentation for more
  ## information.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/transformations_allowed_origins", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsTransformationsC2pa*(client: CloudflareClient,
                                                zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## C2PA (Coalition for Content Provenance and Authenticity) signing adds
  ## cryptographic metadata
  ## to images processed through Cloudflare Image Transformations, enabling
  ## verification of image
  ## authenticity and provenance.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/transformations_c2pa")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsTransformationsC2pa*(client: CloudflareClient,
                                                  zoneId: types.SpeedIdentifier,
                                                  body: PatchZonesZoneIdSettingsTransformationsC2paRequest): Future[JsonNode] {.async.} =
  ## C2PA (Coalition for Content Provenance and Authenticity) signing adds
  ## cryptographic metadata
  ## to images processed through Cloudflare Image Transformations, enabling
  ## verification of image
  ## authenticity and provenance.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/transformations_c2pa", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsTransformationsConfig*(client: CloudflareClient,
                                                  zoneId: types.SpeedIdentifier): Future[JsonNode] {.async.} =
  ## Returns the combined Transformations configuration for a zone, including the
  ## transformations
  ## toggle, allowed origins, and C2PA signing settings in a single response.

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/transformations_config")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsTransformationsConfig*(client: CloudflareClient,
                                                    zoneId: types.SpeedIdentifier,
                                                    body: PatchZonesZoneIdSettingsTransformationsConfigRequest): Future[JsonNode] {.async.} =
  ## Updates one or more fields of the combined Transformations configuration for a
  ## zone.
  ## Omitted fields are left unchanged. The response always returns the full current
  ## state
  ## of all three sub-settings.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/transformations_config", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdSettingsSettingId*(client: CloudflareClient,
                                      zoneId: types.ZonesIdentifier,
                                      settingId: types.ZonesSettingName): Future[JsonNode] {.async.} =
  ## Fetch a single zone setting by name

  let res = await client.httpGET(fmt"/zones/{zoneId}/settings/{settingId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdSettingsSettingId*(client: CloudflareClient,
                                        zoneId: types.ZonesIdentifier,
                                        settingId: types.ZonesSettingName,
                                        body: types.ZonesZoneSettingsSingleRequest): Future[JsonNode] {.async.} =
  ## Updates a single zone setting by the identifier

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/settings/{settingId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, JsonNode)
  else:
    raise newException(CloudflareClientError, body)
