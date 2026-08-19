# cloudflare API client for Nim
#
# Auto-generated from OpenAPI 3.x specification
# using the awesome [Nimbase CLI](https://github.com/nimbase/nimbase)
#
# License: MIT

import std/[asyncdispatch, httpclient, tables,
        strutils, sequtils, times, uri]

import pkg/openparser/json
import ./renames


export asyncdispatch, httpclient, json, tables, sequtils, times
export renames


type
  CloudflareClient* = ref object of RootObj
    baseUri*: string
    httpClient*: AsyncHttpClient
    apiKey*: string

  QueryTable* = OrderedTable[string, string]

  CloudflareClientError* = object of CatchableError

proc `$`*(query: QueryTable): string =
  if query.len > 0:
    add result, "?"
    add result, join(query.keys.toSeq.mapIt(it & "=" & query[it]), "&")

proc initCloudflareClient*(apiKey: string): CloudflareClient =
  new(result)
  result.baseUri = "https://api.cloudflare.com/client/v4/"
  result.httpClient = newAsyncHttpClient()
  result.httpClient.headers = newHttpHeaders({
    "Accept": "application/json",
    "Authorization": "Bearer " & apiKey
  })
  result.apiKey = apiKey

proc httpGet*(client: CloudflareClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.get(url)

proc httpGet*(client: CloudflareClient,
  endpoint: string, query: QueryTable): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint & $query
  result = await client.httpClient.get(url)

proc httpPost*[T](client: CloudflareClient,
  endpoint: string, body: T): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.post(url, toJson(body))

proc httpPost*(client: CloudflareClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.post(url)

proc httpPost*(client: CloudflareClient,
  endpoint: string, query: QueryTable): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint & $query
  result = await client.httpClient.post(url)

proc httpPut*[T](client: CloudflareClient,
  endpoint: string, body: T): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpPut,
    body = toJson(body))

proc httpPut*(client: CloudflareClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpPut)

proc httpPut*(client: CloudflareClient,
  endpoint: string, query: QueryTable): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint & $query
  result = await client.httpClient.request(url, httpMethod = HttpPut)

proc httpDelete*[T](client: CloudflareClient,
  endpoint: string, body: T): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpDelete,
    body = toJson(body))

proc httpDelete*(client: CloudflareClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpDelete)

proc httpDelete*(client: CloudflareClient,
  endpoint: string, query: QueryTable): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint & $query
  result = await client.httpClient.request(url, httpMethod = HttpDelete)

proc httpPatch*[T](client: CloudflareClient,
  endpoint: string, body: T): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpPatch,
    body = toJson(body))

proc httpPatch*(client: CloudflareClient,
  endpoint: string): Future[AsyncResponse] {.async.} =
  let url = client.baseUri & endpoint
  result = await client.httpClient.request(url, httpMethod = HttpPatch)
