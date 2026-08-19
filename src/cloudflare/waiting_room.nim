# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# Nimbase CLI https://github.com/nimbase/nimbase
#
# License: MIT
import std/[strformat]
import ./private/metaclient
import ./private/types


proc getAccountsAccountIdWaitingRooms*(client: CloudflareClient,
                                       accountId: types.WaitingroomIdentifier,
                                       page: float64 = default(float64),
                                       perPage: float64 = default(float64)): Future[types.WaitingroomResponseCollection] {.async.} =
  ## Lists waiting rooms for account.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/accounts/{accountId}/waiting_rooms", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWaitingRooms*(client: CloudflareClient,
                                 zoneId: types.WaitingroomIdentifier,
                                 page: float64 = default(float64),
                                 perPage: float64 = default(float64)): Future[types.WaitingroomResponseCollection] {.async.} =
  ## Lists waiting rooms for zone.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/waiting_rooms", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdWaitingRooms*(client: CloudflareClient,
                                  zoneId: types.WaitingroomIdentifier,
                                  body: types.WaitingroomQueryWaitingroom): Future[types.WaitingroomSingleResponse] {.async.} =
  ## Creates a new waiting room.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/waiting_rooms", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdWaitingRoomsPreview*(client: CloudflareClient,
                                         zoneId: types.WaitingroomIdentifier,
                                         body: types.WaitingroomQueryPreview): Future[types.WaitingroomPreviewResponse] {.async.} =
  ## Creates a waiting room page preview. Upload a custom waiting room page for
  ## preview. You will receive a preview URL in the form
  ## `http://waitingrooms.dev/preview/<uuid>`. You can use the following query
  ## parameters to change the state of the preview:
  ## 1. `force_queue`: Boolean indicating if all users will be queued in the waiting
  ## room and no one will be let into the origin website (also known as queueAll).
  ## 2. `queue_is_full`: Boolean indicating if the waiting room's queue is currently
  ## full and not accepting new users at the moment.
  ## 3. `queueing_method`: The queueing method currently used by the waiting room.
  ## - **fifo** indicates a FIFO queue.
  ## - **random** indicates a Random queue.
  ## - **passthrough** indicates a Passthrough queue. Keep in mind that the waiting
  ## room page will only be displayed if `force_queue=true` or `event=prequeueing` —
  ## for other cases the request will pass through to the origin. For our preview,
  ## this will be a fake origin website returning \"Welcome\".
  ## - **reject** indicates a Reject queue.
  ## 4. `event`: Used to preview a waiting room event.
  ## - **none** indicates no event is occurring.
  ## - **prequeueing** indicates that an event is prequeueing (between
  ## `prequeue_start_time` and `event_start_time`).
  ## - **started** indicates that an event has started (between `event_start_time`
  ## and `event_end_time`).
  ## 5. `shuffle_at_event_start`: Boolean indicating if the event will shuffle users
  ## in the prequeue when it starts. This can only be set to **true** if an event is
  ## active (`event` is not **none**).
  ##
  ## For example, you can make a request to`http://waitingrooms.dev/preview/<uuid>?f
  ## orce_queue=false&queue_is_full=false&queueing_method=random&event=started&shuffl
  ## e_at_event_start=true`
  ## 6. `waitTime`: Non-zero, positive integer indicating the estimated wait time in
  ## minutes. The default value is 10 minutes.
  ##
  ## For example, you can make a request to
  ## `http://waitingrooms.dev/preview/<uuid>?waitTime=50` to configure the estimated
  ## wait time as 50 minutes.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/waiting_rooms/preview", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomPreviewResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWaitingRoomsSettings*(client: CloudflareClient,
                                         zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomZoneSettingsResponse] {.async.} =
  ## Get zone-level Waiting Room settings.

  let res = await client.httpGET(fmt"/zones/{zoneId}/waiting_rooms/settings")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomZoneSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdWaitingRoomsSettings*(client: CloudflareClient,
                                         zoneId: types.WaitingroomIdentifier,
                                         body: types.WaitingroomZoneSettings): Future[types.WaitingroomZoneSettingsResponse] {.async.} =
  ## Replace zone-level Waiting Room settings.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/waiting_rooms/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomZoneSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdWaitingRoomsSettings*(client: CloudflareClient,
                                           zoneId: types.WaitingroomIdentifier,
                                           body: types.WaitingroomZoneSettings): Future[types.WaitingroomZoneSettingsResponse] {.async.} =
  ## Patch zone-level Waiting Room settings.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/waiting_rooms/settings", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomZoneSettingsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWaitingRoomsWaitingRoomId*(client: CloudflareClient,
                                              waitingRoomId: types.WaitingroomWaitingRoomId,
                                              zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomSingleResponse] {.async.} =
  ## Fetches a single configured waiting room.

  let res = await client.httpGET(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdWaitingRoomsWaitingRoomId*(client: CloudflareClient,
                                              waitingRoomId: types.WaitingroomWaitingRoomId,
                                              zoneId: types.WaitingroomIdentifier,
                                              body: types.WaitingroomQueryWaitingroom): Future[types.WaitingroomSingleResponse] {.async.} =
  ## Updates a configured waiting room.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdWaitingRoomsWaitingRoomId*(client: CloudflareClient,
                                                 waitingRoomId: types.WaitingroomWaitingRoomId,
                                                 zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomWaitingRoomIdResponse] {.async.} =
  ## Deletes a waiting room.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomWaitingRoomIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdWaitingRoomsWaitingRoomId*(client: CloudflareClient,
                                                waitingRoomId: types.WaitingroomWaitingRoomId,
                                                zoneId: types.WaitingroomIdentifier,
                                                body: types.WaitingroomQueryWaitingroom): Future[types.WaitingroomSingleResponse] {.async.} =
  ## Patches a configured waiting room.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomSingleResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWaitingRoomsWaitingRoomIdEvents*(client: CloudflareClient,
                                                    waitingRoomId: types.WaitingroomWaitingRoomId,
                                                    zoneId: types.WaitingroomIdentifier,
                                                    page: float64 = default(float64),
                                                    perPage: float64 = default(float64)): Future[types.WaitingroomEventResponseCollection] {.async.} =
  ## Lists events for a waiting room.

  var q = initOrderedTable[string, string]()
  q["page"] = $page
  q["per_page"] = $perPage
  let res = await client.httpGET(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/events", q)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomEventResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdWaitingRoomsWaitingRoomIdEvents*(client: CloudflareClient,
                                                     waitingRoomId: types.WaitingroomWaitingRoomId,
                                                     zoneId: types.WaitingroomIdentifier,
                                                     body: types.WaitingroomQueryEvent): Future[types.WaitingroomEventResponse] {.async.} =
  ## Only available for the Waiting Room Advanced subscription. Creates an event for
  ## a waiting room. An event takes place during a specified period of time,
  ## temporarily changing the behavior of a waiting room. While the event is active,
  ## some of the properties in the event's configuration may either override or
  ## inherit from the waiting room's configuration. Note that events cannot overlap
  ## with each other, so only one event can be active at a time.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/events", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomEventResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventId*(client: CloudflareClient,
                                                           eventId: types.WaitingroomEventId,
                                                           waitingRoomId: types.WaitingroomWaitingRoomId,
                                                           zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomEventResponse] {.async.} =
  ## Fetches a single configured event for a waiting room.

  let res = await client.httpGET(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/events/{eventId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomEventResponse)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventId*(client: CloudflareClient,
                                                           eventId: types.WaitingroomEventId,
                                                           waitingRoomId: types.WaitingroomWaitingRoomId,
                                                           zoneId: types.WaitingroomIdentifier,
                                                           body: types.WaitingroomQueryEvent): Future[types.WaitingroomEventResponse] {.async.} =
  ## Updates a configured event for a waiting room.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/events/{eventId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomEventResponse)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventId*(client: CloudflareClient,
                                                              eventId: types.WaitingroomEventId,
                                                              waitingRoomId: types.WaitingroomWaitingRoomId,
                                                              zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomEventIdResponse] {.async.} =
  ## Deletes an event for a waiting room.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/events/{eventId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomEventIdResponse)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventId*(client: CloudflareClient,
                                                             eventId: types.WaitingroomEventId,
                                                             waitingRoomId: types.WaitingroomWaitingRoomId,
                                                             zoneId: types.WaitingroomIdentifier,
                                                             body: types.WaitingroomQueryEvent): Future[types.WaitingroomEventResponse] {.async.} =
  ## Patches a configured event for a waiting room.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/events/{eventId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomEventResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWaitingRoomsWaitingRoomIdEventsEventIdDetails*(client: CloudflareClient,
                                                                  eventId: types.WaitingroomEventId,
                                                                  waitingRoomId: types.WaitingroomWaitingRoomId,
                                                                  zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomEventDetailsResponse] {.async.} =
  ## Previews an event's configuration as if it was active. Inherited fields from the
  ## waiting room will be displayed with their current values.

  let res = await client.httpGET(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/events/{eventId}/details")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomEventDetailsResponse)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWaitingRoomsWaitingRoomIdRules*(client: CloudflareClient,
                                                   waitingRoomId: types.WaitingroomWaitingRoomId,
                                                   zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomRulesResponseCollection] {.async.} =
  ## Lists rules for a waiting room.

  let res = await client.httpGET(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/rules")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc postZonesZoneIdWaitingRoomsWaitingRoomIdRules*(client: CloudflareClient,
                                                    waitingRoomId: types.WaitingroomWaitingRoomId,
                                                    zoneId: types.WaitingroomIdentifier,
                                                    body: types.WaitingroomCreateRule): Future[types.WaitingroomRulesResponseCollection] {.async.} =
  ## Only available for the Waiting Room Advanced subscription. Creates a rule for a
  ## waiting room.

  let res = await client.httpPOST(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc putZonesZoneIdWaitingRoomsWaitingRoomIdRules*(client: CloudflareClient,
                                                   waitingRoomId: types.WaitingroomWaitingRoomId,
                                                   zoneId: types.WaitingroomIdentifier,
                                                   body: types.WaitingroomUpdateRules): Future[types.WaitingroomRulesResponseCollection] {.async.} =
  ## Only available for the Waiting Room Advanced subscription. Replaces all rules
  ## for a waiting room.

  let res = await client.httpPUT(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/rules", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc deleteZonesZoneIdWaitingRoomsWaitingRoomIdRulesRuleId*(client: CloudflareClient,
                                                            ruleId: types.WaitingroomRuleId,
                                                            waitingRoomId: types.WaitingroomWaitingRoomId,
                                                            zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomRulesResponseCollection] {.async.} =
  ## Deletes a rule for a waiting room.

  let res = await client.httpDELETE(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/rules/{ruleId}")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc patchZonesZoneIdWaitingRoomsWaitingRoomIdRulesRuleId*(client: CloudflareClient,
                                                           ruleId: types.WaitingroomRuleId,
                                                           waitingRoomId: types.WaitingroomWaitingRoomId,
                                                           zoneId: types.WaitingroomIdentifier,
                                                           body: types.WaitingroomPatchRule): Future[types.WaitingroomRulesResponseCollection] {.async.} =
  ## Patches a rule for a waiting room.

  let res = await client.httpPATCH(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/rules/{ruleId}", body)
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomRulesResponseCollection)
  else:
    raise newException(CloudflareClientError, body)

proc getZonesZoneIdWaitingRoomsWaitingRoomIdStatus*(client: CloudflareClient,
                                                    waitingRoomId: types.WaitingroomWaitingRoomId,
                                                    zoneId: types.WaitingroomIdentifier): Future[types.WaitingroomStatusResponse] {.async.} =
  ## Fetches the status of a configured waiting room. Response fields include:
  ## 1. `status`: String indicating the status of the waiting room. The possible
  ## status are:
  ## - **not_queueing** indicates that the configured thresholds have not been met
  ## and all users are going through to the origin.
  ## - **queueing** indicates that the thresholds have been met and some users are
  ## held in the waiting room.
  ## - **event_prequeueing** indicates that an event is active and is currently
  ## prequeueing users before it starts.
  ## - **suspended** indicates that the room is suspended.
  ## 2. `event_id`: String of the current event's `id` if an event is active,
  ## otherwise an empty string.
  ## 3. `estimated_queued_users`: Integer of the estimated number of users currently
  ## waiting in the queue.
  ## 4. `estimated_total_active_users`: Integer of the estimated number of users
  ## currently active on the origin.
  ## 5. `max_estimated_time_minutes`: Integer of the maximum estimated time currently
  ## presented to the users.

  let res = await client.httpGET(fmt"/zones/{zoneId}/waiting_rooms/{waitingRoomId}/status")
  let body = await res.body
  case res.code
  of Http200:
    result = fromJson(body, types.WaitingroomStatusResponse)
  else:
    raise newException(CloudflareClientError, body)
